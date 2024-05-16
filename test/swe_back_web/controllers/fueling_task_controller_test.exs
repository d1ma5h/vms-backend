defmodule SweBackWeb.FuelingTaskControllerTest do
  use SweBackWeb.ConnCase

  import SweBack.FuelingTasksFixtures

  alias SweBack.FuelingTasks.FuelingTask

  @create_attrs %{
    date_and_time: ~N[2023-11-23 18:49:00],
    fuel_quantity: "120.5",
    gas_station_name: "some gas_station_name",
    image_links: "some image_links",
    total_cost: "120.5"
  }
  @update_attrs %{
    date_and_time: ~N[2023-11-24 18:49:00],
    fuel_quantity: "456.7",
    gas_station_name: "some updated gas_station_name",
    image_links: "some updated image_links",
    total_cost: "456.7"
  }
  @invalid_attrs %{date_and_time: nil, fuel_quantity: nil, gas_station_name: nil, image_links: nil, total_cost: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all fueling_tasks", %{conn: conn} do
      conn = get(conn, ~p"/api/fueling_tasks")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create fueling_task" do
    test "renders fueling_task when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/fueling_tasks", fueling_task: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/fueling_tasks/#{id}")

      assert %{
               "id" => ^id,
               "date_and_time" => "2023-11-23T18:49:00",
               "fuel_quantity" => "120.5",
               "gas_station_name" => "some gas_station_name",
               "image_links" => "some image_links",
               "total_cost" => "120.5"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/fueling_tasks", fueling_task: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update fueling_task" do
    setup [:create_fueling_task]

    test "renders fueling_task when data is valid", %{conn: conn, fueling_task: %FuelingTask{id: id} = fueling_task} do
      conn = put(conn, ~p"/api/fueling_tasks/#{fueling_task}", fueling_task: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/fueling_tasks/#{id}")

      assert %{
               "id" => ^id,
               "date_and_time" => "2023-11-24T18:49:00",
               "fuel_quantity" => "456.7",
               "gas_station_name" => "some updated gas_station_name",
               "image_links" => "some updated image_links",
               "total_cost" => "456.7"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, fueling_task: fueling_task} do
      conn = put(conn, ~p"/api/fueling_tasks/#{fueling_task}", fueling_task: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete fueling_task" do
    setup [:create_fueling_task]

    test "deletes chosen fueling_task", %{conn: conn, fueling_task: fueling_task} do
      conn = delete(conn, ~p"/api/fueling_tasks/#{fueling_task}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/fueling_tasks/#{fueling_task}")
      end
    end
  end

  defp create_fueling_task(_) do
    fueling_task = fueling_task_fixture()
    %{fueling_task: fueling_task}
  end
end
