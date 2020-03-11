import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { TeamSearchPage } from './team-search.page';

const routes: Routes = [
  {
    path: '',
    component: TeamSearchPage
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class TeamSearchPageRoutingModule { }
