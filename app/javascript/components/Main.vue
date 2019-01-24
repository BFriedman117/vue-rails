<template>
  <div class="centered">
    <div>
      <div>
        <h1>Ben's Terrible Web App</h1>
        <p>What are you doing here? Get the heck off my app!!</p>
      </div>

      <div>
        <h3>Search For Films</h3>
        <span style="min-width: 500px;">
          <input placeholder="Search..." v-model="queryText" @keypress.enter="query" style="min-width: 400px; min-height: 20px;"/>
          <button class="button" @click="query" style="width: 80px; padding: 5px 0px;">Search</button>
        </span>
      </div>

      <div>
        <div v-for="film in films" class="film">
          <span class="film-card" v-if="film.Response === 'True'">
            <img :src="film.Poster.length ? film.Poster : noPosterURL" class="film-poster"/>
            <div class="film-info">
              <h3>{{ film.Title }}</h3>
              <p>{{ film.Plot }}</p>
              <button class="button">Add To Favorites</button>
            </div>
          </span>
          <span class="film-card" v-else>
            <img :src="noPosterURL"/>
            <div class="film-info">
              <h3>Not Found :(</h3>
              <p>Try again.</p>
            </div>
          </span>
        </div>
      </div>

    </div>
  </div>
</template>
<script>
  import axios from 'axios'
  export default {
    data () {
      return {
        queryText: '',
        films: [],
        noPosterURL: "https://user-images.githubusercontent.com/24848110/33519396-7e56363c-d79d-11e7-969b-09782f5ccbab.png"
      }
    },
    methods: {
      query () {
        this.films = []
        let key = '14a71611'
        axios.get(`http://www.omdbapi.com/?apikey=${key}&t=${this.queryText}`).then(res => {
          this.queryText = ''
          this.films.push(res.data)
        })
      }
    }
  }
</script>
<style scoped>
  .centered {
    display: flex;
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
