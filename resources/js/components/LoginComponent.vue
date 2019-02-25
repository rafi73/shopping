<template>
    <div id="app">
        <v-app id="inspire">
            <v-content>
                <v-container fluid fill-height>
                    <v-layout align-center justify-center>
                        <v-flex xs12 sm8 md4>
                            <v-card class="elevation-12">
                                <v-toolbar dark color="primary">
                                    <v-toolbar-title>Login</v-toolbar-title>
                                    <v-spacer></v-spacer>
                                    <v-tooltip bottom>
                                        <v-btn icon large :href="source" target="_blank" slot="activator">
                                            <!-- <v-icon large>code</v-icon> -->
                                             <v-progress-circular indeterminate  :hidden="!loading"></v-progress-circular>
                                        </v-btn>
                                        <span>Source</span>
                                    </v-tooltip>
                                </v-toolbar>
                                <v-card-text>
                                    <v-form @keyup.enter.native="login()">
                                        <v-text-field prepend-icon="person" name="login" label="Login" type="text" v-model="user.email" ></v-text-field>
                                        <v-text-field prepend-icon="lock" name="password" label="Password" id="password" type="password" v-model="user.password"></v-text-field>
                                    </v-form>
                                </v-card-text>
                                <v-card-actions>
                                    <v-spacer></v-spacer>
                                    <v-btn color="primary" @click.prevent="login()">Login</v-btn>
                                </v-card-actions>
                            </v-card>
                        </v-flex>
                    </v-layout>
                </v-container>
            </v-content>
        </v-app>

        <v-snackbar 
            v-model="snackbar.active" 
            :bottom="snackbar.y === 'bottom'" 
            :left="snackbar.x === 'left'" 
            :multi-line="snackbar.mode === 'multi-line'"
		    :right="snackbar.x === 'right'" 
            :timeout="snackbar.timeout" 
            :top="snackbar.y === 'top'" 
            :vertical="snackbar.mode === 'vertical'">
			{{ snackbar.message }}
			
            <v-btn color="pink" flat @click="snackbar.active = false">Close</v-btn>
		</v-snackbar>
    </div>
</template>

<script>
    import {login} from '../helpers/auth';
    export default {
        data: () => ({
            drawer: null,
            user:{
                email: null,
                password: null
            },
            snackbar: {
                active: false,
                y: 'bottom',
                x: 'right',
                mode: '',
                timeout: 3000,
                message: ''
                
            },
            loading: false
        }),

        props: {
            source: String
        },
        methods:{
            login(){
                this.loading = true
                this.$store.dispatch('login')
                login(this.user)
                .then((res) => {
                    this.$store.commit("loginSuccess", res)
                    this.$router.push({path: '/admin/home'})
                    this.loading = false
                })
                .catch((error) => {
                    this.$store.commit("loginFailed", {error});
                    this.showSnackbar("Username or Password error !")
                    this.loading = false
                });
            },
            showSnackbar(message) {
				this.snackbar.active = true
				this.snackbar.message = message
			},
        }
    }
</script>