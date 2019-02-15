<template>
	<v-layout row>
		<v-flex xs12 class="m-3 px-3">
			<v-app id="inspire">
				<v-card>
					<v-card-title class="grey lighten-4">
						<v-icon class="pr-2">
							{{ $route.meta.icon }}
						</v-icon> 
						<h3 class="headline mb-0">{{ $route.meta.name }}</h3>
						<v-spacer></v-spacer>
						<v-spacer></v-spacer>
						<v-spacer></v-spacer>
						<v-spacer></v-spacer>
						<v-spacer></v-spacer>
						<v-text-field v-on:keyup.enter="fetchAll()" v-model="search" md4 append-icon="search" label="Search" single-line
						 hide-details></v-text-field>
						<v-btn @click.prevent="datatbleSearch()" fab dark small color="primary">
							<v-icon dark>search</v-icon>
						</v-btn>
						<v-btn @click.prevent="clearSearch()" fab dark small color="pink">
							<v-icon dark>close</v-icon>
						</v-btn>
					</v-card-title>

					<v-data-table :headers="headers" :items="orders" :pagination.sync="pagination" :total-items="totalItems" :loading="loading"
					 :rows-per-page-items="rowsPerPageItems">
						<template slot="items" slot-scope="props">
							<td>{{ props.item.id }}</td>
							<td>{{ props.item.customer_name }}</td>
							<td>{{ props.item.customer_email }}</td>
							<td>{{ props.item.total }}</td>
							<td>{{ props.item.created_at }}</td>
							<td>
								<v-icon small class="mr-2" @click="showDetails(props.item)">
									details
								</v-icon>
							</td>
						</template>
					</v-data-table>
					<div class="mb-2 text-xs-center">
						<v-pagination v-model="pagination.page" :length="lastPage" :total-visible="8" @input="next" circle></v-pagination>
					</div>
				</v-card>
			</v-app>
		</v-flex>
		<v-dialog v-model="dialogDetails" max-width="800">
			<v-card>
				<v-card-title>
					<span class="headline">Order Details</span>
				</v-card-title>
				<v-card-text>
					<v-container grid-list-md>
						<v-layout class="text-center" wrap>
							<v-layout wrap>
								<v-flex xs12 sm12 md12>
									<v-text-field v-validate="'required'" v-model="order.billing_name" :counter="10" :error-messages="errors.collect('name')"
									 :label="`${$t('order_name')}`" data-vv-name="name" required></v-text-field>
								</v-flex>
								<v-flex xs12 sm12 md12>
									<v-text-field v-validate="'required'" v-model="order.billing_email" :counter="10" :error-messages="errors.collect('email')"
									 :label="`${$t('order_email')}`" data-vv-name="email" required></v-text-field>
								</v-flex>
								<v-flex xs12 sm12 md12>
									<v-text-field v-validate="'required'" v-model="order.billing_phone" :counter="10" :error-messages="errors.collect('phone')"
									 :label="`${$t('order_phone')}`" data-vv-name="phone" required></v-text-field>
								</v-flex>
								<v-flex xs12 sm12 md12>
									<v-text-field v-validate="'required'" v-model="order.billing_company" :counter="10" :error-messages="errors.collect('company')"
									 :label="`${$t('order_company')}`" data-vv-name="company" required></v-text-field>
								</v-flex>
								<v-flex xs12 sm12 md12>
									<v-text-field v-validate="'required'" v-model="order.billing_country" :counter="10" :error-messages="errors.collect('country')"
									 :label="`${$t('order_country')}`" data-vv-name="country" required></v-text-field>
								</v-flex>
								<v-flex xs12 sm12 md12>
									<v-text-field v-validate="'required'" v-model="order.billing_state" :counter="10" :error-messages="errors.collect('state')"
									 :label="`${$t('order_state')}`" data-vv-name="state" required></v-text-field>
								</v-flex>
								<v-flex xs12 sm12 md12>
									<v-text-field v-validate="'required'" v-model="order.billing_address" :counter="10" :error-messages="errors.collect('address')"
									 :label="`${$t('order_address')}`" data-vv-name="address" required></v-text-field>
								</v-flex>
							</v-layout>
							<v-data-table :items="order.orderDetails" class="elevation-1" hide-actions :headers="orderDetailsheaders">
								<template slot="items" slot-scope="props">
									<td>{{ props.item.product.name }}</td>
									<td>{{ props.item.product.description }}</td>
									<td class="text-xs-center">{{ props.item.quantity }}</td>
									<td class="text-xs-right">{{ props.item.product.price }}</td>
									<td class="text-xs-right">{{ parseFloat(props.item.product.price * props.item.quantity).toFixed(2) }}</td>
								</template>
							</v-data-table>
						</v-layout>
					</v-container>
				</v-card-text>

				<v-card-actions>
					<v-spacer></v-spacer>
					<v-btn color="blue darken-1" flat @click.native="close()">{{ $t('cancel') }}</v-btn>
				</v-card-actions>
			</v-card>
		</v-dialog>
	</v-layout>
</template>

<script>
	import Multiselect from 'vue-multiselect'

	export default {
		name: "settings-view",
		components: {
			Multiselect
		},
		data() {
			return {
				loading: true,
				rowsPerPageItems: [10, 20, 30, 40],
				pagination: {
					rowsPerPage: 10
				},
				headers: [
					{
						text: 'Order #',
						value: 'id'
					},
					{
						text: 'Customer Name',
						value: 'customer_name'
					},
					{
						text: 'Customer Email',
						value: 'customer_email'
					},
					{
						text: 'Total',
						value: 'total'
					},
					{
						text: 'Date',
						value: 'created_at'
					},
					{
						text: "Actions",
						value: "name",
						sortable: false
					}
				],
				brand: {},
				search: "",
				dialogInput: false,
				brands: [],
				totalItems: 0,
				lastPage: 0,
				dialogConfirmDelete: false,
				edit: false,
				dialogInput: false,
				headers: [
					{
						text: 'Order #',
						value: 'id'
					},
					{
						text: 'Customer Name',
						value: 'customer_name'
					},
					{
						text: 'Customer Email',
						value: 'customer_email'
					},
					{
						text: 'Total',
						value: 'total'
					},
					{
						text: 'Date',
						value: 'created_at'
					},
					{
						text: "Actions",
						value: "name",
						sortable: false
					}
				],
				dialogDetails: false,
				orderDetailsheaders: [
					{
						text: 'Product',
						value: 'product.name'
					},
					{
						text: 'Description',
						value: 'product.description'
					},
					{
						text: 'Quantity',
						value: 'quantity'
					},
					{
						text: 'Unit Pice',
						value: 'created_at'
					},
					{
						text: "Total",
						value: "name",
					}
				],
				orders: [],
				order: {}
			}
		},
		computed: {
			formTitle() {
				return this.editedIndex === -1 ? "New Item" : "Edit Item";
			}
		},
		watch: {
			pagination() {
				this.fetchAll()
			}
		},
		created() {
			this.fetchAll()
		},
		methods: {
			fetchAll() {
				console.log(this.pagination)
				this.loading = true
				let url = `/api/orders`
				let params = `?page=${this.pagination.page}
								&rowsPerPage=${this.pagination.rowsPerPage}
								&sortBy=${this.pagination.sortBy}
								&descending=${this.pagination.descending}
								&search=${this.search}`

				axios.get(url + params)
					.then(response => {
						this.orders = response.data.data
						this.totalItems = response.data.meta.total
						this.lastPage = response.data.meta.last_page
						console.log(response.data)
						this.loading = false
					})
					.catch(error => {
						if (error.response) {
							console.log(error.response);
							if (error.response.status === 401) {
								window.location.href = '/login'
							}
						}
					})
			},
			showDetails(order) {
				console.log(order)
				this.dialogDetails = true
				this.order = order
			},
			close() {
				this.dialogDetails = false
			},
			datatbleSearch() {
				if (this.search.length) {
					this.pagination.page = 1
					this.fetchAll()
					console.log(this.pagination)
					this.snackbar = true
				}
			},
			showSnackbar(message) {
				this.snackbar.active = true
				this.snackbar.message = message
			},
			next(page) {
				console.log(page)
				this.pagination.page = page
				this.fetchAll()
			},
			clearSearch() {
				if (this.search.length) {
					this.search = ""
					this.fetchAll()
				}
			}

		}
	}
</script>