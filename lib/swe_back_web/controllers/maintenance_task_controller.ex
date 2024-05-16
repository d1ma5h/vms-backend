defmodule SweBackWeb.MaintenanceTaskController do
  use SweBackWeb, :controller

  alias SweBack.MaintenanceTasks
  alias SweBack.MaintenanceTasks.MaintenanceTask

  action_fallback SweBackWeb.FallbackController

  def index(conn, _params) do
    maintenance_tasks = MaintenanceTasks.list_maintenance_tasks()
    render(conn, :index, maintenance_tasks: maintenance_tasks)
  end

  def create(conn, %{"maintenance_task" => maintenance_task_params}) do
    with {:ok, %MaintenanceTask{} = maintenance_task} <- MaintenanceTasks.create_maintenance_task(maintenance_task_params) do
      conn
      |> put_status(:created)
      |> render(:show, maintenance_task: maintenance_task)
    end
  end

  def show(conn, %{"id" => id}) do
    maintenance_task = MaintenanceTasks.get_maintenance_task!(id)
    render(conn, :show, maintenance_task: maintenance_task)
  end

  def update(conn, %{"id" => id, "maintenance_task" => maintenance_task_params}) do
    maintenance_task = MaintenanceTasks.get_maintenance_task!(id)

    with {:ok, %MaintenanceTask{} = maintenance_task} <- MaintenanceTasks.update_maintenance_task(maintenance_task, maintenance_task_params) do
      render(conn, :show, maintenance_task: maintenance_task)
    end
  end

  def delete(conn, %{"id" => id}) do
    maintenance_task = MaintenanceTasks.get_maintenance_task!(id)

    with {:ok, %MaintenanceTask{}} <- MaintenanceTasks.delete_maintenance_task(maintenance_task) do
      send_resp(conn, :no_content, "")
    end
  end
end
