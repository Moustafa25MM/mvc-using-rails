# Project Name

This README documents the necessary steps to get the application up and running.

## Table of Contents

- [Ruby and Rails Versions](#ruby-and-rails-versions)
- [System Dependencies](#system-dependencies)
- [Configuration](#configuration)
- [Start the APP using Docker](#start-the-app-using-docker)
- [Start the APP](#start-the-app)
- [Database Schema](#database-schema)

## Ruby and Rails Versions

- Ruby version: `3.2.2`
- Rails version: `7.0.8.1`

## System Dependencies

To install system dependencies, run:

```bash
bundle install
```
## Configuration
create a .env file in the root directory with the following contents:

POSTGRES_PASSWORD=your_password
POSTGRES_USER=your_username
POSTGRES_DB=your_database_name

## Start the APP using Docker
    after setting the environment variables as above in .env file then :

    docker-compose build
    docker-compose up
    
## Start the APP

    rails db:create
    rails db:migrate
    rails s

## Database Schema

![Alt text](./databseSchema.png)
