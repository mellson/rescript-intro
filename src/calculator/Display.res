@react.component
let make = (~text) => {
  <div
    className="col-span-5 text-2xl font-black shadow-sm text-right text-white bg-indigo-900 p-4 rounded">
    {React.string(text)}
  </div>
}
