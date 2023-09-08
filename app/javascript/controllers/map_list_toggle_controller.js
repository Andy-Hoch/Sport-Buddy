import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="map-list-toggle"
export default class extends Controller {
  static targets = ["list", "map", "button"];

  fire(event) {
    const currentPage = event.currentTarget.dataset.page;
    this.listTarget.classList.toggle("technically-gone");
    this.mapTarget.classList.toggle("technically-gone");
    if (currentPage == "list") {
      this.buttonTarget.innerHTML = '<span class="btn-text-white"><i class="fas fa-list-ul"></i> Show List</span>';
      this.buttonTarget.dataset.page = "map";
    } else {
      this.buttonTarget.innerHTML = '<span class="btn-text-white"><i class="far fa-map"></i> Show Map</span>';
      this.buttonTarget.dataset.page = "list";
    }
  }
}
