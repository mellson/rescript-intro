@react.component
let make = (~operation, ~send) => {
  open Operation
  open CalculatorMachine

  let extraClasses = switch operation {
  | Clear => "bg-yellow-500"
  | Add
  | Equals => "bg-yellow-200 row-span-2"
  | _ => "bg-yellow-200"
  }

  <Button
    text={operation->toString} extraClasses onClick={_ => send(OperationPressed(operation))}
  />
}
