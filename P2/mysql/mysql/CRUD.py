
from MyDataBase import MyDatabase
from Constants import Constants

class CRUD:
    const = Constants()
    conn = MyDatabase(
            const.decrypt(Constants.e_host),
            int(const.decrypt(Constants.e_port)),
            const.decrypt(Constants.e_database),
            const.decrypt(Constants.e_user),
            const.decrypt(Constants.e_password)
        )
    
    def create_profile(self):
        sql  = '''CREATE TABLE Profiles (
        idx Int NOT NULL PRIMARY KEY,
        name varchar(50) NOT NULL,
        alias varchar(50) NOT NULL,
        token varchar(50) NOT NULL,
        birthdate DATE NOT NULL,
        email varchar(50) NOT NULL,
        lang_code varchar(50) NOT NULL,
        routine varchar(50) NOT NULL,
        alarm int NOT NULL,
        inactivity_time Time NOT NULL,
        inactivity_type varchar(50) NOT NULL
        ) '''
        result = self.conn.query(sql)
        print(result)

    def get_profile(self):
        sql = "SELECT idx, name, alias, token, birthdate, email, lang_code, `routine`, alarm, inactivity_time, inactivity_type" \
        " FROM defaultdb.profiles;"
        result = self.conn.query(sql) 
        print(result)

    def set_profile(self, idx, name, alias, token, birthdate, email, lang_code, routine, alarm, inactivity_time, inactivity_type):
        sql = "INSERT INTO defaultdb.Profiles " \
        "(idx, name, alias, token, birthdate, email, lang_code, `routine`, alarm, inactivity_time, inactivity_type) " \
        "VALUES({}, '{}', '{}', '{}', '{}', '{}', '{}', '{}', {}, '{}','{}');".format(
           idx, name, alias, token, birthdate, email, lang_code, routine, alarm, inactivity_time, inactivity_type
            )
        print(sql)

    def update_profile(self, name, alias, token, birthdate, email, lang_code, routine, alarm, inactivity_time, inactivity_type, idx):
        sql = "UPDATE defaultdb.profiles " \
        "SET name='{}', alias='{}', token='{}', birthdate={}, email='{}', lang_code='{}', `routine`={}, alarm={}, inactivity_time={}, inactivity_type={} " \
        "WHERE idx={};".format(
           idx, name, alias, token, birthdate, email, lang_code, routine, alarm, inactivity_time, inactivity_type, idx
            )
       

    def delete_profile(self, idx):
        sql = "DELETE FROM defaultdb.profiles " \
        "WHERE idx={};".format(idx)
    


crud = CRUD()
#crud.create_profile()
crud.set_profile(1,"Joel Alejandro Sandoval Camacho","Webibabo1400","637492DUCBD","2009-11-06", "Joel@gmail.com","Mysql","Me levanto y me voy a desayunar",7,"45:00","50:00")
crud.set_profile(2,"Job Esau Torres Jimenez","Rolloatomico88","435T3feH","2009-05-03", "Job@gmail.com","C++","Me levanto y hago ejercicio",6,"45:00","67:00")
crud.set_profile(3,"Carlos Gallardo Ledezma","Renkari5000p","dbhf32445","2009-09-03", "Carlos@gmail.com","Python","Me levanto y Voy a trabajar",5,"45:00","66:00")
crud.set_profile(4,"Alan Dwii Angeles Hernandez ","Nimyck089","37846ldm","2009-03-11", "Alan@gmail.com","C","No me levanto y me vuelvo a dormir",10,"16:00","23:00")
crud.set_profile(5,"Rodrigo Hernandez Hernandez","Broly","4736nkd","2009-06-08", "Rodrigo@gmail.com","Scratch","Me levanto y hago mi desayuno",8,"34:00","87:00")
crud.set_profile(6,"Luis Fernando Gonzalez Gonzalez","Whix08","843y5nkf","2009-21-01", "Luis@gmail.com","Python","Me levanto y voy a la preparatoria",6,"43:00","53:00")
crud.set_profile(7,"Juan Antonio Ortega Sandoval","JAOSS","43yrng534","2009-25-03", "Juan@gmail.com","C++","Me levanto en una de mis 8 casas y despues me subo a mi auto apple",4,"53:00","43:00")
crud.set_profile(8,"Aries Miguel Angel Riebelling Macias","ElMichael00","834375utj","1987-09-03", "Aries@gmail.com","Python","Me levanto y juego battelfield",1,"88:00","11:00")
crud.set_profile(9,"Fernanda Lizeth Gonzalez Hernandez","Ferchis00","397438gnrd","2009-22-03", "Ferchis@gmail.com","C","Me levanto y voy con mi familia a desayunar al tianguis",8,"36:00","54:00")
crud.set_profile(10,"Brisa Esmeralda Castellanos Hernandez","Bris08","48937fbrrg","2009-03-04", "Brisa@gmail.com","Mysqlite","Me levanto y voy a la escuela",6,"43:00","58:00")
