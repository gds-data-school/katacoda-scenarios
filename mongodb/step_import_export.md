# Import and export data
Here we show two useful commands available in the
shell to manage large datasets:

1. `mongoexport` is a command-line tool that produces a JSON or CSV export 
of data stored in a `MongoDB` instance.
2. `mongoimport` tool imports content from an Extended JSON, CSV, or TSV 
export created by `mongoexport`, or potentially, another third-party export tool.

## mongoimport

Guide: https://docs.mongodb.com/v4.2/reference/program/mongoimport/

*Tips:*
`mongoimport` is a command that you need to run outside the mongo shell.
You need to use the following parameters, search for the inside the documentation: `db`  the target database,  `collection`  the target collection, `file` the file with data to import,  `drop` if you want to first drop the target collection; `type` if you want to specify you are importing a csv file, `headerline` if you are importing a csv and want to specify that the first row of the file is a header.

### Exercise 1 
Import json:
1. Create a new collection `movies` in the db `datasets` by importing the json file `/root/datasets/movies_limited.json`. Use the `mongoimport` command.

*Hint: use the options `--db`, `--collection` and `--file`*

If you created the command correctly, you should see this output:
```
2021-05-18T13:27:19.253+0000    connected to: mongodb://localhost/
2021-05-18T13:27:19.413+0000    16 document(s) imported successfully. 0 document(s) failed to import.
```


### Exercise 2 (optional)
Import csv:
1. Create a new collection `cities` in the db `datasets` 
by importing the csv file `datasets/cities.csv`. 
Use the `mongoimport` command.

*Hint: use the options `--db`, `--collection`, `--file`, `--headerline` and `--type`*

If you created the command correctly, you should see this output:
```
2021-05-18T13:29:41.534+0000    connected to: mongodb://localhost/
2021-05-18T13:29:41.543+0000    128 document(s) imported successfully. 0 document(s) failed to import.
```

### Exercise 3 
Import truncating existing data:
1. Import the json file `datasets/movies.json` into the existing 
collection `datasets.movies`, truncating the old data, that we don't need anymore. 
Use the `mongoimport` command and its settings to overwrite the old data.

*Hint: use the options `--db`, `--collection`, `--file` and `--drop`*

If you created the command correctly, you should see this output:
```
2021-05-18T13:30:43.148+0000    connected to: mongodb://localhost/
2021-05-18T13:30:43.148+0000    dropping: datasets.movies
2021-05-18T13:30:43.903+0000    28795 document(s) imported successfully. 0 document(s) failed to import.
```

## mongoexport

Guide: https://docs.mongodb.com/v4.2/reference/program/mongoexport/

*Tip:* `mongoexport` *is a command that you need to run outside the mongo shell.*

### Exercise 4 
Export as json:
1. Export the collection `datasets.cities` and store it as a 
json file in the folder `exported_data`. Use the `mongoexport` command.

*Hint: use the options `--db`, `--collection`, `--out` and `--type`*

If you created the command correctly, you should see this output:
```
2021-05-18T13:31:14.074+0000    connected to: mongodb://localhost/
2021-05-18T13:31:14.085+0000    exported 128 records
```

### Exercise 5 (optional)
Export as csv:
1. Export the collection `datasets.movies` and store it as a csv file 
in the folder `exported_data`. 
Use the `mongoexport` command.

*Optional: exclude the* `id` *field from the export and change the order of the fields (example: year as first column)*

*Hint: use the options `--db`, `--collection`, `--out`, `--fields` and `--type`*

If you created the command correctly, you should see this output:
```
2021-05-18T13:31:34.211+0000    connected to: mongodb://localhost/
2021-05-18T13:31:34.554+0000    exported 28795 records
```
