<script>

</script>
<template>
    <div class="wrapper">
        <div class="nav-container">
      <nav v-motion-fade :initial="{ opacity: 0, y:100 }" :enter="{opacity: 1, y:0, transition: {type:'spring', stiffness: 100, damping:15, delay:200} }">
       <img src="../images/home-logo.png" alt="" width = "200px" height="100px">
      <button class="nav-toggle">
        <span class="bar"></span>
        <span class="bar"></span>
        <span class="bar"></span>
      </button>
       <ul class="nav-links">
        <li><router-link>Messages</router-link></li>
        <li><router-link>Logout</router-link></li>
      </ul>
      </nav>
    </div>
        <div class="container">
             <div v-for="vehicle in vehicles" :key="vehicle.value" class="card-container" v-motion-fade>
          <router-link :to="{ path: `/vehicles/${vehicle.reg}`, state: { vehicle } }" class="router-link">
          <img 
          v-if="vehicle.images && vehicle.images.length > 0"
          :src="`https://apexmotors-7wrf.onrender.com${vehicle.images[0].image_url}`" alt="Vehicle Image" width="100%"/>
          <div class="vehHeader"><h3>{{ vehicle.reg }}</h3></div>
          <div class="vehicleDetails">
            <p>Make: <br> {{ vehicle.make }}</p>
            <p>Model: <br> {{ vehicle.model }}</p>
            <p>Year: <br>{{ vehicle.year }}</p>
            <p>Milage: <br>{{ vehicle.milage }}</p>
          <p>Price: <br> {{ vehicle.price }}</p>
          </div>
          </router-link>
        </div>

        </div>       
    </div>
</template>

<style scoped>
.wrapper{
    background: rgb(193, 28, 28);
}
.logo{
    max-width: 300px;
    max-height: 300px;
}
.nav-container{
    display: flex;
}
.nav-links a{
    justify-content: end;
    color: black;
}

</style>