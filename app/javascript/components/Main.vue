<template>
  <div class="centered">
    <div>
      <h1>Bad Apples</h1>
      <p>Rotten Tomatoes, but worse!</p>
    </div>
    <Navbar :components="components" @update-component="updateComponent"></Navbar>
    <component :is="this.component" :favorites="favorites"></component>
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
  .centered {
    display: flex;
    flex-direction: column;
    justify-content: center;
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
