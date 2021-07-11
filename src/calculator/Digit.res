type t =
  | ZeroDigit
  | Digit(int)
  | Dot

let toString = digit =>
  switch digit {
  | ZeroDigit => "0"
  | Dot => "."
  | Digit(value) => value->Int.toString
  }
