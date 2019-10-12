# Wine Journal

A Sinatra based application for keeping track of your favorite wines. 🍷

## Installation

1. Fork the repository
1. Clone the files to your computer
1. Run `bundle install`
1. Run `rake db:migrate`
1. Run `shotgun` to start the server

### Enabling Sessions

To enable sessions, create a `.env` and `.gitignore` file in the root directory.

In `.gitignore`, add the following so that the file is not tracked by Git.

```
.env
```

In `.env` add the following, replacing the string `ABC123` with a secret word or string.

```
SESSION_SECRET="ABC123"
```
Commit `.gitignore`

> **Note**: Since the `.env` file contains sensitive information, it should not be tracked, committed or push to Github. Please see this post on [Hiding Sensitive Information with Environmental Variables in Ruby](https://shannoncrabill.com/blog/hiding-sensitive-information-with-environmental-variables-in-ruby/) for more information.
