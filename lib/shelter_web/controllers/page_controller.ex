defmodule ShelterWeb.PageController do
  use ShelterWeb, :controller

  def index(conn, params) do
    IO.puts("----------------------")
    IO.inspect(params)
    IO.puts("----------------------")
    list = Shelter.Shelterlocations.list_shelterlocation

    street =
    if params == %{} do
      Map.put(params, "street", "練馬区")
    else
      params
    end

    # if params["streetAddres"] != "" do
    #   deta = Shelter.Address.get_coordinate(params["streetAddres"])

    #   [head | tail] = String.split(params["streetAddres"], "都")
    #   cond do
    #     String.contains?(tail, "区") == true -> String.split(tail, "区") |> Enum.at(0) <> "区"
    #     String.contains?(tail, "市") == true ->
    #     String.contains?(tail, "町") == true ->
    #     String.contains?(tail, "村") == true ->
    #   end

    # else
      render(conn, "index.html", shelterlocation: list, params: street["street"])
    #end
  end

  def search(conn, params) do


    IO.puts("-------params--------")
    IO.inspect(params)
    IO.puts("-------params--------")

    params =
    if params == %{} do
      Map.put(params, "street", "東京都墨田区押上1-1-2")
    else
      params
    end

    street =
    if params == %{} do
      "墨田区"
    else
      cond do
        String.contains?(params["street"], "区") == true -> Enum.at(String.split(params["street"], ["都", "区"]), 1) <> "区"
        String.contains?(params["street"], "市") == true -> Enum.at(String.split(params["street"], ["都", "市"]), 1) <> "市"
        String.contains?(params["street"], "町") == true -> Enum.at(String.split(params["street"], ["都", "町"]), 1) <> "町"
        String.contains?(params["street"], "村") == true -> Enum.at(String.split(params["street"], ["都", "村"]), 1) <> "村"
      end
    end

    IO.inspect(street)

    location =
    if params == %{} do
      Shelter.Util.Address.get_coordinate("東京都墨田区押上1-1-2")
    else
      Shelter.Util.Address.get_coordinate(params["street"])
    end

    IO.puts("----------location----------")
    IO.inspect(location)

    list = Shelter.Shelterlocations.list_shelterlocation



    render(conn, "search.html", shelterlocation: list, params: street, streetAddres: params["street"], location: location)
  end

end
