<template>
  <div class="centered">
    <div class="search-container">
      <div v-if="films.length">
        <div>
          <h3>Your Recent Searches</h3>
        </div>
        <div v-for="film in films">
          <FavoriteCard
            @favorite-added="$emit('favorite-added', film)"
            @favorite-removed="$emit('favorite-removed', index)"
            v-if="favoriteIDs.indexOf(film.imdbID) > -1"
            :favorite="favorites[favoriteIDs.indexOf(film.imdbID)]">
          </FavoriteCard>
          <FilmCard v-else
            :film="film"
            @favorite-added="$emit('favorite-added', film)"
            @favorite-removed="$emit('favorite-removed', index)">
          </FilmCard>
        </div>
      </div>
      <div v-else>
        <h3>Enter a search term in the above search bar to find films</h3>
      </div>
    </div>
  </div>
</template>
<script>
  import axios from 'axios'
  import FilmCard from '../Films/FilmCard'
  import FavoriteCard from '../Favorites/FavoriteCard'
  export default {
    props: ['favorites', 'films', 'favoriteIDs'],
    components: {
      FilmCard,
      FavoriteCard
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
