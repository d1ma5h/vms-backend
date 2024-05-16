defmodule SweBackWeb.DriverTaskController do
  use SweBackWeb, :controller

  alias SweBack.DriverTasks
  alias SweBack.DriverTasks.DriverTask

  action_fallback SweBackWeb.FallbackController

  def index(conn, _params) do
    driver_tasks = DriverTasks.list_driver_tasks()
    render(conn, :index, driver_tasks: driver_tasks)
  end

  def create(conn, %{"driver_task" => driver_task_params}) do
    with {:ok, %DriverTask{} = driver_task} <- DriverTasks.create_driver_task(driver_task_params) do
      conn
      |> put_status(:created)
      |> render(:show, driver_task: driver_task)
    end
  end

  def show(conn, %{"id" => id}) do
    driver_task = DriverTasks.get_driver_task!(id)
    render(conn, :show, driver_task: driver_task)
  end

  def update(conn, %{"id" => id, "driver_task" => driver_task_params}) do
    driver_task = DriverTasks.get_driver_task!(id)

    with {:ok, %DriverTask{} = driver_task} <- DriverTasks.update_driver_task(driver_task, driver_task_params) do
      render(conn, :show, driver_task: driver_task)
    end
  end

  def delete(conn, %{"id" => id}) do
    driver_task = DriverTasks.get_driver_task!(id)

    with {:ok, %DriverTask{}} <- DriverTasks.delete_driver_task(driver_task) do
      send_resp(conn, :no_content, "")
    end
  end
end
