import { Injectable } from '@angular/core';
import { AngularFireAuth } from "@angular/fire/auth";
import { User } from 'firebase';
import * as firebase from "firebase/app";
import { HandlerFirebaseExceptions } from '../../exceptions/handlerFirebase.exceptions';

@Injectable({
  providedIn: 'root'
})
export class FirebaseService {
  public isLogged: boolean = false;
  public userLogged: User;
  constructor(public fireAuth: AngularFireAuth) {
    fireAuth.authState.subscribe(this.userIsLogued);
  }

  userIsLogued(user: User): void {
    (user === null) ? this.isLogged = false : this.isLogged = true;
  }

  loginWithGoogle(): Promise<void> {
    const googleProvider = new firebase.auth.GoogleAuthProvider();
    return this.fireAuth.auth.signInWithPopup(googleProvider)
      .then(({ user }) => this.saveUser(user))
      .catch((error: firebase.FirebaseError) => {
        new HandlerFirebaseExceptions(error);
      });
  }

  loginWithFacebook(): Promise<void> {
    const facebookProvider = new firebase.auth.FacebookAuthProvider;
    return this.fireAuth.auth.signInWithPopup(facebookProvider)
      .then(({ user }) => this.saveUser(user))
      .catch((error: firebase.FirebaseError) => {
        new HandlerFirebaseExceptions(error);
      });
  }

  loginWithEmail({ email, password }: { email: string, password: string; }): Promise<void> {
    return this.fireAuth.auth.signInWithEmailAndPassword(email, password)
      .then(({ user }) => this.saveUser(user))
      .catch((error: firebase.FirebaseError) => {
        new HandlerFirebaseExceptions(error);
      });
  }

  registerUser({ email, password }: { email: string, password: string; }): Promise<void> {
    return this.fireAuth.auth.createUserWithEmailAndPassword(email, password)
      .then(({ user }) => this.saveUser(user))
      .catch((error: firebase.FirebaseError) => {
        new HandlerFirebaseExceptions(error);
      });
  }

  saveUser(user: User): void {
    this.isLogged = true;
    this.userLogged = user;
  }
}
