import { createApp } from 'vue'
import './style.css'
import {createBootstrap } from 'bootstrap-vue-next'
import App from './App.vue'
import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue-next/dist/bootstrap-vue-next.css'
import { MotionPlugin } from '@vueuse/motion'
import router from './routers/index.js'


const app = createApp(App)
app.use(createBootstrap())
app.use(router)
app.mount('#app')
app.use(MotionPlugin)