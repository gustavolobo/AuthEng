AuthEng
=======

Motivation
----------
What led me to the creation of this engine was the fact that on several projects that I have worked on, always have the same problems with the gem devise, and almost always because I want that the authentication follows a flow that devise doesn't follow by default.

For example, I don't want people to be able to register themselves, I want it to be done by an authenticated user. And then, these people should receive an account confirmation/activation email, and when they click the link in that email, they can choose their own password.

So, I decided to create an engine, trying to make it as easy as possible to integrate with a newly created application.

Later I will try to clarify the flow of this engine. Any suggestion, thanks.

What it does?
-------------
### Authentication & Users Mgmt
* [Devise](https://github.com/plataformatec/devise) authentication.
* Users cannot register themselves. It's supposed to be an administrator to do so.
* When an administrator registers an user, he doesn't choose a password for him. An email is sent, and the user can then confirm his account by choosing a password.
* Users management backoffice.
* Emails sent with [Delayed Job](https://github.com/collectiveidea/delayed_job).
* [Haml](https://github.com/haml/haml) views.
* [Formtastic](https://github.com/justinfrench/formtastic) forms.
* Users deletion with [rails3_cts_as_paranoid](https://github.com/goncalossilva/rails3_acts_as_paranoid).

Usage
-----
###If you don't have delayed_job, in your Gemfile add:
```ruby
gem 'delayed_job_active_record'
```
And run:
```
bundle install
rails generate delayed_job:active_record
rake db:migrate
```

###Installation
In your project:
```
cd vendor/engines
git clone https://github.com/gustavolobo/AuthEng.git
cd ../..
```
In your Gemfile:
```ruby
gem 'auth_eng', :path => "vendor/engines"
```
Run:
```
bundle install
rake auth_eng:install:migrations
rake db:migrate
```
In your routes file:
```ruby
mount AuthEng::Engine, :at => "/auth_eng"
```
And then, add an user (don't forget to configure the email in your environment):
* seeds.rb
```ruby
AuthEng::User.create(name: "user_name", email: "user_email")
```
(you will receive a confirmation email.)