@react.component
let make = () => {
  open Digit
  open Operation

  <div
    className="p-4 grid grid-cols-5 gap-2 rounded shadow bg-gradient-to-br from-indigo-400 to-pink-400 animate-gradient">
    <Display text="0" />
    <DigitButton digit=Digit(7) />
    <DigitButton digit=Digit(8) />
    <DigitButton digit=Digit(9) />
    <OperationButton operation=Clear />
    <OperationButton operation=Add />
    <DigitButton digit=Digit(4) />
    <DigitButton digit=Digit(5) />
    <DigitButton digit=Digit(6) />
    <OperationButton operation=Divide />
    <DigitButton digit=Digit(3) />
    <DigitButton digit=Digit(2) />
    <DigitButton digit=Digit(1) />
    <OperationButton operation=Multiply />
    <OperationButton operation=Equals />
    <DigitButton digit=ZeroDigit />
    <DigitButton digit=Dot />
    <OperationButton operation=Subtract />
  </div>
}
