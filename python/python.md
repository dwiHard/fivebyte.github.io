# Trik dan Tips Python3
> Disusun oleh Hardiyanto

### Daftar Isi
* [Python with MySQL](#python-with-mysql)
    * [Required](#required)
    * [Create Database](#create-database)
    * [Create Table](#create-table)
    * [Select](#select)
    * [Select With id](#select-with-id)
    * [Insert Table](#insert-table)
    * [Update](#update)
    * [Delete](#delete)
    * [Rangkuman](#rangkuman)
* [Python with web](#python-with-web)
    * [Required web](#required-web)
    * [Parsing htl BeautifulSoup](#parsing-htl-beautifulsoup)
    * [Menampilkan tag html](#menampilkan-tag-html)
* [Configure python](#configure-python)
    * [Path](#path)
    * [virtualenv](#virtualenv)


### Python with MySQL
#### Required

```
$ sudo apt-get install python3-pip
```
```
pip install mysql-connector-python
```
#### Create Database

Buat file ```database.py```
```
import mysql.connector

config = {
	'user': 'user',
	'password': 'password',
	'host': 'localhost'
}

db = mysql.connector.connect(**config)
cursor = db.cursor()
```
Buat file ```setup.py```
```
import mysql.connector
from database import cursor

DB_NAME = 'coba'

def create_database():
	cursor.execute("CREATE DATABASE IF NOT EXISTS {} DEFAULT CHARACTER SET 'utf8'".format(DB_NAME))
	print("Database {} dibuat!".format(DB_NAME))
	

create_database()
```
Jalankan ``python3 setup.py```

#### Create Table

Buat file ```database.py```
```
import mysql.connector

config = {
	'user': 'user',
	'password': 'password',
	'host': 'localhost'
}

db = mysql.connector.connect(**config)
cursor = db.cursor()
```
Untuk file ```setup.py```
```
import mysql.connector
from mysql.connector import errorcode
from database import cursor

DB_NAME = 'coba'

TABLES = {}

TABLES['logs'] = (
	"CREATE TABLE `logs`("
	"`id` int(11) NOT NULL AUTO_INCREMENT,"
	"`text` varchar(250) NOT NULL,"
	"`user` varchar(250) NOT NULL,"
	"`created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,"
	"PRIMARY KEY(`id`)"
	") ENGINE=InnoDB"
)

def create_tables():
	cursor.execute("USE {}".format(DB_NAME))
	
	for table_name in TABLES:
		table_description = TABLES[table_name]
		try:
			print("Buat tabel ({})\n".format(table_name), end="")
			cursor.execute(table_description)
		except mysql.connector.Error as err:
			if err.errno == errorcode.ER_TABLE_EXISTS_ERROR:
				print("Sudah Ada")
			else:
				print(err.msg)

create_tables()	
```

#### Select

Buat file ```database.py```
```
import mysql.connector

config = {
	'user': 'user',
	'password': 'password',
	'host': 'localhost',
	'database': 'coba'
}

db = mysql.connector.connect(**config)
cursor = db.cursor()
```
Untuk file ```main.py```
```
from database import cursor, db

def get_logs():
	sql = ("SELECT * FROM logs ORDER BY created DESC")
	cursor.execute(sql)
	result = cursor.fetchall()
	
	for row in result:
		print(row)
		
get_logs()
```
Jalankan main.py

#### Select With id

Buat file ```database.py```
```
import mysql.connector

config = {
	'user': 'user',
	'password': 'password',
	'host': 'localhost',
	'database': 'coba'
}

db = mysql.connector.connect(**config)
cursor = db.cursor()
```
Untuk file ```main.py```
```
from database import cursor, db

def get_logs_select(id):
	sql = ("SELECT * FROM logs WHERE id= %s")
	cursor.execute(sql,(id,))
	result = cursor.fetchone()
	
	for row in result:
		print(row)
		
get_logs_select(2)
```
Jalankan main.py

#### Insert Table

Buat file ```database.py```
```
import mysql.connector

config = {
	'user': 'user',
	'password': 'password',
	'host': 'localhost',
	'database': 'coba'
}

db = mysql.connector.connect(**config)
cursor = db.cursor()
```
Untuk file ```main.py```
```
from database import cursor, db

def add_log(text, user):
	sql = ("INSERT INTO logs(text, user) VALUES (%s, %s)")
	cursor.execute(sql, (text, user,))
	db.commit()
	log_id = cursor.lastrowid
	print("Tambahkan {}".format(log_id))
	
add_log('coabaaaa','Hard')
add_log('follow','Hexploit')
```
Jalankan main.py

#### Update

Buat file ```database.py```
```
import mysql.connector

config = {
	'user': 'user',
	'password': 'password',
	'host': 'localhost',
	'database': 'coba'
}

db = mysql.connector.connect(**config)
cursor = db.cursor()
```
Untuk file ```main.py```
```
from database import cursor, db

def update_log(id, text):
	sql = ("UPDATE logs SET text = %s WHERE id = %s")
	cursor.execute(sql, (text, id))
	db.commit()
	print("Update log")
	
update_log(3, 'coba')
update_log(2, 'coba')
```
Jalankan main.py
#### Delete

Buat file ```database.py```
```
import mysql.connector

config = {
	'user': 'user',
	'password': 'password',
	'host': 'localhost',
	'database': 'coba'
}

db = mysql.connector.connect(**config)
cursor = db.cursor()
```
Untuk file ```main.py```
```
from database import cursor, db

def delete_log(id):
	sql = ("DELETE FROM logs WHERE id = %s")
	cursor.execute(sql, (id,))
	db.commit()
	print("Remove log")
	
delete_log(2)
```
Jalankan main.py
#### Rangkuman

file ```database.py```
```
import mysql.connector

config = {
	'user': 'hard',
	'password': 'pokokmen',
	'host': 'localhost',
	'database': 'coba'
}

db = mysql.connector.connect(**config)
cursor = db.cursor()
```
file ```setup.py```
```
import mysql.connector
from mysql.connector import errorcode
from database import cursor

DB_NAME = 'coba'

TABLES = {}

TABLES['logs'] = (
	"CREATE TABLE `logs`("
	"`id` int(11) NOT NULL AUTO_INCREMENT,"
	"`text` varchar(250) NOT NULL,"
	"`user` varchar(250) NOT NULL,"
	"`created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,"
	"PRIMARY KEY(`id`)"
	") ENGINE=InnoDB"
)

def create_database():
	cursor.execute("CREATE DATABASE IF NOT EXISTS {} DEFAULT CHARACTER SET 'utf8'".format(DB_NAME))
	print("Database {} dibuat!".format(DB_NAME))
	

def create_tables():
	cursor.execute("USE {}".format(DB_NAME))
	
	for table_name in TABLES:
		table_description = TABLES[table_name]
		try:
			print("Buat tabel ({})\n".format(table_name), end="")
			cursor.execute(table_description)
		except mysql.connector.Error as err:
			if err.errno == errorcode.ER_TABLE_EXISTS_ERROR:
				print("Sudah Ada")
			else:
				print(err.msg)

# Hilangkan tanda # jika ingin run				
# create_database()
# create_tables()
```
file ```main.py```
```
from database import cursor, db

def add_log(text, user):
	sql = ("INSERT INTO logs(text, user) VALUES (%s, %s)")
	cursor.execute(sql, (text, user,))
	db.commit()
	log_id = cursor.lastrowid
	print("Tambahkan {}".format(log_id))
	
def update_log(id, text):
	sql = ("UPDATE logs SET text = %s WHERE id = %s")
	cursor.execute(sql, (text, id))
	db.commit()
	print("Update log")
	
def delete_log(id):
	sql = ("DELETE FROM logs WHERE id = %s")
	cursor.execute(sql, (id,))
	db.commit()
	print("Remove log")

def get_logs():
	sql = ("SELECT * FROM logs ORDER BY created DESC")
	cursor.execute(sql)
	result = cursor.fetchall()
	
	for row in result:
		print(row)
	
def get_logs_select(id):
	sql = ("SELECT * FROM logs WHERE id= %s")
	cursor.execute(sql,(id,))
	result = cursor.fetchone()
	
	for row in result:
		print(row)
		
		
		
# Hilangkan Tanda # jika ingin run
# get all data
# get_logs()

# get select with id
# get_logs_select(2)


# Update 
# update_log(3, 'coba')
# update_log(2, 'coba')
# get_logs()


# Remove 
# delete_log(2)

# Insert 
# add_log('coabaaaa','Hard')
# add_log('follow','Hardi')
# add_log('gasss','Bos')
```

### Python with web
#### Required web

```
pip3 install html5lib
```
```
pip3 install requests
```
```
pip3 install lxml
```
#### Parsing htl BeautifulSoup

```
import requests
from bs4 import BeautifulSoup

url = 'https://contoh.com'
req = requests.get(url)

soup = BeautifulSoup(req.content, 'html5lib')
print(soup.prettify())
```
jika ingin menggunakan request
```
import requests

url = 'https://contoh.com'
req = requests.get(url)

print(req.text)
```
#### Menampilkan tag html

Pencarian tag html
```
import requests
from bs4 import BeautifulSoup

url = 'https://sigeodamkar.com'
req = requests.get(url)

soup = BeautifulSoup(req.content, 'html5lib')
for cari in soup.find_all('h4'):
    print(cari)

```
print isi tag a

```
import requests
from bs4 import BeautifulSoup

url = 'https://sigeodamkar.com'
req = requests.get(url)

soup = BeautifulSoup(req.content, 'html5lib')
for cari in soup.find_all('a'):
    print(cari.text)
```

### Configure python
#### Path
```
echo 'export PATH=$HOME/.local/bin:$PATH' | tee -a ~/.profile
```
```
source ~/.profile
```
#### Virtualenv

Install :
```
python3 -m virtualenv venv
```
Mengaktifkan :
```
source venv/bin/activate
```
Untuk Menonaftifkan :
```
deactivate
```
