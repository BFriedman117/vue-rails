# README

Simple web app that allows users to query a movie database and save a list of favorites with ratings and comments. This app uses Rails to serve a Vue.js front-end.

# To Run:

`bundle install` and `yarn install` to install Ruby Gems and Node packages.

`rake db:create` and then `rake db:migrate` to set up the database.

I didn't have time to properly implement sign-up and log-in, so you will need to create a default user for the app to work in it's current state.

A simple way to accomplish this is to `brew install httpie` (which allows you to make HTTP requests from the command line - https://httpie.org/) and then run `http POST :3000/users username=testuser password=testpassword`. Actual user details are not important - it just needs to exist.

In two separate terminal windows, run `rails s` (to start the Rails server) and `bin/webpack-dev-server` (to start the Vue front-end server).

The app is now running on `localhost:3000`.


# Improvements

### Back-end

I did not have enough time to properly implement users and login. Right now, all database operations default to a hardcoded user with an id of 1. I also did not have enough time to implement database operations that do any sort of filtering, so right now all the data just gets fetched up front and stored on the root front end component. Any sorting now has to happen in the app.

Initially, Comments were in a separate table so a user could eventually see comments by other users. I ended up simplifying things for the sake of time, and putting comments on the Favorites model.

### Front-end

Given more time, I would have implemented a Vuex store, which would have dramatically simplified how data gets passed around and mutated. It would also allow me to move all http requests to the store, and set them up to work with either the dev base of 'localhost:3000' or whatever the production base is (as opposed to hard-coding).

I would also implement Vue Router so a user could directly navigate to a route such as app/favorites instead of needing to start from the same view every time.

Of course, the CSS is in need of serious work as well. Given more time, I would be able to set up more reusable styles such as global stylesheets or third party libraries such as Bootstrap.
