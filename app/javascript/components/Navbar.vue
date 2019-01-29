<template>
  <div class="nav-container">
    <span class="navbar">
      <div v-for="(component, index) in components" :key="index">
        <button class="nav-button" :class="{ 'selected': selected === index }" @click="update(index)">
          {{ component }}
        </button>
      </div>
    </span>
  </div>
</template>
<script>
  export default {
    props: ['components'],
    data () {
      return {
        selected: null
      }
    },
    methods: {
      update (index) {
        this.selected = index
        this.$emit('update-component', this.components[index])
      }
    }
  }
</script>
<style>
  .navbar {
    display: flex;
    flex-direction: row;
  }

  .nav-container {
    padding: 5px;
    background-color: rgba(0,0,0,0.6);
    color: white;
  }

  .nav-button {
    border: none;
    background-color: rgba(0,0,0,0);
    font-family: "Impact";
    color: white;
    cursor: pointer;
    font-size: 18px;
  }

  .selected {
    color: yellow;
  }
</style>
