from flask import Flask, render_template
from flaskext.mysql import MySQL

app = Flask(__name__)

app.config['MYSQL_DATABASE_HOST'] = 'localhost'
app.config['MYSQL_DATABASE_PORT'] = 3306
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = '1234'
app.config['MYSQL_DATABASE_DB'] = 'Libreria'

mysql = MySQL()
mysql.init_app(app)

@app.route('/')
def inicio():
    cursor = mysql.get_db().cursor()
    cursor.execute("SELECT * FROM Libro")
    datos = cursor.fetchall()
    print(datos)
    return render_template('index.html')

@app.route('/paginauno')
def paginauno():
    return "Mundo ola"

if __name__ == '__main__':
    app.run(debug = True)