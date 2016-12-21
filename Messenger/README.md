# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

run rails db:setup to setup database with 4 client accounts. They are ...

Name: Aaron
Email: aaron@mail.com
Password: aaron123
Type: User

Name: Billy
Email: billy@mail.com
Password: billy123
Type: Trainer

Name: Eve
Email: eve@mail.com
Password: eve123
Type: Trainer

Name: James
Email: james@mail.com
Password: james123
Type: User

Each user can send a message to any other user.

Trainers can also use the broadcast option to send a message to every other user/trainer in the database.