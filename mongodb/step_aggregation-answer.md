### Exercise 1
```
> db.movies.aggregate([
    {$match:{"genres":"Action", cast:"Bruce Willis"}},
    {$sort: {year:-1}}
])
```

### Exercise 2

```
> db.movies.aggregate([
	{$match:{"cast":"Mack Sennett"}},
	{$group:{_id:0,counts:{$sum:1}}}
  ])
```
An alternative solution could be
```
> db.movies.aggregate([
	{$unwind:"$cast"},
	{$match:{"cast":"Mack Sennett"}},
	{$group:{_id:0,counts:{$sum:1}}}
  ])
```

### Exercise 3

```
> db.movies.aggregate([
	{$unwind:"$cast"},
	{$group:{_id:"$cast",counts:{$sum:1}}},
	{$sort:{"counts":-1}}
  ])
```
### Exercise 4

```
> db.movies.aggregate([
	{$unwind:"$cast"},
	{$match:{"cast":{$ne:"and"}}},
	{$group:{_id:"$cast",counts:{$sum:1}}},
	{$sort:{"counts":-1}}
  ])
```

### Exercise 5
```
# let's do the aggregation
> db.movies.aggregate([
	{$unwind:"$cast"},
	{$match:{"cast":{$ne:"and"}}},
	{$group:{_id:"$cast",counts:{$sum:1}}},
	{$sort:{"counts":-1}},
	{$out:"top_actors"}
  ])

# we can see show the list of the collections for the database
> show collections

# then we can query the new collection
> db.top_actors.find()
```
### Exercise 6 
You can filter more dirty data in the match stages. In this example we inserted 2 stages, for learning purpose: the first filters out specific words, the second filters by a regex pattern. You can use regex pattern anywhere in the matching criterias
```
> db.movies.aggregate([
	{$unwind:"$cast"},
	{$unwind:"$genres"},
	{$match:{"cast":{"$nin": ["and", "or", "...other stopwords..." ]}}},
	{$match:{"cast":{"$in": [ /^[A-Za-z].*/ ]}}},
	{$group:{_id:{actor:"$cast",genre:"$genres"},count_movies:{$sum:1},list_movies:{$addToSet:"$title"}}},
	{$project:{actor:"$_id.actor",genre:"$_id.genre",count_movies:1,list_movies:1}},
	{$project:{_id:0}},
	{$sort:{"count_movies":-1,"actor":1,"genre":1}},
	{$out:"actors_and_genres"}
  ])
```
### Exercise 7 
To create an index use the following command:
`db.movies.createIndex({"cast":1})`

