type t =
  | Clear
  | Divide
  | Multiply
  | Add
  | Subtract
  | Equals

let toString = operation =>
  switch operation {
  | Clear => "C"
  | Divide => "/"
  | Multiply => "*"
  | Add => "+"
  | Subtract => "-"
  | Equals => "="
  }
