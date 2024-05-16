defmodule SweBackWeb.MaintenanceTaskJSON do
  alias SweBack.MaintenanceTasks.MaintenanceTask

  @doc """
  Renders a list of maintenance_tasks.
  """
  def index(%{maintenance_tasks: maintenance_tasks}) do
    %{data: for(maintenance_task <- maintenance_tasks, do: data(maintenance_task))}
  end

  @doc """
  Renders a single maintenance_task.
  """
  def show(%{maintenance_task: maintenance_task}) do
    %{data: data(maintenance_task)}
  end

  defp data(%MaintenanceTask{} = maintenance_task) do
    %{
      id: maintenance_task.id,
      description: maintenance_task.description,
      status: maintenance_task.status,
      scheduled_date: maintenance_task.scheduled_date,
      completion_date: maintenance_task.completion_date,
      maintenance_cost: maintenance_task.maintenance_cost,
      maintenance_person_id: maintenance_task.maintenance_person_id,
      vehicle_id: maintenance_task.vehicle_id
    }
  end
end
