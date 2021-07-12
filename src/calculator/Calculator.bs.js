// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as Display$RescriptIntro from "./Display.bs.js";
import * as DigitButton$RescriptIntro from "./DigitButton.bs.js";
import * as OperationButton$RescriptIntro from "./OperationButton.bs.js";
import * as CalculatorMachine$RescriptIntro from "./CalculatorMachine.bs.js";

function Calculator(Props) {
  var match = CalculatorMachine$RescriptIntro.use(undefined);
  var send = match[1];
  return React.createElement("div", {
              className: "p-4 grid grid-cols-5 gap-2 rounded shadow bg-gradient-to-br from-indigo-400 to-pink-400 animate-gradient"
            }, React.createElement(Display$RescriptIntro.make, {
                  state: match[0]
                }), React.createElement(DigitButton$RescriptIntro.make, {
                  digit: /* Digit */{
                    _0: 7
                  },
                  send: send
                }), React.createElement(DigitButton$RescriptIntro.make, {
                  digit: /* Digit */{
                    _0: 8
                  },
                  send: send
                }), React.createElement(DigitButton$RescriptIntro.make, {
                  digit: /* Digit */{
                    _0: 9
                  },
                  send: send
                }), React.createElement(OperationButton$RescriptIntro.make, {
                  operation: /* Clear */0,
                  send: send
                }), React.createElement(OperationButton$RescriptIntro.make, {
                  operation: /* Add */3,
                  send: send
                }), React.createElement(DigitButton$RescriptIntro.make, {
                  digit: /* Digit */{
                    _0: 4
                  },
                  send: send
                }), React.createElement(DigitButton$RescriptIntro.make, {
                  digit: /* Digit */{
                    _0: 5
                  },
                  send: send
                }), React.createElement(DigitButton$RescriptIntro.make, {
                  digit: /* Digit */{
                    _0: 6
                  },
                  send: send
                }), React.createElement(OperationButton$RescriptIntro.make, {
                  operation: /* Divide */1,
                  send: send
                }), React.createElement(DigitButton$RescriptIntro.make, {
                  digit: /* Digit */{
                    _0: 1
                  },
                  send: send
                }), React.createElement(DigitButton$RescriptIntro.make, {
                  digit: /* Digit */{
                    _0: 2
                  },
                  send: send
                }), React.createElement(DigitButton$RescriptIntro.make, {
                  digit: /* Digit */{
                    _0: 3
                  },
                  send: send
                }), React.createElement(OperationButton$RescriptIntro.make, {
                  operation: /* Multiply */2,
                  send: send
                }), React.createElement(OperationButton$RescriptIntro.make, {
                  operation: /* Equals */5,
                  send: send
                }), React.createElement(DigitButton$RescriptIntro.make, {
                  digit: /* Zero */0,
                  send: send
                }), React.createElement(DigitButton$RescriptIntro.make, {
                  digit: /* Dot */1,
                  send: send
                }), React.createElement(OperationButton$RescriptIntro.make, {
                  operation: /* Subtract */4,
                  send: send
                }));
}

var make = Calculator;

export {
  make ,
  
}
/* react Not a pure module */
