<!-- MapLoader.vue -->
<template>
  <div>
    <div id="map"/> <!-- point 1 -->
    <template v-if="!!this.google && !!this.map"> <!-- point 2 -->
      <slot
        :google="google"
        :map="map"
      />
    </template>
  </div>
</template>

<script>
import GoogleMapsApiLoader from 'google-maps-api-loader';
import MapProvider from './MapProvider';

export default {
	components: {
		MapProvider
	},
	props:{
		mapConfig: Object,
		apiKey: String
	},
	data(){
		return {
			google: null,
			map: null
		};
	},
	mounted () { // point 3
		GoogleMapsApiLoader({
			apiKey: this.apiKey
		}).then((google) => {
			this.google = google;
			this.initializeMap();
		});
	},
	methods: {
		initializeMap (){
			const mapContainer = this.$el.querySelector('#map'); // point 1
			const { Map } = this.google.maps;
			this.map = new Map(mapContainer, this.mapConfig);
		}
	}
};
</script>

<style scoped>
#map {
  height: 100vh;
  width: 100%;
}
</style>
