open CalculatorMachine

let stateToString = state => {
  switch state {
  | Initial => "0"
  | Typing(digits)
  | Result(digits, _, _) => digits
  | Operating(firstDigits, _, secondDigits) =>
    if secondDigits != "" {
      secondDigits
    } else {
      firstDigits
    }
  }
}

@react.component
let make = (~state) => {
  <div
    className="bg-opacity-75 col-span-5 text-2xl font-black shadow text-right text-white bg-indigo-900 p-4 mb-2 rounded">
    {React.string(state->stateToString)}
  </div>
}
