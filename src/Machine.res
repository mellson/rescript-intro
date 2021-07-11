type machine<'a, 'b> = {state: 'a, send: 'b => unit}
let use = (initialState: 'a, handleEvent: ('a, 'b) => 'a) => {
  let (state, setState) = React.useState(_ => initialState)

  let send = event => setState(_ => state->handleEvent(event))

  (state, send)
}
