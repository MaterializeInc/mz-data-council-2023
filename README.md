# Streaming Analytics with dbt: The Fun Parts

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/MaterializeInc/mz-data-council-2023)

Many data teams have a streaming use case waiting to get off the ground: that dashboard that could run a little faster, a little cheaper; or that notification that could go out right now, instead of in 15 minutes. More often than not, the blocker is getting the required infrastructure in place to even get started with streaming, and having to let go of all the tools your team knows and loves. What if nothing had to change, and streaming still meant just using a database and writing dbt models? In this hands-on workshop, you will build a streaming application from scratch in under an hour using Materialize, dbt and a dash of SQL.

### Getting Started
To run this workshop you will use your own Materialize account. This will have a unique `MZ_HOST`, `MZ_USER` and `MZ_PASSWORD`. If you are attending the workshop in person, you will be provided with a unique URL that will set these environment variables. From there you can run:
```
dbt debug
```
To ensure your dbt project can properly connect. Then to create the necessary connections in your account you can use dbt to execute this macro:
```
dbt run-operation init_connections 
```