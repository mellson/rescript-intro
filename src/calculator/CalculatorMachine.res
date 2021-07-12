type state =
  | Initial
  | Typing(string)
  | Operating(string, Operation.t, string)
  | Result(string, Operation.t, string)

type events =
  | DigitPressed(Digit.t)
  | OperationPressed(Operation.t)

let calculate = (a, operation: Operation.t, b) => {
  let firstFloat = a->Js.Float.fromString
  let secondFloat = b->Js.Float.fromString

  switch operation {
  | Divide => firstFloat /. secondFloat
  | Multiply => firstFloat *. secondFloat
  | Add => firstFloat +. secondFloat
  | Subtract => firstFloat -. secondFloat
  | Clear
  | Equals => secondFloat
  }->Float.toString
}

let handleEvent = (state, event) =>
  switch state {
  | Initial =>
    switch event {
    | DigitPressed(digit) =>
      switch digit {
      | Zero => state
      | Digit(value) => Typing(value->Int.toString)
      | Dot => Typing("0.")
      }
    | _ => state
    }
  | Typing(digits) =>
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
  | Operating(a, operation, b) =>
    switch event {
    | DigitPressed(digit) =>
      switch digit {
      | Zero if b == "" => Operating(a, operation, "0")
      | Zero => Operating(a, operation, b ++ "0")
      | Digit(value) if b != "0" => Operating(a, operation, b ++ value->Int.toString)
      | Digit(value) => Operating(a, operation, value->Int.toString)
      | Dot if b->Js.String2.includes(".") => state
      | Dot if b != "" => Operating(a, operation, b ++ ".")
      | Dot => Operating(a, operation, "0.")
      }
    | OperationPressed(newOperation) =>
      switch newOperation {
      | Clear => Initial
      | Equals => Result(calculate(a, operation, b), operation, b)
      | _ => Operating(calculate(a, operation, b), newOperation, "")
      }
    }
  | Result(result, prevOperation, b) =>
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
      | Equals => Result(calculate(result, prevOperation, b), prevOperation, b)
      | _ => Operating(result, newOperation, "")
      }
    }
  }

let use = () => Machine.use(Initial, handleEvent)
