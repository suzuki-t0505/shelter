defmodule ShelterWeb.ShelterlocationController do
  use ShelterWeb, :controller

  alias Shelter.Shelterlocations
  alias Shelter.Shelterlocations.Shelterlocation

  def index(conn, params) do
    IO.puts("----------------------")
    IO.inspect(params)
    IO.puts("----------------------")

    shelterlocation = Shelterlocations.list_shelterlocation()
    render(conn, "index.html", shelterlocation: shelterlocation)
  end

  def new(conn, _params) do
    changeset = Shelterlocations.change_shelterlocation(%Shelterlocation{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"shelterlocation" => shelterlocation_params}) do
    case Shelterlocations.create_shelterlocation(shelterlocation_params) do
      {:ok, shelterlocation} ->
        conn
        |> put_flash(:info, "Shelterlocation created successfully.")
        |> redirect(to: Routes.shelterlocation_path(conn, :show, shelterlocation))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    shelterlocation = Shelterlocations.get_shelterlocation!(id)
    render(conn, "show.html", shelterlocation: shelterlocation)
  end

  def edit(conn, %{"id" => id}) do
    shelterlocation = Shelterlocations.get_shelterlocation!(id)
    changeset = Shelterlocations.change_shelterlocation(shelterlocation)
    render(conn, "edit.html", shelterlocation: shelterlocation, changeset: changeset)
  end

  def update(conn, %{"id" => id, "shelterlocation" => shelterlocation_params}) do
    shelterlocation = Shelterlocations.get_shelterlocation!(id)

    case Shelterlocations.update_shelterlocation(shelterlocation, shelterlocation_params) do
      {:ok, shelterlocation} ->
        conn
        |> put_flash(:info, "Shelterlocation updated successfully.")
        |> redirect(to: Routes.shelterlocation_path(conn, :show, shelterlocation))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", shelterlocation: shelterlocation, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    shelterlocation = Shelterlocations.get_shelterlocation!(id)
    {:ok, _shelterlocation} = Shelterlocations.delete_shelterlocation(shelterlocation)

    conn
    |> put_flash(:info, "Shelterlocation deleted successfully.")
    |> redirect(to: Routes.shelterlocation_path(conn, :index))
  end
end
