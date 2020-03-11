import { Component, OnInit, Input } from '@angular/core';
import { Player } from 'src/app/shared/models/player.model';

@Component({
  selector: 'app-card-player',
  templateUrl: './card-player.component.html',
  styleUrls: ['./card-player.component.scss'],
})
export class CardPlayerComponent implements OnInit {

  @Input() player: Player;

  constructor() { }

  ngOnInit() { }


}
