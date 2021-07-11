type toggleStates =
  | On
  | Off

type toggleEvents =
  | TurnOn
  | TurnOff

let handleOnEvent = (currentState, event) =>
  switch event {
  | TurnOn => currentState
  | TurnOff => Off
  }

let handleOffEvent = (currentState, event) =>
  switch event {
  | TurnOn => On
  | TurnOff => currentState
  }

let handleEvent = (currentState, event) =>
  switch currentState {
  | On => currentState->handleOnEvent(event)
  | Off => currentState->handleOffEvent(event)
  }

let stateToString = state => {
  switch state {
  | On => "On"
  | Off => "Off"
  }
}

@react.component
let make = () => {
  let (state, send) = Machine.use(On, handleEvent)

  <div className="flex flex-col justify-center items-center p-4">
    <div className="text-xl"> {React.string(state->stateToString)} </div>
    <button onClick={_ => send(TurnOn)}> {React.string("Turn on")} </button>
    <button onClick={_ => send(TurnOff)}> {React.string("Turn off")} </button>
  </div>
}
