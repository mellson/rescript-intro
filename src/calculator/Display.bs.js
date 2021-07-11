// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";

function stateToString(state) {
  if (state) {
    return state._0;
  } else {
    return "0";
  }
}

function Display(Props) {
  var state = Props.state;
  return React.createElement("div", {
              className: "col-span-5 text-2xl font-black shadow-sm text-right text-white bg-indigo-900 p-4 rounded"
            }, stateToString(state));
}

var make = Display;

export {
  stateToString ,
  make ,
  
}
/* react Not a pure module */
