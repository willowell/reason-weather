let geo: option<'a> = %raw(`navigator.geolocation`)

@val
external getCurrentPosition: (~onSuccess: 'a => unit, ~onError: 'b => unit) => unit =
  "navigator.geolocation.getCurrentPosition"

let getGeolocation = (~sendGeo, ~sendErr) => {
  let onSuccess = p => sendGeo(p["coords"]["latitude"], p["coords"]["longitude"])
  let onError = e => {
    let msg = switch e["code"] {
    | 1 => "Permission denied"
    | 2 => "Position unavailable"
    | 3 => "Timeout"
    | _ => "Unknown error"
    }
    sendErr(msg)
  }

  switch geo {
  | Some(_) => getCurrentPosition(~onSuccess, ~onError)
  | None => Js.log("Not available")
  }
}
