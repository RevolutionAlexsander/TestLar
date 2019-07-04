/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue');

// import VueRouter from 'vue-router';
// import router from './router';
// import App from './components/App';
// window.Vue.use(VueRouter);
// import Zav from './components/ZayavkaIndex';


/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

// const app = new Vue({render:h=>h(App)}).$mount("#app");
Vue.component('zayavkaIndex', require('./components/ZayavkaIndex'));
const app = new Vue({
    el: '#app'
    // components: {'zayavkaIndex': Zav},
});
// import ZayavkaIndex from './components/ZayavkaIndex.vue';
// // const ZayavkaIndex = {template: '<h2>ОНО</h2>'};
//
// const routes = [
//     {
//         path: '/',
//         components: ZayavkaIndex,
//     },
// ];
//
// const router = new VueRouter({
//     mode: history,
//     routes: routes,
//
// });
//

