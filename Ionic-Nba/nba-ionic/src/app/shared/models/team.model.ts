export class Team {
  private _teamID: number;
  private _key: string;
  private _city: string;
  private _name: string;
  private _stadiumID: number;
  private _conference: string;
  private _division: string;
  private _primaryColor: string;
  private _secondaryColor: string;
  private _tertiaryColor: string;
  private _quaternaryColor: string;
  private _photoUrl: string;

  constructor({
    teamID,
    key,
    city,
    name,
    stadiumID,
    conference,
    division,
    primaryColor,
    secondaryColor,
    tertiaryColor,
    quaternaryColor,
    photoUrl
  }) { }

  public get name(): string {
    return this._name;
  }
  public set name(value: string) {
    this._name = value;
  }

  public get city(): string {
    return this._city;
  }
  public set city(value: string) {
    this._city = value;
  }
  public get teamID(): number {
    return this._teamID;
  }
  public set teamID(value: number) {
    this._teamID = value;
  }

  public get stadiumID(): number {
    return this._stadiumID;
  }
  public set stadiumID(value: number) {
    this._stadiumID = value;
  }

  public get key(): string {
    return this._key;
  }
  public set key(value: string) {
    this._key = value;
  }
  public get photoUrl(): string {
    return this._photoUrl;
  }
  public set photoUrl(value: string) {
    this._photoUrl = value;
  }

  public get quaternaryColor(): string {
    return this._quaternaryColor;
  }
  public set quaternaryColor(value: string) {
    this._quaternaryColor = value;
  }

  public get tertiaryColor(): string {
    return this._tertiaryColor;
  }
  public set tertiaryColor(value: string) {
    this._tertiaryColor = value;
  }

  public get secondaryColor(): string {
    return this._secondaryColor;
  }
  public set secondaryColor(value: string) {
    this._secondaryColor = value;
  }
  public get primaryColor(): string {
    return this._primaryColor;
  }
  public set primaryColor(value: string) {
    this._primaryColor = value;
  }

  public get division(): string {
    return this._division;
  }
  public set division(value: string) {
    this._division = value;
  }
  public get conference(): string {
    return this._conference;
  }
  public set conference(value: string) {
    this._conference = value;
  }
}