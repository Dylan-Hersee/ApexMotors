<script lang="js">
import { ref } from "vue";
import { useRoute } from "vue-router";
import home from "./home.vue"

export default {
    setup() {
     const vehicle = ref();
     const route = useRoute();

     async function getVehicle() {
        const reg = route.params.reg;
        const res= await fetch("http://localhost:3000/api/vehicles/${reg}")
        vehicle.value = await res.json()
        
     }

     getVehicle()

     return { vehicle }
    },

    data(){
        return{
        
        }
    }
};
</script>

<template>
    <div class="container">
        <div class="card-container">
            <div class="detail_container" v-if="vehicle">
                <h1 id="header"> {{ vehicle.reg }}</h1>
                <p class="car_details"> Make <span>{{ vehicle.make }}</span></p>
                <p class="car_details"> Model <span>{{ vehicle.model }}</span></p>
                <p class="car_details"> Year <span>{{ vehicle.year }}</span></p>
                <p class="car_details"> Milage <span>{{ vehicle.milage }}</span></p>
            <div class="end">
                <h2 class="car_details"> € <span>{{ vehicle.price }}</span></h2>
            </div>
            </div>
        </div>
        
    </div>
   
</template>
<style>

</style>