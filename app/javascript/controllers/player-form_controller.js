// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"
const DEFAULT_POINTS = 500;
let MAX_POINTS = 2000;
const TOTAL_POINTS = DEFAULT_POINTS+MAX_POINTS;
export default class extends Controller {
    static targets = [ "attack_output", "defense_output", "power_output", "charisma_output", "spirit_output", "used_points", "submitButton", "alertPoints" ]
  connect() {
    console.log('player')
  }

  usePoint(e) {
      console.log(e.target)
    
      if (this.sumPoints() > TOTAL_POINTS) {
          console.log('error')
          this.used_pointsTarget.classList.remove('text-success')
          this.used_pointsTarget.classList.add('text-danger')

      } else {
          console.log('OK')
          this.used_pointsTarget.classList.remove('text-danger')
          this.used_pointsTarget.classList.add('text-success')
      }
      this.used_pointsTarget.textContent = `${TOTAL_POINTS - this.sumPoints()}`
      
  }
  range(e) {
    switch(e.target.id) {
        case 'player_attack':
            this.attack_outputTarget.textContent = `${e.target.value}`
          break;
        case 'player_defense':
            this.defense_outputTarget.textContent = `${e.target.value}`
            break;
        case 'player_power':
            this.power_outputTarget.textContent = `${e.target.value}`
            break;
        case 'player_charisma':
            this.charisma_outputTarget.textContent = `${e.target.value}`
            break;
        case 'player_spirit':
            this.spirit_outputTarget.textContent = `${e.target.value}`
            break;
        default:
          // code block
      }  
      if (this.sumPoints() > TOTAL_POINTS) {
          // EXCESO DE PUNTOS UTILIZADOS
          this.used_pointsTarget.classList.remove('text-success')
          this.used_pointsTarget.classList.add('text-danger')

      } else {
          // PUNTOS FALTAN
          this.used_pointsTarget.classList.remove('text-danger')
          this.used_pointsTarget.classList.add('text-success')
      }
      this.used_pointsTarget.textContent = `${TOTAL_POINTS - this.sumPoints()}`
      if (TOTAL_POINTS - this.sumPoints() === 0) {
        this.submitButtonTarget.disabled = false;
      } else {
        this.submitButtonTarget.disabled = true;
      }
  }

  sumPoints() {
    const total_points = parseInt(this.attack_outputTarget.textContent) + 
        parseInt(this.defense_outputTarget.textContent) + 
        parseInt(this.power_outputTarget.textContent)  + 
        parseInt(this.charisma_outputTarget.textContent) + 
        parseInt(this.spirit_outputTarget.textContent);
    return total_points;
  }
}
