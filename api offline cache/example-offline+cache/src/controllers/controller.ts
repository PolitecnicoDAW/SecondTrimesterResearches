import { Service } from '../services/service';
import { View } from '../view/view';

export class Controller {
  service: Service;
  view: View;

  constructor(service: Service, view: View) {
    this.service = service;
    this.view = view;
    this.service.binder('printOne', this.view.printCard);
    this.service.binder('printSome', this.view.printCards);
    this.view.binder('addOne', this.service.addSimpson);
    this.view.addEvents();
    this.service.binder('buttonEnabled', this.view.changeButtonEnable);
  }
}
