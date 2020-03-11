import { Simpson } from '../models/simpson.model';
export class View {
  view: Document;
  GUI: any;
  handlers: any = {};

  constructor(view: Document) {
    this.view = view;
    this.GUI = {
      containerList: this.view.getElementById('list'),
      buttonAddMore: this.view.getElementById('buttonAdd')
    };
  }

  binder(key: string, handler: any): void {
    this.handlers[key] = handler;
  }

  addEvents() {
    this.GUI.buttonAddMore.addEventListener('click', this.handlers.addOne);
    window.addEventListener('online', this.changeButton);
    window.addEventListener('offline', this.changeButton);
  }

  createElementCard({ quote, imgSrc, name }: Simpson) {
    const card = this.view.createElement('div');
    card.classList.add('card');

    const img = this.view.createElement('img');
    img.src = imgSrc;

    const labelName = this.view.createElement('label');
    labelName.innerHTML = `Nombre: `;

    const pName = this.view.createElement('p');
    pName.innerHTML = name;

    const labelQuote = this.view.createElement('label');
    labelQuote.innerHTML = `Frase: `;

    const pQuote = this.view.createElement('p');
    pQuote.innerHTML = quote;

    card.appendChild(img);
    card.appendChild(labelName);
    card.appendChild(pName);
    card.appendChild(labelQuote);
    card.appendChild(pQuote);
    return card;
  }

  printCard = (card: Simpson) => {
    this.GUI.containerList.appendChild(this.createElementCard(card));
  };

  changeButton = () => {
    this.GUI.buttonAddMore.disabled = !navigator.onLine;
  };

  changeButtonEnable = () => {
    if (navigator.onLine) this.GUI.buttonAddMore.disabled = false;
  };

  printCards = (cards: Simpson[]) => {
    this.GUI.containerList.innerHTML = '';
    for (const card of cards) {
      this.printCard(card);
    }
  };
}
