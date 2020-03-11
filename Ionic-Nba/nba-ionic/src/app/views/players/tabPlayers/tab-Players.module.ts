import { IonicModule } from '@ionic/angular';
import { RouterModule } from '@angular/router';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { TabPlayers } from './tab-Players.page';
import { PlayerSearchPageModule } from '../player-search/player-search.module';

@NgModule({
  imports: [
    IonicModule,
    CommonModule,
    FormsModule,
    RouterModule.forChild([{ path: '', component: TabPlayers }]),
    PlayerSearchPageModule
  ],
  declarations: [TabPlayers]
})
export class TabPlayersPageModule { }
