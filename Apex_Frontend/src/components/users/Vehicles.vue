<script lang="js">
export default {
   data(){
    return{
        reg: this.$route.params.reg, 
        vehicle: {}
    }
   }, 
   created(){
    fetch(`http://localhost:3000/api/vehicles/vehicle?reg=${this.reg}`)
    .then(res => res.json())
    .then(data => {
        console.log(data)
        this.vehicle = data
    }).catch(err => console.error(err))
    }
}
   
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
<style>

</style>