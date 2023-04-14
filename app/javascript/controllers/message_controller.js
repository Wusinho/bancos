import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="message"
export default class extends Controller {
  connect() {
    setTimeout(function() {
      let message = document.getElementById("message")
      message.innerHTML = ''
    } , 3000)
  }

}
