<script setup lang="js">
import { ref } from 'vue';
import AddVehicle from './AddVehicle.vue';
import home from '../users/home.vue';
import Vehicles from '../users/Vehicles.vue';
import router from '../../routers/index.js';

  const reg = ref("");
  const make = ref("");
  const model = ref("");
  const year = ref("");
  const milage = ref("");
  const price = ref("");


async function newVehicle(vehicle){
  reg.value = vehicle.reg;
  make.value = vehicle.make;
  model.value = vehicle.model;
  year.value = vehicle.year;
  milage.value = vehicle.milage;
  price.value = vehicle.price;
}

async function getVehicles(){
    const res = await fetch("http://localhost:3000/vehicles");

}


</script>

<template>
    <router-view />
    <main class="container">
        <ul>
            <li><img src="" alt=""></li>
            <li>Messages</li>
            <li>logout</li>
        </ul>
        <div class="veh-container">
            <h1>{{ reg }}</h1>
            <h1>{{ make }}</h1>
            <h1>{{ model }}</h1>
            <h1>{{ year }}</h1>
            <h1>{{ milage }}</h1>
            <h1>{{ price }}</h1>
            <AddVehicle @add-vehicle="newVehicle"/>
        </div>
    </main>
</template>

<style>
    
</style>