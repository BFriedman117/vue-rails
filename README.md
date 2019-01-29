# README

Simple web app that allows users to query a movie database and save a list of favorites with ratings and comments. This app uses Rails to serve a Vue.js front-end.

# To Run:

`bundle install` and `yarn install`
`rake db:create` and then `rake db:migrate` to set up the database
In two separate terminal windows, run `rails s` (to start the Rails server) and `bin/webpack-dev-server` to start the Vue front-end.

# Improvements

### Back-end

I did not have enough time to properly implement users and login. Right now, all database operations default to a hardcoded user with an id of 1. I also did not have enough time to implement database operations that do any sort of filtering, so right now all the data just gets fetched up front and stored on the root front end component.

Initially, Comments were in a separate table so a user could see comments by other users. I ended up simplifying things for the sake of time, and putting comments on the Favorites model.  

### Front-end

Given more time, I would have implemented a Vuex store, which would have dramatically simplified how data gets passed around and mutated. It would also allow me to move all http requests to the store.

I would also implement Vue Router so a user could directly navigate to a route such as app/favorites instead of needing to start from the same view every time.

Of course, the CSS is in need of serious work as well. Given more time, I would be able to set up more reusable styles such as global stylesheets or third party libraries such as Bootstrap.
