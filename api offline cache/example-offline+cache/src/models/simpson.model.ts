interface ISimpson {
  quote: string;
  character: string;
  image: string;
  characterDirection: string;
}
class Simpson {
  name: string;
  quote: string;
  imgSrc: string;
  constructor({ quote, character, image }: Partial<ISimpson>) {
    this.name = character;
    this.quote = quote;
    this.imgSrc = image;
  }
}

export { ISimpson, Simpson };
