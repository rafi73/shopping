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
						<v-btn @click.prevent="addNew()" fab dark small color="teal">
							<v-icon dark>add</v-icon>
						</v-btn>
					</v-card-title>


					<v-data-table :headers="headers" :items="products" :pagination.sync="pagination" :total-items="totalItems" :loading="loading" :rows-per-page-items="rowsPerPageItems">
						<template slot="items" slot-scope="props">
							<td>{{ props.item.name }}</td>
							<td>{{ props.item.category.name }}</td>
							<td>
								<div class="image-container">
									<img class="object-fit-cover" :src="props.item.image.toString().split(',')[0] || '/img/v.png'" />
								</div>
							</td>
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
						<v-pagination v-model="pagination.page" :length="lastPage" :total-visible="8" @input="next" circle></v-pagination>
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
							<v-flex xs12 sm4 md4>
								<multiselect 
									placeholder="Select Category"
									data-vv-name="category"
									v-model="selectedCategory"
									track-by="id"
									label="name"
									:options="categories"
									@select="onSelectCategory"
									v-validate="'required'">
								</multiselect>
								<span class="v-messages error--text" v-show="errors.has('category')">{{ errors.first('category') }}</span>   
							</v-flex>
							<v-flex xs12 sm4 md4>
								<multiselect v-model="selectedSubCategory" :options="subCategories" @select="onSelectSubCategory" track-by="id" label="name"
									placeholder="Select Sub Category" selectLabel="" deselectLabel="" selectedLabel=""  name="category">
								</multiselect>
							</v-flex>
							<v-flex xs12 sm4 md4>
								<multiselect 
									placeholder="Select Brand"
									data-vv-name="brand"
									v-model="selectedBrand"
									track-by="id"
									label="name"
									:options="brands"
									@select="onSelectBrand"
									v-validate="'required'">
								</multiselect>
								<span class="v-messages error--text" v-show="errors.has('brand')">{{ errors.first('brand') }}</span>
							</v-flex>

							<v-flex xs12 sm12 md12 >
								<v-text-field v-validate="'required'" v-model="product.name" :counter="300" 
								:error-messages="errors.collect('name')" :label="`${ $t('product_name')}`" name="name" data-vv-as="name"></v-text-field>
							</v-flex>

							<v-flex xs12 sm12 md12>
								<span>Description</span>
								<wysiwyg v-model="product.description" v-validate="'required'" name="description" data-vv-as="description" type="text"></wysiwyg>
								<span class="is-danger">{{ errors.first('description') }}</span>
							</v-flex>

							<v-flex xs12 sm12 md12>
								<span>Images</span>
								<div class="multiple-image">	
									<vue-upload-multiple-image 
										@upload-success="uploadImageSuccess" 
										@before-remove="beforeRemove"
										@edit-image="editImage" 
										@data-change="dataChange" 
										:data-images="images"
										:dragText=DRAG_TEXT
										:browseText=UPLOAD_TEXT
										:maxImage=MAX_UPLOAD
										:showPrimary=false  
										v-validate="!product.image ? 'required':''" 
										name="image">
									</vue-upload-multiple-image>
								</div>
								<span class="is-danger" >{{ errors.first('image') }}</span>  
							</v-flex>

							<v-flex xs12 sm12 md12 >
								<v-text-field v-validate="'required'" v-model="product.reference" :counter="200" 
								:error-messages="errors.collect('product_reference')" :label="`${ $t('product_reference')}`" name="product_reference" data-vv-as="product reference"></v-text-field>
							</v-flex>

							<v-flex xs12 sm12 md12 >
								<v-text-field v-validate="'required'" v-model="product.condition" :counter="200" 
								:error-messages="errors.collect('product_condition')" :label="`${ $t('product_conditoin')}`" name="product_condition" data-vv-as="product condition"></v-text-field>
							</v-flex>

							<v-flex xs12 sm12 md12 >
								<v-text-field v-validate="'required|decimal:2'" v-model="product.price" :counter="10" 
								:error-messages="errors.collect('price')" :label="`${ $t('product_price')}`" data-vv-name="price" ></v-text-field>
							</v-flex>

							<v-flex xs12 sm12 md12 >
								<v-text-field v-validate="'required|decimal:2'" v-model="product.discount_price" :counter="10" 
								:error-messages="errors.collect('discount_price')" :label="`${ $t('product_discount_price')}`" name="discount_price" data-vv-as="discount price"  ></v-text-field>
							</v-flex>

							<v-flex xs12 sm12 md12>
								<span>More Info</span>
								<wysiwyg v-model="product.more_info" v-validate="'required'" name="more_info" data-vv-as="more info" type="text"></wysiwyg>
								<span class="is-danger">{{ errors.first('more_info') }}</span>
							</v-flex>

							<v-flex xs12 sm12 md12>
								<span>Inside Box</span>
								<wysiwyg v-model="product.inside_box" v-validate="'required'" name="more_info" data-vv-as="more info" type="text"></wysiwyg>
								<span class="is-danger">{{ errors.first('more_info') }}</span>
							</v-flex>

							<v-flex xs12 sm12 md12 v-for="(specification, index) in categoryWiseSpecifications" :key="index">
								<v-text-field 
									v-validate="'required'" 
									:name="`${specification.specification.name}`" 
									:data-vv-as="`${specification.specification.name}`"
									v-model="productSpecifications[specification.specification.id]" 
									:counter="200" 
									:error-messages="errors.collect(`${specification.specification.name}`)" 
									:label="`${specification.specification.name}`" >
								</v-text-field>
							</v-flex>

							<v-checkbox :label="`${$t('product_active')}: ${product.active}`" v-model="product.active" ></v-checkbox>
							<v-checkbox :label="`${$t('New')}: ${product.new}`" v-model="product.new" ></v-checkbox>
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

					<v-btn color="red darken-1" flat="flat" @click="erase()" >
						Agree
					</v-btn>
				</v-card-actions>
			</v-card>
		</v-dialog>

		<v-snackbar v-model="snackbar.active" :bottom="snackbar.y === 'bottom'" :left="snackbar.x === 'left'" :multi-line="snackbar.mode === 'multi-line'"
		 :right="snackbar.x === 'right'" :timeout="snackbar.timeout" :top="snackbar.y === 'top'" :vertical="snackbar.mode === 'vertical'">
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
				product: {
					specification: {}
				},
				loading: false,
				dialog: false,
				headers: [
					{
						text: 'Name',
						value: 'name'
					},
					{
						text: 'Category',
						value: 'category'
					},
					{
						text: 'Image',
						value: 'image', 
						align: 'center'
					},
					{
						text: 'Active',
						value: 'active'
					},
					{
						text: 'Created At',
						value: 'created_at'
					},
					{
						text: "Actions",
						value: "name",
						sortable: false
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
				dialogConfirmDelete: false,
				edit : false,
				dialogInput : false,
				selectedCategory : null,
				selectedSubCategory : null,
				categories: [],
				selectedBrand : null,
				brands: [],
				categoryWiseSpecifications: [],
				productSpecifications: {},
				products: [],
				productWiseSpecifications: [],
				MAX_UPLOAD:5,
                UPLOAD_TEXT:'Click Here To Upload',
				DRAG_TEXT:'Drag & Drop Files',
				images:[],
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
			this.fetchCategories()
			this.fetchBrands()

		},
		methods: {
			editItem(item) {
				this.product = Object.assign({}, item)
				//this.imgInput = this.product.image
				this.selectedCategory = this.categories.find(x => x.id === this.product.category.id)
				this.selectedSubCategory = this.subCategories.find(x => x.id === this.product.sub_category_id)
				this.selectedBrand = this.brands.find(x => x.id === this.product.brand_id)
				this.fetchProductWiseSpecifications(this.product.id)
				this.fetchCategoryWiseSpecifications(this.product.category.id)
				this.dialogInput = true
				this.edit = true
				this.productSpecifications = {}

				let images = this.product.image.split(',')
				images.forEach(element => {
					this.images.push({
						path: element,
						default: 1,
						highlight: 1,
						caption: 'caption to display. receive',
					})
				})
			},
			deleteItem(item) {
				this.dialogConfirmDelete = true
				this.product = item
			},
			close() {
				this.dialogInput = false
				setTimeout(() => {
					this.editedItem = Object.assign({}, this.defaultItem)
					this.editedIndex = -1
				}, 300)
			},
			save() {
				this.product.specification = this.productSpecifications
				this.$validator.validate().then(result => {
                    if (result){
						this.loading = true
						if (this.edit) {
							console.log('edit', this.editedItem)
							axios.put('/api/product', this.product)
								.then(
									(response) => {
										this.showSnackbar('Item Updated Successfully')
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
							//this.desserts.push(this.editedItem)
							console.log('save', this.editedItem)

							
							this.product.created_by = this.$store.state.currentUser.id
							this.product.updated_by = this.$store.state.currentUser.id

							axios.post('/api/product', this.product)
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
						this.productSpecifications = {}
					}
					else{
						console.log('validation failed')
					}
				})
			},
			fetchAll() {
				console.log(this.pagination)
				this.loading = true
				let url = `/api/products-datatable`
				let params = `?page=${this.pagination.page}
								&rowsPerPage=${this.pagination.rowsPerPage}
								&sortBy=${this.pagination.sortBy}
								&descending=${this.pagination.descending}
								&search=${this.search}`

				axios.get(url + params)
					.then(response => {
						this.products = response.data.data
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
				axios.delete(`/api/product/${this.product.id}`)
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
			addNew(){
				this.product = {image:null, active: true, new: true}
				this.imgInput = ``
				this.selectedCategory = null
				this.selectedSubCategory = null
				this.selectedBrand = null
				this.dialogInput = true
				this.edit = false,
				this.imageName = null
			},
			onSelectCategory(selectedOption, id){
                if(selectedOption){
					this.product.category_id = selectedOption.id
					console.log(selectedOption.id)
					this.fetchSubCategories(selectedOption.id)
					this.fetchCategoryWiseSpecifications(selectedOption.id)
				}
			},
			fetchCategories() {
				this.loading = true
				axios.get(`/api/categories`)
				.then(response => {
					this.categories = response.data.data
					console.log(response.data.data)
					this.loading = false
				})
				.catch(error => {
					if (error.response) {
						console.log(error.response)
					}
				})
			},
			onSelectSubCategory(selectedOption, id){
                if(selectedOption){
					this.product.sub_category_id = selectedOption.id
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
			onSelectBrand(selectedOption, id){
                if(selectedOption){
					this.product.brand_id = selectedOption.id
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
			fetchProductWiseSpecifications(productId) {
				this.loading = true
				axios.get(`/api/product-wise-specification/${productId}/product`)
				.then(response => {
					this.productWiseSpecifications = response.data.data

					let temp = {}

					this.productSpecifications = {}
					this.productWiseSpecifications.forEach((element, index) => {
						this.productSpecifications[element.specification_id] = element.description
					})

					console.log('check', this.productSpecifications)

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
                this.product.image = fileList  
                if(fileList.length > this.MAX_UPLOAD){
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
                    this.product.image = images.join()
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