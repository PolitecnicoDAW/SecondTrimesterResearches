import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { IonicModule } from '@ionic/angular';
import { PlayerSearchPageRoutingModule } from './player-search-routing.module';
import { PlayerSearchPage } from './player-search.page';
import { CardPlayerComponent } from '../card-player/card-player.component';
import { PlayerModalPageModule } from '../player-modal/player-modal.module';
import { FilterRepeatPipe } from '../../../shared/pipes/repeat-filter.pipe';
import { PlayerService } from 'src/app/shared/services/player/player.service';



@NgModule({
  imports: [
    CommonModule,
    FormsModule,
    IonicModule,
    PlayerSearchPageRoutingModule,
    PlayerModalPageModule
  ],
  declarations: [PlayerSearchPage, CardPlayerComponent, FilterRepeatPipe],
  exports: [PlayerSearchPage],
  providers: [PlayerService]
})
export class PlayerSearchPageModule { }
