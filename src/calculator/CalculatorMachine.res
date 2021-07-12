type state =
  | Initial
  | Typing(string)

type events =
  | DigitPressed(Digit.t)
  | OperationPressed(Operation.t)

let handleEvent = (currentState, event) =>
  switch currentState {
  | Initial =>
    switch event {
    | DigitPressed(digit) =>
      switch digit {
      | Zero => currentState
      | Digit(value) => Typing(value->Int.toString)
      | Dot => Typing("0.")
      }
    | _ => currentState
    }
  | Typing(digits) =>
    switch event {
    | DigitPressed(digit) =>
      switch digit {
      | Zero => Typing(digits ++ "0")
      | Digit(value) => Typing(digits ++ value->Int.toString)
      | Dot =>
        if digits->Js.String2.includes(".") {
          currentState
        } else {
          Typing(digits ++ ".")
        }
      }
    | OperationPressed(operation) =>
      switch operation {
      | Clear => Initial
      | _ => currentState
      }
    }
  }

let use = () => Machine.use(Initial, handleEvent)
