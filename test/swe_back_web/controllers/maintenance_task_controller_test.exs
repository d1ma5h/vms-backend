defmodule SweBackWeb.MaintenanceTaskControllerTest do
  use SweBackWeb.ConnCase

  import SweBack.MaintenanceTasksFixtures

  alias SweBack.MaintenanceTasks.MaintenanceTask

  @create_attrs %{
    completion_date: ~D[2023-11-23],
    description: "some description",
    maintenance_cost: 120.5,
    scheduled_date: ~D[2023-11-23],
    status: "some status"
  }
  @update_attrs %{
    completion_date: ~D[2023-11-24],
    description: "some updated description",
    maintenance_cost: 456.7,
    scheduled_date: ~D[2023-11-24],
    status: "some updated status"
  }
  @invalid_attrs %{completion_date: nil, description: nil, maintenance_cost: nil, scheduled_date: nil, status: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all maintenance_tasks", %{conn: conn} do
      conn = get(conn, ~p"/api/maintenance_tasks")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create maintenance_task" do
    test "renders maintenance_task when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/maintenance_tasks", maintenance_task: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/maintenance_tasks/#{id}")

      assert %{
               "id" => ^id,
               "completion_date" => "2023-11-23",
               "description" => "some description",
               "maintenance_cost" => 120.5,
               "scheduled_date" => "2023-11-23",
               "status" => "some status"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/maintenance_tasks", maintenance_task: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update maintenance_task" do
    setup [:create_maintenance_task]

    test "renders maintenance_task when data is valid", %{conn: conn, maintenance_task: %MaintenanceTask{id: id} = maintenance_task} do
      conn = put(conn, ~p"/api/maintenance_tasks/#{maintenance_task}", maintenance_task: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/maintenance_tasks/#{id}")

      assert %{
               "id" => ^id,
               "completion_date" => "2023-11-24",
               "description" => "some updated description",
               "maintenance_cost" => 456.7,
               "scheduled_date" => "2023-11-24",
               "status" => "some updated status"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, maintenance_task: maintenance_task} do
      conn = put(conn, ~p"/api/maintenance_tasks/#{maintenance_task}", maintenance_task: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete maintenance_task" do
    setup [:create_maintenance_task]

    test "deletes chosen maintenance_task", %{conn: conn, maintenance_task: maintenance_task} do
      conn = delete(conn, ~p"/api/maintenance_tasks/#{maintenance_task}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/maintenance_tasks/#{maintenance_task}")
      end
    end
  end

  defp create_maintenance_task(_) do
    maintenance_task = maintenance_task_fixture()
    %{maintenance_task: maintenance_task}
  end
end
