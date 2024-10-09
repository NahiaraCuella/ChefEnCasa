import mysql.connector

# Conectar a la base de datos
conn = mysql.connector.connect(
    host='10.9.120.5',
    user='chefencasa',
    password='chefencasa111',
    database='ChefEnCasa'
)
cursor = conn.cursor()

# Consultar datos
cursor.execute('SELECT * FROM usuarios')
rows = cursor.fetchall()
for row in rows:
    print(row)

# Cerrar la conexión
conn.close()
