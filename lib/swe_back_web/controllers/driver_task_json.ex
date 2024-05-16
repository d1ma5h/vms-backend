defmodule SweBackWeb.DriverTaskJSON do
  alias SweBack.DriverTasks.DriverTask

  @doc """
  Renders a list of driver_tasks.
  """
  def index(%{driver_tasks: driver_tasks}) do
    %{data: for(driver_task <- driver_tasks, do: data(driver_task))}
  end

  @doc """
  Renders a single driver_task.
  """
  def show(%{driver_task: driver_task}) do
    %{data: data(driver_task)}
  end

  defp data(%DriverTask{} = driver_task) do
    %{
      id: driver_task.id,
      start_time: driver_task.start_time,
      end_time: driver_task.end_time,
      status: driver_task.status,
      description: driver_task.description,
      route_information: driver_task.route_information,
      driver_id: driver_task.driver_id,
      vehicle_id: driver_task.vehicle_id
    }
  end
end
