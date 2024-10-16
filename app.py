from flask import Flask, jsonify
import mysql.connector

db_file = "chefencasa.db"

app = Flask(__name__)

# Conectar a la base de datos
conn = mysql.connector.connect(
    host='10.9.120.5',
    user='chefencasa',
    password='chefencasa111',
    database='chefencasa'
)

@app.route('/usuarios')
def usuario():
    cursor = conn.cursor(dictionary=True)
     # Consultar datos
    cursor.execute('SELECT * FROM usuario')
    rows = cursor.fetchall()
    
    # Cerrar la conexión
    cursor.close()
    conn.close()
    
    # Devolver los resultados en formato JSON
    return jsonify(rows)

@app.route('/usuarios/<int:id>')
def detalle_usuario(id):
    cursor = conn.cursor(dictionary=True)
    cursor.row_factory = dict.factory
    
    user = "SELECT pais FROM pais_id = ?"
    result = cursor.excuete(user, (id,))
    pais = result.fetchall()
    
    conn.close()
    result = {"usuario": usuario, "pais": pais}
    return jsonify(result)