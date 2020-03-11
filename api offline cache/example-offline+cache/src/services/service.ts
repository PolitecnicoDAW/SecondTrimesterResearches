import { Simpson, ISimpson } from '../models/simpson.model';
import {
  FAKE_CACHE_URL,
  API_ENVPOINT,
  CACHE_NAME
} from '../assets/constants/constants';

export class Service {
  handlers: any = {};
  charaptersSimpsons: Simpson[] = [];

  constructor() {
    this.searchCache()
      .then(charaptersSimpsons => {
        this.charaptersSimpsons = charaptersSimpsons;
        this.handlers.printSome(this.charaptersSimpsons);
        this.handlers.buttonEnabled();
      })
      .catch(() => {
        this.handlers.buttonEnabled();
        console.log('No habia datos cacheados');
      });
  }

  binder(key: string, handler: any): void {
    this.handlers[key] = handler;
  }

  private searchCache(): Promise<Simpson[]> {
    return caches
      .open(CACHE_NAME)
      .then(async cache => {
        return await cache.match(FAKE_CACHE_URL);
      })
      .then(function(response) {
        if (response) return response.json();
        throw new Error();
      });
  }

  private cacheDatas(): Promise<void> {
    return caches
      .open(CACHE_NAME)
      .then(
        async cache =>
          await cache.put(
            FAKE_CACHE_URL,
            new Response(JSON.stringify(this.charaptersSimpsons))
          )
      );
  }

  private fetchApi(): Promise<Simpson> {
    return fetch(API_ENVPOINT)
      .then((response: Response) => response.json())
      .then(
        (charapterSimpsonDTO: ISimpson[]) => new Simpson(charapterSimpsonDTO[0])
      );
  }

  addSimpson = (): Promise<void> => {
    return this.fetchApi()
      .then((simpson: Simpson) => {
        this.charaptersSimpsons = [...this.charaptersSimpsons, simpson];
        this.handlers.printOne(simpson);
      })
      .then(async () => {
        await this.cacheDatas();
      });
  };
}
