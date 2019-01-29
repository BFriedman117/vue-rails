<template>
  <div class="header-searchbar">
    <div class="input-group">
      <input class="searchbar" placeholder="Search for films..." v-model="queryText" @keypress.enter="query"/>
      <div class="button-container">
        <button class="searchbar-button" @click="query">&#x1f50d</button>
      </div>
    </div>
  </div>
</template>
<script>
  import axios from 'axios'
  export default {
    data () {
      return {
        queryText: ''
      }
    },
    methods: {
      query () {
        this.films = []
        let key = '14a71611'
        axios.get(`http://www.omdbapi.com/?apikey=${key}&t=${this.queryText}`).then(res => {
          this.queryText = ''
          this.$emit('film-found', res.data)
        })
      }
    }
  }
</script>
<style>
  .header-searchbar {
    margin: 30px 30px;
  }

  .input-group {
    display: table;
    border-radius: 5px;
    vertical-align: middle;
  }

  .searchbar {
    display: table-cell;
    height: 32px;
    width: 400px;
    padding: 3px 10px;
    font-size: 18px;
    border-radius: 5px;
    border: none;
  }

  .button-container {
      display: table-cell;
  }

  .searchbar-button {
    display: inline-block;
    vertical-align: middle;
    text-align: center;
    font-size: 16px;
    line-height: 1.25;
    padding: 9px 6px;
    border: none;
    border-radius: 5px;
    margin: 2px;
    margin-bottom: 5px;
    font-family: "Impact";
    cursor: pointer;
  }
</style>
