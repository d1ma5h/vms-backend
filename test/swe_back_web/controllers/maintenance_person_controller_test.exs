defmodule SweBackWeb.MaintenancePersonControllerTest do
  use SweBackWeb.ConnCase

  import SweBack.MaintenancePersonsFixtures

  alias SweBack.MaintenancePersons.MaintenancePerson

  @create_attrs %{
    address: "some address",
    email: "some email",
    middle_name: "some middle_name",
    name: "some name",
    phone_number: "some phone_number",
    surname: "some surname"
  }
  @update_attrs %{
    address: "some updated address",
    email: "some updated email",
    middle_name: "some updated middle_name",
    name: "some updated name",
    phone_number: "some updated phone_number",
    surname: "some updated surname"
  }
  @invalid_attrs %{address: nil, email: nil, middle_name: nil, name: nil, phone_number: nil, surname: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all maintenance_persons", %{conn: conn} do
      conn = get(conn, ~p"/api/maintenance_persons")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create maintenance_person" do
    test "renders maintenance_person when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/maintenance_persons", maintenance_person: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/maintenance_persons/#{id}")

      assert %{
               "id" => ^id,
               "address" => "some address",
               "email" => "some email",
               "middle_name" => "some middle_name",
               "name" => "some name",
               "phone_number" => "some phone_number",
               "surname" => "some surname"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/maintenance_persons", maintenance_person: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update maintenance_person" do
    setup [:create_maintenance_person]

    test "renders maintenance_person when data is valid", %{conn: conn, maintenance_person: %MaintenancePerson{id: id} = maintenance_person} do
      conn = put(conn, ~p"/api/maintenance_persons/#{maintenance_person}", maintenance_person: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/maintenance_persons/#{id}")

      assert %{
               "id" => ^id,
               "address" => "some updated address",
               "email" => "some updated email",
               "middle_name" => "some updated middle_name",
               "name" => "some updated name",
               "phone_number" => "some updated phone_number",
               "surname" => "some updated surname"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, maintenance_person: maintenance_person} do
      conn = put(conn, ~p"/api/maintenance_persons/#{maintenance_person}", maintenance_person: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete maintenance_person" do
    setup [:create_maintenance_person]

    test "deletes chosen maintenance_person", %{conn: conn, maintenance_person: maintenance_person} do
      conn = delete(conn, ~p"/api/maintenance_persons/#{maintenance_person}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/maintenance_persons/#{maintenance_person}")
      end
    end
  end

  defp create_maintenance_person(_) do
    maintenance_person = maintenance_person_fixture()
    %{maintenance_person: maintenance_person}
  end
end
