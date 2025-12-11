import mysql.connector
from mysql.connector import Error

def connect_to_database():  
    # Варианты подключения для тестирования
    connection_configs = [
        {
            'host': 'localhost',
            'user': 'root',
            'password': 'root',   # Стандартный пароль
            'database': 'autorisation',
            'charset': 'utf8mb4'
        }
    ]
    
    for i, config in enumerate(connection_configs, 1):
        try:
            print(f"\nПопытка подключения #{i}...")
            print(f"Пользователь: {config['user']}")
            print(f"Пароль: '{config['password'] if config['password'] else '(пустой)'}'")
            print(f"База данных: {config['database']}")
            
            connection = mysql.connector.connect(**config)
            
            if connection.is_connected():
                print(f"Успешно подключено!")
                return connection
                
        except Error as e:
            print(f"Не удалось: {e}")
            continue
    
    return None

def main():
    """Основная функция"""
    
    # Подключаемся к базе данных
    print("\n" + "-" * 70)
    db = connect_to_database()
    
    if not db:
        print("\nНе удалось подключиться к базе данных")
        print("\nВозможные решения:")
        print("1. Убедитесь, что MySQL сервер запущен")
        print("2. Проверьте правильность пароля")
        print("3. Проверьте существует ли база 'autorisation'")
        print("4. Попробуйте подключиться через командную строку:")
        print("mysql -u root -p")
        print("(нажмите Enter если запросит пароль)")
        return
    
    cursor = None
    
    try:
        cursor = db.cursor(dictionary=True)
        
        query = """
        SELECT 
            -- Информация о пользователе
            c.id_client,
            CONCAT(c.surname, ' ', c.name) as full_name,
            c.email,
            c.is_active,
            DATE_FORMAT(c.date_created, '%d.%m.%Y') as registration_date,
            DATE_FORMAT(c.date_last_join, '%d.%m.%Y %H:%i') as last_login,
            
            -- Роли пользователя
            GROUP_CONCAT(DISTINCT r.role_name ORDER BY r.role_name SEPARATOR ', ') as roles,
            
            -- Права пользователя
            GROUP_CONCAT(
                DISTINCT p.permissions_name 
                ORDER BY p.permissions_name 
                SEPARATOR ', '
            ) as permissions
            
        FROM client c
        
        -- Связь с ролями
        LEFT JOIN client_has_roles chr ON c.id_client = chr.client_id_client
        LEFT JOIN roles r ON chr.roles_id_role = r.id_role
        
        -- Связь ролей с разрешениями
        LEFT JOIN roles_has_permissions rhp ON r.id_role = rhp.roles_id_role
        LEFT JOIN permissions p ON rhp.permissions_id_permission = p.id_permission
        
        GROUP BY 
            c.id_client, 
            c.surname, 
            c.name, 
            c.email, 
            c.is_active, 
            c.date_created, 
            c.date_last_join
            
        ORDER BY c.surname, c.name
        """
        
        print("Выполняю запрос...")
        cursor.execute(query)
        users = cursor.fetchall()
        
        if not users:
            print("\nВ базе данных нет пользователей")
        else:
            print(f"\nНайдено пользователей: {len(users)}")
            
            # Выводим информацию о каждом пользователе
            print("\n" + "=" * 70)
            print("СПИСОК ПОЛЬЗОВАТЕЛЕЙ С ПРАВАМИ:")
            print("=" * 70)
            
            for i, user in enumerate(users, 1):
                print(f"\n{i}. {user['full_name']}")
                print(f"Email: {user['email']}")
                print(f"Зарегистрирован: {user['registration_date']}")
                print(f"Последний вход: {user['last_login'] or 'Никогда'}")
                print(f"Статус: {'Активен' if user['is_active'] else 'Неактивен'}")
                
                if user['roles']:
                    print(f"Роли: {user['roles']}")
                else:
                    print(f"Роли: Нет назначенных ролей")
                
                if user['permissions']:
                    print(f"Права: {user['permissions']}")
                else:
                    print(f"Права: Нет прав доступа")
                
                if i < len(users):
                    print("   " + "-" * 50)
        
    except Error as e:
        print(f"\nОшибка при выполнении запроса: {e}")
        
        # Показываем какие таблицы есть в базе
        try:
            print("\nДоступные таблицы:")
            cursor.execute("SHOW TABLES")
            tables = cursor.fetchall()
            for table in tables:
                print(f"   - {table['Tables_in_autorisation']}")
        except:
            pass
            
    finally:
        # Закрываем соединение
        if cursor:
            cursor.close()
        if db and db.is_connected():
            db.close()
            print("\nСоединение с базой данных закрыто")

if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print("\n\nРабота скрипта прервана пользователем")
        print("=" * 70)
    except Exception as e:
        print(f"\nНеожиданная ошибка: {e}")
        print("=" * 70)