from MongoUtils import *;
from CommonUtils import *;

if __name__ == '__main__':

  REMOTE_DB_URL = "mongodb+srv://Alien:AlienDB@cluster0.mitqgvp.mongodb.net/?retryWrites=true&w=majority"
  LOCAL_DB_URL = "mongodb://localhost:27017/"
  FILE_NAME = "USERSDATA.json"
  DB_NAME = input("Enter DATABASE name: ")
  COLL_NAME = input("Enter COLLECTION name: ")
  collObj = None;
  
  while True:
    print("1.Create DB\n2.Insert Bluk Data\n3.Login\n-1.Exit\n")
    ch = int(input("enter the choice: "))
    if ch == 1:
       print("================ CONNECTING =======================")
       print(createDBCollection(DB_NAME,COLL_NAME,REMOTE_DB_URL))
    elif ch == 2:
      collObj = CreateConnection(DB_NAME,COLL_NAME,REMOTE_DB_URL)
      encryptedData = readDataFromFileName(FILE_NAME)
      print(insertBlukData(collObj,encryptedData))
    
    elif ch == 3:
       collObj = CreateConnection(DB_NAME,COLL_NAME,REMOTE_DB_URL)

       usernameInp = input("ENTER USERNAME :  ")
       response_Data = findByUserName(collObj,usernameInp)
       print(response_Data)
       if response_Data:
        if response_Data["username"] == usernameInp:
          passwordInp = input("ENTER PASSWORD :  ")
          if response_Data["password"] == encrypt(passwordInp):
            print("LOGIN SUCCESS")
          else:
            print("INVALID PASSWORD....")
        else:
            print("INVALID USERNAME...")
       else:
          print("NO MATCHING RECORD WITH USERNAME....")
    
    elif ch == -1:
      break
    else:
      print("invalid choice.. , please try again..")



      





  

 





 
  
  
 


  

