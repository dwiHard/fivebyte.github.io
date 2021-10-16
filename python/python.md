# Trik dan Tips Python3
> Disusun oleh Hardiyanto

### Daftar Isi
* [Basic Python](#basic-python)
    * [Print String](#print-string)
    * [Math](#math)
    * [Variable & Methods](#variable-methods)
    * [Fuction](#fuction)
    * [Add in Parameter](#add-in-parameter)
    * [Add in Multiple Parameter](#add-in-multiple-parameter)
    * [Using Return](#using-return)
    * [Boolean Expressions](#boolean-expressions)
    * [Relational an Boolean Operator](#relational-an-boolean-operator)
    * [Conditional Statements](#conditional-statements)
    * [List](#list)
    * [Tuples](#tuples)
    * [Looping](#looping)
    * [Importing](#importing)
    * [Advanced String](#advanced-string)
    * [Dictionaries](#dictionaries)
    * [List and Dictionaries](#list-and-dictionaries)
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
* [Python with selenium](#python-with-selenium)
	* [Persiapan](#persiapan)
	* [Basic](#basic)
* [Python with appium](#python-with-appium)
	* [Persiapan](#persiapan)
* [Configure python](#configure-python)
    * [Path](#path)
    * [virtualenv](#virtualenv)


### Basic Python
#### Print String

```
print("Ini String")

print("\n")
```

#### Math

```
print("Math Time : ")
print(50 + 50) #add
print(50 - 50) #subract
print(50 * 50) #multiplu
print(50 / 50) #divide
print(50 + 50 - 50 / 50 * 50) #pendas
print(50 ** 2) #exponents
print(50 % 2) #modulo
print(50 // 8) #number without leftover

print("\n")
```

#### Variable & Methods

```
print("Fun with variables and methods : ")
quote = "semakin anda tenang, semakin anda bisa"

print(len(quote))
print(quote.upper())
print(quote.lower())
print(quote.title())

name = "Hardi"
age = 20

print("My name is " +name+ " and I am "+str(age)+ "Years old.")


print("\n")
```

#### Fuction

```
print("New, same functions : ")
def who_i():
    name = "hardi"
    age = 20
    print("My name is "+name+ " and I am "+str(age)+ "years old")

who_i()

print("\n")
```

#### Add in Parameter

```
def add_one_hundred(num):
    print(num + 100)

add_one_hundred(100)

print("\n")
```

#### Add in Multiple Parameter

```
def add(x,y):
    print (x + y)

add(7,7)
add(289,100)

print("\n")
```

#### Using Return

```
def multiply(x,y):
    return x + y

print(multiply(7,7))

def squre_root(x):
    return x + .5

print (squre_root(64))

print("\n")
```

#### Boolean Expressions

```
print("Boolean expressions :")
bool1 = True
bool2 = 3 * 3 == 9
bool3 = False
bool4 = 3 * 3 != 9
print (bool1,bool2,bool3,bool4)
print (type(bool1))

bool5 = "True"
print(type(bool5))

print("\n")
```

#### Relational an Boolean Operator

```
greater_than = 7 > 5
less_than = 5 < 7
greater_than_equal_to = 7 >= 7
less_than_equal_to = 7 <= 7

print(greater_than,less_than,greater_than_equal_to,less_than_equal_to)

test_and = (7 > 5) and (6 < 7)
test_or = (7 > 5) or (5 < 7)
test_not = not True

print(test_and)

print("\n")
```

#### Conditional Statements

```
print("Conditional statements :")
def soda(money):
    if money >= 2:
        return "You've got yourself a soda !"
    else:
        return "No soda for you!"

print(soda(3))
print(soda(1))

print("\n")

def alcohol(age,money):
    if(age >= 21) and (money >= 5):
        return "We're getting tipsy!"
    elif(age >= 21) and (money < 5):
        return "Come back with more money"
    elif(age < 21) and (money < 5):
        return "Nice try, kid"
    else:
        return "You're too poor and to young"

print(alcohol(21,5))
print(alcohol(21,4))
print(alcohol(20,4))

print("\n")
```

#### List

```
print("List have brackets: ")
movie = ["Naruto","batman", "Spiderman", "One Piece", "Boruto"]

print(movie[1])
print(movie[0:2])
print(movie[1:])
print(movie[:1])
print(movie[-1])
print(len(movie))

movie.append("JANS")
print(movie)

movie.pop()
print(movie)

movie.pop(1)
print(movie)

movie = ["Naruto","batman", "Spiderman", "One Piece", "Boruto"]
person = ["Bambank", "yanto", "Sukirman", "Sukijan", "Sarimen"]
combine = zip(movie,person)
print(list(combine))

print("\n")
```

#### Tuples

```
print("Tuples have parentheses and cannot change")
grades = ("A", "B", "C", "D", "E", "F")
print(grades[1])

print("\n")
```

#### Looping

```
print("for lopps start finish of iterate: ")
vagetables = ["kates", "nongko", "pelem"]
for x in vagetables:
    print(x)

print("while loops Excute as long as True : ")
i = 1
while i < 10:
    print(i)
    i += 1
```

#### Importing

```
import sys #system functions and parameters
from datetime import datetime
print(datetime.now())

def new_line():
    print("\n")
    
new_line()
```

#### Advanced String

```
print("Advanced strings :")
my_name = "Hard"
print(my_name[0]) #first initial
print(my_name[-1]) #last letter

sentence = "This is a sentence"
print(sentence[:4]) #first word
print(sentence[-9:-1]) #last word

print(sentence.split()) # split sentence by delimiter (space)

sentence_split = sentence.split()
sentence_join = ' '.join(sentence_split)
print(sentence_join)
print("==========================")
print('\n'.join(sentence_split))

quoteception = "I said, 'give me all the money'"
print(quoteception)

quoteception = "I said, \"give me all the money\""
print(quoteception)

print("A" in "Apple")
letter = "a"
word = "Apple"
print(letter in word)
print(letter.lower() in word.lower()) #improved case insensitive

word_two = "Bingo"
print((letter.lower() in word.lower() and not letter.lower() in word_two.lower()))
too_much_space = "             helloe       "
print(too_much_space.strip())


full_name = "Hardi ganteng"
print(full_name.replace("ganteng","Hardiyanto"))
print(full_name.find("anteng"))

movie = "The hard"
print("My favorite movie is {}.".format(movie))

new_line()
```

#### Dictionaries

```
print("Dictionaries are keys and values :")
drink = {"wedang uwuh": 7, "wedang ronde": 4, "wedang putih": 10} #drink is key, price is value
print(drink)

employees = {"finance":["Bob", "Linda", "Tina"], "IT":["Gene", "Louse", "Teddy"]}
print(employees)

employees['Legal'] = ['Mr. robot'] #add key : value pair
print(employees)

employees.update({"Sales": ["Andie", "Ollie"]})
print(employees)

drink['wedang uwuh'] = 10
print(drink)
print(drink.get("wedang uwuh"))
print(drink.get("ciu"))
print(drink["wedang uwuh"])
```

#### List and Dictionaries

```
movie = ["Naruto", "Boruto", "Tato"]
person = ["Sakirman", "Sukirmen", "Paimen"]
combined = zip(movie, person)
movie_dictionaries = {key: value for key, value in combined}
print(movie_dictionaries)
```


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

### Python with selenium
#### Persiapan
Siapakan browser disini saya menggunakan google chrome, yang perlu diperhatikan yang pertama install chromedriver, pada kasus ini saya menggunakan linux, langkah" bisa diikuti
```
$ wget https://chromedriver.storage.googleapis.com/91.0.4472.101/chromedriver_linux64.zip
```
```
$ unzip chromedriver_linux64_2.3.zip
```
```
$ sudo cp chromedriver /usr/bin/chromedriver
```
```
$ sudo chown root /usr/bin/chromedriver
```
```
$ sudo chmod +x /usr/bin/chromedriver
```
```
$ sudo chmod 755 /usr/bin/chromedriver
```
untuk setup pathnya
```
driver = webdriver.Chrome('/usr/bin/chromedriver')
```
Ini langkah selanjutnya untuk setting web driver untuk firefox download link dibawah ini
```
https://github.com/mozilla/geckodriver/releases
```
Langkah selanjutnya ikuti dibawah ini pastikan filenya udah diextrack
```
$ sudo cp geckodriver /usr/bin/geckodriver
```
```
$ sudo chown root /usr/bin/geckodriver
```
```
$ sudo chmod +x /usr/bin/geckodriver
```
```
$ sudo chmod 755 /usr/bin/chromedriver
```
Langkah selanjutnya menginstall python 
selanjutnya pastikan menggunakan python versi 3++, selanjutnya install selenium dengan cara berikut
```
$ pip3 install selenium
```

### Basic
```
from selenium import webdriver
import time

driver = webdriver.Chrome() 

driver.get("http://localhost")
driver.maximize_window()

driver.find_element_by_id('signin-email').send_keys('operator@gmail.com')
driver.find_element_by_id('submit').click()
driver.find_element_by_link_text('modal').click()
driver.switch_to_window(driver.window_handles[0])
```

### Python with appium
#### persiapan
Kunjuni halaman berikut 
```
https://pypi.org/project/Appium-Python-Client/
```
lalu untuk menginstall app client
```
$ pip install Appium-Python-Client
```
jika untuk mengintall desktopnya
```
https://github.com/appium/appium-desktop/releases/
```
sesuaikan dengan os yang kalian pakai

#### Send whatsapp text
cari app package android buka aplikasinya lalu
Untuk linux :
```
$ adb shell dumpsys window | grep -E 'mCurrentFocus'
```
Untuk Windows :
```
$ adb shell dumpsys window | find "mCurrentFocus"
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
