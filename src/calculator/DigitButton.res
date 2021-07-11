@react.component
let make = (~digit, ~send) => {
  open Digit
  open States

  let className = switch digit {
  | ZeroDigit => "bg-white col-span-2"
  | _ => "bg-white"
  }

  let text = digit->toString

  <Button text onClick={_ => send(DigitPressed(digit))} className />
}
