defmodule ShelterWeb.ShelterlocationControllerTest do
  use ShelterWeb.ConnCase

  alias Shelter.Shelterlocations

  @create_attrs %{sheltername: "some sheltername"}
  @update_attrs %{sheltername: "some updated sheltername"}
  @invalid_attrs %{sheltername: nil}

  def fixture(:shelterlocation) do
    {:ok, shelterlocation} = Shelterlocations.create_shelterlocation(@create_attrs)
    shelterlocation
  end

  describe "index" do
    test "lists all shelterlocation", %{conn: conn} do
      conn = get(conn, Routes.shelterlocation_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Shelterlocation"
    end
  end

  describe "new shelterlocation" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.shelterlocation_path(conn, :new))
      assert html_response(conn, 200) =~ "New Shelterlocation"
    end
  end

  describe "create shelterlocation" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.shelterlocation_path(conn, :create), shelterlocation: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.shelterlocation_path(conn, :show, id)

      conn = get(conn, Routes.shelterlocation_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Shelterlocation"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.shelterlocation_path(conn, :create), shelterlocation: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Shelterlocation"
    end
  end

  describe "edit shelterlocation" do
    setup [:create_shelterlocation]

    test "renders form for editing chosen shelterlocation", %{conn: conn, shelterlocation: shelterlocation} do
      conn = get(conn, Routes.shelterlocation_path(conn, :edit, shelterlocation))
      assert html_response(conn, 200) =~ "Edit Shelterlocation"
    end
  end

  describe "update shelterlocation" do
    setup [:create_shelterlocation]

    test "redirects when data is valid", %{conn: conn, shelterlocation: shelterlocation} do
      conn = put(conn, Routes.shelterlocation_path(conn, :update, shelterlocation), shelterlocation: @update_attrs)
      assert redirected_to(conn) == Routes.shelterlocation_path(conn, :show, shelterlocation)

      conn = get(conn, Routes.shelterlocation_path(conn, :show, shelterlocation))
      assert html_response(conn, 200) =~ "some updated sheltername"
    end

    test "renders errors when data is invalid", %{conn: conn, shelterlocation: shelterlocation} do
      conn = put(conn, Routes.shelterlocation_path(conn, :update, shelterlocation), shelterlocation: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Shelterlocation"
    end
  end

  describe "delete shelterlocation" do
    setup [:create_shelterlocation]

    test "deletes chosen shelterlocation", %{conn: conn, shelterlocation: shelterlocation} do
      conn = delete(conn, Routes.shelterlocation_path(conn, :delete, shelterlocation))
      assert redirected_to(conn) == Routes.shelterlocation_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.shelterlocation_path(conn, :show, shelterlocation))
      end
    end
  end

  defp create_shelterlocation(_) do
    shelterlocation = fixture(:shelterlocation)
    %{shelterlocation: shelterlocation}
  end
end
