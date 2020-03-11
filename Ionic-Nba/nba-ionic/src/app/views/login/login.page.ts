import { Component, OnInit } from '@angular/core';
import { Validators, FormBuilder, FormGroup } from '@angular/forms';
import { FirebaseService } from 'src/app/shared/services/firebase/firebase.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.page.html',
  styleUrls: ['./login.page.scss'],
})
export class LoginPage implements OnInit {
  protected login: FormGroup;

  constructor(private formBuilder: FormBuilder, private firebaseService: FirebaseService, private router: Router) {
    this.login = this.formBuilder.group({
      email: ['', Validators.compose([Validators.maxLength(70), Validators.pattern('^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$'), Validators.required])],
      password: [''],
    });
  }

  ngOnInit() {
    if (this.firebaseService.isLogged) this.router.navigateByUrl('/');
  }

  loginEmail = (): void => {
    const { email, password } = this.login.value;
    this.firebaseService.loginWithEmail({ email, password }).then(() => {
      this.router.navigateByUrl('/');
    });
  };

  loginGoogle = (): void => {
    this.firebaseService.loginWithGoogle().then(() => {
      this.router.navigateByUrl('/');
    });
  };

  loginFacebook = (): void => {
    this.firebaseService.loginWithFacebook().then(() => {
      this.router.navigateByUrl('/');
    });
  };

  register = (): void => {
    const { email, password } = this.login.value;
    this.firebaseService.registerUser({ email, password }).then(() => {
      this.router.navigateByUrl('/');
    });
  };

}
