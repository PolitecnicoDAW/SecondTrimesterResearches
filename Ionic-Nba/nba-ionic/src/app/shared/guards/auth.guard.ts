import { Injectable } from '@angular/core';
import { CanActivate } from '@angular/router';
import { FirebaseService } from '../services/firebase/firebase.service';
import { Router } from "@angular/router";

@Injectable({
  providedIn: 'root'
})
export class AuthGuard implements CanActivate {
  constructor(private authService: FirebaseService, private router: Router) { }
  canActivate() {
    if (this.authService.isLogged) return true;
    this.router.navigateByUrl('/login');
    return false;
  }

}
