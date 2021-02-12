type main = {temp: float}

type weather = {
  description: string,
  icon: string,
}

type response = {
  main: main,
  name: string,
  weather: array<weather>,
}

let decodeMain = json => {
  open Json.Decode
  {temp: json |> field("temp", float)}
}
let decodeWeather = json => {
  open Json.Decode
  {
    description: json |> field("description", string),
    icon: json |> field("icon", string),
  }
}
let decodeResponse = json => {
  open Json.Decode
  {
    name: json |> field("name", string),
    main: json |> field("main", decodeMain),
    weather: json |> field("weather", array(decodeWeather)),
  }
}
