<template>
  <div>
    <div>
      <h3>Your Favorite Films: </h3>
    </div>
    <div v-for="(favorite, index) in favorites" :key="index">
      <FavoriteCard :favorite="favorite"></FavoriteCard>
      <!-- <FilmCard></FilmCard> -->
    </div>
  </div>
</template>
<script>
import FavoriteCard from './FavoriteCard'
import FilmCard from '../Films/FilmCard'
export default {
  components: {
    FavoriteCard,
    FilmCard
  },
  props: ['favorites', 'favoriteIDs'],
  data () {
    return {
      currentFavorites: [],
      favoriteFilms: [],
      loaded: false
    }
  },
  methods: {
    updateFavorite () {

    },
    fetchFilmData () {
      let key = '14a71611'
      axios.get(`http://www.omdbapi.com/?apikey=${key}&i=${this.favorite.omdbid}`).then(res => {
        console.log('got something: ', res)
        if (res.data.Response === 'True') {
          this.currentFilm = res.data
        }
      })
    }
  },
  created () {
    console.log('fav', this.favorites)
  }
}
</script>
