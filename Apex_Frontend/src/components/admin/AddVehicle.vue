<script lang="js" setup>
    import { ref } from 'vue';

  const emit = defineEmits(["addVehicle"]);

  const reg = ref("");
  const make = ref("");
  const model = ref("");
  const year = ref("");
  const milage = ref("");
  const price = ref("");



    function vehicleSubmit(){
        emit("addVehicle", {
            reg: reg.value, 
            make: make.value, 
            model: model.value, 
            year: year.value, 
            milage: milage.value,
            price: price.value
        })
    }

</script>


<template>
    <div class="addVehicle">
            <form @submit.prevent="vehicleSubmit">
                <input v-model="reg" type="reg" name="reg" placeholder="07/D/1234">
                <input v-model="make" type="make" name="make" placeholder="Make">
                <input v-model="model" type="model" name="model" placeholder="Model">
                <input v-model="year" type="year" name="year" placeholder="Year">
                <input  v-model="milage" type="milage" name="milage" placeholder="Milage km">
                <input v-model="price" type="price" name="price" placeholder="Price">
                 <div class="but-container">
                    <button> Add</button>
                </div>
            </form>
    </div>
</template>

<style>


</style>