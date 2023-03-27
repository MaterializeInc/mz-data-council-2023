# Streaming Analytics with dbt: The Fun Parts

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/MaterializeInc/mz-data-council-2023)

Many data teams have a streaming use case waiting to get off the ground: that dashboard that could run a little faster, a little cheaper; or that notification that could go out right now, instead of in 15 minutes. More often than not, the blocker is getting the required infrastructure in place to even get started with streaming, and having to let go of all the tools your team knows and loves. What if nothing had to change, and streaming still meant just using a database and writing dbt models? In this hands-on workshop, you will build a streaming application from scratch in under an hour using Materialize, dbt and a dash of SQL.

### Getting Started
To run this workshop you will use your own Materialize account. This will have a unique `MZ_HOST`, `MZ_USER` and `MZ_PASSWORD`. If you are attending the workshop in person, you will be provided with a unique URL that will set these environment variables.

We will go over all of this in more detail during the workshop but this is a quick overview of some of the commands we will use.

- To ensure your dbt project in Gitpod can connect to your Materialize instance run:
```
dbt debug
```

- Then to create the necessary connections in your account you can use dbt to execute this macro. You will only need to execute this once:
```
dbt run-operation init_connections 
```

- Assuming you can connect and you have created the necessary connections in your account you can run dbt normally to build your models:
```
dbt run
```

- To build the documentation of our dbt project. You can run:
```
dbt docs generate && dbt docs serve --no-browser
```
While the dbt docs are running, open a separate Gitpod terminal and run:
```
gp ports list
```
This will give your unique URL that you can use to access the dbt documentation.

- To enter your Materialize instance, run the following:
```
export PGPASSWORD=$MZ_PASSWORD
psql -h $MZ_HOST -p 6875 -U $MZ_USER -d materialize --set=sslmode=require
```
You will only need to set your `PGPASSWORD` once and this will be the same as `MZ_PASSWORD` which is injected when you enter the Gitpod environment. From there you will be able to run normal SQL and query the models we are building:
```
SELECT SUM(revenue) FROM materialize.qck.item_summary;
```