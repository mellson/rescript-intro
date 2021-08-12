// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "rescript/lib/es6/curry.js";
import * as React from "react";
import * as Button$RescriptIntro from "./Button.bs.js";
import * as Operation$RescriptIntro from "../Models/Operation.bs.js";

function OperationButton(Props) {
  var operation = Props.operation;
  var send = Props.send;
  var className;
  switch (operation) {
    case /* Clear */0 :
        className = "bg-yellow-500";
        break;
    case /* Divide */1 :
    case /* Multiply */2 :
    case /* Subtract */4 :
        className = "bg-yellow-200";
        break;
    case /* Add */3 :
    case /* Equals */5 :
        className = "bg-yellow-200 row-span-2";
        break;
    
  }
  return React.createElement(Button$RescriptIntro.make, {
              text: Operation$RescriptIntro.toString(operation),
              className: className,
              onClick: (function (param) {
                  return Curry._1(send, {
                              TAG: /* OperationPressed */1,
                              _0: operation
                            });
                })
            });
}

var make = OperationButton;

export {
  make ,
  
}
/* react Not a pure module */