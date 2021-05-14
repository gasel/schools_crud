<template>
    <div class="container">
        <div class="row mt-5">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Tabla de alumnos</h3>

                <div class="card-tools">
                    <button class="btn btn-success" data-toggle="modal" data-target="#addNew" @click="openModalWindow">Añadir alumno <i class="fas fa-user-plus fa-fw"></i></button>
                </div>
              </div>
             
              <div class="card-body table-responsive p-0">
                <table class="table table-hover">
                  <tbody>
                    <tr>
                        <th>ID</th>
                        <th>Nonmbre</th>
                        <th>Apellidos</th>
                        <th>Fecha de nacimiento</th>
                        <th>Localidad</th>
                        <th>Escuela</th>
                        <th>Creado en</th>
                        <th>Modificar</th>
                  </tr> 

                  <tr v-for="student in students.data" :key="student.id">
                    <td>{{ student.id }}</td>
                    <td>{{ student.name }}</td>
                    <td>{{ student.surname }}</td>
                    <td>{{ student.birthdate | formatDate}}</td>
                    <td>{{ student.city }}</td>
                    <td>{{ student.school.name}}</td>
                    <td>{{ student.created_at | formatDate}}</td>

                    <td>
                        <a href="#" data-id="student.id" @click="editModalWindow(student)">
                            <i class="fa fa-edit blue"></i>
                        </a>
                        |
                        <a href="#" @click="deleteStudent(student.id)">
                            <i class="fa fa-trash red"></i>
                        </a>

                    </td>
                  </tr>
                </tbody></table>
                <pagination :data="students" @pagination-change-page="loadStudents">
                    <span slot="prev-nav">&lt; Previous</span>
                    <span slot="next-nav">Next &gt;</span>
                </pagination>
              </div>

              <div class="card-footer">
                 
              </div>
            </div>
           
          </div>
        </div>


            <div class="modal fade" id="addNew" tabindex="-1" role="dialog" aria-labelledby="addNewLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                <div class="modal-header">

                    <h5 v-show="!editMode" class="modal-title" id="addNewLabel">Añadir nuevo alumno</h5>
                    <h5 v-show="editMode" class="modal-title" id="addNewLabel">Actualizar alumno</h5>

                    <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                    <span aria-hidden="true">&times;</span>
                    </button>
                </div>

<form @submit.prevent="editMode ? updateStudent() : createStudent()">
<input type="hidden" v-model="form._method" name="_method" value="PUT">
<div class="modal-body">
    <div class="form-group">
        <input v-model="form.name" type="text" name="name"
            placeholder="Nombre"
            class="form-control" :class="{ 'is-invalid': form.errors.has('name') }">
        <has-error :form="form" field="name"></has-error>
    </div>

    <div class="form-group">
        <input v-model="form.surname" type="text" name="surname"
            placeholder="Apellidos"
            class="form-control" :class="{ 'is-invalid': form.errors.has('surname') }">
        <has-error :form="form" field="surname"></has-error>
    </div>

    <div class="form-group">
        <datepicker v-model="form.birthdate" :bootstrap-styling=true name="birthdate"
            placeholder="Fecha de nacimiento"
            :format="customFormatter" :language="es"
            :class="{ 'is-invalid': form.errors.has('birthdate') }"></datepicker>
        <has-error :form="form" field="birthdate"></has-error>
    </div>

    <div class="form-group">
        <input v-model="form.city" type="text" name="city"
            placeholder="Localidad"
            class="form-control" :class="{ 'is-invalid': form.errors.has('city') }">
        <has-error :form="form" field="city"></has-error>
    </div>
    
    <div class="form-group">
        <select name="type" v-model="form.school.id" id="type" class="form-control" :class="{ 'is-invalid': form.errors.has('school.id') }">
            <option value="">Escoje una escuela</option>
            <option v-for="school in schools" :key="school.id" :value="school.id">{{school.name}}</option>
        </select>
        <has-error :form="form" field="school.id"></has-error>
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
	import Datepicker from 'vuejs-datepicker';
	import { es } from 'vuejs-datepicker/dist/locale'
    export default {
		beforeCreate() {
			this.datepicker = Datepicker
		},
		components: {
			Datepicker
		},
        data() {
            return {
                es: es,
                editMode: false,
                students: {},
                schools: {},
                pagenumber: 1,
                form: new Form({
                    _method: 'POST',
                    id: '',
                    name : '',
                    surname : '',
                    birthdate : '',
                    city: '',
                    school: {
						id: '',
						name: ''
                    }

                })
            }
        },
        methods: {

		customFormatter(date) {
			return this.$options.filters.formatDate(date); // moment(date).format('MMMM Do YYYY, h:mm:ss a');
		},
        editModalWindow(student){
           this.form.clear();
           this.editMode = true
           this.form.reset();
           $('#addNew').modal('show');
           this.form.fill(student);
           this.form._method = 'PUT';
        },
        updateStudent(){
           this.form.put('admin/students/'+this.form.id)
               .then(()=>{

                   Toast.fire({
                      icon: 'success',
                      title: 'El alumno se ha actualizado correctamente'
                   })

                   Fire.$emit('AfterCreatedStudentLoadIt');

                   $('#addNew').modal('hide');
               })
               .catch(()=>{
                   console.log("Error.....")
               })
        },
        openModalWindow(){
           this.editMode = false
           this.form.reset();
           $('#addNew').modal('show');
           this.form._method = 'POST';
        },

		// Pagination
        loadStudents(page = 1) { // pick data from controller and push it into students object

			axios.get("admin/students"+'?page='+page).then( data => ( this.students = data.data));
			this.pagenumber = page;

        },
        loadSchools() { // pick data from controller and push it into schools object

			axios.get("admin/schools/all").then( data => { this.schools = data.data});

        },

        createStudent(){

            this.$Progress.start()

            this.form.post('admin/students')
                .then(() => {
                   
                    Fire.$emit('AfterCreatedStudentLoadIt'); // custom events

                        Toast.fire({
                          icon: 'success',
                          title: 'Alumno creado correctamente'
                        })

                        this.$Progress.finish()

                        $('#addNew').modal('hide');

                })
                .catch((err) => {
                    console.log("Error......", err)
                    this.$Progress.finish()
					/*Toast.fire({
					  icon: 'warning',
					  title: 'Ha habido un error al crear el alumno'
					})*/
                })

          },
          deleteStudent(id) {
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
                this.form.delete('admin/students/'+id)
                    .then((response)=> {
                            Swal.fire(
                              'Eliminada!',
                              'Alumno borrado correctamente',
                              'success'
                            )
                    this.loadStudents(this.pagenumber);

                    }).catch(() => {
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
            this.loadStudents(1);
            this.loadSchools();

            let refThis = this;
            Fire.$on('AfterCreatedStudentLoadIt',()=>{ // custom events fire on
                refThis.loadStudents(refThis.pagenumber);
            });

        }
    }
</script>
