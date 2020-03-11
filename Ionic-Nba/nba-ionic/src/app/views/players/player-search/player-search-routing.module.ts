import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { PlayerSearchPage } from './player-search.page';

const routes: Routes = [
  {
    path: '',
    component: PlayerSearchPage
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class PlayerSearchPageRoutingModule { }
