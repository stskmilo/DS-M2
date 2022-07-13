mycursor = db.cursor()
mycursor.execute('SELECT * FROM alumno')
result = mycursor.fetchall()
df = pd.DataFrame(result)
print(df) #retorna lista de tuplas