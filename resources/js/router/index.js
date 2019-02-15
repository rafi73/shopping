import Vue from 'vue'
import Router from 'vue-router'
Vue.use(Router)

//
import admin_component from '../components/AdminComponent.vue'
import login_component from '../components/LoginComponent.vue'
import r_link from '../components/RouterLink.vue'

//
Vue.component('admin-component', admin_component)
Vue.component('r-link', r_link)
Vue.component('login-component', login_component)


//
import home from '../components/HomeComponent.vue'
import admin_user from '../components/Admin/UserComponent.vue'
import brand from '../components/Admin/Brand.vue'
import category from '../components/Admin/Category.vue'
import categoryWiseSpecification from '../components/Admin/CategoryWiseSpecification.vue'
import customer from '../components/Admin/Customer.vue'
import order from '../components/Admin/Order.vue'
import priceList from '../components/Admin/PriceList.vue'
import product from '../components/Admin/Product.vue'
import quoteRequest from '../components/Admin/QuoteRequest.vue'
import specification from '../components/Admin/Specification.vue'
import subCategory from '../components/Admin/SubCategory.vue'
import seller from '../components/Admin/Seller.vue'
import stock from '../components/Admin/Stock.vue'
import purchase from '../components/Admin/Purchase.vue'


export default new Router({
    mode: 'history',
    routes: 
    [
        {
            path: '/admin/login',
            name: 'login',
            meta: 
            { 
                requiresAuth : false
            }
        },
        { 
            path: '/admin/home', 
            name: 'home', 
            component: home, 
            meta: 
            { 
                name: 'ホーム', 
                icon: 'home' ,
                requiresAuth : true
            } 
        },
        { 
            path: '/admin/user', 
            name: 'admin_user', 
            component: admin_user, 
            meta: 
            { 
                name: '社員管理', 
                icon: 'supervisor_account',
                requiresAuth : true
            } 
        },
        { 
            path: '/admin/brand', 
            name: 'brand', 
            component: brand, 
            meta: 
            { 
                name: 'Brand', 
                icon: 'supervisor_account',
                requiresAuth : true
            } 
        },
        { 
            path: '/admin/category', 
            name: 'category', 
            component: category, 
            meta: 
            { 
                name: 'Category', 
                icon: 'supervisor_account',
                requiresAuth : true
            } 
        },
        { 
            path: '/admin/category-wise-specification', 
            name: 'category-wise-specification', 
            component: categoryWiseSpecification, 
            meta: 
            { 
                name: 'Category Wise Specification', 
                icon: 'supervisor_account',
                requiresAuth : true
            } 
        },
        { 
            path: '/admin/customer', 
            name: 'customer', 
            component: customer, 
            meta: 
            { 
                name: 'Customer', 
                icon: 'supervisor_account',
                requiresAuth : true
            } 
        },
        { 
            path: '/admin/order', 
            name: 'order', 
            component: order, 
            meta: 
            { 
                name: 'Order', 
                icon: 'supervisor_account',
                requiresAuth : true
            } 
        },
        { 
            path: '/admin/price-list', 
            name: 'price-list', 
            component: priceList, 
            meta: 
            { 
                name: 'Price List', 
                icon: 'supervisor_account',
                requiresAuth : true
            } 
        },
        { 
            path: '/admin/product', 
            name: 'product', 
            component: product, 
            meta: 
            { 
                name: 'Product', 
                icon: 'supervisor_account',
                requiresAuth : true
            } 
        },
        { 
            path: '/admin/quote-request', 
            name: 'quote-request', 
            component: quoteRequest, 
            meta: 
            { 
                name: 'Quote Request', 
                icon: 'supervisor_account',
                requiresAuth : true
            } 
        },

        { 
            path: '/admin/specification', 
            name: 'specification', 
            component: specification, 
            meta: 
            { 
                name: 'Specification', 
                icon: 'supervisor_account',
                requiresAuth : true
            } 
        },
        { 
            path: '/admin/sub-category', 
            name: 'sub-category', 
            component: subCategory, 
            meta: 
            { 
                name: 'Sub Category', 
                icon: 'supervisor_account',
                requiresAuth : true
            } 
        },
        { 
            path: '/admin/seller', 
            name: 'seller', 
            component: seller, 
            meta: 
            { 
                name: 'Seller', 
                icon: 'supervisor_account',
                requiresAuth : true
            } 
        },
        { 
            path: '/admin/stock', 
            name: 'stock', 
            component: stock, 
            meta: 
            { 
                name: 'Stock', 
                icon: 'supervisor_account',
                requiresAuth : true
            } 
        },
        { 
            path: '/admin/purchase', 
            name: 'purchase', 
            component: purchase, 
            meta: 
            { 
                name: 'Purchase', 
                icon: 'supervisor_account',
                requiresAuth : true
            } 
        },
    ],
})