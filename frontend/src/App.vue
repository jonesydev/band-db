<script setup>
  
</script>

<template>
  
  <nav>
    <RouterLink to="/">Home</RouterLink> | 
    <RouterLink to="/artist">Artist</RouterLink> | 
    <RouterLink to="/album">Album</RouterLink> | 
    <RouterLink to="/label">Label</RouterLink> | 
    <RouterLink to="/personnel">Personnel</RouterLink> | 
    <RouterLink to="/about">About</RouterLink>
  </nav>
  
  <div id="app">      
    <RouterView />
  </div>  
</template>

