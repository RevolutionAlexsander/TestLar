import VueRouter from 'vue-router';
import Zayav from './components/ZayavkaIndex';

export default new VueRouter({
    routes: [
        {
            path: '/',
            components: Zayav,
        }
    ],
    mode: history,
})