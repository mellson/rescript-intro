type t =
  | Zero
  | Digit(int)
  | Dot

let toString = digit =>
  switch digit {
  | Zero => "0"
  | Dot => "."
  | Digit(value) => value->Int.toString
  }
