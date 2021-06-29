defmodule Shelter.ShelterlocationsTest do
  use Shelter.DataCase

  alias Shelter.Shelterlocations

  describe "shelterlocation" do
    alias Shelter.Shelterlocations.Shelterlocation

    @valid_attrs %{sheltername: "some sheltername"}
    @update_attrs %{sheltername: "some updated sheltername"}
    @invalid_attrs %{sheltername: nil}

    def shelterlocation_fixture(attrs \\ %{}) do
      {:ok, shelterlocation} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Shelterlocations.create_shelterlocation()

      shelterlocation
    end

    test "list_shelterlocation/0 returns all shelterlocation" do
      shelterlocation = shelterlocation_fixture()
      assert Shelterlocations.list_shelterlocation() == [shelterlocation]
    end

    test "get_shelterlocation!/1 returns the shelterlocation with given id" do
      shelterlocation = shelterlocation_fixture()
      assert Shelterlocations.get_shelterlocation!(shelterlocation.id) == shelterlocation
    end

    test "create_shelterlocation/1 with valid data creates a shelterlocation" do
      assert {:ok, %Shelterlocation{} = shelterlocation} = Shelterlocations.create_shelterlocation(@valid_attrs)
      assert shelterlocation.sheltername == "some sheltername"
    end

    test "create_shelterlocation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Shelterlocations.create_shelterlocation(@invalid_attrs)
    end

    test "update_shelterlocation/2 with valid data updates the shelterlocation" do
      shelterlocation = shelterlocation_fixture()
      assert {:ok, %Shelterlocation{} = shelterlocation} = Shelterlocations.update_shelterlocation(shelterlocation, @update_attrs)
      assert shelterlocation.sheltername == "some updated sheltername"
    end

    test "update_shelterlocation/2 with invalid data returns error changeset" do
      shelterlocation = shelterlocation_fixture()
      assert {:error, %Ecto.Changeset{}} = Shelterlocations.update_shelterlocation(shelterlocation, @invalid_attrs)
      assert shelterlocation == Shelterlocations.get_shelterlocation!(shelterlocation.id)
    end

    test "delete_shelterlocation/1 deletes the shelterlocation" do
      shelterlocation = shelterlocation_fixture()
      assert {:ok, %Shelterlocation{}} = Shelterlocations.delete_shelterlocation(shelterlocation)
      assert_raise Ecto.NoResultsError, fn -> Shelterlocations.get_shelterlocation!(shelterlocation.id) end
    end

    test "change_shelterlocation/1 returns a shelterlocation changeset" do
      shelterlocation = shelterlocation_fixture()
      assert %Ecto.Changeset{} = Shelterlocations.change_shelterlocation(shelterlocation)
    end
  end
end
