import os
from bson import ObjectId
from pymongo import MongoClient
from dotenv import load_dotenv

load_dotenv()

MONGO_URI = os.getenv("MONGO_URI")
MONGO_DB = os.getenv("MONGO_DB")
MONGO_COLLECTION = os.getenv("MONGO_COLLECTION")

# client = MongoClient(MONGO_URI)
# db = client[MONGO_DB]
# collection = db[MONGO_COLLECTION]

client = MongoClient(os.getenv("MONGO_URI"))
db = client[os.getenv("MONGO_DB")]
collection = db["users"]

def save_user_to_db(user_data: dict):
    result = collection.insert_one(user_data)
    return str(result.inserted_id)

def update_user_result(mongo_id, result):
    from bson import ObjectId
    collection.update_one({"_id": ObjectId(mongo_id)}, {"$set": {"result": result}})
