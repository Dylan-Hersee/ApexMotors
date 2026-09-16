import { createRouter, createWebHashHistory } from 'vue-router'
import HomeView from '../components/users/home.vue'
import AdminApp from '../components/admin/AdminApp.vue'
import Vehicles from '../components/users/Vehicles.vue'
import AddVehicle from '../components/admin/AddVehicle.vue'
import About from '../components/users/About.vue'


const routes = [
  { path: '/home', name: 'home', component: HomeView },
  { path: '/admin', name: 'admin', component: AdminApp },
  { path: '/vehicles/:reg', name: 'vehicles', component: Vehicles },
  { path: '/about', name: 'about', component: About }
]

const router = createRouter({
  history: createWebHashHistory(import.meta.env.BASE_URL),
  routes
})

export default router
