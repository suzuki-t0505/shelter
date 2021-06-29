defmodule Shelter.Repo.Migrations.CreateShelterlocation do
  use Ecto.Migration

  def change do
    create table(:shelterlocation) do
      add :shelterName, :string
      add :governmentCode, :integer
      add :prefectures, :string
      add :designatedWardCity, :string
      add :streetAddress, :string
      add :lat, :float
      add :long, :float

      timestamps()
    end

  end
end
