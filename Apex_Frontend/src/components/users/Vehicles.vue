<script lang="js">
import { Transition } from 'vue';
import About from './About.vue';
import Contact from './Contact.vue';
import Finance from './Finance.vue';
import Stock from './Stock.vue';
import TradeIn from './TradeIn.vue';
import { onMounted } from 'vue';


export default {
     setup(){
         onMounted(() => {
            const navbarToggle = document.querySelector('.nav-toggle');
            const navbarMenu = document.querySelector('.nav-links');

            if (navbarToggle && navbarMenu) {
                navbarToggle.addEventListener('click', () => {
                    navbarToggle.classList.toggle('active');
                    navbarMenu.classList.toggle('active');
                });
            }
        })
    },

   data(){
    return{

        reg: this.$route.params.reg, 
        vehicle: {},
        currentImg: 0
    }
   }, 
   created(){
    fetch(`${import.meta.env.VITE_API_URL}/api/vehicles/vehicle?reg=${this.reg}`)
    .then(res => res.json())
    .then(data => {
        console.log(data)
        this.vehicle = data
    }).catch(err => console.error(err))

},
    methods:{
    
    
     next(){
        if(this.currentImg < this.vehicle.images.length - 1){
            this.currentImg++
        }else{
            this.currentImg = 0
        }
    }

    , prev(){
        if(this.currentImg > 0){
            this.currentImg--
        }else{
            this.currentImg = this.vehicle.images.length - 1
        }
    }
    }
    } 
   
</script>

<template>
    <div class="vehicle-page-wrapper">
        <div class="nav-container" >
      <nav v-motion-fade :initial="{ opacity: 0, y:100 }" :enter="{opacity: 1, y:0, transition: {type:'spring', stiffness: 100, damping:15, delay:200} }">
      <router-link :to="{path: `/home`, state: { Homeview }}"><img src="../images/home-logo.png" alt="" width = "200px" height="100px"></router-link>
      <button class="nav-toggle">
        <span class="bar"></span>
        <span class="bar"></span>
        <span class="bar"></span>
       </button>

      <ul class="nav-links">
        <li><router-link :to="{path: `/stock`, state: { Stock }}">Stock</router-link></li>
        <li><router-link :to="{path: `/finance`, state: { Finance }}">Finance</router-link></li>
        <li><router-link :to="{path: `/trade-in`, state: { TradeIn }}">Trade-in</router-link></li>
        <li><router-link :to="{path: `/Contact`, state: { Contact }}">Contact</router-link></li>
        <li><router-link :to="{path: `/about`, state: { About }}">About</router-link></li>
      </ul>
      </nav>
    </div>
        <div class="slider">
                <button class="btn" id="btn-left" @click="prev()">&#706</button>
                <transition name="fade" mode="out-in">
                <div class="img-box" v-if="vehicle.images && vehicle.images.length > 0">
                    <div class="img_item">
                    
                    <img v-for="(image, i) in vehicle.images" 
                    :key="image.images_url"
                    :src="`https://apexmotors-7wrf.onrender.com${image.image_url}`"
                    :alt="`${vehicle.reg}`" style="max-width: 900px; max-height: 400px;" v-show="currentImg === i">
                    
                    </div>
                </div>
                </transition>                
                <button class="btn" id="btn-right" @click="next()">&#707</button>
            </div>
            <div class="detail_container" v-if="vehicle">
                <div class="reg">
                <h1> {{ vehicle.reg }}</h1>
                </div>
                <div class="sub_header"><h2>Description</h2></div>
                <div class="contents">
                    <div class="make">
                        <p class="car_details"> Make <span>{{ vehicle.make }}</span></p>
                    </div>
                    <div class="model">
                        <p class="car_details"> Model <span>{{ vehicle.model }}</span></p>
                    </div>
                    <div class="year">
                        <p class="car_details"> Year <span>{{ vehicle.year }}</span></p>
                    </div>
                    <div class="milage">
                        <p class="car_details"> Milage <span>{{ vehicle.milage }}</span></p>
                    </div>
                </div>
                <div class="end">
                    <h2 class="car_details"> € <span>{{ vehicle.price }}</span></h2>
                </div>
            <div class="overview">

            </div>
            <div id="owner" v-for="owner in vehicle.owners" :key="owner.id">
                <div class="sub_header"><h2>Ownership & History</h2></div>
            </div>
            <div id="running_cost" v-for="running_cost in vehicle.running_cost" :key="running_cost.id">
                <div class="sub_header"><h2>Running Cost</h2></div>
                <div class="owner"> 
                    <div>
                        <h3>Current Country Registation: </h3>
                        <p>{{ vehicle.current_country_reg }}</p>
                    </div>
                    <div>
                        <h3>Owners</h3>
                        <p>{{ vehicle.owners }}</p>
                    </div>
                    <div>
                        <h3>NCT Expiry</h3>
                        <p>{{ vehicle.NCT_Expiry }}</p>
                    </div>
                    <div>
                        <h3>Imported Country</h3>
                        <p>{{ vehicle.import_country }}</p>
                    </div>
                </div>
            </div>
            <div id="performance" v-for="performance in vehicle.performance" :key="performance.id">
                <div class="sub_header"><h2>Performance</h2></div>
                <div>
                    <div>
                        <h3>Engine Size</h3>
                        <p>{{ vehicle.engine_size }}</p>
                    </div>
                     <div>
                        <h3>Engine Power</h3>
                        <p>{{ vehicle.engine_power}}</p>
                    </div>
                     <div>
                        <h3>Acceleration</h3>
                        <p>{{ vehicle.acceleration}}</p>
                    </div>
                     <div>
                        <h3>Top Speed</h3>
                        <p>{{ vehicle.top_speed }}</p>
                    </div>
                     <div>
                        <h3>Torque</h3>
                        <p>{{ vehicle.torque }}</p>
                    </div>
                </div>
            </div>
            <div id="dimensions" v-for="dimensions in vehicle.dimensions" :key="dimensions.id">
                <div class="sub_header"><h2>Dimensions</h2></div>
                <div>
                    <div>
                        <h3>External Length</h3>
                        <p>{{ vehicle.external_length }}</p>
                    </div>
                    <div>
                        <h3>External Width</h3>
                        <p>{{ vehicle.external_width }}</p>
                    </div>
                    <div>
                        <h3>External height</h3>
                        <p>{{ vehicle.external_height }}</p>
                    </div>
                    <div>
                        <h3> Ground Clearance </h3>
                        <p>{{ vehicle.ground_clearace }}</p>
                    </div>
                    <div>
                        <h3>Boot Volume </h3>
                        <p>{{ vehicle.boot_volume }}</p>
                    </div>
                    <div>
                        <h3>Fuel Tank Capacity</h3>
                        <p>{{ vehicle.fuel_tank_cap }}</p>
                    </div>
                </div>
            </div>
            <div id="features" v-for=" features in vehicle.features" :key="features.id">
                <div class="sub_header"><h2>Features</h2></div>
                <div>
                    <div>
                        <h3>Comfort & Convenience</h3>
                        <p>{{ vehicle.comfort }}</p>
                    </div>
                    <div>
                        <h3>Media </h3>
                        <p>{{ vehicle.media }}</p>
                    </div>
                    <div>
                        <h3>Assistance </h3>
                        <p>{{ vehicle.assistance }}</p>
                    </div>
                    <div>
                        <h3>Style </h3>
                        <p>{{ vehicle.style }}</p>
                    </div>
                    <div>
                        <h3>Safety</h3>
                        <p>{{ vehicle.safety }}</p>
                    </div>
                    <div>
                        <h3>Performance</h3>
                        <p>{{ vehicle.performance }}</p>
                    </div>
                </div>
            </div>
            <div id="desc">
                <div class="description">{{ description }}</div>
            </div>
            </div>
        
         <div class="ftr-container" v-motion-fade :initial="{ opacity: 0, y:100 }" :enter="{opacity: 1, y:0, transition: {type:'spring', stiffness: 100, damping:15, delay:200} }">
        <footer>
          <div class="ftr-link">
              <a href="">Stock</a>
              <a href="">Finance</a>
              <a href="">Trade-in</a>
              <a href="">Contact</a>
              <a href="">About</a>
              <a href="https://www.instagram.com/autos_apex?mdxt=MnoxNXRoZGQxMHdz" class="social"><img src="../images/insta.png" alt="" width="50px"></a>
              <a href="https://www.tiktok.com/@apex.autos4?_r=1&_t=ZN-9At3XrKvUX8" class="social"><img src="../images/TikTok.png" alt="" width="50px"></a>
          </div>
        </footer>
      </div>
    </div>
</template>

<style scoped>

.detail_container h1{
    text-align: center;
}

.slider{
   display: flex;
   justify-content: center;
   align-items: center;
}
.img-box{
    display: flex;
    justify-content: center;
    margin-left: 0.8rem;
    max-height: 400px;
    max-width: 900px;
}
  
    #btn-left, #btn-right{
        position: relative;
        border:none;
        outline:none;
        background-color: transparent;
        font-size: 8rem;
        color: #fff9f9;
        cursor: pointer;
    } 

    #btn-left{
        margin-right: -3.5rem;
    }
    #btn-right{
        margin-left: -2rem;
    }
    
    
    #btn-left:hover, #btn-right:hover{
        color: #2c2a2a;
    }

    @keyframes fade {
        from { opacity: 0; }
        to { opacity: 1; }
    }
    .fade-enter-active, .fade-leave-active {
        transition: opacity 0.5s;
    }
    .fade-enter-from, .fade-leave-to {
        opacity: 0;
    }
    .card-container{
       display: flex;
       flex-direction: row;
       width: 100%;
       animation: appear 5s linear;
       font-family: 'Roboto', sans-serif;
       padding:0;
       background-color: #2c2a2a;
    }
     .car_details{
        color: #c12424;
    }
    .detail_container{
        list-style: none;
        padding: 0.5rem;
        width: 100%;
        max-width: 900px;
        color: #c12424;
        margin-left: 25px;
        flex-direction: row;
        text-align: center;
    }

    .detail_container p, .detail_container h2{
        display: flex;
        justify-content: space-between;
        padding: 8px 0;
        text-align: center;
    }
    .reg{
        align-items: center;
    }

    @media screen and (max-width: 768px) {
    .contents{
      position: relative;
      z-index: 1;
      width: 100%;
      flex: 1;
      min-width: none;
    } 
    .hero-wrapper {
    background-image: -moz-radial-gradient();
    padding-bottom: 10%;
    }
 
    .navbar{
        backdrop-filter: none;
    }
    .nav-container .nav-links{
        display: none;
        flex-direction: column;
        align-items: flex-start;
        position: absolute;
        height: 100vh;
        width: 250px;
        top: 0;
        right: 0;
        padding: 5rem 1.5rem;
        box-shadow: 0 10px 10px rgba(0, 0, 0, 0.9);
        backdrop-filter: blur(10px);
    }
    
    .nav-toggle {
        display: block;
        z-index: 999;
    }
    .nav-container .nav-links.active{
      display: flex;
    }
    .nav-toggle.active .bar:nth-child(2){
      opacity: 0;
    }
     .nav-toggle.active .bar:nth-child(1){
      transform: translateY(8px) rotate(45deg);
    }
     .nav-toggle.active .bar:nth-child(3){
      transform: translateY(-8px) rotate(-45deg);
    }
    .ftr-link{
      width: 100%;
      background-size: cover;
    }

    .ftr-link a{
      margin-left: 5px;
      align-items: center;
      padding: 0%; 
    }
    .ftr-link{
      position: relative;
      width: 100%;
      animation: none;
      transform: none;
      opacity: 1;
    }
   
    .vehicleDetails{
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: 6px 10px;  
      align-items: start;
    }
    .vehicleDetails > *{
      margin: 0;
      line-height: 1.3;
    }
    #btn-left, #btn-right{
        font-size: 3rem;
    }
    #btn-left{
        margin: -2rem;
    }
    #btn-right{
        margin: -1.1rem;
    }
    .ftr-link{
      align-items: center;
    }
    .detail_container{
        margin: 0;
    }
    
   
}

    @media only screen and (max-width: 1200px){
        
    }
</style>