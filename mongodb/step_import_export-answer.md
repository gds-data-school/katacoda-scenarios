### Exercise 1 
In the bash shell
```
# let's import the data:
$ mongoimport --db=datasets --collection=movies --file=/root/datasets/movies_limited.json 

# enter inside the mongo shell:
$ mongo
```
In the mongo shell
```
# let's switch the database:
> use datasets;
# let's count the rows of the imported database:
> db.movies.count();
```


### Exercise 2 
In the bash shell:
```
# let's import the data:
$ mongoimport --db=datasets --collection=cities --type=csv --headerline --file=/root/datasets/cities.csv 
```
Then enter inside the mongo shell
```
$ mongo
```
In the cli use the following commands
```
# let's switch the database:
> use datasets;
# let's count the imported rows:
> db.cities.count();
```

### Exercise 3 
In the bash shell
```
# let's import the data:
$ mongoimport --db=datasets --collection=movies --drop --file=/root/datasets/movies.json 

# enter inside the mongo shell:
$ mongo
```
Then in the mongo shell
```
# let's switch the database:
> use datasets;
# let's count the rows:
> db.movies.count();
```

### Exercise 4 
In the bash shell
```
# create folder (if needed):
$ mkdir -p /root/exported_data

# export the dataset:
$ mongoexport --db=datasets --collection=cities --type=json --out=/root/exported_data/cities.json

# now let's check the exported document, showing the head of the json file:
$ head /root/exported_data/cities.json
```

### Exercise 5
In the bash shell

```
# create folder (if needed):
$ mkdir -p /root/exported_data

# export the dataset:
$ mongoexport --db=datasets --collection=movies --type=csv --fields=year,title,cast,genre --out=/root/exported_data/movies.csv

# now let's check the exported document, counting the number of lines of the csv:
$ wc -l /root/exported_data/movies.csv
```
