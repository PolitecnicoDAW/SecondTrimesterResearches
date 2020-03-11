import { FirebaseError } from 'firebase';
import { EXCEPTIONS } from './firebase.exceptions';
import { ToastController } from '@ionic/angular';


export class HandlerFirebaseExceptions {

    private toastController: ToastController;
    constructor({ code }: FirebaseError) {
        const myexception = EXCEPTIONS[code];
        this.toastController = new ToastController();
        this.presentToast(myexception);
    }


    async presentToast(message: string) {
        const toast = await this.toastController.create({
            message,
            duration: 2500,
            color: 'danger',
            cssClass: 'ion-text-center'
        });
        toast.present();
    }

}
