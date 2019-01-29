<template>
  <div class="main">
    <div class="header">
      <div>
        <h1 class="header-main">Bad Apples!</h1>
      </div>
      <SearchBar @film-found="filmFound"></SearchBar>
    </div>
    <Navbar :components="components" :selected="selected" @update-component="updateComponent"></Navbar>
    <div class="centered">
      <component
      :is="components[selected].name"
      :favorites="favorites"
      :favoriteIDs="favoriteIDs"
      :films="films"
      :loaded="loaded"
      :queryText="queryText">
    </component>
    </div>
  </div>
</template>
<script>
  import axios from 'axios'
  import Navbar from './Navbar'
  import SearchResults from './Search/SearchResults'
  import SearchBar from './Search/SearchBar'
  import Favorites from './Favorites/Favorites'
  export default {
    components: {
      SearchResults,
      SearchBar,
      Favorites,
      Navbar
    },
    data () {
      return {
        userID: 1,
        users: [],
        favorites: [],
        favoriteIDs: [],
        comments: [],
        films: [],
        loaded: false,
        queryText: '',
        selected: 0,
        components: [
          {
          name: 'SearchResults',
          displayName: 'Search Results'
          },
          {
            name: 'Favorites',
            displayName: 'Favorites'
          }
        ]
      }
    },
    methods: {
      updateComponent (index) {
        this.selected = index
      },
      fetchUsers () {
        return axios.get(`http://localhost:3000/users`).then(res => {
          console.log('got users', res.data)
          this.users = res.data
        })
      },
      populateIDs (favorites) {
        favorites.forEach(favorite => {
          this.favoriteIDs.push(favorite.omdbid)
        })
      },
      fetchFavorites () {
        return axios.get(`http://localhost:3000/favorites`).then(res => {
          console.log('got favorites', res.data)
          this.favorites = res.data
          this.populateIDs(res.data)
        })
      },
      fetchComments () {
        return axios.get(`http://localhost:3000/comments`).then(res => {
          console.log('got comments', res.data)
          this.comments = res.data
        })
      },
      filmFound (film) {
        console.log('ff', film)
        this.films.push(film)
        this.selected = 0
      }
    },
    created () {
      Promise.all([
        // this.fetchUsers(),
        this.fetchFavorites(),
        this.fetchComments()
      ]).then(() => console.log('all done!'))
    }
  }
</script>
<style scoped>

  .main {
    margin: 0 20%;
    background-color: white;
    height: 100vh;
  }

  .header {
    background-color: #FA320A;
    color: white;
    padding: 1px 15px;
    display: flex;
    flex-direction: row;
  }

  .header-main {
    font-family: "Impact";
    font-size: 40px;
  }

  .header-sub {
    font-family: "Impact"
  }

  .centered {
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
  }

  .button:hover {
    cursor: pointer;
  }

  .film {
    max-width: 500px;
    max-height: 300px;
    margin: 15px 0px;
  }

  .film-card {
    display: flex;
    flex-direction: row;
    padding-right: 5px;
    background-color: #eaeaea;
  }

  .film-poster {
    max-height: 200px;
  }

  .film-info {
    margin-left: 15px;
  }
</style>
