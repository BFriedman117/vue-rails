<template>
  <div class="film">
    <span class="film-card" v-if="film.Response === 'True'">
      <img :src="film.Poster.length ? film.Poster : noPosterURL" class="film-poster"/>
      <div class="film-info">
        <h3>{{ film.Title }}</h3>
        <p>{{ film.Plot }}</p>
        <button class="button" @click="$emit('add-to-favorites')">Add To Favorites</button>
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
  export default {
    props: ['film']
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
