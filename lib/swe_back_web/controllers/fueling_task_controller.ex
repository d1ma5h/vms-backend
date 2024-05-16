defmodule SweBackWeb.FuelingTaskController do
  use SweBackWeb, :controller

  alias SweBack.FuelingTasks
  alias SweBack.FuelingTasks.FuelingTask

  action_fallback SweBackWeb.FallbackController

  def index(conn, _params) do
    fueling_tasks = FuelingTasks.list_fueling_tasks()
    render(conn, :index, fueling_tasks: fueling_tasks)
  end

  def create(conn, %{"fueling_task" => fueling_task_params}) do
    with {:ok, %FuelingTask{} = fueling_task} <- FuelingTasks.create_fueling_task(fueling_task_params) do
      conn
      |> put_status(:created)
      |> render(:show, fueling_task: fueling_task)
    end
  end

  def show(conn, %{"id" => id}) do
    fueling_task = FuelingTasks.get_fueling_task!(id)
    render(conn, :show, fueling_task: fueling_task)
  end

  def update(conn, %{"id" => id, "fueling_task" => fueling_task_params}) do
    fueling_task = FuelingTasks.get_fueling_task!(id)

    with {:ok, %FuelingTask{} = fueling_task} <- FuelingTasks.update_fueling_task(fueling_task, fueling_task_params) do
      render(conn, :show, fueling_task: fueling_task)
    end
  end

  def delete(conn, %{"id" => id}) do
    fueling_task = FuelingTasks.get_fueling_task!(id)

    with {:ok, %FuelingTask{}} <- FuelingTasks.delete_fueling_task(fueling_task) do
      send_resp(conn, :no_content, "")
    end
  end
end
