In this example we want to calculate the average salary for employees by country.

### Task

```python
# import dataframe useful functions
from pyspark.sql.functions import *

# read departments CSV file setting the appropriate options
dept = spark.read.option('delimiter', '|').option('header', True).csv('departments.csv')

# read employees JSON file
emp = spark.read.json('employees.json')

# show dataframes to see if files where read correctly
dept.show()
emp.show()

# select just the columns you need
dept_sel = dept.select("dept_id","country")
emp_sel = emp.select("salary", "dept_id")

# join dataframes specifying the join column
joined_df = emp_sel.join(dept_sel,["dept_id"])

joined_df.show()

# you only need salary and country. Select them..
salary_country_df = joined_df.select("salary", "country")

# ..or simply drop dept_id
salary_country_df = joined_df.drop("dept_id")

# Now you need to group the records by country and compute the average by salary
res_df = salary_country_df.groupBy("country").avg("salary")

res_df.show()
```
