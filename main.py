from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def inicio():
    return render_template('index.html')

@app.route('/paginauno')
def paginauno():
    return "Mundo ola"

if __name__ == '__main__':
    app.run(debug = True)