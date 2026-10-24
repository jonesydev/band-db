<script setup>
  const userName = "Jonesy"
  const endCopyYear = new Date().getFullYear()
</script>

<template>
  <main>
    <h1>BandDb</h1> 
    <p>Welcome back, {{ userName }}!</p>
  </main>

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
