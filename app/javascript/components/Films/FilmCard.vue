<template>
  <div class="film">
    <span class="film-card" v-if="film && film.Response === 'True'">
      <img :src="film.Poster.length ? film.Poster : noPosterURL" class="film-poster"/>
      <div class="film-info">
        <h3>{{ film.Title }}</h3>
        <p>{{ film.Plot }}</p>
        <button class="button" @click="addToFavorites" v-if="!isFavorite">Add To Favorites</button>
        <button class="button" @click="removeFromFavorites" v-if="isFavorite && id">Remove From Favorites</button>
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
</template>
<script>
  import axios from 'axios'
  export default {
    props: ['film', 'isFavorite', 'id'],
    data () {
      return {
        noPosterURL: "https://user-images.githubusercontent.com/24848110/33519396-7e56363c-d79d-11e7-969b-09782f5ccbab.png",
        added: false,
        deleted: false,
        currentFilm: {}
      }
    },
    methods: {
      addToFavorites () {
        axios.post(`http://localhost:3000/favorites`, {
          user_id: '1',
          omdbid: this.film.imdbID
        }).then(res => {
          this.$emit('favorite-added', this.film)
          this.added = true
          console.log('added', res)
        })
      },
      removeFromFavorites () {
        axios.delete(`http://localhost:3000/favorites/${this.id}`).then(res => {
          this.$emit('favorite-removed')
          this.deleted = true
          console.log('removed', res)
        })
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
    }
  }
</script>
<style>
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
