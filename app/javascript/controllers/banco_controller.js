import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="banco"
export default class extends Controller {

  connect() {
  }
  click(e){
    let creador_submit = document.getElementById('submit_creador')
    if (creador_submit.innerHTML === 'Crear proveedor y Banco') {
      creador_submit.innerHTML = 'Crear solo Banco'
    } else {
      creador_submit.innerHTML = 'Crear proveedor y Banco'
    }
  }

}
