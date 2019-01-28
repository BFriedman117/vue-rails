<template>
  <div class="centered">
    <div>
      <div>
        <h3>Search For Films</h3>
        <span style="min-width: 500px;">
          <input placeholder="Search..." v-model="queryText" @keypress.enter="query" style="min-width: 400px; min-height: 20px;"/>
          <button class="button" @click="query" style="width: 80px; padding: 5px 0px;">Search</button>
        </span>
      </div>
      <div>
        <div v-for="film in films">
          <FilmCard :film="film" @add-to-favorites="addToFavorites(film)"></FilmCard>
        </div>
      </div>
    </div>

  </div>
</template>
<script>
  import axios from 'axios'
  import FilmCard from '../Films/FilmCard'
  export default {
    components: {
      FilmCard
    },
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
      },
      addToFavorites (film) {
        console.log('recieved favorite', film)
        this.$emit('add-to-favorites', film)
        axios.post(`http://localhost:3000/favorites`, {
          user_id: '1',
          omdbid: film.imdbID
        }).then(res => {
          console.log('added', res)
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

</style>
