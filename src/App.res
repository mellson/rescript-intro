@react.component
let make = () => {
  <div className="flex flex-col justify-center items-center h-screen">
    {React.string("ReScript React with Tailwind running on Vite")} <ToggleMachine />
  </div>
}
