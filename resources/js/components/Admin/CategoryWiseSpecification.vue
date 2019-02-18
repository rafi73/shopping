<template>
	<v-layout row>
		<v-flex xs12 class="m-3 px-3">
			<v-card>
				<v-card-title class="grey lighten-4">
					<v-icon class="pr-2">
						{{ $route.meta.icon }}
					</v-icon> 
					<h3 class="headline mb-0">{{ $route.meta.name }}</h3>
				</v-card-title>
				<v-spacer></v-spacer>
			</v-card>
			<v-card-text>
				<v-container grid-list-md>
					<v-layout wrap>
						<v-flex xs12 sm8 offset-sm2 lg8 offset-lg2>
							<v-card>
							<multiselect v-model="selectedCategory" :options="categories" @select="onSelectCategory" track-by="id" label="name"
							 placeholder="Select Category" selectLabel="" deselectLabel="" selectedLabel="" v-validate="'required'" name="category"
							 data-vv-as="category">
							</multiselect>
							</v-card>
						</v-flex>
					</v-layout>
				</v-container>

				<v-container grid-list-md>
					<v-layout wrap>
						<v-flex xs12 sm8 offset-sm2 lg8 offset-lg2>
							<v-data-table v-model="selected" :headers="headers" :items="specifications" select-all item-key="name" class="elevation-1">
								<template slot="headers" slot-scope="props">
									<tr>
										<th>
											<v-checkbox :input-value="props.all" :indeterminate="props.indeterminate" primary hide-details @click.native="toggleAll()"></v-checkbox>
										</th>
										<th v-for="header in props.headers" :key="header.text" :class="['column sortable', pagination.descending ? 'desc' : 'asc', header.value === pagination.sortBy ? 'active' : '']"
										 @click="changeSort(header.value)">
											<v-icon small>arrow_upward</v-icon>
											{{ header.text }}
										</th>
									</tr>
								</template>
								<template slot="items" slot-scope="props">
									<tr :active="props.selected" @click="props.selected = !props.selected">
										<td>
											<v-checkbox :input-value="props.selected" primary hide-details></v-checkbox>
										</td>
										<td>{{ props.item.name }}</td>
										<td class="text-xs-right">{{ props.item.description }}</td>
									</tr>
								</template>
							</v-data-table>
							<v-btn slot="activator" color="primary" @click.prevent="save()" dark class="mb-2">Save</v-btn>
						</v-flex>
					</v-layout>
				</v-container>
			</v-card-text>
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
				specification: {},
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
						text: 'Description',
						value: 'description'
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
				specifications: [],
				dialogConfirmDelete: false,
				edit: false,
				dialogInput: false,
				selectedCategory: null,
				categories: [],
				pagination: {
					sortBy: 'name'
				},
				selected: [],
				categoryWiseSpecification: {}

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
			this.fetchCategories()
		},
		methods: {
			pickFile() {
				this.$refs.image.click();
			},
			editItem(item) {
				this.specification = Object.assign({}, item)
				this.dialogInput = true
				this.edit = true
			},
			deleteItem(item) {
				this.dialogConfirmDelete = true
				this.specification = item
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
					if (result) {
						this.busy = true
						if (this.edit) {
							console.log('edit', this.editedItem)
							this.specification.updated_by = this.$store.state.currentUser.id

							axios.put('/api/category-wise-specification', this.specification)
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
							console.log('save', this.editedItem)
							this.specification.created_by = this.$store.state.currentUser.id
							this.specification.updated_by = this.$store.state.currentUser.id

							let temp = []
							this.selected.forEach(element => {
								temp.push({
									'category_id': this.specification.category_id,
									'specification_id': element.id,
									'created_by': 0,
									'updated_by': 0
								})
							})

							this.categoryWiseSpecification.data = temp
							axios.post('/api/category-wise-specification', this.categoryWiseSpecification)
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
						this.specification.image = this.imgInput
						//console.log(this.imgInput, this.imageFile)
					});
				} else {
					this.imageName = "";
					this.imageFile = "";
					this.imgInput = "";
				}
			},
			erase() {
				this.dialogConfirmDelete = false
				this.busy = true
				axios.delete(`/api/specification/${this.specification.id}`)
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
			addNew() {
				this.specification = { active: true }
				this.imgInput = ``
				this.selectedCategory = null
				this.dialogInput = true
				this.edit = false
			},
			onSelectCategory(selectedOption, id) {
				if (selectedOption) {
					this.specification.category_id = selectedOption.id
					this.fetchSpecification(selectedOption.id)
					this.selected = []
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
			fetchSpecification(categoryId) {
				//this.busy = true
				axios.get(`/api/category-wise-specification-joint/${categoryId}/category`)
					.then(response => {
						this.specifications = response.data.data

						this.specifications.forEach(element => {
							if (element.checked)
								this.selected.push(element)
						})
						console.log(response.data.data)
						//this.busy = false
					})
					.catch(error => {
						if (error.response) {
							console.log(error.response)
						}
					})
			},
			toggleAll() {
				if (this.selected.length) this.selected = []
				else this.selected = this.specifications.slice()
			},
			changeSort(column) {
				if (this.pagination.sortBy === column) {
					this.pagination.descending = !this.pagination.descending
				} else {
					this.pagination.sortBy = column
					this.pagination.descending = false
				}
			}
		}
	}
</script>