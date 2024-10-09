from flask import Flask, jsonify
import mysql.connector

db_file = "chefencasa.db"

app = Flask(__name__)



@app.route('/usuarios')
def usuario():

# Conectar a la base de datos
    conn = mysql.connector.connect(
    host='10.9.120.5',
    user='chefencasa',
    password='chefencasa111',
    database='chefencasa'
)
    cursor = conn.cursor(dictionary=True)
     # Consultar datos
    cursor.execute('SELECT * FROM usuario')
    rows = cursor.fetchall()
    
    # Cerrar la conexión
    cursor.close()
    conn.close()
    
    # Devolver los resultados en formato JSON
    return jsonify(rows)
