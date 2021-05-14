import VueRouter from 'vue-router'

// Pages
import Home from './pages/home'
import About from './pages/about'
import Register from './pages/register'
import Login from './pages/login'
import Dashboard from './pages/user/dashboard'
import AdminDashboard from './pages/admin/dashboard'
import AdminUsers from './pages/admin/users'
import AdminSchools from './pages/admin/schools'
import AdminStudents from './pages/admin/students'

// Routes
const routes = [
  {
    path: '/',
    name: 'home',
    component: Home,
    meta: {
      auth: undefined
    }
  },
  {
    path: '/about',
    name: 'about',
    component: About,
    meta: {
      auth: undefined
    }
  },
  {
    path: '/register',
    name: 'register',
    component: Register,
    meta: {
      auth: false
    }
  },
  {
    path: '/login',
    name: 'login',
    component: Login,
    meta: {
      auth: false
    }
  },
  // USER ROUTES
  {
    path: '/dashboard',
    name: 'dashboard',
    component: Dashboard,
    meta: {
      auth: true
    }
  },
  // ADMIN ROUTES
  {
    path: '/admin',
    name: 'admin.dashboard',
    component: AdminDashboard,
    meta: {
      auth: {
        roles: 'admin', 
        redirect: {
          name: 'login'
        }, 
        forbiddenRedirect: '/403'
      }
    },
  },
  {
    path: '/admin/users',
    name: 'admin.users',
    component: AdminUsers,
    meta: {
      auth: {
        roles: 'admin', 
        redirect: {
          name: 'login'
        }, 
        forbiddenRedirect: '/403'
      }
    },
  },
  {
    path: '/admin/schools',
    name: 'admin.schools',
    component: AdminSchools,
    meta: {
      auth: {
        roles: 'admin', 
        redirect: {
          name: 'login'
        }, 
        forbiddenRedirect: '/403'
      }
    },
  },
  {
    path: '/admin/students',
    name: 'admin.students',
    component: AdminStudents,
    meta: {
      auth: {
        roles: 'admin', 
        redirect: {
          name: 'login'
        }, 
        forbiddenRedirect: '/403'
      }
    }
  },
]

const router = new VueRouter({
  history: true,
  mode: 'history',
  routes,
})
export default router
