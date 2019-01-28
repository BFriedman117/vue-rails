<template>
  <div>
    <span>
      <button v-for="component in components" @click="$emit('update-component', component)">
        {{ component }}
      </button>
    </span>
  </div>
</template>
<script>
  export default {
    props: ['components']
  }
</script>
