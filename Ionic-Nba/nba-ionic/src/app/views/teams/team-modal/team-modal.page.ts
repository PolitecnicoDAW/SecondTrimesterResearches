import { Component, Input } from '@angular/core';
import { Team } from 'src/app/shared/models/team.model';
import { ModalController } from '@ionic/angular';

@Component({
  selector: 'app-team-modal',
  templateUrl: './team-modal.page.html',
  styleUrls: ['./team-modal.page.scss'],
})
export class TeamModalPage {

  @Input() team: Team;

  constructor(private modalController: ModalController) { }

  exit() {
    this.modalController.dismiss();
  }

}
