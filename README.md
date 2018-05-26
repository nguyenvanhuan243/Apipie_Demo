This is a sample Rails application demonstrating the features of the
[Apipie](http://github.com/Pajk/apipie-rails) gem.



<!--Set up Rails app -->
  `bundle install` 
  `rake db:setup`
  `rails server`

<!-- API -->
<!-- Note: Create a new user MUST run FIRST -->
1. Create a new user with GET method
  curl -H "Content-Type: application/json" -X POST\
         -d '{"user":{"name":"admin"}}'\
          http://localhost:3000/api/v1/users

2. Create a new tweet with a specify user.
  curl -H "Content-Type: application/json" -X POST\
         -d '{"tweet":{"text":"Text",
                       "scheduled_at":"20/10"}}'\
          http://localhost:3000/api/v1/users/1/tweets

3. Create a new address with a specify user.
  curl -H "Content-Type: application/json" -X POST\
         -d '{"address":{"phone":"Hurray", "country":"2012-12-22T01:00"}}'\
          http://localhost:3000/api/v1/users/1/addresses

4. Create a new comment with a specify user.
  curl -H "Content-Type: application/json" -X POST\
         -d '{"comment":{"title":"Comment Title", "country":"Spam"}}'\
          http://localhost:3000/api/v1/users/1/comments
<!-- API ACCESS -->
`fdsafld`