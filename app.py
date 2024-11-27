from flask import Flask, jsonify, request, render_template,Blueprint
from flask_cors import CORS  # Importa CORS
import mysql.connector

db_file = "chefencasa.db"
bp = Blueprint()


app = Flask(__name__)
CORS(app)  # Aplica CORS a toda la aplicación

#Todos los def que digan jsonify a la ruta le vas a pasar (/api/lo de atras queda igual)
#Paso 2: armar nuevas rutas, donde la ruta diga (ej:/usuario), en el return devuelve render_template 


def conectarseABaseDeDatos():
    return mysql.connector.connect(
            host='10.9.120.5',
            user='chefencasa',
            password='chefencasa111',
            database='chefencasa'
        )    


@app.route("/recetas")
def recetas():
    
    conn = conectarseABaseDeDatos()
    cursor = conn.cursor(dictionary=True)
    consulta = """
        SELECT * FROM recetas;"""
    lista_recetas = cursor.execute(consulta)
    print(lista_recetas)
    pagina = render_template("recetas.html", recetas = lista_recetas)
    
    return pagina



@app.route('/api/usuarios')
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

@app.route('/api/usuarios/<int:id>')
def detalle_usuario(id):
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

@app.route('/api/recetas-por-usuario/<int:id>')
def conectar_recetas(id):
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

@app.route('/api/usuarios', methods=("POST",))
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

@app.route('/api/usuarios/<int:id>', methods=('DELETE',))
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



@app.route('/api/ingredientes/<int:id>', methods=('GET',))
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
    if resultado is None:
        return jsonify({"error": "No se encontraron resultados"}), 404
    return jsonify(resultado)

@app.route('/api/recetas/<int:id>', methods=('DELETE',))
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

@app.route('/api/ingredientes/', methods=('POST',))
def agregar_ingredientes():
    conn = conectarseABaseDeDatos()
    tipo_de_ingrediente = request.json["tipo_de_ingrediente"]
    cursor = conn.cursor(dictionary=True)

    consulta = """ 
    INSERT INTO ingredientes(tipo_de_ingrediente) VALUES (%s)
    """
    cursor.execute(consulta, (tipo_de_ingrediente, ))
    conn.commit()
    
    cursor.close()
    conn.close()

    resultado = {"resultado": "ok", "mensaje" : "ingrediente agregado"}
    return jsonify(resultado)


@app.route('/api/cocciones/<int:id>', methods=('GET',))
def obtener_cocciones(id):
    conn = conectarseABaseDeDatos()
    cursor = conn.cursor(dictionary=True)

    consulta = """
    SELECT * FROM recetas WHERE cocciones_id = %s
    """
    cursor.execute(consulta, (id,))
    resultado = cursor.fetchone()

  # Si no se encuentra el registro, devuelve un error 404
    if resultado is None:
        return jsonify({"error": "No se encontraron resultados"}), 404
    
    cursor.close()
    conn.close()
    
    return jsonify(resultado)

# Ruta para obtener una receta por su ID
@app.route('/api/receta/<int:id>', methods=['GET'])
def get_receta(id):
    conn = conectarseABaseDeDatos()
    cursor = conn.cursor(dictionary=True)
    cursor.execute('SELECT * FROM recetas WHERE id = %s', (id,))  # Consulta con parámetro de ID
    receta = cursor.fetchone()  # Obtener una receta por su ID
    
    cursor.close()
    conn.close()
    
    if receta is None:
        return jsonify({'error': 'Receta no encontrada'}), 404
    return jsonify(receta)  # Devuelve la receta como JSON

if __name__ == '__main__':
    app.run(debug=True)

@app.route('/api/dietas/<int:id>', methods=('GET',))
def obtener_dietas (id):
    conn = conectarseABaseDeDatos()
    cursor = conn.cursor(dictionary=True)

    consulta = """
    SELECT * FROM recetas WHERE dietas_id = %s
    """
    cursor.execute(consulta, (id,))
    resultado = cursor.fetchall()

    # Si no se encuentran resultados, devuelve un error 404
    if not resultado:
        return jsonify({"error": "No se encontraron recetas para este tipo de dieta"}), 404
    
    cursor.close()
    conn.close()
    
    return jsonify(resultado)

@app.route('/api/momentos_dias/<int:id>', methods=('GET',))
def obtener_recetas_por_momento(id):
    conn = conectarseABaseDeDatos()
    cursor = conn.cursor(dictionary=True)

    consulta = """
    SELECT * FROM recetas WHERE momentoDia_id = %s
    """
    cursor.execute(consulta, (id,))
    resultado = cursor.fetchall()

    # Si no se encuentran resultados, devuelve un error 404
    if not resultado:
        return jsonify({"error": "No se encontraron recetas para este momento del día"}), 404
    
    cursor.close()
    conn.close()
    
    return jsonify(resultado)


@app.route('/api/search/<int:id>', methods=('GET',))
def obtener_recetas(id):
    conn = conectarseABaseDeDatos()
    cursor = conn.cursor(dictionary=True)
    # Obtener el parámetro de búsqueda desde la URL
    search_query = request.args.get('q', '')  # 'q' es el parámetro de búsqueda
    
    consulta = """
    SELECT * FROM recetas
    WHERE nombre LIKE %s OR descripcion LIKE %s    
    """
    cursor.execute(consulta, (f'%{search_query}%', f'%{search_query}%'))    
    resultado = cursor.fetchall()

    # Si no se encuentran resultados, devuelve un error 404
    if not resultado:
        return jsonify({"error": "No se encontraron recetas para este momento del día"}), 404
    
    cursor.close()
    conn.close()
    
    return jsonify(resultado)

