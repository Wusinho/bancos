import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="banco"
export default class extends Controller {

  connect() {
  }
  click(e){
    let provider_submit = document.getElementById('submit_creador')
    if (provider_submit.innerHTML === 'Crear proveedor y Banco') {
      provider_submit.innerHTML = 'Crear solo Banco'
    } else {
      provider_submit.innerHTML = 'Crear proveedor y Banco'
    }
  }

}
