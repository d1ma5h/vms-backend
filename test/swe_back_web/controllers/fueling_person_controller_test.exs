defmodule SweBackWeb.FuelingPersonControllerTest do
  use SweBackWeb.ConnCase

  import SweBack.FuelingPersonsFixtures

  alias SweBack.FuelingPersons.FuelingPerson

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
    test "lists all fueling_persons", %{conn: conn} do
      conn = get(conn, ~p"/api/fueling_persons")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create fueling_person" do
    test "renders fueling_person when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/fueling_persons", fueling_person: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/fueling_persons/#{id}")

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
      conn = post(conn, ~p"/api/fueling_persons", fueling_person: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update fueling_person" do
    setup [:create_fueling_person]

    test "renders fueling_person when data is valid", %{conn: conn, fueling_person: %FuelingPerson{id: id} = fueling_person} do
      conn = put(conn, ~p"/api/fueling_persons/#{fueling_person}", fueling_person: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/fueling_persons/#{id}")

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

    test "renders errors when data is invalid", %{conn: conn, fueling_person: fueling_person} do
      conn = put(conn, ~p"/api/fueling_persons/#{fueling_person}", fueling_person: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete fueling_person" do
    setup [:create_fueling_person]

    test "deletes chosen fueling_person", %{conn: conn, fueling_person: fueling_person} do
      conn = delete(conn, ~p"/api/fueling_persons/#{fueling_person}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/fueling_persons/#{fueling_person}")
      end
    end
  end

  defp create_fueling_person(_) do
    fueling_person = fueling_person_fixture()
    %{fueling_person: fueling_person}
  end
end
