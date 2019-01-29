<template>
  <div>
    <FilmCard :film="currentFilm" v-if="currentFilm"></FilmCard>
    <div>
      <span>
        <h5>Your Score:</h5>
      </span>
      <span>
        <input type="range" step=".5" min=".5" max="5" v-model="rating"/>
      </span>
    </div>
  </div>
</template>
<script>
  import axios from 'axios'
  import FilmCard from '../Films/FilmCard'
  export default {
    props: ['favorite'],
    data () {
      return {
          currentFilm: null,
          rating: null,
          text: '',
          editing: false
      }
    },
    components: {
      FilmCard
    },
    methods: {
      fetchFilmData () {
        let key = '14a71611'
        axios.get(`http://www.omdbapi.com/?apikey=${key}&i=${this.favorite.omdbid}`).then(res => {
          console.log('got something: ', res)
          if (res.data.Response === 'True') {
            this.currentFilm = res.data
          }
        })
      },
      populateData () {
        let temp = Object.assign({}, this.favorite)
        this.rating = temp.rating
        // TODO: Connect comments, possibly move into 'favorites'
        // this.text = temp.string
        // TODO: Change 'string' field in comments to more descriptive 'text'
      }
    },
    created () {
      console.log('i exist')
      this.fetchFilmData()
      this.populateData()
    }
  }
</script>
