// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Machine$RescriptIntro from "../../Machine.bs.js";
import * as Calculation$RescriptIntro from "./Calculation.bs.js";

function handleInitial(state, $$event) {
  if ($$event.TAG !== /* DigitPressed */0) {
    return state;
  }
  var digit = $$event._0;
  if (typeof digit === "number") {
    if (digit !== 0) {
      return {
              TAG: /* Typing */0,
              _0: "0."
            };
    } else {
      return state;
    }
  } else {
    return {
            TAG: /* Typing */0,
            _0: String(digit._0)
          };
  }
}

function handleTyping(state, $$event, digits) {
  if ($$event.TAG === /* DigitPressed */0) {
    var digit = $$event._0;
    if (typeof digit === "number") {
      if (digit !== 0) {
        if (digits.includes(".")) {
          return state;
        } else {
          return {
                  TAG: /* Typing */0,
                  _0: digits + "."
                };
        }
      } else {
        return {
                TAG: /* Typing */0,
                _0: digits + "0"
              };
      }
    } else {
      return {
              TAG: /* Typing */0,
              _0: digits + String(digit._0)
            };
    }
  }
  var operation = $$event._0;
  if (operation !== 0) {
    if (operation >= 5) {
      return state;
    } else {
      return {
              TAG: /* Operating */1,
              _0: digits,
              _1: operation,
              _2: ""
            };
    }
  } else {
    return /* Initial */0;
  }
}

function handleOperating(state, $$event, a, operation, b) {
  if ($$event.TAG === /* DigitPressed */0) {
    var digit = $$event._0;
    if (typeof digit === "number") {
      if (digit !== 0) {
        if (b.includes(".")) {
          return state;
        } else if (b !== "") {
          return {
                  TAG: /* Operating */1,
                  _0: a,
                  _1: operation,
                  _2: b + "."
                };
        } else {
          return {
                  TAG: /* Operating */1,
                  _0: a,
                  _1: operation,
                  _2: "0."
                };
        }
      } else if (b === "") {
        return {
                TAG: /* Operating */1,
                _0: a,
                _1: operation,
                _2: "0"
              };
      } else {
        return {
                TAG: /* Operating */1,
                _0: a,
                _1: operation,
                _2: b + "0"
              };
      }
    }
    var value = digit._0;
    if (b !== "0") {
      return {
              TAG: /* Operating */1,
              _0: a,
              _1: operation,
              _2: b + String(value)
            };
    } else {
      return {
              TAG: /* Operating */1,
              _0: a,
              _1: operation,
              _2: String(value)
            };
    }
  }
  var newOperation = $$event._0;
  if (newOperation !== 0) {
    if (newOperation >= 5) {
      return {
              TAG: /* Result */2,
              _0: Calculation$RescriptIntro.calculate(a, operation, b),
              _1: operation,
              _2: b
            };
    } else {
      return {
              TAG: /* Operating */1,
              _0: Calculation$RescriptIntro.calculate(a, operation, b),
              _1: newOperation,
              _2: ""
            };
    }
  } else {
    return /* Initial */0;
  }
}

function handleResult($$event, result, prevOperation, b) {
  if ($$event.TAG === /* DigitPressed */0) {
    var digit = $$event._0;
    if (typeof digit === "number") {
      if (digit !== 0) {
        return {
                TAG: /* Typing */0,
                _0: "0."
              };
      } else {
        return /* Initial */0;
      }
    } else {
      return {
              TAG: /* Typing */0,
              _0: String(digit._0)
            };
    }
  }
  var newOperation = $$event._0;
  if (newOperation !== 0) {
    if (newOperation >= 5) {
      return {
              TAG: /* Result */2,
              _0: Calculation$RescriptIntro.calculate(result, prevOperation, b),
              _1: prevOperation,
              _2: b
            };
    } else {
      return {
              TAG: /* Operating */1,
              _0: result,
              _1: newOperation,
              _2: ""
            };
    }
  } else {
    return /* Initial */0;
  }
}

function handleEvent(state, $$event) {
  if (typeof state === "number") {
    return handleInitial(state, $$event);
  }
  switch (state.TAG | 0) {
    case /* Typing */0 :
        return handleTyping(state, $$event, state._0);
    case /* Operating */1 :
        return handleOperating(state, $$event, state._0, state._1, state._2);
    case /* Result */2 :
        return handleResult($$event, state._0, state._1, state._2);
    
  }
}

function use(param) {
  return Machine$RescriptIntro.use(/* Initial */0, handleEvent);
}

export {
  handleInitial ,
  handleTyping ,
  handleOperating ,
  handleResult ,
  handleEvent ,
  use ,
  
}
/* Machine-RescriptIntro Not a pure module */
