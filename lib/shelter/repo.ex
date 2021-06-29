defmodule Shelter.Repo do
  use Ecto.Repo,
    otp_app: :shelter,
    adapter: Ecto.Adapters.Postgres
end
