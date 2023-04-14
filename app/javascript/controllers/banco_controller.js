import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="banco"
export default class extends Controller {

  connect() {
  }
  click(e){
    const checkbox = e.target.checked
    let provider_submit = document.getElementById('submit_creador')
    if (checkbox) {
      provider_submit.innerHTML = 'Crear solo Banco'
    } else {
      provider_submit.innerHTML = 'Crear proveedor y Banco'
    }
  }

}
