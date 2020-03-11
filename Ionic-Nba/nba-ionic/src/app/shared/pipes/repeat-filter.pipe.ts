import { Pipe, PipeTransform } from '@angular/core';
import { Player } from '../models/player.model';
import * as _ from 'lodash';


@Pipe({
  name: 'filterRepeat'
})
export class FilterRepeatPipe implements PipeTransform {
  transform(value: Player[], ...args: any[]) {
    return (value = _.uniqBy(value, e => e.team));
  }
}