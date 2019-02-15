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
						<v-text-field v-model="search" md4 append-icon="search" label="Search" single-line hide-details></v-text-field>
						
					</v-card-title>

					<v-data-table :headers="headers" :items="quoteRequests" :search="search">
						<template slot="items" slot-scope="props">
							<td>{{ props.item.name }}</td>
							<td>{{ props.item.email }}</td>
							<td>{{ props.item.company_name }}</td>
							<td>{{ props.item.company_reg_number }}</td>
							<td>{{ props.item.company_address }}</td>
							<td>{{ props.item.contact }}</td>
							<td>{{ props.item.additional_message }}</td>
							
						</template>
						<v-alert slot="no-results" :value="true" color="error" icon="warning">
							Your search for "{{ search }}" found no results.
						</v-alert>
					</v-data-table>
				</v-card>
			</v-app>
		</v-flex>
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
				busy: false,
				imageName: "",
				imgInput: "",
				imageFile: "",
				dialog: false,
				headers: [
					{
						text: 'Name',
						value: 'id'
					},
					{
						text: 'Email',
						value: 'customer_name'
					},
					{
						text: 'Company Name',
						value: 'customer_email'
					},
					{
						text: 'Company Registration No',
						value: 'total'
					},
					{
						text: 'Company Address',
						value: 'created_at'
					},
					{
						text: "Contact Number",
						value: "name",
					},
					{
						text: "Additional Info",
						value: "name",
					}
				],
				desserts: [],
				editedIndex: -1,
				editedItem: {
					name: "",
					calories: 0,
					fat: 0,
					carbs: 0,
					protein: 0
				},
				defaultItem: {
					name: "",
					calories: 0,
					fat: 0,
					carbs: 0,
					protein: 0
				},
				search: '',
				subCategories: [],
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
				quoteRequests : []
			}
		},
		computed: {
			formTitle() {
				return this.editedIndex === -1 ? "New Item" : "Edit Item";
			}
		},
		watch: {
			dialog(val) {
				val || this.close();
			}
		},
		created() {
			this.fetchAll()

		},
		methods: {
			
			fetchAll() {
				this.busy = true
				axios.get(`/api/quote-requests`)
				.then(response => {
					this.quoteRequests = response.data.data
					console.log(response.data.data)
					this.busy = false
				})
				.catch(error => {
					if (error.response) {
						console.log(error.response)
					}
				})
			},
			showDetails(order){
				console.log(order)
				this.dialogDetails = true
				this.orderDetails = order.orderDetails
			},
			close() {
				this.dialogDetails = false
			},
			
		}
	}
</script>