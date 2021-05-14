<template>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <router-link :to="{name: 'home'}" class="navbar-brand">Administrador de escuelas</router-link>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto" v-if="$auth.check('user', 'role')">
          <li class="nav-item" v-for="(route, key) in routes.user" v-bind:key="route.path">
            <router-link :to="{ name : route.path }" :key="key" class="nav-link">{{route.name}}</router-link>
          </li>
      </ul>
      <ul class="navbar-nav mr-auto" v-if="$auth.check('admin', 'role')">
		<template v-for="route in routes.admin">
          <li class="nav-item" v-if="typeof route.subroutes === 'undefined'" :key="'route-${route.name}'">
            <router-link :to="{ name : route.path }" class="nav-link">{{route.name}}</router-link>
          </li>
          <li class="nav-item dropdown" v-else>
            <a href="#" class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                {{route.name}}
            </a>
			<div class="dropdown-menu" aria-labelledby="navbarDropdown">
			  <template v-for="subroute in route.subroutes">
                <router-link class="dropdown-item" :to="{ name : subroute.path }" :key="'subroute-' + subroute.path">
                  {{subroute.name}}
                </router-link>
			  </template>
			</div>
          </li>
		</template>
      </ul>
      <ul class="navbar-nav mr-auto">
          <li class="nav-item" v-for="(route, key) in routes.global" v-bind:key="route.path">
            <router-link :to="{ name : route.path }" :key="key" class="nav-link">{{route.name}}</router-link>
          </li>
      </ul>
      <ul class="navbar-nav ml-auto" v-if="!$auth.check()">
          <li class="nav-item" v-for="(route, key) in routes.unlogged" v-bind:key="route.path">
            <router-link :to="{ name : route.path }" :key="key" class="nav-link">{{route.name}}</router-link>
          </li>
      </ul>
      <ul class="navbar-nav ml-auto" v-if="$auth.check()">
        <li class="nav-item">
          <a class="nav-link" href="#" @click.prevent="$auth.logout()">Logout</a>
        </li>
      </ul>
    </div>
  </nav>
</template>
<script>
  export default {
    data() {
      return {
        routes: {
          // UNLOGGED
          unlogged: [
            { name: 'Registro', path: 'register' },
            { name: 'Login', path: 'login'}
          ],
          global: [
            { name: 'Acerca', path: 'about' }
          ],
          // LOGGED USER
          user: [
            { name: 'Dashboard', path: 'dashboard' }
          ],
          // LOGGED ADMIN
          admin: [
            { name: 'Dashboard', path: 'admin.dashboard' },
            { name: 'Administración', subroutes: [
				{ name: 'Usuarios', path: 'admin.users' },
				{ name: 'Escuelas', path: 'admin.schools' },
				{ name: 'Alumnos', path: 'admin.students' }
            ]}
          ]
        }
      }
    },
    mounted() {
      //
    }
  }
</script>
<style>
.navbar {
  margin-bottom: 30px;
}
</style>
