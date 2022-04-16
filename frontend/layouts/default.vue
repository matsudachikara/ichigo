<template>
  <div class="main-layout">
    <nuxt />
  </div>
</template>

<script>
export default {}
</script>
<style lang="scss">
html,
body,
#__nuxt,
#__layout,
#__layout > div {
  width: 100%;
  height: 100%;
  overflow-x: hidden;
}
.main-layout {
  display: flex;
  flex-direction: column;
}
</style>
