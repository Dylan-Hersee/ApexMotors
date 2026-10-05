<script lang="js">
import { Transition } from 'vue';
import About from './About.vue';
import Contact from './Contact.vue';
import Finance from './Finance.vue';
import Stock from './Stock.vue';
import TradeIn from './TradeIn.vue';


export default {
   data(){
    return{

        reg: this.$route.params.reg, 
        vehicle: {},
        currentImg: 0
    }
   }, 
   created(){
    fetch(`http://localhost:3000/api/vehicles/vehicle?reg=${this.reg}`)
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
        <div class="vehicle-nav-container" >
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
        <div class="slider">
                <button class="btn" id="btn-left" @click="prev()">&#706</button>
                <transition name="fade" mode="out-in">
                <div class="img-box" v-if="vehicle.images && vehicle.images.length > 0">
                    <div class="img_item">
                    
                    <img v-for="(image, i) in vehicle.images" 
                    :key="image.images_url"
                    :src="`http://localhost:3000${image.image_url}`"
                    :alt="`${vehicle.reg}`" style="width: 900px; height: 400px;" v-show="currentImg === i">
                    
                    </div>
                </div>
                </transition>
                
                
                <button class="btn" id="btn-right" @click="next()">&#707</button>
            </div>
            
                
        <div class="card-container">
            <div class="detail_container" v-if="vehicle">
                <div class="reg">
                <h1> {{ vehicle.reg }}</h1>
                </div>
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
                <div class="sub_header"><h2>Description</h2></div>
                <div class="description">{{ description }}</div>
            </div>
            </div>
        </div>
        
    </div>
   
</template>
<style scoped>
.vehicle-page-wrapper{
    background-color: #000000;
    
}
.slider{
   display: flex;
   justify-content: center;
   align-items: center;
}
.img-box{
    display: flex;
    justify-content: center;
    margin-left: 10px;
    max-height: 400px;
    max-width: 900px;
}
    .img-box img{
        width: 100% auto-fill;
        height: 100% auto-fill;
        
        }
  
    #btn-left, #btn-right{
        position: relative;
        border:none;
        outline:none;
        background-color: transparent;
        font-size: 100px;
        color: #fff;
        cursor: pointer;
    } 

    #btn-left{
        margin-right: -50px;
    }
    #btn-right{
        margin-left: -40px;
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
       width: 50%;
       animation: appear 5s linear;
       font-family: 'Roboto', sans-serif;
       padding:0;
    }
    .detail_container{
        list-style: none;
        padding: 0;
        width: 100%;
        max-width: 400px;
        color: #bababa;
        margin-left: 25px;
        flex-direction: row;
    }

    .detail_container p, .detail_container h2{
        display: flex;
        justify-content: space-between;
        padding: 8px 0;
    }
    .reg{
        align-items: center;
    }
</style>