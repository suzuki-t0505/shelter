defmodule Shelter.Util.Address do
  def get_coordinate(address) do
    data = HTTPoison.get!("https://www.geocoding.jp/api/?q=#{address}")
    [string_lat, string_long] =
      data.body
      |> String.split("\n")
      |> Enum.map(& if String.contains?(&1, ["<lat>", "<lng>"])do &1 end)
      |> Enum.filter(& &1)
      |> Enum.map(&String.replace(&1, ["<lat>", "</lat>", "<lng>", "</lng>"], ""))

      lat = String.to_float(string_lat)
      long = String.to_float(string_long)
    %{lat: lat, long: long}
  end
end
