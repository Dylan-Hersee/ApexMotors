<script lang="js">
import { ref } from "vue";

export default {
    setup() {
        const vehicles = ref([]);
         getVehicles();

        async function getVehicles() {
            const res = await fetch("http://localhost:3000/api/vehicles/allVehicles");
            vehicles.value = await res.json();
            console.log(JSON.stringify(vehicles.value, null, 2));
        }

        return { vehicles, getVehicles };
    }
};
</script>

<template>
    <div class="container">
        
    </div>
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
</template>
<style>

</style>