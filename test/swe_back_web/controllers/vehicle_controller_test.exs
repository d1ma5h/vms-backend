defmodule SweBackWeb.VehicleControllerTest do
  use SweBackWeb.ConnCase

  import SweBack.VehiclesFixtures

  alias SweBack.Vehicles.Vehicle

  @create_attrs %{
    license_plate: "some license_plate",
    make: "some make",
    model: "some model",
    sitting_capacity: 42,
    status: "some status",
    type: "some type",
    year: 42
  }
  @update_attrs %{
    license_plate: "some updated license_plate",
    make: "some updated make",
    model: "some updated model",
    sitting_capacity: 43,
    status: "some updated status",
    type: "some updated type",
    year: 43
  }
  @invalid_attrs %{license_plate: nil, make: nil, model: nil, sitting_capacity: nil, status: nil, type: nil, year: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all vehicles", %{conn: conn} do
      conn = get(conn, ~p"/api/vehicles")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create vehicle" do
    test "renders vehicle when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/vehicles", vehicle: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/vehicles/#{id}")

      assert %{
               "id" => ^id,
               "license_plate" => "some license_plate",
               "make" => "some make",
               "model" => "some model",
               "sitting_capacity" => 42,
               "status" => "some status",
               "type" => "some type",
               "year" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/vehicles", vehicle: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update vehicle" do
    setup [:create_vehicle]

    test "renders vehicle when data is valid", %{conn: conn, vehicle: %Vehicle{id: id} = vehicle} do
      conn = put(conn, ~p"/api/vehicles/#{vehicle}", vehicle: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/vehicles/#{id}")

      assert %{
               "id" => ^id,
               "license_plate" => "some updated license_plate",
               "make" => "some updated make",
               "model" => "some updated model",
               "sitting_capacity" => 43,
               "status" => "some updated status",
               "type" => "some updated type",
               "year" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, vehicle: vehicle} do
      conn = put(conn, ~p"/api/vehicles/#{vehicle}", vehicle: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete vehicle" do
    setup [:create_vehicle]

    test "deletes chosen vehicle", %{conn: conn, vehicle: vehicle} do
      conn = delete(conn, ~p"/api/vehicles/#{vehicle}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/vehicles/#{vehicle}")
      end
    end
  end

  defp create_vehicle(_) do
    vehicle = vehicle_fixture()
    %{vehicle: vehicle}
  end
end
