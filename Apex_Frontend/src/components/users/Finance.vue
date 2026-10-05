<script>
import Stock from './Stock.vue';

</script>
<template>
    <div class="Finace-page-wrapper">
    <div class="Finance-nav-container" >
      <nav v-motion-fade :initial="{ opacity: 0, y:100 }" :enter="{opacity: 1, y:0, transition: {type:'spring', stiffness: 100, damping:15, delay:200} }">
       <router-link :to="{path: `/home`, state: { Homeview }}"><img src="../images/home-logo.png" alt="" width = "200px" height="100px"></router-link>
      <ul class="nav-links">
        <li><router-link :to="{path: `/stock`, state: { Stock }}">Stock</router-link></li>
        <li><router-link :to="{path: `/finance`, state: { Finance }}">Finance</router-link></li>
        <li><router-link :to="{path: `/trade-in`, state: { TradeIn }}">Trade-in</router-link></li>
        <li><router-link :to="{path: `/Contact`, state: { Contact }}">Contact</router-link></li>
        <li><router-link :to="{path: `/about`, state: { About }}">About</router-link></li>
      </ul>
      </nav>
    </div>
</div>
    <h1>This Function is currently unavailable please Contact our Team for further Information</h1>
</template>

<style>

</style>