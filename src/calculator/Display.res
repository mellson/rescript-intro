open States

let stateToString = state => {
  switch state {
  | Zero => "0"
  | AccumulateDigits(digits) => digits
  }
}

@react.component
let make = (~state) => {
  <div
    className="col-span-5 text-2xl font-black shadow-sm text-right text-white bg-indigo-900 p-4 rounded">
    {React.string(state->stateToString)}
  </div>
}
