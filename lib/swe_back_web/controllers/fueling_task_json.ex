defmodule SweBackWeb.FuelingTaskJSON do
  alias SweBack.FuelingTasks.FuelingTask

  @doc """
  Renders a list of fueling_tasks.
  """
  def index(%{fueling_tasks: fueling_tasks}) do
    %{data: for(fueling_task <- fueling_tasks, do: data(fueling_task))}
  end

  @doc """
  Renders a single fueling_task.
  """
  def show(%{fueling_task: fueling_task}) do
    %{data: data(fueling_task)}
  end

  defp data(%FuelingTask{} = fueling_task) do
    %{
      id: fueling_task.id,
      date_and_time: fueling_task.date_and_time,
      fuel_quantity: fueling_task.fuel_quantity,
      total_cost: fueling_task.total_cost,
      gas_station_name: fueling_task.gas_station_name,
      image_links: fueling_task.image_links,
      driver_id: fueling_task.driver_id,
      vehicle_id: fueling_task.vehicle_id,
      fueling_person_id: fueling_task.fueling_person_id,
      status: fueling_task.status
    }
  end
end
