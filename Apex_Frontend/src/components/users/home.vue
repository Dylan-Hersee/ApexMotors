

<script lang="js">
import { ref } from "vue";


export default {
    setup() {
        const vehicles = ref([]);
         getVehicles();

        async function getVehicles() {
            const res = await fetch("http://localhost:3000/api/vehicles/allVehicles");
            vehicles.value = await res.json();
            console.log(vehicles.value);
        }

        async function getImages(reg, images_url) {
            const res = await fetch(`http://localhost:3000/api/vehicles/vehicle/images?reg=${reg}&images_url=${images_url}`);
            const images = await res.json();
            console.log(images);
        }

        return { vehicles, getVehicles };
    }
};
</script>



<template>
  <div class="page-wrapper">
    <div>
      <nav>
      <a href="./home.vue"><img src="../images/Apex_logo.jpeg" alt="" width = "200px" height="100px"></a>
      <ul class="nav-links">
        <li><a href="">Stock</a></li>
        <li><a href="">Finance</a></li>
        <li><a href="">Trade-in</a></li>
        <li><a href="">Contact</a></li>
        <li><a href="">About</a></li>
      </ul>
      </nav>
    </div>

    <div class="searchFilter">
      <form @submit="">
        <input v-model="makeModel" type="text" id="carType" placeholder=" Make/Model ">
        <input v-model="startYear" type="text" id="startYear" placeholder=" Year Start ">
        <input v-model="endYear" type="text" id="endYear" placeholder=" Year End ">
        <input v-model="minPrice" type="text" id="minPrice" placeholder=" Min Price ">
        <input v-model="maxPrice" type="text" id="maxPrice" placeholder=" Max Price ">
        <div class="button-container">
        <button class="search"> Search </button>
        </div>  
      </form>
    </div>

    <div>
      <h1 class="available"> Currently Available</h1>
      <div class="card">
        <div v-for="vehicle in vehicles" :key="vehicle.reg">
    <h3>{{ vehicle.make }}</h3>
    <p>Year: {{ vehicle.year }}</p>
    <p>Milage: {{ vehicle.milage }}</p>
    <p>Price: {{ vehicle.price }}</p>
    <img :src="`http://localhost:3000${vehicle.images_url}`" alt="Vehicle Image" width="200px" height="100px"/>
    </div>

      </div>
    <div class="location">
      <img src="" alt="" class="map">
      <div class="contact">
        <h1 class="contactHeader">Contact Us</h1>
        <form action="">
        <input v-model="contactForm" type="text" placeholder=" Name ">
        <input type="text" placeholder=" Email ">
        <input type="text" placeholder=" Message ">
        <button class="send">Send</button>
        </form>
      </div>
    </div>

    <div class="info">
      <h1> Any Questions? </h1>
      <p> Email: </p>
      <p> Phone: </p>
      <a href=""><img src="" alt="">Insta</a>
      <a href=""><img src="" alt="">TikTok</a>
      <div class="openHours">
        <h1>Opening Hours</h1>
        <ul class="opening">
          <li> Monday <br> By Appointment Only</li>
          <li> Tuesday <br> By Appointment Only</li>
          <li> Wednesday <br> By Appointment Only</li>
          <li> Thursday <br> By Appointment Only</li>
          <li> Friday <br> By Appointment Only</li>
          <li> Saturday <br> By Appointment Only</li>
          <li> Sunday <br> By Appointment Only</li>
        </ul>
      </div>
    </div>
    </div>

    <div>
      <ul>
        <li><a href=""><img src="" alt=""></a></li>
        <li><a href="">Stock</a></li>
        <li><a href="">Finance</a></li>
        <li><a href="">Trade-in</a></li>
        <li><a href="">Contact</a></li>
        <li><a href="">About</a></li>
      </ul>
    </div>
  </div>
</template>

<style>


</style>
