<template>
  <div>
    <FilmCard :film="currentFilm" v-if="currentFilm" :isFavorite="true" :id="favorite.id"></FilmCard>
    <div class="favorites">
      <span>
        <h5>Your Score: {{ rating ? rating : 'No Score Yet'}}</h5>
        <input type="range" step=".5" min=".5" max="5" v-model="rating"/>
      </span>
      <div>
        <h5>Comment: </h5>
        <textarea></textarea>
      </div>
    </div>
  </div>
</template>
<script>
  import axios from 'axios'
  import FilmCard from '../Films/FilmCard'
  export default {
    props: ['favorite', 'film'],
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
      console.log(this.favorite)
      if (this.film) {
        this.currentFilm = Object.assign({}, this.film)
      } else {
        this.fetchFilmData()
      }
      this.populateData()
    }
  }
</script>
<style>
  .favorites {
    background-color: #eaeaea;
    padding: 10px;
  }
</style>
