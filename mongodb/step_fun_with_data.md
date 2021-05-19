# Fun with data

Here we use a sample of data from AirBnB, see this [link](http://insideairbnb.com/get-the-data.html)
for further details.

The data can be stored in MongoDB running the
following bash script (remember to *quit* from the mongo cli first)

`bash loader.sh`{{execute}}

The script also installed the `python` package `pymongo` that
we will use later in the class.

We need to use the new database, called *airbnb*. To check that the databases
are correctly loaded you can use the `show dbs` statement inside the mongo cli. 


To get the collections you can use the command [show collections](https://docs.mongodb.com/manual/release-notes/4.0-compatibility/#compat-show-collections).
As a first step let's count the number of items
```
> use airbnb
> db.sample_data.count()
```
You should get 27. 

### Exercise

In the following you should use the `find` [command](https://docs.mongodb.com/manual/reference/method/db.collection.find/#find-documents-that-match-query-criteria) 
to select documents. We want to select data based on
the following criteria (in mongodb criteria are also called 'match criteria'):
1. select apartments where the number of bedrooms = 2;
2. select apartments where the number of bedrooms = 2 and price is lower than 800;
3. select apartments in New York;
4. select apartments in New York and Los Angeles. 

Hints:
* bedrooms field: "bedrooms" (type integer)
* price field: "price" (type string with format "NNN.DD")
* city field: "address.market" (type string)

To better see the result, you can only project some fields.

You can count the result of each find command with the construct
`db.sample_data.find({<match criteria>}, {<projections>}).count()`

You should get the following count result for each query:
1. 3 documents
2. 1 document
3. 1 document
4. 1 document