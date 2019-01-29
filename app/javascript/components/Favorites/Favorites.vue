<template>
  <div>
    <div>
      <h3>Your Favorite Films: </h3>
    </div>
    <div v-for="(favorite, index) in favorites" :key="index">
      <FavoriteCard :favorite="favorite"></FavoriteCard>
    </div>
  </div>
</template>
<script>
import FavoriteCard from './FavoriteCard'
export default {
  components: {
    FavoriteCard
  },
  props: ['favorites'],
  data () {
    return {
      currentFavorites: []
    }
  },
  methods: {
    updateFavorite () {

    }
  }
}
</script>
