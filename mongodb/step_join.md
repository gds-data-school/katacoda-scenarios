# Join

In this step we analyze a different dataset, **orders**. It should
be already loaded in the database. 
Access
via command line
```
$ mongo
```
and then use the following command
```
> use orders
```

This database has a more complex structure.
It contains five collection. We can get information
regarding the collections using the following commands
[listCollections](https://docs.mongodb.com/manual/reference/command/listCollections/).
For our purpose just type
```
> db.getCollectionNames()
```

As a first step explore the database to understand the
whole structure.

Once you are confident on the structure it is time
to perform a *join* among two collections. This operation
is called [aggregation](https://docs.mongodb.com/manual/reference/operator/aggregation/lookup/).
To flatten the risulting array we perform the 
so-called [unwind](https://docs.mongodb.com/manual/reference/operator/aggregation/unwind/)
manipulation.

In this example we perform a join on the `customerid`
```
> db.customers.aggregate([
    // first stage in the pipe
    {
        $lookup: {
            from: "items_ordered",
            localField: "customerid",
            foreignField: "customerid",
            as: "joined"
        }
     },
    // second stage in the pipe
    {
        $unwind: "$joined"
    }   
])
```

Tricky enough? 

### Exercise

Suppose you want to select item for fields where the state
of the customer is Colorado, can you do this?

In SQL the query should look like
```postgres-psql
SELECT items_ordered.item 
FROM customer, item_ordered
WHERE customer.customerid = items_ordered.customerid
AND customer.state = 'Colorado'
```
