# Specifications for the Sinatra Assessment

A detailed account of my process can be found at [Building a Wine Journal Application with Sinatra](https://shannoncrabill.com/blog/sinatra-crud-application/).

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
  - ActiveRecord including migrations are used for the MVC
- [x] Include more than one model class (e.g. User, Post, Category).
  - For this application two models were used. A model for users and a models for bottles of wine. Each user will be able to do CRUD operations on the bottles that are in their collection.
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
  - A user has_many bottles.
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
  - A bottle belongs_to many users. A bottle instance is unique, but different users can have different instances of the same type of wine.
- [x] Include user accounts with unique login attribute (username or email)
  - On the /login page, a form asks the user for an email address and password. If the user exists in the database (find by email) and the password matches the password on file, the user is logged in and redirected to the /bottles route.
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
  - Creating, when a user is logged in, any bottles they create as associated with their user_id. If they are not logged in, redirect to the signup page.
  - The create a new bottle page can only be accessed by login users. If they are not logged in, they are redirected to the sign in page (what if they never created an account)
  - Similar logic is used for viewing a specific bottle and viewing the edit/delete page for a specific bottle
- [x] Ensure that users can't modify content created by other users
  - Edit and delete pages can only be seen by the owner of the content.
  - As a second line of protection, at the point of updating or deleting, it is double checked if the current user has permission. If they do not have permissions, the actions are not executed.
- [x] Include user input validations
 - Objects will only be created or saved to the database if there are no empty inputs.
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
  - 80+ commits as of October 11th
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
