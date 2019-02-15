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
												<v-text-field v-validate="'required|max:255'" v-model="category.name" :counter="255" :error-messages="errors.collect('name')" :label="`${$t('category_name')}`" data-vv-name="name" required ></v-text-field>
											</v-flex>
											<v-flex xs12 sm12 md12>
												<v-textarea v-validate="'required|max:255'" v-model="category.description" :counter="255" :error-messages="errors.collect('description')" :label="`${$t('category_description')}`" data-vv-name="description" required ></v-textarea>
											</v-flex>
											<v-flex xs12 sm12 md12>
												<img :src="imgInput" height="150" v-if="imgInput" />
												<v-text-field :label="`${$t('category_image')}`" @click='pickFile' v-model='imageName' prepend-icon='attach_file'></v-text-field>
												<input type="file" style="display: none" ref="image" accept="image/*" @change="onFilePicked">
											</v-flex>
											<v-checkbox :label="`${$t('category_active')}: ${category.active}`" v-model="category.active"></v-checkbox>
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

					<v-data-table :headers="headers" :items="categories" :search="search">
						<template slot="items" slot-scope="props">
							<td>{{ props.item.name }}</td>
							<td>{{ props.item.description }}</td>
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

	export default {
		name: "settings-view",
		components: {
		},
		data() {
			return {
				category: {},
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
				categories: [],
				dialogConfirmDelete: false,
				edit : false,
				dialogInput : false

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
			pickFile() {
				this.$refs.image.click();
			},
			editItem(item) {
				this.category = Object.assign({}, item)
				this.imgInput = this.category.image
				this.dialogInput = true
				this.edit = true
			},
			deleteItem(item) {
				console.log(item)
				this.dialogConfirmDelete = true
				this.category = item
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

							axios.put('/api/category', this.category)
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

							axios.post('/api/category', this.category)
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
						this.category.image = this.imgInput
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
			erase() {
				console.log('erase clicked')
				this.dialogConfirmDelete = false
				this.busy = true
				axios.delete(`/api/category/${this.category.id}`)
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
				this.category = { active: true}
				this.imgInput = ``
				this.dialogInput = true
				this.edit = false
			}
		}
	}
</script>