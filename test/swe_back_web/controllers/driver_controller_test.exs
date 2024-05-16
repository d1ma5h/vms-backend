defmodule SweBackWeb.DriverControllerTest do
  use SweBackWeb.ConnCase

  import SweBack.DriversFixtures

  alias SweBack.Drivers.Driver

  @create_attrs %{
    address: "some address",
    driving_license_code: "some driving_license_code",
    email: "some email",
    government_id: "some government_id",
    middle_name: "some middle_name",
    name: "some name",
    phone_number: "some phone_number",
    surname: "some surname"
  }
  @update_attrs %{
    address: "some updated address",
    driving_license_code: "some updated driving_license_code",
    email: "some updated email",
    government_id: "some updated government_id",
    middle_name: "some updated middle_name",
    name: "some updated name",
    phone_number: "some updated phone_number",
    surname: "some updated surname"
  }
  @invalid_attrs %{address: nil, driving_license_code: nil, email: nil, government_id: nil, middle_name: nil, name: nil, phone_number: nil, surname: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all drivers", %{conn: conn} do
      conn = get(conn, ~p"/api/drivers")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create driver" do
    test "renders driver when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/drivers", driver: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/drivers/#{id}")

      assert %{
               "id" => ^id,
               "address" => "some address",
               "driving_license_code" => "some driving_license_code",
               "email" => "some email",
               "government_id" => "some government_id",
               "middle_name" => "some middle_name",
               "name" => "some name",
               "phone_number" => "some phone_number",
               "surname" => "some surname"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/drivers", driver: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update driver" do
    setup [:create_driver]

    test "renders driver when data is valid", %{conn: conn, driver: %Driver{id: id} = driver} do
      conn = put(conn, ~p"/api/drivers/#{driver}", driver: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/drivers/#{id}")

      assert %{
               "id" => ^id,
               "address" => "some updated address",
               "driving_license_code" => "some updated driving_license_code",
               "email" => "some updated email",
               "government_id" => "some updated government_id",
               "middle_name" => "some updated middle_name",
               "name" => "some updated name",
               "phone_number" => "some updated phone_number",
               "surname" => "some updated surname"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, driver: driver} do
      conn = put(conn, ~p"/api/drivers/#{driver}", driver: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete driver" do
    setup [:create_driver]

    test "deletes chosen driver", %{conn: conn, driver: driver} do
      conn = delete(conn, ~p"/api/drivers/#{driver}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/drivers/#{driver}")
      end
    end
  end

  defp create_driver(_) do
    driver = driver_fixture()
    %{driver: driver}
  end
end
