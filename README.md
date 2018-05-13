# SQL-Interface

Simple project that allows to manipulate with SQL queries stored in the database via web interface.

## Functionality:
#### Main tab: 
- Allows to add querises to database. Query must have SELECT and FROM statements, FROM and ORDER BY are optional
- Shows all queries in database that are not marked as archived
- Allows to edit existing queries

#### Archive tab
- Shows archived queries. Those cannot be edited or deleted, only unarchived. 

## Deployment
Package structure should be the following:

Classes<br>
 -Project<br>
 --Controller<br>
 --Query<br>
CSP Files<br>
 -ui.csp<br>

## Built with
- [InterSystems Caché](http://www.intersystems.com/ru/our-products/cache/cache-overview/) as database management system
- [Bootstrap v4.1](https://getbootstrap.com/) as web framework
