

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
        <select name="vehicle" id="vehicle">
          <option value="Make">Make</option>
          <option value="Toyota">Toyota</option>
          <option value="VW">VW</option>
          <option value="BMW">BMW</option>
          <option value="Audi">Audi</option>
          <option value="Ford">Ford</option>
        </select>

        <select name="vehicle" id="vehicle">
          <option value="model">Model</option>
          <option value="Toyota">Toyota</option>
          <option value="VW">VW</option>
          <option value="BMW">BMW</option>
          <option value="Audi">Audi</option>
          <option value="Ford">Ford</option>
        </select>

        <select name="Year" id="year">
          <option value="Year">Year</option>
          <option value="2026">2026-2020</option>
          <option value="2019">2019-2014</option>
          <option value="2013">2013-2007</option>
        </select>

         <select name="Price" id="price">
          <option value="Price">Price</option>
          <option value="50k">50k-41k</option>
          <option value="40k">40k-31k</option>
          <option value="30k">30k-21k</option>
          <option value="20k">20k-10k</option>
          <option value="10k">less than 10k</option>
        </select>

        <select name="vehicle" id="vehicle">
          <option value="Milage">Milage</option>
          <option value="200k">over 200,000km</option>
          <option value="high">150,000km-199,000km</option>
          <option value="medium">100,000km-144,000km</option>
          <option value="low">50,000-99,000km</option>
          <option value="Veryl_low">less then 50,000km</option>
        </select>
        <button class="search"> Search </button>
         
      </form>
    </div>

    <div class = "Available_Stock">
      <div id="header"> <h1>Currently Available</h1></div>
      <div class="card">
        <div v-for="vehicle in vehicles" :key="vehicle.value">
          <img 
    v-if="vehicle.images && vehicle.images.length > 0"
    :src="`http://localhost:3000${vehicle.images[0].image_url}`" alt="Vehicle Image" width="200px" height="100px" />
          <h3>{{ vehicle.reg }}</h3>
          <h3>{{ vehicle.make }}</h3>
          <p>Year: {{ vehicle.year }}</p>
          <p>Milage: {{ vehicle.milage }}</p>
          <p>Price: {{ vehicle.price }}</p>
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

.Available_Stock {
  display: flex;
  flex-direction: column;
}
#header h1{
  text-align: center;
}
.card{
    flex-direction: row;
}

.searchFilter{
  width: 100%;
  display: flex;
  flex-direction: row;
  justify-content: center;
}

.searchFilter select{
  margin: 5px;
  border-color: rgb(172, 170, 170);
  border-radius: 8px;
  background-color: rgb(199, 201, 201);
}

.searchFilter button{
  border-radius: 10px;
  margin: 5px;
}
</style>
