# [Blaze](http://blazeapp.herokuapp.com/)

A web application for logging trails completed while hiking, biking, or running.

*Built using Ruby on Rails as my back-end capstone project at Nashville Software School*

## Goals

- Build an online log for creating trail entries
- Consume an API to utilize data in creating trail entries
- Implement an OAuth strategy
- Image upload to trail entries

## Tech & Techniques Used

- TrailApi.com / HTTParty
- Carrierwave/Fog/AWS S3 buckets
- Capybara / RSpec
- Postgresql / Heroku
- Devise, Omniauth (Twitter), Figaro
- Sass, Haml, Foundation

Users can log in both locally or authenticate via Twitter. The email used is always checked against the database for uniqueness whether 
an account is created locally or through the Twitter login. This could cause a problem with two separate methods to authenticate. However, this app 
uses code which will link the two methods together if the same email is used. For example, if a user creates an account locally and then in the 
future uses Twitter to login, as long as the user confirms an email address used to create an account locally, only the one user record will remain 
in the database. A duplicate account will not be created for the user.
