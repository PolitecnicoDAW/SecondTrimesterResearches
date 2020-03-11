import { Component, Input } from '@angular/core';
import { ModalController } from '@ionic/angular';
import { Player } from "../../../shared/models/player.model";

@Component({
  selector: 'app-player-modal',
  templateUrl: './player-modal.page.html',
  styleUrls: ['./player-modal.page.scss'],
})
export class PlayerModalPage {

  @Input() player: Player;

  constructor(private modalController: ModalController) { }



  exit() {
    this.modalController.dismiss();
  }

}
