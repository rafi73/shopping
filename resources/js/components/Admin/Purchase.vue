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
						<v-text-field v-on:keyup.enter="fetchAll()" v-model="search" md4 append-icon="search"
							label="Search" single-line hide-details></v-text-field>
						<v-btn @click.prevent="datatbleSearch()" fab dark small color="primary">
							<v-icon dark>search</v-icon>
						</v-btn>
						<v-btn @click.prevent="clearSearch()" fab dark small color="pink">
							<v-icon dark>close</v-icon>
						</v-btn>
						<v-btn @click.prevent="addNew()" fab dark small color="teal">
							<v-icon dark>add</v-icon>
						</v-btn>
					</v-card-title>


					<v-data-table :headers="headers" :items="purchases" :pagination.sync="pagination"
						:total-items="totalItems" :loading="loading" :rows-per-page-items="rowsPerPageItems">
						<template slot="items" slot-scope="props">
							<td>{{ props.item.product.name }}</td>
							<td>{{ props.item.seller.name }}</td>
							<td class="text-xs-right">{{ props.item.cost_price}}</td>
							<td class="text-xs-right">{{ props.item.selling_price}}</td>
							<td>{{ props.item.active }}</td>
							<td>{{ props.item.created_at }}</td>
							<td>
								<v-icon small class="mr-2" @click="editItem(props.item)">
									edit
								</v-icon>
								<v-icon small @click="deleteItem(props.item)">
									delete
								</v-icon>
							</td>
						</template>
					</v-data-table>
					<div class="mb-2 text-xs-center">
						<v-pagination v-model="pagination.page" :length="lastPage" :total-visible="8" @input="next"
							circle></v-pagination>
					</div>
				</v-card>
			</v-app>
		</v-flex>

		<v-dialog v-model="dialogInput" max-width="1200" persistent>
			<v-card>
				<v-card-title>
					<span class="headline">{{ formTitle }}</span>
				</v-card-title>
				<v-card-text>
					<v-container grid-list-md>
						<v-layout wrap>
							<v-flex xs12 sm6 md6>
								<multiselect placeholder="Select purchase" data-vv-name="product"
									v-model="selectedProduct" track-by="id" label="name" :options="products"
									@select="onSelectProduct" v-validate="'required'">
								</multiselect>
								<span class="v-messages error--text"
									v-show="errors.has('product')">{{ errors.first('product') }}</span>
									
							</v-flex>

							<v-flex xs12 sm6 md6>
								<multiselect placeholder="Select Seller" data-vv-name="seller"
									v-model="selectedSeller" track-by="id" label="name" :options="sellers"
									@select="onSelectSeller" v-validate="'required'">
								</multiselect>
								<span class="v-messages error--text"
									v-show="errors.has('seller')">{{ errors.first('seller') }}</span>
							</v-flex>

							
							<v-flex xs12 sm6 md6>
								<v-text-field v-validate="'required|decimal:2'" v-model="purchase.cost_price" :counter="300"
									:error-messages="errors.collect('cost_price')" :label="`${ $t('purchase_cost_price')}`"
									name="cost_price" data-vv-as="cost_price"></v-text-field>
							</v-flex>

							<v-flex xs12 sm6 md6>
								<v-text-field v-validate="'required|decimal:2'" v-model="purchase.selling_price" :counter="300"
									:error-messages="errors.collect('selling_price')" :label="`${ $t('purchase_selling_price')}`"
									name="selling_price" data-vv-as="selling_price"></v-text-field>
							</v-flex>

							<v-checkbox :label="`${$t('purchase_active')}: ${purchase.active}`" v-model="purchase.active">
							</v-checkbox>
						</v-layout>
					</v-container>
				</v-card-text>

				<v-card-actions>
					<v-spacer></v-spacer>
					<v-btn color="blue darken-1" flat @click.native="close()">{{ $t('cancel') }}</v-btn>
					<v-btn color="blue darken-1" flat @click.native="save()">{{ $t('save') }}</v-btn>
				</v-card-actions>
			</v-card>
		</v-dialog>

		<v-dialog v-model="dialogConfirmDelete" max-width="500">
			<v-card>
				<v-card-title class="headline">{{ $t('delete_confirm_title') }}</v-card-title>
				<v-card-text>{{ $t('delete_confirm_text') }}</v-card-text>
				<v-card-actions>
					<v-spacer></v-spacer>
					<v-btn color="blue darken-1" flat="flat" @click="dialogConfirmDelete = false">
						Disagree
					</v-btn>

					<v-btn color="red darken-1" flat="flat" @click="erase()">
						Agree
					</v-btn>
				</v-card-actions>
			</v-card>
		</v-dialog>

		<v-snackbar v-model="snackbar.active" :bottom="snackbar.y === 'bottom'" :left="snackbar.x === 'left'"
			:multi-line="snackbar.mode === 'multi-line'" :right="snackbar.x === 'right'" :timeout="snackbar.timeout"
			:top="snackbar.y === 'top'" :vertical="snackbar.mode === 'vertical'">
			{{ snackbar.message }}
			<v-btn color="pink" flat @click="snackbar.active = false">Close</v-btn>
		</v-snackbar>
	</v-layout>
</template>

<style>
	#my-strictly-unique-vue-upload-multiple-image {
		font-family: 'Avenir', Helvetica, Arial, sans-serif;
		-webkit-font-smoothing: antialiased;
		-moz-osx-font-smoothing: grayscale;
		text-align: center;
		color: #2c3e50;
		margin-top: 60px;
	}

	.multiple-image h1,
	h2 {
		font-weight: normal;
	}

	.multiple-image ul {
		list-style-type: none;
		padding: 0;
	}

	.multiple-image li {
		display: inline-block;
		margin: 0 0px;
	}

	.multiple-image a {
		color: #42b983;
	}
</style>

<script>
	import Multiselect from 'vue-multiselect'
	import VueUploadMultipleImage from 'vue-upload-multiple-image'

	export default {
		name: "settings-view",
		components: {
			Multiselect,
			VueUploadMultipleImage
		},
		data() {
			return {
				purchase: {
					expiry_date: this.$moment().format("YYYY-MM-DD"),
				},
				loading: false,
				dialog: false,
				headers: [
					{ text: 'Product', value: 'products.name' },
					{ text: 'Seller', value: 'sellers.name' },
					{ text: 'Cost', value: 'cost_price', align: 'right'  },
					{ text: 'Selling', value: 'selling_price', align: 'right' },
					{ text: 'Active', value: 'active' },
					{ text: 'Created At', value: 'created_at' },
					{ text: "Actions", value: "name", sortable: false }
				],
				search: '',
				dialogConfirmDelete: false,
				edit: false,
				dialogInput: false,
				snackbar: {
					active: false,
					y: 'bottom',
					x: 'right',
					mode: '',
					timeout: 3000,
					message: ''
				},
				formTitle: '',
				rowsPerPageItems: [10, 20, 30, 40],
				pagination: {
					rowsPerPage: 10
				},
				totalItems: 0,
				lastPage: 0,
				modal: false,
				selectedProduct: {},
				products: [],
				selectedSeller: {},
				sellers: [],
				purchases: []
			}
		},
		computed: {
		},
		watch: {
			pagination() {
				this.fetchAll()
			}
		},
		created() {
			this.pagination.sortBy = 'created_at'
			this.pagination.descending = 'true'
			this.fetchAll()

			console.log(this.$moment().format("YYYY-MM-DD"))
		},
		methods: {
			editItem(item) {
				this.purchase = Object.assign({}, item)
				this.selectedProduct =  this.purchase.product
				this.selectedSeller = this.purchase.seller
				this.dialogInput = true
				this.edit = true

				this.fetchProducts()
				this.fetchSellers()
			},
			deleteItem(item) {
				this.dialogConfirmDelete = true
				this.purchase = item
			},
			close() {
				this.dialogInput = false
				setTimeout(() => {
					this.editedItem = Object.assign({}, this.defaultItem)
					this.editedIndex = -1
				}, 300)
			},
			save() {
				this.$validator.validate().then(result => {
					if (result) {
						this.loading = true
						this.purchase.updated_by = this.$store.state.currentUser.id

						if (this.edit) {
							console.log('edit', this.editedItem)
							axios.put('/api/purchase', this.purchase)
								.then(
									(response) => {
										this.loading = false
										this.showSnackbar('Updated successfully')
										console.log(response)
										this.fetchAll()
									}
								)
								.catch(
									(error) => {
										this.loading = false
										console.log(error)
										this.showSnackbar(error.data.message)
									}
								)
						} else {
							this.purchase.created_by = this.$store.state.currentUser.id
							
							axios.post('/api/purchase', this.purchase)
								.then(
									(response) => {
										this.loading = false
										this.showSnackbar('Item added')
										console.log(response)
										this.fetchAll()
									}
								)
								.catch(
									(error) => {
										this.loading = false
										console.log(error)
									}
								)
						}
						this.close()
						
						this.edit = false
						this.purchaseSpecifications = {}
					}
					else {
						console.log('validation failed')
					}
				})
			},
			fetchAll() {
				console.log(this.pagination)
				this.loading = true
				let url = `/api/purchases-datatable`
				let params = `?page=${this.pagination.page}
								&rowsPerPage=${this.pagination.rowsPerPage}
								&sortBy=${this.pagination.sortBy}
								&descending=${this.pagination.descending}
								&search=${this.search}`

				axios.get(url + params)
					.then(response => {
						this.purchases = response.data.data
						this.totalItems = response.data.meta.total
						this.lastPage = response.data.meta.last_page
						console.log(response.data)
						this.loading = false
					})
					.catch(error => {
						if (error.response) {
							console.log(error.response);
							if (error.response.status === 401) {
								window.location.href = '/admin/login'
							}
						}
					})
			},
			erase() {
				this.dialogConfirmDelete = false
				this.loading = true
				axios.delete(`/api/purchase/${this.purchase.id}`)
					.then(response => {
						this.loading = false
						this.fetchAll()
					})
					.catch(error => {
						if (error.response) {
							console.log(error.response)
						}
					})
			},
			addNew() {
				this.formTitle = 'Add new item'
				this.purchase = { batch: Math.random().toString(36).substring(7), active: true }
				this.selectedProduct = null
				this.selectedSeller = null
				this.selectedBrand = null
				this.dialogInput = true
				this.edit = false


				this.fetchProducts()
				this.fetchSellers()
			},
			onSelectProduct(selectedOption, id) {
				if (selectedOption) {
					this.purchase.product_id = selectedOption.id
				}
			},
			onSelectSeller(selectedOption, id) {
				if (selectedOption) {
					this.purchase.seller_id = selectedOption.id
				}
			},
			fetchSellers() {
				this.loading = true
				axios.get(`/api/sellers`)
					.then(response => {
						this.sellers = response.data.data
						console.log(response.data.data)
						this.loading = false
					})
					.catch(error => {
						if (error.response) {
							console.log(error.response)
						}
					})
			},
			fetchProducts() {
				this.loading = true
				axios.get(`/api/products`)
					.then(response => {
						this.products = response.data.data
						console.log(response.data.data)
						this.loading = false
					})
					.catch(error => {
						if (error.response) {
							console.log(error.response)
						}
					})
			},
			onSelectSubCategory(selectedOption, id) {
				if (selectedOption) {
					this.purchase.sub_category_id = selectedOption.id
				}
			},
			fetchSubCategories(categoryId) {
				this.loading = true
				axios.get(`/api/sub-category/${categoryId}/category`)
					.then(response => {
						this.subCategories = response.data.data
						console.log(response.data.data)
						this.loading = false
					})
					.catch(error => {
						if (error.response) {
							console.log(error.response)
						}
					})
			},
			onSelectBrand(selectedOption, id) {
				if (selectedOption) {
					this.purchase.brand_id = selectedOption.id
				}
			},
			fetchBrands() {
				this.loading = true
				axios.get(`/api/brands`)
					.then(response => {
						this.brands = response.data.data
						console.log(response.data.data)
						this.loading = false
					})
					.catch(error => {
						if (error.response) {
							console.log(error.response)
						}
					})
			},
			fetchCategoryWiseSpecifications(catgoryId) {
				this.loading = true
				axios.get(`/api/category-wise-specification/${catgoryId}/category`)
					.then(response => {
						this.categoryWiseSpecifications = response.data.data
						console.log(response.data.data)
						this.loading = false
					})
					.catch(error => {
						if (error.response) {
							console.log(error.response)
						}
					})
			},
			fetchpurchaseWiseSpecifications(purchaseId) {
				this.loading = true
				axios.get(`/api/purchase-wise-specification/${purchaseId}/purchase`)
					.then(response => {
						this.purchaseWiseSpecifications = response.data.data

						let temp = {}

						this.purchaseSpecifications = {}
						this.purchaseWiseSpecifications.forEach((element, index) => {
							this.purchaseSpecifications[element.specification_id] = element.description
						})

						console.log('check', this.purchaseSpecifications)

						console.log(response.data.data)
						this.loading = false
					})
					.catch(error => {
						if (error.response) {
							console.log(error.response)
						}
					})
			},

			uploadImageSuccess(formData, index, fileList) {
				console.log(fileList)
				this.purchase.image = fileList
				if (fileList.length > this.MAX_UPLOAD) {
					alert('Max image limit  exceeded!')
				}
			},

			beforeRemove(index, done, fileList) {
				console.log('index', index, fileList)
				var r = confirm("remove image")
				if (r == true) {
					done()
					let images = []
					fileList.forEach(element => {
						images.push(element.path)
					})
					this.purchase.image = images.join()
				}
				else {
				}
			},

			editImage(formData, index, fileList) {
				console.log('edit data', formData, index, fileList)
			},

			dataChange(data) {
				console.log(data)
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