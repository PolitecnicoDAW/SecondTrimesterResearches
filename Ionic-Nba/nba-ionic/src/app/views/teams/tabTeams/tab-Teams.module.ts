import { IonicModule } from '@ionic/angular';
import { RouterModule } from '@angular/router';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { TabTeamsPage } from './tab-Teams.page';
import { TeamSearchPageModule } from '../team-search/team-search.module';

@NgModule({
  imports: [
    IonicModule,
    CommonModule,
    FormsModule,
    RouterModule.forChild([{ path: '', component: TabTeamsPage }]),
    TeamSearchPageModule
  ],
  declarations: [TabTeamsPage]
})
export class TabTeamsPageModule { }
