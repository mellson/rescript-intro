@react.component
let make = (~text, ~className="bg-white") => {
  <button
    className={"p-4 text-2xl font-bold shadow-sm active:scale-95 active:-rotate-1 hover:shadow-xl duration-75 hover:scale-105 hover:rotate-1 cursor-pointer rounded text-center " ++
    className}>
    {React.string(text)}
  </button>
}
