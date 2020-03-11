export class Player {
  private _playerID: number;
  private _teamID: number;
  private _team: string;
  private _jersey: number;
  private _positionCategory: string;
  private _position: string;
  private _firstName: string;
  private _lastName: string;
  private _height: number;
  private _weight: number;
  private _birthDate: string;
  private _birthCity: string;
  private _birthState: string;
  private _college: null;
  private _salary: number;
  private _photoUrl: string;
  private _experience: number;

  constructor({
    playerID,
    teamID,
    team,
    jersey,
    positionCategory,
    position,
    firstName,
    lastName,
    height,
    weight,
    birthDate,
    birthCity,
    birthState,
    college,
    salary,
    photoUrl,
    experience
  }) { }

  public get firstName(): string {
    return this._firstName;
  }
  public set firstName(value: string) {
    this._firstName = value;
  }
  public get playerID(): number {
    return this._playerID;
  }
  public set playerID(value: number) {
    this._playerID = value;
  }

  public get team(): string {
    return this._team;
  }
  public set team(value: string) {
    this._team = value;
  }

  public get experience(): number {
    return this._experience;
  }
  public set experience(value: number) {
    this._experience = value;
  }
  public get height(): number {
    return this._height;
  }
  public set height(value: number) {
    this._height = value;
  }
  public get birthDate(): string {
    return this._birthDate;
  }
  public set birthDate(value: string) {
    this._birthDate = value;
  }
  public get birthCity(): string {
    return this._birthCity;
  }
  public set birthCity(value: string) {
    this._birthCity = value;
  }
  public get birthState(): string {
    return this._birthState;
  }
  public set birthState(value: string) {
    this._birthState = value;
  }
  public get college(): null {
    return this._college;
  }
  public set college(value: null) {
    this._college = value;
  }
  public get salary(): number {
    return this._salary;
  }
  public set salary(value: number) {
    this._salary = value;
  }
  public get photoUrl(): string {
    return this._photoUrl;
  }
  public set photoUrl(value: string) {
    this._photoUrl = value;
  }
  public get weight(): number {
    return this._weight;
  }
  public set weight(value: number) {
    this._weight = value;
  }
  public get lastName(): string {
    return this._lastName;
  }
  public set lastName(value: string) {
    this._lastName = value;
  }
  public get jersey(): number {
    return this._jersey;
  }
  public set jersey(value: number) {
    this._jersey = value;
  }
  public get positionCategory(): string {
    return this._positionCategory;
  }
  public set positionCategory(value: string) {
    this._positionCategory = value;
  }
  public get position(): string {
    return this._position;
  }
  public set position(value: string) {
    this._position = value;
  }
  public get teamID(): number {
    return this._teamID;
  }
  public set teamID(value: number) {
    this._teamID = value;
  }
}