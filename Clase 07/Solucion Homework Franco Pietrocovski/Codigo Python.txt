import mysql.connector
import pandas as pd

alumnos = pd.read_csv('ruta_de_tu_archivo.csv',header=0)

db = mysql.connector.connect(
    host='localhost',
    user='tu_usuario',
    password='tu_contraseña',
    database='tu_db'
)

mycursor = db.cursor()

sql = 'INSERT INTO alumno (cedulaIdentidad,nombre,apellido,fechaNacimiento,fechaIngreso,idCohorte) VALUES (%s,%s,%s,%s,%s,%s)'

for i in range(len(alumnos)):
    
    a = alumnos.iloc[i]
    
    val = (
        int(a['cedulaIdentidad']),
        a['nombre'],
        a['apellido'],
        str(a['fechaNacimiento']),
        str(a['fechaIngreso']),
        int(a['idCohorte'])
        )
    
    mycursor.execute(sql,val)

mycursor.execute('''SET FOREIGN_KEY_CHECKS=1;
SET GLOBAL FOREIGN_KEY_CHECKS=1;''')
    
db.commit()