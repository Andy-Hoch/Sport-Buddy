import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

// Connects to data-controller="flatpickr"
export default class extends Controller{
  static targets = [ "startTime", "endTime" ]

  connect() {
    flatpickr(this.startTimeTarget, {
      enableTime: true,
      dateFormat: "Y-m-d H:i",
      time_24hr: true,
    })

    flatpickr(this.endTimeTarget, {
      enableTime: true,
      dateFormat: "Y-m-d H:i",
      time_24hr: true,
    })
  }
}
