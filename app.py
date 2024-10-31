from flask import Flask, jsonify, request
from flask_cors import CORS  # Importa CORS
import mysql.connector

db_file = "chefencasa.db"

app = Flask(__name__)
CORS(app)  # Aplica CORS a toda la aplicación

def conectarseABaseDeDatos():
    return mysql.connector.connect(
            host='10.9.120.5',
            user='chefencasa',
            password='chefencasa111',
            database='chefencasa'
        )    

@app.route('/usuarios')
def usuario():
    # Conectar a la base de datos
    conn = conectarseABaseDeDatos()
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
    # Conectar a la base de datos
    # Conectar a la base de datos
    conn = conectarseABaseDeDatos()
    cursor = conn.cursor(dictionary=True)
    
    user = """SELECT u.user AS nombre, p.nombre AS pais, u.email 
            FROM usuario u JOIN pais p ON u.pais_id = p.id 
            WHERE u.id = %s"""
    result = cursor.execute(user, (id,))
    usuario = cursor.fetchone()
    
    # Cerrar la conexión
    cursor.close()
    conn.close()

    result = {"usuario": usuario}
    return jsonify(result)

@app.route('/recetas-por-usuario/<int:id>')
def conectar_recetas(id):
    # Conectar a la base de datos
    # Conectar a la base de datos
    conn = conectarseABaseDeDatos()
    cursor = conn.cursor(dictionary=True)
    
    user = """SELECT * FROM recetas WHERE user_id = %s """
    result = cursor.execute(user, (id,))
    recetas = cursor.fetchall()
    
    # Cerrar la conexión
    cursor.close()
    conn.close()

    result = {"recetas": recetas}
    return jsonify(result)

@app.route('/usuarios', methods=("POST",))
def agregar_usuario():
    conn = conectarseABaseDeDatos()
    email = request.json["email"]
    user = request.json["user"]
    contrasenia = request.json["contrasenia"]
    cursor = conn.cursor(dictionary=True)
 	# Consultar datos
    consulta = """
    	INSERT INTO usuario(user,contrasenia,email) VALUES (%s,%s,%s)
    	"""
    cursor.execute(consulta, (user,contrasenia,email))
    conn.commit()
    
	# Cerrar la conexión
    cursor.close()
    conn.close()
    
	# Devolver los resultados en formato JSON
    resultado = { "resultado" : "ok", "mensaje" : "se agregó el usuario"}
    return jsonify(resultado)

@app.route('/usuarios/<int:id>', methods=('DELETE',))
def borrar_usuario(id):
    conn = conectarseABaseDeDatos()
    cursor = conn.cursor(dictionary=True)

    consulta = """
    DELETE FROM recetas WHERE user_id = %s
    """
    cursor.execute(consulta,(id,))
    consulta2 = """
    DELETE FROM usuario WHERE id = %s
    """
    cursor.execute(consulta2,(id,))
    conn.commit()

    cursor.close()
    conn.close()

    resultado = {"resultado" : "ok", "mensaje" : "usuario borrado"}
    return jsonify(resultado)



@app.route('/ingredientes/<int:id>', methods=('GET',))
def obtener_ingrediente(id):
    conn = conectarseABaseDeDatos()
    cursor = conn.cursor(dictionary=True)

    consulta = """
    SELECT * FROM ingredientes WHERE id = %s
    """
    cursor.execute(consulta, (id,))
    consulta = cursor.fetchone()

    cursor.close()
    conn.close()
    resultado = consulta
    return jsonify(resultado)

@app.route('/recetas/<int:id>', methods=('DELETE',))
def borrar_recetas(id):
    conn = conectarseABaseDeDatos()
    cursor = conn.cursor(dictionary=True)

    consulta = """
    DELETE FROM recetas WHERE user_id = %s
    """
    cursor.execute(consulta,(id,))
    conn.commit()

    cursor.close()
    conn.close()

    resultado = {"resultado" : "ok", "mensaje" : "receta borrado"}
    return jsonify(resultado)