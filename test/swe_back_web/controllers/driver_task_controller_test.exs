defmodule SweBackWeb.DriverTaskControllerTest do
  use SweBackWeb.ConnCase

  import SweBack.DriverTasksFixtures

  alias SweBack.DriverTasks.DriverTask

  @create_attrs %{
    description: "some description",
    end_time: ~N[2023-11-23 18:24:00],
    route_information: "some route_information",
    start_time: ~N[2023-11-23 18:24:00],
    status: "some status"
  }
  @update_attrs %{
    description: "some updated description",
    end_time: ~N[2023-11-24 18:24:00],
    route_information: "some updated route_information",
    start_time: ~N[2023-11-24 18:24:00],
    status: "some updated status"
  }
  @invalid_attrs %{description: nil, end_time: nil, route_information: nil, start_time: nil, status: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all driver_tasks", %{conn: conn} do
      conn = get(conn, ~p"/api/driver_tasks")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create driver_task" do
    test "renders driver_task when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/driver_tasks", driver_task: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/driver_tasks/#{id}")

      assert %{
               "id" => ^id,
               "description" => "some description",
               "end_time" => "2023-11-23T18:24:00",
               "route_information" => "some route_information",
               "start_time" => "2023-11-23T18:24:00",
               "status" => "some status"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/driver_tasks", driver_task: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update driver_task" do
    setup [:create_driver_task]

    test "renders driver_task when data is valid", %{conn: conn, driver_task: %DriverTask{id: id} = driver_task} do
      conn = put(conn, ~p"/api/driver_tasks/#{driver_task}", driver_task: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/driver_tasks/#{id}")

      assert %{
               "id" => ^id,
               "description" => "some updated description",
               "end_time" => "2023-11-24T18:24:00",
               "route_information" => "some updated route_information",
               "start_time" => "2023-11-24T18:24:00",
               "status" => "some updated status"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, driver_task: driver_task} do
      conn = put(conn, ~p"/api/driver_tasks/#{driver_task}", driver_task: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete driver_task" do
    setup [:create_driver_task]

    test "deletes chosen driver_task", %{conn: conn, driver_task: driver_task} do
      conn = delete(conn, ~p"/api/driver_tasks/#{driver_task}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/driver_tasks/#{driver_task}")
      end
    end
  end

  defp create_driver_task(_) do
    driver_task = driver_task_fixture()
    %{driver_task: driver_task}
  end
end
