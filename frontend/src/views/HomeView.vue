<script setup>
  const endCopyYear = new Date().getFullYear()
</script>

<template>
  <div>
    <h1>BandDb</h1>
    <p>Welcome to our band database!</p>
  </div>

  <footer>
    <p>&copy; 2022-{{ endCopyYear }} JonesyDev Systems</p>
  </footer>
</template>


<style scoped>  
  h1 {
    font-weight: bold;
  }

  footer {
    position: fixed;
    bottom: 0;
    width: 100%;
    text-align: center;
  }
</style>