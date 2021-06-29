defmodule Shelter.Shelterlocations.Shelterlocation do
  use Ecto.Schema
  import Ecto.Changeset

  schema "shelterlocation" do
    field :shelterName, :string
    field :governmentCode, :integer
    field :prefectures, :string
    field :designatedWardCity, :string
    field :streetAddress, :string
    field :lat, :float
    field :long, :float

    timestamps()
  end

  @doc false
  def changeset(shelterlocation, attrs) do
    shelterlocation
    |> cast(attrs, [:shelterName, :governmentCode, :prefectures, :designatedWardCity, :streetAddress, :lat, :long])
    |> validate_required([:shelterName, :governmentCode, :prefectures, :designatedWardCity, :streetAddress, :lat, :long])
  end
end
