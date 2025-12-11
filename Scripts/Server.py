from flask import Flask, request
import mysql.connector
from mysql.connector import Error

app = Flask(__name__)

DB_CONFIG = {
    'host': 'localhost',
    'user': 'root',
    'password': 'root',
    'database': 'autorisation',
    'charset': 'utf8mb4'
}

def get_db_connection():
    """Создать подключение к базе данных"""
    try:
        conn = mysql.connector.connect(**DB_CONFIG)
        return conn
    except Error as e:
        print(f"Ошибка подключения к БД: {e}")
        return None

def check_user_in_db(username, password):
    """Проверяет пользователя в базе данных autorisation"""
    conn = get_db_connection()
    if not conn:
        return False, None
    
    try:
        cursor = conn.cursor(dictionary=True)
        
        # Ищем пользователя в таблице client
        query = """
        SELECT id_client, surname, name, email, password, is_active
        FROM client 
        WHERE email = %s OR CONCAT(surname, ' ', name) LIKE %s
        LIMIT 1
        """
        
        cursor.execute(query, (username, f"%{username}%"))
        user = cursor.fetchone()
        
        cursor.close()
        conn.close()
        
        if user:
            if user['password'] == password:
                return True, user
        return False, None
        
    except Error as e:
        print(f"Ошибка БД: {e}")
        return False, None

# роут по заданию
@app.route('/')
def index():
    return '<h1>Cервер работает</h1><p><a href="/login">Авторизироваться</a></p>'

# реализация авторизации
@app.route('/login', methods=['GET', 'POST'])
def login():
    html_form = '''
    <h2>Окно авторизации</h2>
    <form method="POST">
        Логин: <input type="text" name="username"><br><br>
        Пароль: <input type="password" name="password"><br><br>
        <input type="submit" value="Войти">
    </form>
    '''
    if request.method == 'POST':
        username = request.form.get('username', '')
        password = request.form.get('password', '')
        
        print(f"📝 Получены данные:")
        print(f"   Логин: {username}")
        print(f"   Пароль: {password}")
        print(f"   IP адрес: {request.remote_addr}")
        
        is_valid, user = check_user_in_db(username, password)
        
        if is_valid:
            print(f"\nАвторизация удалась:")
            print(f"   Пользователь: {user['surname']} {user['name']}")
            print(f"   Email: {user['email']}")
            print(f"   ID: {user['id_client']}")
            print(f"   Активен: {'Да' if user['is_active'] else 'Нет'}")
            result = '<p> Успешная авторизация</p>'
        else:
            print("\nОшибка авторизации:")
            result = '<p> Неправельный логин или пароль</p>'  
        return html_form + result + '<p><a href="/login">← Попробовать снова</a> | <a href="/">На главную</a></p>'
    return html_form

if __name__ == '__main__':
    # Сервер: http://127.0.0.1:5000
    app.run(debug=True)