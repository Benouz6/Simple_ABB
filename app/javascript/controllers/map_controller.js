import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  // static targets = ['markers']
  static values = {
    apiKey:
      "pk.eyJ1IjoiYmVub3V6NiIsImEiOiJjbGFqc3Uza28wMm5oM3ZvMjc0cGUxb3U2In0.ZOQyVdqUGXOvZ1crEz-L1w",
    markers: Array,
  };

  connect() {

    console.log(this.markersValue);
    console.log('wello');

    mapboxgl.accessToken =
    "pk.eyJ1IjoiYmVub3V6NiIsImEiOiJjbGFqc3Uza28wMm5oM3ZvMjc0cGUxb3U2In0.ZOQyVdqUGXOvZ1crEz-L1w";

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
    });

    this.#addMarkersToMap();
    this.#fitMapToMarkers();

  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)

      // Create a HTML element for your custom marker
      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html

      // Pass the element as an argument to the new marker
      new mapboxgl.Marker(customMarker)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map)
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
    console.log(this.markersValue);
  }
}
