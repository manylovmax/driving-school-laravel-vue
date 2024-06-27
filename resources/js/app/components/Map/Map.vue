<template>
  <div>
    <map-loader
      :map-config="mapConfig"
      :api-key="API_KEY">
      <template slot-scope="scopeProps"> <!-- slot-scope -->
        <child-marker
          v-for="(marker,i) in markers"
          :key="i"
          :position="marker"
          :google="scopeProps.google"
          :map="scopeProps.map"
        />
      </template>
    </map-loader>
  </div>
</template>

<script>
import MapLoader from './MapLoader.vue';
import ChildMarker from './ChildMarker';
import C from './constants';

export default {
	components: {
		MapLoader,
		ChildMarker
	},
	props: {
		markers: Array
	},
	data(){
		return {
			API_KEY: C.API_KEY,
			mapConfig: {
				zoom: 12,
				center: this.markers[0]
			}
		};
	},
};
</script>
