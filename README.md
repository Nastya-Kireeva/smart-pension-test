# Smart Pension Test Task

## Description
This program reads from file with logs and filters them.

## Installation
Clone the repository
```
Install ruby (3.0.0)

Run $ bundle install
```
## Usage
```
Running in the console:
$ ruby ruby_app.rb log/webserver.log
```

## This script:
```
- Validates given file with logs by checking its presence and fullness
- Filters the logs in 2 ways: ordered list of webpages with most page views & 
  ordered list of webpages with most unique page views
- Outputs result to console
```

## Running tests
```
rspec
```