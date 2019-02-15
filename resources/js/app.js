require('./bootstrap');

// Vue
import Vue from 'vue'
import App from './components/App'

// Vuetify
import Vuetify from 'vuetify'
import colors from 'vuetify/es5/util/colors'

Vue.use(Vuetify, {
    theme: {
        primary: colors.indigo.base,
        secondary: colors.blue.base,
        accent: colors.amber.base,
    }
});
import 'vuetify/dist/vuetify.min.css'
import 'material-design-icons-iconfont/dist/material-design-icons.css'

import Vuex from 'vuex';
Vue.use(Vuex);

import StoreData from './store';
const store = new Vuex.Store(StoreData);
// Vue-Router
import router from './router'


import validation from './helpers/validation';
import {initialize} from './helpers/general';
initialize(store, router);

import { i18n } from './helpers'

// Editor
import wysiwyg from "vue-wysiwyg"
Vue.use(wysiwyg, {
    image: {
        uploadURL: "/api/product/images/upload",
        dropzoneOptions: {}
    },
})

// Main app
const app = new Vue({
    el: '#app',
    i18n,
    render: h => h(App),
    router,
    store
});