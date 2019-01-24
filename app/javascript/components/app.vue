<template>
  <div id='app'>
    <Main></Main>
  </div>
</template>

<script>
  import Main from './Main'
  export default {
    components: {
      Main
    },
    data () {
      return {
        message: "Welcome to Heck"
      }
    }
  }
</script>

<style scoped>
  p {
    font-size: 2em;
    text-align: center;
  }
</style>
