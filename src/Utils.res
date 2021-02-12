let s = React.string

@val external requireCSS: string => unit = "require"

@val external requireImage: string => string = "require"

let kToC = k => k -. 273.15

let kToF = k => kToC(k) *. 9. /. 5. +. 32.
