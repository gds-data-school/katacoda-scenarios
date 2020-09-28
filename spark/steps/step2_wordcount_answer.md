Now you are ready to write your first Spark script.

### Task 1

```python
# Read the input file from current working directory
input_file = 'wikienel.txt'

# input_rdd now contains one row for each line in the input file
input_rdd = sc.textFile(input_file)

# flatMap maps 1 input row into 1 or more output rows
splitted = input_rdd.flatMap(lambda line: line.split(" "))

# flatMap maps 1 input row into 1 output row
mapped = splitted.map(lambda word: (word, 1))

# for each key, compute the sum of the values
counts = mapped.reduceByKey(lambda a, b: a + b)

# collect the results or save them into HDFS
sorted_counts = counts.sortBy(lambda x: x[1], ascending=False)
sorted_counts.collect()
```


### Task 2

Not satisfied with the results?

Try to clean the input dataset with these examples:

```python
# Remove non-alphabetical characters (dot, hyphenes, quotes, ...)
repl_rdd = input_rdd.map(lambda line: line.replace(",", " ").replace(".", " ").replace("'", " ").replace("\"", " "))

# Lowercase or Uppercase all words
low_rdd = repl_rdd.map(lambda line: line.lower())

# Remove words shorter than 4 characters
long_rdd = splitted.filter(lambda word: len(word)>3)
```
