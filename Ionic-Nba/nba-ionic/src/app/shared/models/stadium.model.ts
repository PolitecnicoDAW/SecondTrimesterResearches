export class Stadium {
  constructor(
    private _stadiumID: number,
    private _name: string,
    private _address: string,
    private _city: string,
    private _state: string,
    private _zip: string,
    private _capacity: number,
    private _geoLat: number,
    private _geoLong: number
  ) { }

  public get address(): string {
    return this._address;
  }
  public set address(value: string) {
    this._address = value;
  }
  public get city(): string {
    return this._city;
  }
  public set city(value: string) {
    this._city = value;
  }
  public get state(): string {
    return this._state;
  }
  public set state(value: string) {
    this._state = value;
  }
  public get capacity(): number {
    return this._capacity;
  }
  public set capacity(value: number) {
    this._capacity = value;
  }
  public get geoLat(): number {
    return this._geoLat;
  }
  public set geoLat(value: number) {
    this._geoLat = value;
  }
  public get zip(): string {
    return this._zip;
  }
  public set zip(value: string) {
    this._zip = value;
  }
  public get geoLong(): number {
    return this._geoLong;
  }
  public set geoLong(value: number) {
    this._geoLong = value;
  }
  public get name(): string {
    return this._name;
  }
  public set name(value: string) {
    this._name = value;
  }

  public get stadiumID(): number {
    return this._stadiumID;
  }
  public set stadiumID(value: number) {
    this._stadiumID = value;
  }
}