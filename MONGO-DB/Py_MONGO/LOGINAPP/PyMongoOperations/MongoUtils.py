import pymongo 
import CommonUtils

def createDBCollection(db_name,coll_name,DB_URL):
    ''' this method will create a new DB with new COLLECTION written @username'''
    #client connection 
    client = pymongo.MongoClient(DB_URL)

    #DB connection
    my_db = client[db_name]

    #collection connection 
    my_coll = my_db[coll_name]
    
    data = {"name": "kumar","username":"Akumar","password":CommonUtils.encrypt("kumar123")}
    my_coll.insert_one(data)

    return f"{db_name} created with collection name {coll_name} and inserted one record. "


def CreateConnection(db_name,coll_name,DB_URL):
    
    #client connection 
    try:
        client = pymongo.MongoClient(DB_URL)
        try:
            if db_name in client.list_database_names():
                my_db = client[db_name]
                try:
                    if coll_name in my_db.list_collection_names():
                        my_coll = my_db[coll_name]
                        print(f"Connection CREATED for {db_name} &  collection {coll_name} ....")
                        return my_coll
                    else:
                        raise Exception("Collection not found...")
                except Exception as e:
                    print(e)               
            else:
                raise Exception("DB NOT FOUND")
        except Exception as e:
            print(e)
        
    except Exception as e:
        print("unable to create Client connection...",e)


def insertBlukData(coll,data):
  coll.insert_many(data)
  return "inserted successfully..."


def findByUserName(coll,uname):
  return coll.find_one({"username":uname})


def insertOne():
    pass

def findOneRecord():
    pass

def updateRecord():
    pass

def removeRecord():
    pass