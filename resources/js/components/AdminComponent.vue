<template>
    <v-app id="app">
        <v-navigation-drawer v-model="drawer" clipped fixed app>
            <v-list dense>
                <r-link linkname='category'></r-link>
                <r-link linkname='sub-category'></r-link>
                <r-link linkname='brand'></r-link>
                <r-link linkname='specification'></r-link>
                <r-link linkname='category-wise-specification'></r-link>
                <r-link linkname='product'></r-link>
                <r-link linkname='customer'></r-link>
                <r-link linkname='order'></r-link>
                <r-link linkname='price-list'></r-link>
                <r-link linkname='quote-request'></r-link>
                <r-link linkname='seller'></r-link>
                <r-link linkname='stock'></r-link>
                <r-link linkname='purchase'></r-link>
               
            </v-list>
        </v-navigation-drawer>

        <v-toolbar color="primary" dark fixed app clipped-left>
            <v-toolbar-side-icon @click.stop="drawer = !drawer"></v-toolbar-side-icon>
            <v-toolbar-title>{{title}}</v-toolbar-title>
            <v-spacer></v-spacer>
            {{ name }}
            <v-btn icon @click="logout()">
                <v-tooltip left>
                    <v-icon slot="activator" color="white" dark>exit_to_app</v-icon>
                    <span>ログアウト</span>
                </v-tooltip>
            </v-btn>
        </v-toolbar>

        <v-content>
            <v-container fluid fill-height 
                <v-layout justify-center fluid column>
                    <v-fade-transition mode="out-in">
                        <router-view @axios-logout="axiosLogout"></router-view>
                    </v-fade-transition>
                </v-layout>
            </v-container>
        </v-content>

        <v-footer color="primary" dark app fixed>
            <span class="white--text ml-3" v-html="footer"></span>
        </v-footer>

        <v-dialog v-model="dialogConfirmLogout" max-width="500">
			<v-card>
				<v-card-title class="headline">Confirm!</v-card-title>
				<v-card-text>Are you sure want to logout?</v-card-text>
				<v-card-actions>
					<v-spacer></v-spacer>
					
					<v-btn color="red darken-1" flat="flat" @click="dialogConfirmLogout = false">
						Cancel
					</v-btn>
                    <v-btn color="blue darken-1" flat="flat" @click="axiosLogout">
						Logout
					</v-btn>
				</v-card-actions>
			</v-card>
		</v-dialog>
    </v-app>
</template>

<script>
    export default {
        name: 'AdminComponent',

        props: {
            name: String,
        },

        data: () => ({
            drawer: false,
            footer: new Date().getFullYear(),
            title: 'Application',
            dialogConfirmLogout: false,
        }),

        mounted() {
            if (process.env.MIX_FOOTER) { this.footer = process.env.MIX_FOOTER }
            if (process.env.MIX_TITLE) { this.title = process.env.MIX_TITLE }
        },

        methods: {
            axiosLogout: function () {
                this.$store.commit('logout');
                this.$router.push({ name: 'login' })
            },
            logout: function () {
                this.dialogConfirmLogout = true
            },
        },
    }
</script>