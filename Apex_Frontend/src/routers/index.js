import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../components/users/home.vue'
import AdminApp from '../components/admin/AdminApp.vue'
import Vehicles from '../components/users/Vehicles.vue'
import AddVehicle from '../components/admin/AddVehicle.vue'


const routes = [
  { path: '/home', name: 'home', component: HomeView },
  { path: '/admin', name: 'admin', component: AdminApp },
  { path: '/vehicles', name: 'vehicles', component: Vehicles }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router
