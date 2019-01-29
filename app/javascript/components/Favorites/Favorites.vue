<template>
  <div>
    <div>
      <h3>Your Favorite Films: </h3>
    </div>
    <div v-for="(favorite, index) in favorites" :key="index" class="card-container" v-if="favorites.length">
      <FavoriteCard
        :index="index"
        @favorite-removed="favoriteRemoved"
        :favorite="favorite">
      </FavoriteCard>
    </div>
    <div v-else>
      <h3>You have no currently saved favorites. Search films to get started.</h3>
    </div>
  </div>
</template>
<script>
import FavoriteCard from './FavoriteCard'
import FilmCard from '../Films/FilmCard'
import axios from 'axios'
export default {
  components: {
    FavoriteCard,
    FilmCard
  },
  props: ['favoriteIDs'],
  data () {
    return {
      currentFavorites: [],
      favoriteFilms: [],
      loaded: false,
      favorites: []
    }
  },
  methods: {
    favoriteRemoved (index) {
      this.favorites.splice(index, 1)
    },
    fetchFilmData () {
      let key = '14a71611'
      axios.get(`http://www.omdbapi.com/?apikey=${key}&i=${this.favorite.omdbid}`).then(res => {
        console.log('got something: ', res)
        if (res.data.Response === 'True') {
          this.currentFilm = res.data
        }
      })
    },
    fetchFavorites () {
      return axios.get(`http://localhost:3000/favorites`).then(res => {
        this.favorites = res.data
      })
    }
  },
  created () {
    this.fetchFavorites()
  }
}
</script>
