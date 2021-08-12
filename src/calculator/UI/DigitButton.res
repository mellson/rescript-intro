@react.component
let make = (~digit, ~send) => {
  open Digit
  open CalculatorMachine

  let extraClasses = switch digit {
  | Zero => "bg-white col-span-2"
  | _ => "bg-white"
  }

  <Button text={digit->toString} onClick={_ => send(DigitPressed(digit))} extraClasses />
}
