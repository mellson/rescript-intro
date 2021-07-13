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
