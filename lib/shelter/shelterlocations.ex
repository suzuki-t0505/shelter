defmodule Shelter.Shelterlocations do
  @moduledoc """
  The Shelterlocations context.
  """

  import Ecto.Query, warn: false
  alias Shelter.Repo

  alias Shelter.Shelterlocations.Shelterlocation

  @doc """
  Returns the list of shelterlocation.

  ## Examples

      iex> list_shelterlocation()
      [%Shelterlocation{}, ...]

  """
  def list_shelterlocation do
    Repo.all(Shelterlocation)
  end


  @doc """
  Gets a single shelterlocation.

  Raises `Ecto.NoResultsError` if the Shelterlocation does not exist.

  ## Examples

      iex> get_shelterlocation!(123)
      %Shelterlocation{}

      iex> get_shelterlocation!(456)
      ** (Ecto.NoResultsError)

  """
  def get_shelterlocation!(id), do: Repo.get!(Shelterlocation, id)

  @doc """
  Creates a shelterlocation.

  ## Examples

      iex> create_shelterlocation(%{field: value})
      {:ok, %Shelterlocation{}}

      iex> create_shelterlocation(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_shelterlocation(attrs \\ %{}) do
    %Shelterlocation{}
    |> Shelterlocation.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a shelterlocation.

  ## Examples

      iex> update_shelterlocation(shelterlocation, %{field: new_value})
      {:ok, %Shelterlocation{}}

      iex> update_shelterlocation(shelterlocation, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_shelterlocation(%Shelterlocation{} = shelterlocation, attrs) do
    shelterlocation
    |> Shelterlocation.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a shelterlocation.

  ## Examples

      iex> delete_shelterlocation(shelterlocation)
      {:ok, %Shelterlocation{}}

      iex> delete_shelterlocation(shelterlocation)
      {:error, %Ecto.Changeset{}}

  """
  def delete_shelterlocation(%Shelterlocation{} = shelterlocation) do
    Repo.delete(shelterlocation)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking shelterlocation changes.

  ## Examples

      iex> change_shelterlocation(shelterlocation)
      %Ecto.Changeset{data: %Shelterlocation{}}

  """
  def change_shelterlocation(%Shelterlocation{} = shelterlocation, attrs \\ %{}) do
    Shelterlocation.changeset(shelterlocation, attrs)
  end
end
