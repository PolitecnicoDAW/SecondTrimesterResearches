import { Injectable } from '@angular/core';
import { Team } from '../../models/team.model';
import { environment } from 'src/environments/environment.prod';
import { Observable } from 'rxjs';
import { HttpClient } from '@angular/common/http';


@Injectable({
  providedIn: 'root'
})
export class TeamService {

  public teams$: Observable<Team[]>;

  constructor(private http: HttpClient) {
    this.teams$ = this.getTeam();
  }

  getTeam(): Observable<Team[]> {
    return this.http.get<Team[]>(environment.teams);
  }


}
