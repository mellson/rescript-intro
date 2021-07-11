@react.component
let make = (~digit) => {
  open Digit

  let className = switch digit {
  | ZeroDigit => "bg-white col-span-2"
  | _ => "bg-white"
  }

  <Button text={digit->toString} className />
}
