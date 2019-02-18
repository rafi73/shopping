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


					<v-data-table :headers="headers" :items="stocks" :pagination.sync="pagination"
						:total-items="totalItems" :loading="loading" :rows-per-page-items="rowsPerPageItems">
						<template slot="items" slot-scope="props">
							<td>{{ props.item.batch}}</td>
							<td class="text-xs-right">{{ props.item.quantity}}</td>
							<td>{{ props.item.product.name }}</td>
							<td>{{ props.item.seller.name }}</td>
							<td>{{ props.item.expiry_date }}</td>
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
								<multiselect placeholder="Select stock" data-vv-name="product"
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
								<v-text-field v-validate="'required|decimal:2'" v-model="stock.quantity" :counter="300"
									:error-messages="errors.collect('quantity')" :label="`${ $t('stock_quantity')}`"
									name="quantity" data-vv-as="quantity"></v-text-field>
							</v-flex>

							<v-flex xs12 sm6 md6>
								<v-text-field v-validate="'required'" v-model="stock.batch" :counter="300"
									:error-messages="errors.collect('batch')" :label="`${ $t('stock_batch')}`"
									name="batch" data-vv-as="batch"></v-text-field>
							</v-flex>

							<v-flex xs12 sm12 md12>
								<v-dialog ref="dialog" v-model="modal" :return-value.sync="stock.expiry_date" persistent lazy
									full-width width="290px">
									<v-text-field slot="activator" v-model="stock.expiry_date" label="Expiry Date"
										prepend-icon="event" readonly></v-text-field>
									<v-date-picker v-model="stock.expiry_date" scrollable>
										<v-spacer></v-spacer>
										<v-btn flat color="primary" @click="modal = false">Cancel</v-btn>
										<v-btn flat color="primary" @click="$refs.dialog.save(stock.expiry_date)">OK</v-btn>
									</v-date-picker>
								</v-dialog>
							</v-flex>

							<v-checkbox :label="`${$t('stock_active')}: ${stock.active}`" v-model="stock.active">
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
				stock: {
					expiry_date: this.$moment().format("YYYY-MM-DD"),
				},
				loading: false,
				dialog: false,
				headers: [
					{ text: 'Batch', value: 'batch' },
					{ text: 'Quantity', value: 'quantity', align: 'right' },
					{ text: 'Product', value: 'product', sortable: false },
					{ text: 'Seller', value: 'seller', sortable: false },
					{ text: 'Expiry Date', value: 'expiry_date' },
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
				date: new Date().toISOString().substr(0, 10),
				modal: false,
				selectedProduct: {},
				products: [],
				selectedSeller: {},
				sellers: [],
				stocks: []
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
				this.stock = Object.assign({}, item)
				this.selectedProduct =  this.stock.product
				this.selectedSeller = this.stock.seller
				this.dialogInput = true
				this.edit = true
			},
			deleteItem(item) {
				this.dialogConfirmDelete = true
				this.stock = item
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
						this.stock.updated_by = this.$store.state.currentUser.id

						if (this.edit) {
							console.log('edit', this.editedItem)
							axios.put('/api/stock', this.stock)
								.then(
									(response) => {
										this.showSnackbar('Updated successfully')
										console.log(response)
										this.fetchAll()
									}
								)
								.catch(
									(error) => {
										console.log(error)
									}
								)
						} else {
							this.stock.created_by = this.$store.state.currentUser.id
							
							axios.post('/api/stock', this.stock)
								.then(
									(response) => {
										this.showSnackbar('Item added')
										console.log(response)
										this.fetchAll()
									}
								)
								.catch(
									(error) => {
										console.log(error)
									}
								)
						}
						this.close()
						this.loading = false
						this.edit = false
						this.stockSpecifications = {}
					}
					else {
						console.log('validation failed')
					}
				})
			},
			fetchAll() {
				console.log(this.pagination)
				this.loading = true
				let url = `/api/stocks-datatable`
				let params = `?page=${this.pagination.page}
								&rowsPerPage=${this.pagination.rowsPerPage}
								&sortBy=${this.pagination.sortBy}
								&descending=${this.pagination.descending}
								&search=${this.search}`

				axios.get(url + params)
					.then(response => {
						this.stocks = response.data.data
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
				axios.delete(`/api/stock/${this.stock.id}`)
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
				this.stock = { batch: Math.random().toString(36).substring(7), active: true }
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
					this.stock.product_id = selectedOption.id
				}
			},
			onSelectSeller(selectedOption, id) {
				if (selectedOption) {
					this.stock.seller_id = selectedOption.id
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
					this.stock.sub_category_id = selectedOption.id
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
					this.stock.brand_id = selectedOption.id
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
			fetchstockWiseSpecifications(stockId) {
				this.loading = true
				axios.get(`/api/stock-wise-specification/${stockId}/stock`)
					.then(response => {
						this.stockWiseSpecifications = response.data.data

						let temp = {}

						this.stockSpecifications = {}
						this.stockWiseSpecifications.forEach((element, index) => {
							this.stockSpecifications[element.specification_id] = element.description
						})

						console.log('check', this.stockSpecifications)

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
				this.stock.image = fileList
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
					this.stock.image = images.join()
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