import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/HomeView.vue'
import ArtistView from '../views/ArtistView.vue'
import AlbumView from '../views/AlbumView.vue'
import LabelView from '../views/LabelView.vue'
import PersonnelView from '../views/PersonnelView.vue'
import AboutView from '../views/AboutView.vue'

const routes = [
  { path: '/', component: HomeView },
  { path: '/artist', component: ArtistView },
  { path: '/album', component: AlbumView },
  { path: '/label', component: LabelView },
  { path: '/personnel', component: PersonnelView },
  { path: '/about', component: AboutView }
]

const router = createRouter({
  history: createWebHistory(),
  routes,
})

export default router
