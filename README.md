# Streaming Analytics with dbt: The Fun Parts

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/MaterializeInc/mz-data-council-2023)

Many data teams have a streaming use case waiting to get off the ground: that dashboard that could run a little faster, a little cheaper; or that notification that could go out right now, instead of in 15 minutes. More often than not, the blocker is getting the required infrastructure in place to even get started with streaming, and having to let go of all the tools your team knows and loves. What if nothing had to change, and streaming still meant just using a database and writing dbt models?

In this hands-on workshop, you will **build a streaming application from scratch** in under an hour using Materialize, dbt and a dash of SQL. :sparkles:

## Getting started

### Setup

To speed things up, we've created temporary Materialize accounts for everyone and packaged everything you need to get up and running in a Gitpod environment. Head over to [this link](https://app.hex.tech/8ef023be-82dc-4938-a59a-68b406eb8d57/app/67f97582-9360-4665-9fce-a11d092b5b6c/latest) to get started!

> **Note:** These temporary accounts will be wiped after the workshop. If you want to continue exploring Materialize, [sign up for access](https://materialize.com/register/) or drop by our booth for a demo!

### What to expect

We'll go over the setup and walk through its different moving parts in the first part of the workshop. Here's a rough overview of some of the commands you'll be running:

1. Ensure your dbt project in Gitpod can connect to your assigned Materialize instance:

```bash
dbt debug
```

2. Then, execute the `init_connections` macro to bootstrap the required connections in Materialize (which would, under normal conditions, be configured ahead of running your dbt projects!). You only need to execute this **once**:

```bash
dbt run-operation init_connections
```

3. Assuming you can connect and the required connections exist in your account, run dbt normally to build your models:

```bash
dbt run
```

4. As with any other dbt project, you can automatically generate and serve its documentation as a static website. Run:

```bash
dbt docs generate && dbt docs serve --no-browser
```

While the dbt docs are running, open a separate Gitpod terminal and run:

```bash
gp ports list
```

This will output a unique URL that you can use to access the documentation website.

5. Finally, you can start exploring the data model in Materialize! To connect to your instance using `psql`, run:

```bash
export PGPASSWORD=$MZ_PASSWORD

psql -h $MZ_HOST -p 6875 -U $MZ_USER -d materialize --set=sslmode=require
```

You only need to set your `PGPASSWORD` once, and this will be the same as `MZ_PASSWORD` which is injected when you enter the Gitpod environment. From here, you'll be able to run SQL statements and query the models! As an example, try running:

```sql
SELECT SUM(revenue) FROM materialize.qck.item_summary;
```

## Getting support

If you run into a snag or need support, just wave and we'll be right over! :wave: