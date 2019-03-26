# Bookmark Manager

	This is a week 4 challenge as part of the Masters on-site curriculum.

	## User Stories

	```
	As a user
	I would like to be able to see a list of bookmarks
	So that I can quickly access my favourite websites
	```

	## Domain Model

  - Classes
  Bookmark class

  - Views
  List view of all bookmarks

  - Controller

  ## Database Instructions

	- Firstly, connect to psql by typing <psql> in command line
	- Once you have psql running, you onnect to the database by typing the pqsl command \c bookmark_manager;
	- Do not forget the final semi-colon - it's not optional.
	- The RSpec tests require a test database to be setup - please see below for instructions.

## Production Database Setup Instructions

	- `CREATE DATABASE BOOKMARK_MANAGER;`
	- `CREATE TABLE bookmarks (id SERIAL PRIMARY KEY, url VARCHAR(60));`

## Test Database Setup Instructions

- `CREATE DATABASE BOOKMARK_MANAGER_TEST;`
- `CREATE TABLE bookmarks (id SERIAL PRIMARY KEY, url VARCHAR(60));`
