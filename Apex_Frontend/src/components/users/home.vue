

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
        <div class="selector" id="make">
          <select name="vehicle" id="vehicle">
            <option value="Make">Make</option>
            <option value="Toyota">Toyota</option>
            <option value="VW">VW</option>
            <option value="BMW">BMW</option>
            <option value="Audi">Audi</option>
            <option value="Ford">Ford</option>
          </select>
        </div>
        <div class="selector" id="model">
          <select name="vehicle" id="vehicle">
            <option value="model">Model</option>
            <option value="Toyota">Toyota</option>
            <option value="VW">VW</option>
            <option value="BMW">BMW</option>
            <option value="Audi">Audi</option>
            <option value="Ford">Ford</option>
          </select>
        </div>

        <div class="selector" id="year">
          <select name="Year" id="year">
            <option value="Year">Year</option>
            <option value="2026">2026-2020</option>
            <option value="2019">2019-2014</option>
            <option value="2013">2013-2007</option>
          </select>
        </div>

        <div class="selector" id="price">
          <select name="Price" id="price">
            <option value="Price">Price</option>
            <option value="50k">50k-41k</option>
            <option value="40k">40k-31k</option>
            <option value="30k">30k-21k</option>
            <option value="20k">20k-10k</option>
            <option value="10k">less than 10k</option>
          </select>
        </div>

        <div class="selector" id="milage">
          <select name="vehicle" id="vehicle">
            <option value="Milage">Milage</option>
            <option value="200k">over 200,000km</option>
            <option value="high">150,000km-199,000km</option>
            <option value="medium">100,000km-144,000km</option>
            <option value="low">50,000-99,000km</option>
            <option value="Veryl_low">less then 50,000km</option>
          </select>
        </div>
        <button class="selector"> Search </button>
         
      </form>
    </div>

    <div id="header"> <h1>Featured Stock</h1></div>

    <div class = "Available_Stock">
        <div v-for="vehicle in vehicles" :key="vehicle.value" class="card-container">
          <img 
    v-if="vehicle.images && vehicle.images.length > 0"
    :src="`http://localhost:3000${vehicle.images[0].image_url}`" alt="Vehicle Image" width="100%" />
          <div class="vehHeader"><h3>{{ vehicle.reg }}</h3></div>
          <p>Make: {{ vehicle.make }}</p>
          <p>Year: {{ vehicle.year }}</p>
          <p>Milage: {{ vehicle.milage }}</p>
          <p>Price: {{ vehicle.price }}</p>
        </div>
      </div>
      <div class="contact">
        <div class="contact-input">
          <div><h1 class="contactHeader">Contact Us</h1></div>
        <form action="">
        <div class="contact-form">
          <input v-model="contactForm" type="text" placeholder=" Name " id="name">
          <input type="text" placeholder=" Phone " id="phone">
          <input type="text" placeholder=" Email " id="email">
          <input type="text" placeholder=" Message " id="message">
        </div>
        <div class="contact-bt"><button>Send</button></div>
        </form>
        </div>
         <div class="contact-details">
      <h1> Any Questions? </h1>
      <p> Email: </p>
      <p> Phone: </p>
      <a href="" class="social"><img src="../images/insta.png" alt="" width="100px"></a>
      <a href="" class="social"><img src="../images/TikTok.png" alt="" width="100px"></a>
      </div>
      </div>
      <div class="box-container">
      <div class="openHours">
        <h1>Opening Hours</h1>
        <ul class="opening">
          <li><span class="day">Monday</span><span class="hours"> By Appointment Only</span></li>
          <li><span class="day">Tuesday</span><span class="hours"> By Appointment Only</span></li>
          <li><span class="day">Wednesday</span><span class="hours"> By Appointment Only</span></li>
          <li><span class="day">Thursday</span><span class="hours"> By Appointment Only</span></li>
          <li><span class="day">Friday</span><span class="hours"> By Appointment Only</span></li>
          <li><span class="day">Saturday</span><span class="hours"> By Appointment Only</span></li>
          <li><span class="day">Sunday</span><span class="hours"> By Appointment Only</span></li>
        </ul>
      </div>
      <div class="loaction-box">
      <section>
          <h1>Our Location </h1>
          <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2428.0512725221956!2d-6.58522372348239!3d52.51441117205974!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4868014faf2f4eb3%3A0x9a440e63f63e66d9!2sThe%20Grove!5e0!3m2!1sen!2sie!4v1789249342015!5m2!1sen!2sie" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="strict-origin-when-cross-origin"></iframe>
      </section>
      </div>
      </div>
      <div class="ftr-container">
        <footer>
          <div class="ftr-link">
              <a href="">Stock</a>
              <a href="">Finance</a>
              <a href="">Trade-in</a>
              <a href="">Contact</a>
              <a href="">About</a>
              <a href="" class="social"><img src="../images/insta.png" alt="" width="50px"></a>
              <a href="" class="social"><img src="../images/TikTok.png" alt="" width="50px"></a>
          
          </div>
        </footer>
      </div>
    </div>
</template>

<style>




#header h1{
  text-align: center;
}

.searchFilter{
  padding: 5px;
  margin: 5px;
  animation: appear linear;
  animation-timeline: view();
}

.searchFilter form{
  display: flex;
  flex-direction: row;
  gap: 1rem;
  justify-content: center;
  padding: 20px;  
}

.selector, .selector select{
  height:50px;
  border-radius: 10px;
  box-shadow: inset 5px 5px 15px 0 rgb(117, 114, 114);
  background-color: rgb(2, 2, 2);
  color: rgb(228, 228, 228);
  font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
}

#header{
  margin-bottom: 50px;
}
.Available_Stock{
  display: flex;
  justify-content: space-around;
  margin: 10px;
  font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
  animation: appear linear;
  animation-timeline: view();
}
.Available_Stock img{
  overflow: hidden;
}
.card-container{
  border-radius: 20px;
  flex: 0 0 25%;
  background: #bcbcbc;
  box-shadow: 16px 40px 84px 14px rgba(160, 160, 160, 0.31);
  animation: appear 5s linear;
}
.card-container p{
  text-align: justify;
  padding-left: 5%;
  font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
  margin-top: 20px;
  color: #444343;
  
  
}
.vehHeader{
  margin-top: 0;
  text-align: center;
  background: #373737;
  color: rgb(255, 252, 252);
  margin: -20px;
  position: relative;
  font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
  overflow: hidden;
  margin-left: 10%;
  margin-right: 10%;
  border-radius: 8px;
  overflow: hidden;
}
 h1{
  background: -webkit-linear-gradient( #8b8b8b, #d70000);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}

.information{
  display: flex;
  flex-direction: row;
  margin-top: 0px;
  animation: appear linear;
  animation-timeline: view();
}
.contact{
  display: flex;
  flex-direction: row;
  width: 100%;
  margin-top: 20px;
}
.contact h1{
  margin-bottom: 20px;
}
.contact input{
  display: flex;
  flex-direction: column;
  background: #d5d5d5;
  border: #4b4b4b;
  border-radius: 8px;
  box-shadow: inset 5px 5px 15px 0 rgb(117, 114, 114);
  margin-bottom: 1rem;

  
}

#name{ 
  width: 45%;
  max-width: 205px;
  
}

#phone{
  width: 45%;
  max-width: 205px;
 

}
#message{
  padding-bottom: 50px;
  width: 95%;
  margin-right: 5%;

}
#email{
  width: 95%;
  margin-right: 5%;
  max-width: 250px;
  
}

.contact-bt {
  display: flex;
  justify-content: flex-end;
  
}

.contact button{
  margin-right: 25px;
  padding: 10px 30px;
  border-radius: 10px;
  background: #bababa;
  color: #6b6b6b;
  text-transform: uppercase;
  cursor: pointer;
  position: relative;
  z-index: 0;
  
}
.contact button ::after{
  content: "";
  z-index: -1;
  position: absolute;
  width: 100px;
  height: 100px;
  background: #aaa6a6;
  left: 0;
  top: 0;
}
.contact button ::before{
  content: "";
  background: linear-gradient(
    45deg, 
    #d70000, #6b6b6b, #373737
  );
  position: absolute;
  top: -2px;
  left: -2px;
}
.contact-input{
  flex: 1;
  margin-left: 25px;
  animation: appear linear;
  animation-timeline: view();
}
.contact-details{
  flex: 1;
  color: #d5d5d5;
  animation: appear linear;
  animation-timeline: view();
}
.social{
  margin: 10px;
}
.openHours{
  display: flex;
  flex-direction: column;
  width:50%;
  animation: appear 5s linear;
}
.opening{
  list-style: none;
  padding: 0;
  width: 100%;
  max-width: 400px;
  color: #bababa;
  margin-left: 25px;
}
.opening li{
  display: flex;
  justify-content: space-between;
  padding: 8px 0;
}
.box-container{
  display: flex;
}
.box-container iframe{
  max-width: 500px;
  max-height:400px;
  border-radius: 8px;

}

.ftr-container{
  padding-bottom: 4rem;
}
footer{
  width: 80%;
  height: 40vh;
  color: #d5d5d5;
  display: flex;
  margin-right: 2rem;
  margin-top: 5rem;
}
.ftr-link a{
  position: relative;
    font-size: 1.45rem;
    font-weight:500;
    text-decoration:none;
    color: rgb(228, 228, 228);
    transition: all 0.3s ease;
    border-radius: 0.5rem;
    font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;
    list-style:none;
    gap: 2rem;
    padding-right: 5px;
    margin: 2rem;

}


</style>
