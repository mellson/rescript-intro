@react.component
let make = () => {
  let (state, send) = CalculatorMachine.use()

  open Digit
  open Operation

  <div
    className="p-4 grid grid-cols-5 gap-2 rounded shadow bg-gradient-to-br from-indigo-400 to-pink-400 animate-gradient">
    <Display state />
    <DigitButton digit=Digit(7) send />
    <DigitButton digit=Digit(8) send />
    <DigitButton digit=Digit(9) send />
    <OperationButton operation=Clear send />
    <OperationButton operation=Add send />
    <DigitButton digit=Digit(4) send />
    <DigitButton digit=Digit(5) send />
    <DigitButton digit=Digit(6) send />
    <OperationButton operation=Divide send />
    <DigitButton digit=Digit(1) send />
    <DigitButton digit=Digit(2) send />
    <DigitButton digit=Digit(3) send />
    <OperationButton operation=Multiply send />
    <OperationButton operation=Equals send />
    <DigitButton digit=Zero send />
    <DigitButton digit=Dot send />
    <OperationButton operation=Subtract send />
  </div>
}
