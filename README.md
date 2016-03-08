### Dependencies

This app relies on devise, mailgun-ruby, angular-ui-bootstrap-rails, dotenv-rails, puma and postgres. All of these can be pulled in from the gemfile by running bundle.

### How to access staging and production and deploy to those environments:

Set up git remote: center.heroku.com/articles/git###creating-a-heroku-remote

Once you're added as a collobarator on Heroku for product and staging, you can create remotes with the commands below:

``` 
git remote add staging git.heroku.com/staging-svp-chicago.git
git remote add production git.heroku.com/production-svp-chicago.git 
```

To push to one of these, use this command:

```
git push <environment> <branch>
```

### Setting up a local database populated with sample data:

Locally, run:

```
rake db:create
rake db:migrate
rake db:seed <- To pull in some seed data
```

For heroku environments, run commands like so:

```
heroku run <command> –remote <environment>
```

### List of environment variables that need to be included in .env (not provided here):

```
MAILGUN_API_KEY=<provided seperately>
ACTION_MAILER_DOMAIN=<provided seperately> 
ACTION_MAILER_USER_NAME=<provided seperately> 
ACTION_MAILER_PASSWORD=<provided seperately>
SVP_EMAIL=<provided seperately>
ENVIRONMENT_URL=<put domain here>
```

### Notes:

Please read the comments in the code for notes on how things are set up.

Our test suite has relavant and passing tests, but we were not able to complete all tests.