const {
  app,
  BrowserWindow,
  ipcMain,
  Tray,
  Menu,
  globalShortcut
} = require('electron');
const path = require('path');

let appIcon = null;
let forceQuit = false;

function createChatWindow(username) {
  let window = new BrowserWindow({
    width: 1420,
    height: 720,
    webPreferences: {
      nodeIntegration: true
    }
  });

  forceQuit = true;
  ipcMain.once('requestUsername', function(event) {
    event.reply('responseUsername', username);
  });

  window.loadURL(path.join('file://', __dirname, 'index.html'));
  //win.loadFile('index.html');
  //window.webContents.openDevTools();

  window.on('close', event => {
    if (!forceQuit) {
      event.preventDefault();
      window.hide();
    } else {
      app.quit();
    }
  });

  setAppTray(window);
}

function createLogginWindow() {
  return new Promise(function(resolve, reject) {
    let window = new BrowserWindow({
      width: 400,
      height: 220,
      webPreferences: {
        nodeIntegration: true
      }
    });

    window.loadURL(path.join('file://', __dirname, 'login.html'));

    // Disable menubar
    window.setMenu(null);
    //window.webContents.openDevTools();

    ipcMain.on('usernameIntroduced', function(event, username) {
      console.log('Username:', username);
      window.hide();
      resolve(username);
    });
  });
}

// This method will be called when Electron has finished
// initialization and is ready to create browser windows.
// Algunas APIs pueden usarse sólo después de que este evento ocurra.
app
  .whenReady()
  .then(createLogginWindow)
  .then(createChatWindow);

app.on('activate', () => {
  if (BrowserWindow.getAllWindows().length === 0) {
    createChatWindow();
  }
});

app.on('ready', () => {
  globalShortcut.register('CommandOrControl+Shift+Q', () => {
    forceQuit = !forceQuit;
  });
});

function setAppTray(window) {
  const iconName = 'clown.png'; //process.platform === 'win32' ? 'windows-icon.png' : 'iconTemplate.png';
  const iconPath = path.join(__dirname, iconName);
  appIcon = new Tray(iconPath);
  appIcon.setToolTip('Discordia Chat');

  const contextMenu = Menu.buildFromTemplate([
    {
      label: 'Restore',
      click: () => {
        window.restore();
        //appIcon.destroy();
      }
    },
    {
      label: 'Quit',
      click: () => {
        forceQuit = true;
        app.quit();
      }
    }
  ]);

  appIcon.setContextMenu(contextMenu);
}

// Quit when all windows are closed.
app.on('window-all-closed', () => {
  // En macOS es común para las aplicaciones y sus barras de menú
  // que estén activas hasta que el usuario salga explicitamente con Cmd + Q
  if (process.platform !== 'darwin') {
    app.quit();
  }
  if (appIcon) appIcon.destroy();
});
