type state =
  | Zero
  | AccumulateDigits(string)

type events =
  | DigitPressed(Digit.t)
  | OperationPressed(Operation.t)

let handleEvent = (currentState, event) =>
  switch currentState {
  | Zero =>
    switch event {
    | DigitPressed(digit) =>
      switch digit {
      | ZeroDigit => currentState
      | Digit(value) => AccumulateDigits(value->Int.toString)
      | Dot => AccumulateDigits("0.")
      }
    | _ => currentState
    }
  | AccumulateDigits(digits) =>
    switch event {
    | DigitPressed(digit) =>
      switch digit {
      | ZeroDigit => currentState
      | Digit(value) => AccumulateDigits(digits ++ value->Int.toString)
      | Dot =>
        if digits->Js.String2.includes(".") {
          currentState
        } else {
          AccumulateDigits(digits ++ ".")
        }
      }
    | OperationPressed(operation) =>
      switch operation {
      | Clear => Zero
      | _ => currentState
      }
    }
  }

let use = () => Machine.use(Zero, handleEvent)
