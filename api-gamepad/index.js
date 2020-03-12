class GamepadController {
  listeners = [];
  mapping = new GamepadMapping();

  constructor() {
    window.addEventListener('gamepadconnected', event => {
      console.log('Gamepad Connected');
      console.log(event.gamepad);

      this.startListeningGamepad(event.gamepad.index);
    });

    window.addEventListener('gamepaddisconnected', event => {
      console.log('Gamepad Disconnected');
      this.removeListeningGamepad(event.gamepad.index);
    });
  }

  startListeningGamepad(index) {
    this.listeners[index] = setInterval(this.listenGamepad, 100);
  }

  removeListeningGamepad(index) {
    clearInterval(this.listeners[index]);
  }

  listenGamepad = () => {
    const gamepad = navigator.getGamepads()[0];

    const btnPressed = this.isAnyBtnPressed(gamepad.buttons);
    const axePressed = this.isAnyAxePressed(gamepad.axes);

    if (btnPressed) {
      console.log(this.mapping.buttons[btnPressed]);
      //this.mapping.execute(btnPressed);
    }
    if (axePressed) {
      console.log(this.mapping.axes[axePressed.index][axePressed.value]);
    }
  };

  isAnyBtnPressed(buttons) {
    const pressed = buttons.find(({ pressed }) => pressed);
    return buttons.indexOf(pressed) + 1;
  }
  isAnyAxePressed(axes) {
    const pressed = axes.find(axe => axe !== 0);
    return pressed ? { index: axes.indexOf(pressed) + 1, value: pressed } : 0;
  }
}

class GamepadMapping {
  buttons = {
    '1': 'X',
    '2': 'A',
    '3': 'B',
    '4': 'Y',
    '5': 'L',
    '6': 'R',
    '10': 'START',
    '9': 'SELECT'
  };

  axes = {
    '1': {
      '1': 'RIGHT',
      '-1': 'LEFT'
    },
    '2': {
      '1': 'DOWN',
      '-1': 'UP'
    }
  };

  execute(pressedBtnNum) {
    const button = this.buttons[pressedBtnNum];
    this.map[button]();
  }
}

class DOOMGamepadMap extends GamepadMapping {
  map = {
    X: () => {
      console.log('xd');
    },
    A: () => {
      console.log('A button pressed');
    }
  };
}

new GamepadController();

//https://developer.mozilla.org/en-US/docs/Games/Techniques/Controls_Gamepad_API
