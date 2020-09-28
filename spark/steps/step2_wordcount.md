Now you are ready to write your first Spark script.

## Task 1

In this exercise, we will rewrite the Work Count script and try to improve the results.

An input file is placed under your home directory in the local file system:

`ls wikienel.txt`

Open pyspark and compute each different word's frequency.

Remember the steps:

- Read the file so that each element of the RDD contains one line of the input file
- Split each line into many words
- Create key-value pairs: (word, 1)
- Group by word and sum the corresponding values
- Order the results by value


## Task 2

Not satisfied with the results?

Try to clean the input dataset:

- Remove non-alphabetical characters (dot, hyphenes, quotes, ...)
- Lowercase or Uppercase all words
- Remove words shorter than 4 characters
- ...

