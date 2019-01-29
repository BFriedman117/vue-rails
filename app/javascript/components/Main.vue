<template>
  <div class="main">
    <div class="header">
      <div>
        <h1 class="header-main">Bad Apples!</h1>
      </div>
      <div class="header-searchbar">
        <div class="input-group">
          <input class="searchbar" placeholder="Search for films..."/>
          <div class="button-container">
            <button class="searchbar-button">&#x1f50d</button>
          </div>
        </div>
      </div>
    </div>
    <Navbar :components="components" @update-component="updateComponent"></Navbar>
    <div class="centered">
      <component :is="this.component" :favorites="favorites"></component>
    </div>
  </div>
</template>
<script>
  import axios from 'axios'
  import Navbar from './Navbar'
  import Search from './Search/Search'
  import Favorites from './Favorites/Favorites'
  export default {
    components: {
      Search,
      Favorites,
      Navbar
    },
    data () {
      return {
        users: [],
        favorites: [],
        comments: [],
        component: 'Search',
        components: ['Search', 'Favorites']
      }
    },
    methods: {
      updateComponent (component) {
        this.component = component
      },
      fetchUsers () {
        return axios.get(`http://localhost:3000/users`).then(res => {
          console.log('got users', res.data)
          this.users = res.data
        })
      },
      fetchFavorites () {
        return axios.get(`http://localhost:3000/favorites`).then(res => {
          console.log('got favorites', res.data)
          this.favorites = res.data
        })
      },
      fetchComments () {
        return axios.get(`http://localhost:3000/comments`).then(res => {
          console.log('got comments', res.data)
          this.comments = res.data
        })
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

  .header-searchbar {
    margin: 30px 30px;
  }

  .input-group {
    display: table;
    border-radius: 5px;
    vertical-align: middle;
  }

  .searchbar {
    display: table-cell;
    height: 32px;
    width: 400px;
    padding: 3px 10px;
    font-size: 18px;
    border-radius: 5px;
    border: none;
  }

  .button-container {
      display: table-cell;
  }

  .searchbar-button {
    display: inline-block;
    vertical-align: middle;
    text-align: center;
    font-size: 16px;
    line-height: 1.25;
    padding: 9px 6px;
    border: none;
    border-radius: 5px;
    margin: 2px;
    margin-bottom: 5px;
    font-family: "Impact";
    cursor: pointer;
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
