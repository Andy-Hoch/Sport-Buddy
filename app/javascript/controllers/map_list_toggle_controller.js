import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map-list-toggle"
export default class extends Controller {
  static targets = ["list", "map", "button"]

  connect() {
    console.log("Hello from toggle_controller.js");
    console.log(this.listTarget);
    console.log(this.mapTarget);
    console.log(this.buttonTarget);
  }

  fire(event) {
    const currentPage = event.currentTarget.dataset.page;
    this.listTarget.classList.toggle("d-none");
    this.mapTarget.classList.toggle("d-none");
    if (currentPage == 'list') {
      this.buttonTarget.innerHTML = '<i class="fas fa-list-ul"></i> Show List';
      this.buttonTarget.dataset.page = 'map';
    } else {
      this.buttonTarget.innerHTML = '<i class="far fa-map"></i> Show Map';
      this.buttonTarget.dataset.page = 'list';
    }
  }
}
