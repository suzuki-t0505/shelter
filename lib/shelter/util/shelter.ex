defmodule Shelter.Util.CreateDeta do
  alias Shelter.Shelterlocations.Shelterlocation
  alias Shelter.Shelterlocations
  def readcsv(filename) do
    {state, deta} = File.read(filename)
    case state do
      :ok -> trimcsv(deta)
      :error -> "ファイルが読み込まれませんでした。"
    end
  end

  def trimcsv(deta) do
    [column | shelter_deta] = deta
    |> String.split("\r\n")
    |> Enum.map(&String.replace(&1, "\uFEFF", ""))
    |> Enum.map(&String.split(&1, ","))

    Enum.map(shelter_deta, &Enum.into(Enum.zip([:shelterName, :governmentCode, :prefectures, :designatedWardCity, :streetAddress, :lat, :long], &1), %{}))
    |> Enum.map(&Shelterlocations.create_shelterlocation(&1))
  end

  def main do
    readcsv("assets/130001_evacuation_center.csv")
  end
end
