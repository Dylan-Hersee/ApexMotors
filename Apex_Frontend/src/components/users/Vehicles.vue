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

        return { vehicles, getVehicles };
    }
};
</script>

<template>
    <div class="container">
        
    </div>
    <div v-for="vehicle in vehicles" :key="vehicle.reg">
    <h3>{{ vehicle.make }}</h3>
    <p>Year: {{ vehicle.year }}</p>
    <p>Milage: {{ vehicle.milage }}</p>
    <p>Price: {{ vehicle.price }}</p>
    <img :src="`http://localhost:3000${vehicle.images_url}`" alt="Vehicle Image" />
    </div>
</template>
<style>

</style>