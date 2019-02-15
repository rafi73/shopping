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
						<v-btn @click.prevent="addNew()" slot="activator" color="primary" dark class="mb-2">{{ $t('new_item') }}</v-btn>
						<v-dialog v-model="dialogInput" max-width="1000px">
							<v-card>
								<v-card-title>
									<span class="headline">{{ formTitle }}</span>
								</v-card-title>
								<v-card-text>
									<v-container grid-list-md>
										<v-layout wrap>
											<v-flex xs12 sm12 md12>
												<!-- <multiselect v-model="selectedCategory" :class="{ 'is-danger': !selectedCategory }" :options="categories" @select="onSelectCategory" track-by="id" label="name"
													placeholder="Select Category" selectLabel="" deselectLabel="" selectedLabel="" v-validate="'required'" name="category"
													data-vv-as="category">
												</multiselect> -->
												 <multiselect 
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
											<v-flex xs12 sm12 md12>
												<v-text-field v-validate="'required'" v-model="subCategory.name" :counter="10" :error-messages="errors.collect('name')" :label="`${$t('sub_category_name')}`" data-vv-name="name" required ></v-text-field>
											</v-flex>
											<v-flex xs12 sm12 md12>
												<v-textarea v-validate="'required'" v-model="subCategory.description" :counter="10" :error-messages="errors.collect('description')" :label="`${$t('sub_category_description')}`" data-vv-name="description" required ></v-textarea>
											</v-flex>
											<v-flex xs12 sm12 md12>
												<img :src="imgInput" height="150" v-if="imgInput" />
												<v-text-field :label="`${$t('sub_category_image')}`" @click='pickFile' v-model='imageName' prepend-icon='attach_file'></v-text-field>
												<input type="file" style="display: none" ref="image" accept="image/*" @change="onFilePicked">
											</v-flex>
											<v-checkbox :label="`${$t('sub_category_active')}: ${subCategory.active}`" v-model="subCategory.active"></v-checkbox>
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
					</v-card-title>

					<v-data-table :headers="headers" :items="subCategories" :search="search">
						<template slot="items" slot-scope="props">
							<td>{{ props.item.name }}</td>
							<td>{{ props.item.category.name }}</td>
							<td>
								<div class="image-container">
									<img class="object-fit-cover" :src="props.item.image || '/img/v.png'" />
								</div>
							</td>
							<td>{{ props.item.active }}</td>
							<td>
								<v-icon small class="mr-2" @click="editItem(props.item)">
									edit
								</v-icon>
								<v-icon small @click="deleteItem(props.item)">
									delete
								</v-icon>
							</td>
						</template>
						<v-alert slot="no-results" :value="true" color="error" icon="warning">
							Your search for "{{ search }}" found no results.
						</v-alert>
					</v-data-table>
				</v-card>
			</v-app>
		</v-flex>
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
				subCategory: {},
				busy: false,
				imageName: "",
				imgInput: "",
				imageFile: "",
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
						value: 'image'
					},
					{
						text: 'Active',
						value: 'active'
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
				categories: [],

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
			//this.initialize();
			this.fetchAll()
			this.fetchCategories()
		},
		methods: {
			pickFile() {
				this.$refs.image.click();
			},
			editItem(item) {
				this.subCategory = Object.assign({}, item)
				this.imgInput = this.subCategory.image
				this.selectedCategory = this.categories.find(x => x.id === this.subCategory.category.id)
				this.dialogInput = true
				this.edit = true
			},
			deleteItem(item) {
				this.dialogConfirmDelete = true
				this.subCategory = item
			},
			close() {
				this.dialogInput = false
				setTimeout(() => {
					this.editedItem = Object.assign({}, this.defaultItem)
					this.editedIndex = -1
				}, 300)
			},
			save() {
				//if (this.formHasErrors()) return
				this.$validator.validate().then(result => {
                    if (result){
						this.busy = true
						if (this.edit) {
							// Object.assign(this.desserts[this.editedIndex], this.editedItem)
							console.log('edit', this.editedItem)

							axios.put('/api/sub-category', this.subCategory)
								.then(
									(response) => {
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

							axios.post('/api/sub-category', this.subCategory)
								.then(
									(response) => {
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
						this.busy = false
						this.edit = false
					}
				})
				
			},
			onFilePicked(e) {
				const files = e.target.files;
				if (files[0] !== undefined) {
					this.imageName = files[0].name;
					if (this.imageName.lastIndexOf(".") <= 0) {
						return;
					}
					const fr = new FileReader();
					fr.readAsDataURL(files[0]);
					fr.addEventListener("load", () => {
						this.imgInput = fr.result
						this.imageFile = files[0] // this is an image file that can be sent to server...
						this.subCategory.image = this.imgInput
						//console.log(this.imgInput, this.imageFile)
					});
				} else {
					this.imageName = "";
					this.imageFile = "";
					this.imgInput = "";
				}
			},
			fetchAll() {
				this.busy = true
				axios.get(`/api/sub-categories`)
				.then(response => {
					this.subCategories = response.data.data
					console.log(response.data.data)
					this.busy = false
				})
				.catch(error => {
					if (error.response) {
						console.log(error.response)
					}
				})
			},
			erase() {
				this.dialogConfirmDelete = false
				this.busy = true
				axios.delete(`/api/sub-category/${this.subCategory.id}`)
				.then(response => {
					this.busy = false
					this.fetchAll()
				})
				.catch(error => {
					if (error.response) {
						console.log(error.response)
					}
				})
			},
			addNew(){
				this.subCategory = {active: true}
				this.imgInput = ``
				this.selectedCategory = null
				this.dialogInput = true
				this.edit = false
			},
			onSelectCategory(selectedOption, id){
                if(selectedOption){
					this.subCategory.category_id = selectedOption.id
				}
			},
			fetchCategories() {
				this.busy = true
				axios.get(`/api/categories`)
				.then(response => {
					this.categories = response.data.data
					console.log(response.data.data)
					this.busy = false
				})
				.catch(error => {
					if (error.response) {
						console.log(error.response)
					}
				})
			},
		}
	}
</script>