import urllib.parse

def urlencode(str):
  return urllib.parse.quote(str)


def urldecode(str):
  return urllib.parse.unquote(str)
print ("Masukkan Kata")
x = input()

encoded = urlencode(x)
print(encoded)  
decoded = urldecode(encoded)
print(decoded)  
