<template>
  <div>
    <FilmCard :film="currentFilm" v-if="currentFilm" :isFavorite="true" :id="favorite.id"></FilmCard>
    <div class="favorites">
      <span class="rating">
        <h5 class="title">Your Score: {{ rating ? rating : 'No Score Yet'}}</h5>
        <input type="range" step=".5" min=".5" max="5" v-model="rating" style="margin-left: 10px;" @input="edit"/>
      </span>
      <div>
        <h5 class="title">Comment: </h5>
        <textarea v-model="comment" @input="edit"></textarea>
      </div>
      <button v-if="editing" @click="updateFavorite">Save Changes</button>
    </div>
  </div>
</template>
<script>
  import axios from 'axios'
  import debounce from 'lodash.debounce'
  import FilmCard from '../Films/FilmCard'
  export default {
    props: ['favorite', 'film'],
    data () {
      return {
          currentFilm: null,
          rating: null,
          comment: '',
          editing: false,
          debounce
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
        this.comment = temp.comment
      },
      edit () {
        this.editing = true
      },
      updateFavorite () {
        axios.patch(`http://localhost:3000/favorites/${this.favorite.id}`, {
          comment: this.comment,
          rating: this.rating
        }).then(res => {
          console.log(res)
        })
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

  .title {
    margin: 0px 1px;
    margin-bottom: 2px;
  }

  .rating {
    display: flex;
    flex-direction: row;
    max-height: 25px;
  }
</style>
