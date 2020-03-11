import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { TabsPage } from './tabs.page';


const routes: Routes = [
  {
    path: 'tabs',
    component: TabsPage,
    children: [
      {
        path: 'Home',
        children: [
          {
            path: '',
            loadChildren: () =>
              import('../home/tabHome/tab-Home.module').then(m => m.TabHomePageModule)
          }
        ]
      },
      {
        path: 'Players',
        children: [
          {
            path: '',
            loadChildren: () =>
              import('../players/tabPlayers/tab-Players.module').then(m => m.TabPlayersPageModule)
          }
        ]
      },
      {
        path: 'Teams',
        children: [
          {
            path: '',
            loadChildren: () =>
              import('../teams/tabTeams/tab-Teams.module').then(m => m.TabTeamsPageModule)
          }
        ]
      },
      {
        path: '',
        redirectTo: '/tabs/Home',
        pathMatch: 'full'
      }
    ]
  },
  {
    path: '',
    redirectTo: '/tabs/Home',
    pathMatch: 'full'
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class TabsPageRoutingModule { }
