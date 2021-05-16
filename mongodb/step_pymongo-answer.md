
```
from pymongo import MongoClient

client = MongoClient('localhost', 27017)

airbnb = client["airbnb"]

sample = airbnb["sample_data"]

cursor = sample.find({
    "bedrooms": 2,
    "price": {"$lt": "800"}
  },
  {"bedrooms":1,"address.market":1,"price":1}
)

first_question = list(cursor)

print(first_question)

cursor = sample.find({
    "bedrooms": {"$in": [2, 3]}, 
    "address.market": {"$in": ["Montreal", "Rio De Janeiro"]}
  }, 
  {"bedrooms":1,"address.market":1,"price":1}
)

second_question = list(cursor)

print(second_question)
```
