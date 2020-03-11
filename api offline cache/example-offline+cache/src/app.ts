import { Controller } from './controllers/controller';
import { Service } from './services/service';
import { View } from './view/view';

const controller: Controller = new Controller(
  new Service(),
  new View(window.document)
);
