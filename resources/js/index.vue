<template>
    <div id="main">
        <header id="header">
            <Menu></Menu>
        </header>
		<div class="content-wrapper">
			<div class="content">
				<div class="container-fluid">

					<router-view></router-view>

					<vue-progress-bar></vue-progress-bar>

				</div>
			</div>
		</div>
    </div>
</template>
<script>
  import Menu from './components/menu.vue'
  export default {
    data() {
      return {
        //
      }
    },
    components: {
      Menu
    }
  }
</script>
