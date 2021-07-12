// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Machine$RescriptIntro from "../Machine.bs.js";

function handleEvent(currentState, $$event) {
  if (currentState) {
    var digits = currentState._0;
    if ($$event.TAG !== /* DigitPressed */0) {
      if ($$event._0 !== 0) {
        return currentState;
      } else {
        return /* Initial */0;
      }
    }
    var digit = $$event._0;
    if (typeof digit === "number") {
      if (digit !== 0) {
        if (digits.includes(".")) {
          return currentState;
        } else {
          return /* Typing */{
                  _0: digits + "."
                };
        }
      } else {
        return /* Typing */{
                _0: digits + "0"
              };
      }
    } else {
      return /* Typing */{
              _0: digits + String(digit._0)
            };
    }
  }
  if ($$event.TAG !== /* DigitPressed */0) {
    return currentState;
  }
  var digit$1 = $$event._0;
  if (typeof digit$1 === "number") {
    if (digit$1 !== 0) {
      return /* Typing */{
              _0: "0."
            };
    } else {
      return currentState;
    }
  } else {
    return /* Typing */{
            _0: String(digit$1._0)
          };
  }
}

function use(param) {
  return Machine$RescriptIntro.use(/* Initial */0, handleEvent);
}

export {
  handleEvent ,
  use ,
  
}
/* Machine-RescriptIntro Not a pure module */
