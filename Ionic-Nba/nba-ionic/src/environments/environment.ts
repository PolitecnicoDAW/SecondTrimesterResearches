// This file can be replaced during build by using the `fileReplacements` array.
// `ng build --prod` replaces `environment.ts` with `environment.prod.ts`.
// The list of file replacements can be found in `angular.json`.

export const environment = {
  production: false,
  firebaseConfig: {
    apiKey: "AIzaSyAnGEaeW3OyiDhyOXL2WDMymol2augQKvA",
    authDomain: "ionic-nba.firebaseapp.com",
    databaseURL: "https://ionic-nba.firebaseio.com",
    projectId: "ionic-nba",
    storageBucket: "ionic-nba.appspot.com",
    messagingSenderId: "579839595223",
    appId: "1:579839595223:web:5854733edfaa04bbc99692"
  },
  players: 'http://localhost:5000/players',
  teams: 'http://localhost:5000/teams',
  statistics: 'http://localhost:5000/statistics',
  stadium: 'http://localhost:5000/stadiums'
};

/*
 * For easier debugging in development mode, you can import the following file
 * to ignore zone related error stack frames such as `zone.run`, `zoneDelegate.invokeTask`.
 *
 * This import should be commented out in production mode because it will have a negative impact
 * on performance if an error is thrown.
 */
// import 'zone.js/dist/zone-error';  // Included with Angular CLI.
