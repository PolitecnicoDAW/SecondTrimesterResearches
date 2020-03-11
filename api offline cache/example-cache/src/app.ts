import { CACHE_NAME, API_ENVPOINT } from './assets/constants/contants';
import { ISimpson, Simpson } from './models/simpson.model';

const containerList = document.getElementById('list');
const buttonDelete = document.getElementById('buttonDelete');
const buttonCache = document.getElementById('buttonCache');

function createElementCard({ quote, imgSrc, name }: Simpson) {
  const card = document.createElement('div');
  card.classList.add('card');

  const img = document.createElement('img');
  img.src = imgSrc;

  const labelName = document.createElement('label');
  labelName.innerHTML = `Nombre: `;

  const pName = document.createElement('p');
  pName.innerHTML = name;

  const labelQuote = document.createElement('label');
  labelQuote.innerHTML = `Frase: `;

  const pQuote = document.createElement('p');
  pQuote.innerHTML = quote;

  card.appendChild(img);
  card.appendChild(labelName);
  card.appendChild(pName);
  card.appendChild(labelQuote);
  card.appendChild(pQuote);
  return card;
}

function printCard(card: Simpson) {
  containerList.appendChild(createElementCard(card));
}

function printCards(cards: Simpson[]) {
  for (const card of cards) {
    printCard(card);
  }
}

function clearContainerList() {
  containerList.innerHTML = '';
}

function cacheRequest() {
  return caches
    .open(CACHE_NAME)
    .then(async cache => await cache.add(API_ENVPOINT));
}

function searchCache() {
  return caches
    .open(CACHE_NAME)
    .then(async cache => {
      return await cache.match(API_ENVPOINT);
    })
    .then(function(response) {
      if (response) return response.json();
      throw new Error();
    })
    .then(cahractersSimpsonDTO =>
      cahractersSimpsonDTO.map(
        (characterDTO: ISimpson) => new Simpson(characterDTO)
      )
    );
}

function clearCache() {
  caches.open(CACHE_NAME).then((cache: Cache) => {
    cache.delete(API_ENVPOINT);
  });
}

function clear() {
  clearContainerList();
  clearCache();
}

function print() {
  return searchCache().then(printCards);
}

function clickCache() {
  cacheRequest().then(print);
}

buttonDelete.addEventListener('click', clear);
buttonCache.addEventListener('click', clickCache);

print().catch(() => {
  cacheRequest().then(print);
});
