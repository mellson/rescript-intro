type state =
  | Initial
  | Typing(string)
  | Operating(string, Operation.t, string)
  | Result(string, Operation.t, string)

type event =
  | DigitPressed(Digit.t)
  | OperationPressed(Operation.t)

let handleInitial = (state, event) =>
  switch event {
  | DigitPressed(digit) =>
    switch digit {
    | Zero => state
    | Digit(value) => Typing(value->Int.toString)
    | Dot => Typing("0.")
    }
  | _ => state
  }

let handleTyping = (state, event, digits) =>
  switch event {
  | DigitPressed(digit) =>
    switch digit {
    | Zero => Typing(digits ++ "0")
    | Digit(value) => Typing(digits ++ value->Int.toString)
    | Dot if digits->Js.String2.includes(".") => state
    | Dot => Typing(digits ++ ".")
    }
  | OperationPressed(operation) =>
    switch operation {
    | Clear => Initial
    | Equals => state
    | _ => Operating(digits, operation, "")
    }
  }

let handleOperating = (state, event, a, operation, b) =>
  switch event {
  | DigitPressed(digit) =>
    switch digit {
    | Zero if b != "0" => Operating(a, operation, b ++ "0")
    | Zero => state
    | Digit(value) if b != "0" => Operating(a, operation, b ++ value->Int.toString)
    | Digit(value) => Operating(a, operation, value->Int.toString)
    | Dot if b->Js.String2.includes(".") => state
    | Dot if b != "" => Operating(a, operation, b ++ ".")
    | Dot => Operating(a, operation, "0.")
    }
  | OperationPressed(newOperation) =>
    switch newOperation {
    | Clear => Initial
    | Equals => Result(Calculation.calculate(a, operation, b), operation, b)
    | _ => Operating(Calculation.calculate(a, operation, b), newOperation, "")
    }
  }

let handleResult = (event, result, prevOperation, b) =>
  switch event {
  | DigitPressed(digit) =>
    switch digit {
    | Zero => Initial
    | Digit(value) => Typing(value->Int.toString)
    | Dot => Typing("0.")
    }
  | OperationPressed(newOperation) =>
    switch newOperation {
    | Clear => Initial
    | Equals => Result(Calculation.calculate(result, prevOperation, b), prevOperation, b)
    | _ => Operating(result, newOperation, "")
    }
  }

let handleEvent = (state, event) =>
  switch state {
  | Initial => handleInitial(state, event)
  | Typing(digits) => handleTyping(state, event, digits)
  | Operating(a, operation, b) => handleOperating(state, event, a, operation, b)
  | Result(result, prevOperation, b) => handleResult(event, result, prevOperation, b)
  }

let use = () => Machine.use(Initial, handleEvent)
