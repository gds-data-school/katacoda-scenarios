In this example we want to calculate the average salary for employees by country.

## Task

There are two datasets to read:

- Employee contains anagraphic data, salary and department ID of the employees.

`cat employees.json`{{execute}}

- Departments contains geographic informations about the departments.

`cat departments.csv`{{execute}}

Start a new PySpark shell and read the files into Dataframes:

`pyspark`{{execute}}


## Task

- We only need some columns of the Dataframes:
    - For employees: SALARY, DEPT_ID
    - For departments: DEPT_ID, COUNTRY

- Now we have to join the datasets. Then, we don't need DEPT_ID anymore.

- Resulting Dataframe should be grouped by COUNTRY.

- Finally, compute the average SALARY for each COUNTRY.
