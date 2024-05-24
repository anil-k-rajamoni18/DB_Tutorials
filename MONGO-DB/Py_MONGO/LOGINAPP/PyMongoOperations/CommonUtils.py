import hashlib
import json
import os 

def encrypt(passwd):
  return  hashlib.md5(passwd.encode()).hexdigest()


def readDataFromFileName(fileName):
  print("current path ====>",os.getcwd())
  os.chdir("./PyMongoOperations")
  f = open(fileName)
  userdata = json.load(f)
  for data in userdata:
    data["password"] = encrypt(data["password"])
  return userdata

#print(readDataFromFileName("USERSDATA.json"))
