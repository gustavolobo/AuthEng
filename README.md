AuthEng
=======

Motivation
----------
What led me to the creation of this engine was the fact that on several projects that I have worked on, always have the same problems with the gem devise, and almost always because I want that the authentication follows a flow that devise doesn't follow by default.

For example, I don't want people to be able to register themselves, I want it to be done by an authenticated user. And then, these people should receive an account confirmation/activation email, and when they click the link in that email, they can choose their own password.

So, I decided to create an engine, trying to make it as easy as possible to integrate with a newly created application.

Later I will try to clarify the flow of this engine. Any suggestion, thanks.