# Wine Journal

A Sinatra based application for keeping track of your favorite wines. 🍷

## About

I have a habit of not taking very good notes.

I assume that I will remember something. Like that really good wine I bought that one time. Don't you remember? The one with the...label?

So, I built an app for that. Welcome to Wine Journal.

## Installation

1. Fork the repository
1. Clone the files to your computer
1. Run `bundle install`
1. Run `rake db:migrate`
1. Run `shotgun` to start the server

### Enabling Sessions

To enable sessions, create a `.env` file in the root directory.

In `.env` add the following, replacing the string `ABC123` with a secret word or string.

```
SESSION_SECRET="ABC123"
```
Commit `.gitignore`

> **Note**: Since the `.env` file contains sensitive information, it should not be tracked, committed or push to Github. Please see this post on [Hiding Sensitive Information with Environmental Variables in Ruby](https://shannoncrabill.com/blog/hiding-sensitive-information-with-environmental-variables-in-ruby/) for more information.

### Seeding the Database

Wine journal is now ready to use!

If you want to pre-populate the database with wine bottles (some of my personal favorites) run `rake db:seed`.

The wine bottles created by the seed file will belong to the user with an ID of 1.

## Additional Links

- [Contributing](CONTRIBUTING.md)
- [License](LICENSE.md)
- [Spec](spec.md)
