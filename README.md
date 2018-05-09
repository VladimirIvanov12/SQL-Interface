# SQL-Interface

Garage made prototype for SQL Interface.

### Examples (Run in Ensemble Terminal): ###
#### Initialize query: ####
`set query = "SELECT Name,SecondName, Sex, DateOfBirth FROM Project.Person"`

#### Add Query to database: ####
`set res = ##class(Project.Controller).addQueryToHistory(query)`

#### View all queries added to database: ####
`set res = ##class(Project.Controller).getAllQueries()`

#### Delete query from database: ####
`set res = ##class(Project.Controller).deleteQuery(xxx)`
where xxx = query ID

#### Run query: ####
`set result = ##class(Project.Controller).runQuery(query)`
