import Vue from 'vue'
import Router from 'vue-router'
import AutoPianoPC from '@/pages/AutoPianoPC'

Vue.use(Router)

export default new Router({
  mode: 'hash',
  routes: [
    { path: '/', name: 'AutoPianoPC', component: AutoPianoPC },
  ]
})
