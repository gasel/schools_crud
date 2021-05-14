<template>
    <div class="container">
        <div class="row mt-5">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Tabla de escuelas</h3>

                <div class="card-tools">
                    <button class="btn btn-success" data-toggle="modal" data-target="#addNew" @click="openModalWindow">Añadir escuela <i class="fas fa-school fa-fw"></i></button>
                </div>
              </div>
             
              <div class="card-body table-responsive p-0">
                <table class="table table-hover">
                  <tbody>
                    <tr>
                        <th>ID</th>
                        <th>Nonmbre</th>
                        <th>Dirección</th>
                        <th>Logo</th>
                        <th>Email</th>
                        <th>Teléfono</th>
                        <th>Web</th>
                        <th>Creado en</th>
                        <th>Modificar</th>
                  </tr> 

                  <tr v-for="school in schools.data" :key="school.id">
                    <td>{{ school.id }}</td>
                    <td>{{ school.name }}</td>
                    <td>{{ school.address }}</td>
                    <td>
						<button type="button" class="btn bg-transparent p-0" data-toggle="modal" data-target="#highres1">
							<img :src="getLogoURL(school.logo)" class="img-thumbnail" @click="zoom(school.logo)">
						</button>
                    </td>
                    <td>{{ school.email }}</td>
                    <td>{{ school.phone}}</td>
                    <td>{{ school.website}}</td>
                    <td>{{ school.created_at | formatDate}}</td>

                    <td>
                        <a href="#" data-id="school.id" @click="editModalWindow(school)">
                            <i class="fa fa-edit blue"></i>
                        </a>
                        |
                        <a href="#" @click="deleteSchool(school.id)">
                            <i class="fa fa-trash red"></i>
                        </a>

                    </td>
                  </tr>
                </tbody></table>
                <pagination :data="schools" @pagination-change-page="loadSchools">
                    <span slot="prev-nav">&lt; Previous</span>
                    <span slot="next-nav">Next &gt;</span>
                </pagination>
              </div>
            
              <div class="card-footer">
                 
              </div>
            </div>
           
          </div>
        </div>


		<div id="highres1" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<img class="img-responsive w-100 h-100" :src="getZoomLogoURL()">
				</div>
			</div>
		</div>

		<div class="modal fade" id="addNew" tabindex="-1" role="dialog" aria-labelledby="addNewLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
			<div class="modal-header">

				<h5 v-show="!editMode" class="modal-title" id="addNewLabel">Añadir nueva escuela</h5>
				<h5 v-show="editMode" class="modal-title" id="addNewLabel">Actualizar escuela</h5>

				<button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
				<span aria-hidden="true">&times;</span>
				</button>
			</div>

<form @submit.prevent="editMode ? updateSchool() : createSchool()">
<input type="hidden" name="_method" value="PUT">
<div class="modal-body">
    <div class="form-group">
        <input v-model="form.name" type="text" name="name"
            placeholder="Nombre"
            class="form-control" :class="{ 'is-invalid': form.errors.has('name') }">
        <has-error :form="form" field="name"></has-error>
    </div>

    <div class="form-group">
        <input v-model="form.address" type="text" name="address"
            placeholder="Dirección"
            class="form-control" :class="{ 'is-invalid': form.errors.has('address') }">
        <has-error :form="form" field="address"></has-error>
    </div>

	<div class="form-group row">
	  <input type="hidden" name="logo" v-model="form.logo"> 
	  <label for="logo_input" class="col-sm-2 col-form-label">Logo</label>
	  <div class="col-sm-10">
		<input type="file" id="logo_input" ref="fileupload" @change='uploadLogo' name="logo_input"
		    placeholder="Logotipo"
		    class="form-control" :class="{ 'is-invalid': form.errors.has('logo') }">
		<has-error :form="form" field="logo"></has-error> 
	  </div>
	</div>
	<div class="form-group row justify-content-center">
	  <div class="col-sm-12">
		<div v-show="logoLoaded || editMode" class="card card-primary card-outline">
		  <div class="card-body box-profile">
			<div class="text-center">
			  <img class="img-fluid" :src="getLogo()" alt="Logo vista previa">
			</div>
		  </div>
		</div>
	  </div>
	</div>

    <div class="form-group">
        <input v-model="form.email" type="email" name="email"
            placeholder="E-mail"
            class="form-control" :class="{ 'is-invalid': form.errors.has('email') }">
        <has-error :form="form" field="email"></has-error>
    </div>
    
    <div class="form-group">
        <input v-model="form.phone" type="text" name="phone"
            placeholder="Teléfono"
            class="form-control" :class="{ 'is-invalid': form.errors.has('phone') }">
        <has-error :form="form" field="phone"></has-error>
    </div>

    <div class="form-group">
        <input v-model="form.website" type="text" name="website"
            placeholder="Página web"
            class="form-control" :class="{ 'is-invalid': form.errors.has('website') }">
        <has-error :form="form" field="website"></has-error>
    </div>

</div>
<div class="modal-footer">
    <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
    <button v-show="editMode" type="submit" class="btn btn-primary">Actualizar</button>
    <button v-show="!editMode" type="submit" class="btn btn-primary">Crear</button>
</div>

</form>

			</div>
		</div>
		</div>
    </div>

</template>

<script>
    export default {
        data() {
            return {
                selectedLogo: null,
                editMode: false,
                logoLoaded: false,
                schools: {},
                logo_image: '',
                pagenumber: 1,
                form: new Form({
                    _method: 'POST',
                    id: '',
                    name : '',
                    address : '',
                    logo : '',
                    logo_name : '',
                    email: '',
                    phone: '',
                    website: ''

                })
            }
        },
        methods: {
        
        zoom(url) {
			this.selectedLogo = url;
        },
        
        getLogoURL(url) {
			return "/storage/school_logos/" + url;
        },
        getZoomLogoURL() {
			return "/storage/school_logos/" + this.selectedLogo;
        },
        
		uploadLogo(e){
			let fileInput = e.target.files[0];
			let reader = new FileReader();  

			if (fileInput['size'] < 2111775) {

				this.form.logo = fileInput;
				let auxThis = this;
				reader.onloadend = (file) => {
					auxThis.logo_image = reader.result;
					auxThis.logoLoaded = true;
					auxThis.form.logo_name = '';
				}
				reader.readAsDataURL(fileInput);
				
			} else {
				// alert('El tamaño del fichero no puede ser mayor de 2 megas.')
				Swal.fire({
				  icon: 'error',
				  title: 'Oops...',
				  text: 'El tamaño del fichero no puede ser mayor de 2 megas'
				})
			}
		},
		
		// For getting instant uploaded logo
		getLogo() {
			let logo = (!this.editMode || (this.editMode && this.logoLoaded)) ? this.logo_image : "/storage/school_logos/" + this.form.logo_name;
			return logo;
		},

        editModalWindow(school){
           this.form.clear();
           this.editMode = true;
           this.logoLoaded = false;
           this.$refs.fileupload.value = null;
           this.form.reset();
           $('#addNew').modal('show');
           this.form.fill(school);
           this.form.logo_name = school.logo;
           this.form._method = 'PUT';
        },
        updateSchool(){
           this.form.post('admin/schools/'+this.form.id, {

               // Transform form data to FormData
               transformRequest: [function (data, headers) {
                   return objectToFormData(data)
               }]
           })
               .then(()=>{

                   Toast.fire({
                      icon: 'success',
                      title: 'La escuela se ha actualizado correctamente'
                   })

                   Fire.$emit('AfterCreatedSchoolLoadIt');

                   $('#addNew').modal('hide');
               })
               .catch((err)=>{
                   // console.log("Error.....")
					Swal.fire({
					  icon: 'error',
					  title: 'Oops...',
					  text: 'Algo ha ido mal!',
					  footer: '<a href>Porqué pasa esto?</a>'
					})
               })
        },
        openModalWindow(){
           this.form.clear();
           this.editMode = false;
           this.logoLoaded = false;
           this.$refs.fileupload.value = null;
           this.form.reset();
           $('#addNew').modal('show');
           this.form._method = 'POST';
        },

        // Pagination
        loadSchools(page = 1) { // pick data from controller and push it into schools object

			axios.get("admin/schools"+'?page='+page).then( data => (this.schools = data.data));
			this.pagenumber = page;

        },

        createSchool(){

            this.$Progress.start()

            this.form.post('admin/schools', {

               // Transform form data to FormData
               transformRequest: [function (data, headers) {
                   return objectToFormData(data)
               }]
            })
                .then(() => {
                   
                    Fire.$emit('AfterCreatedSchoolLoadIt'); // custom events

                        Toast.fire({
                          icon: 'success',
                          title: 'Escuela creada correctamente'
                        })

                        this.$Progress.finish();

                        $('#addNew').modal('hide');

                })
                .catch((err) => {
                    this.$Progress.finish();
                    // console.log("Error......", err)
					Swal.fire({
					  icon: 'error',
					  title: 'Oops...',
					  text: 'Algo ha ido mal!',
					  footer: '<a href>Porqué pasa esto?</a>'
					})
                })
     
          },
          deleteSchool(id) {
            Swal.fire({
              title: 'Está seguro?',
              text: "No será posible revertir los cambios!",
              icon: 'warning',
              showCancelButton: true,
              confirmButtonColor: '#3085d6',
              cancelButtonColor: '#d33',
              confirmButtonText: 'Si, bórralo!',
              cancelButtonText: 'Cancelar!'
            }).then((result) => {
                
              if (result.value) {
                //Send Request to server
                this.form.delete('admin/schools/'+id)
                    .then((response)=> {
                            Swal.fire(
                              'Eliminada!',
                              'Escuela borrada correctamente',
                              'success'
                            )
                    this.loadSchools(this.pagenumber);

                    }).catch((err) => {
                        Swal.fire({
                          icon: 'error',
                          title: 'Oops...',
                          text: 'Algo ha ido mal!',
                          footer: '<a href>Porqué pasa esto?</a>'
                        })
                    })
                }

            })
          }
        },

        created() { 
            this.loadSchools(1);

            let refThis = this;
            Fire.$on('AfterCreatedSchoolLoadIt',()=>{ // custom events fire on
                refThis.loadSchools(refThis.pagenumber);
            });

        }
    }
</script>
