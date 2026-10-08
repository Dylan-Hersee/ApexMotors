import HomeView from '../components/users/home.vue'
import TradeIn from '../components/users/TradeIn.vue'
import AdminApp from '../components/admin/AdminApp.vue'
import Vehicles from '../components/users/Vehicles.vue'
import AddVehicle from '../components/admin/AddVehicle.vue'
import About from '../components/users/About.vue'
import { createRouter, createWebHashHistory } from 'vue-router'
import Contact from '../components/users/Contact.vue'
import Stock from '../components/users/Stock.vue'
import Finance from '../components/users/Finance.vue'


const routes = [
  { path: '/', redirect: '/home'},
  { path: '/home', name: 'home', component: HomeView },
  { path: '/admin', name: 'admin', component: AdminApp },
  { path: '/vehicles/:reg', name: 'vehicles', component: Vehicles },
  { path: '/about', name: 'about', component: About }, 
  { path: '/trade-in', name: 'trade-in', component: TradeIn}, 
  { path: '/contact', name: 'contact', component: Contact}, 
  { path: '/stock', name: 'stock', component: Stock},
  { path: '/finance', name: 'finance', component: Finance}
]

const router = createRouter({
  history: createWebHashHistory(import.meta.env.BASE_URL), routes
})

  


export default router

