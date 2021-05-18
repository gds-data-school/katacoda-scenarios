A possible solution is
```
db.customers.aggregate([
    {
        $match: {
            "state": "Colorado"
        }
    },
    {
        $lookup: {
            from: "items_ordered",
            localField: "customerid",
            foreignField: "customerid",
            as: "joined"
        }
     },
    {
        $unwind: "$joined"
    },
    {
        $project: {
            "joined.item": 1
        }
    }
]).pretty()
```

The resulting *SQL-like* database is the following

```
           firstname lastname       city     state   order_date       item  quantity  price
customerid
10438          Kevin    Smith    Durango  Colorado  01-Nov-1999   Umbrella       1.0   6.75
10438          Kevin    Smith    Durango  Colorado  02-Nov-1999     Pillow       1.0   8.50
10438          Kevin    Smith    Durango  Colorado  18-Jan-2000       Tent       1.0  79.99
10439         Conrad    Giles  Telluride  Colorado  14-Aug-1999  Ski Poles       2.0  25.50
10439         Conrad    Giles  Telluride  Colorado  18-Sep-1999       Tent       1.0  88.00
```
