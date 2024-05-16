defmodule SweBack.MaintenanceTasksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SweBack.MaintenanceTasks` context.
  """

  @doc """
  Generate a maintenance_task.
  """
  def maintenance_task_fixture(attrs \\ %{}) do
    {:ok, maintenance_task} =
      attrs
      |> Enum.into(%{
        completion_date: ~D[2023-11-23],
        description: "some description",
        maintenance_cost: 120.5,
        scheduled_date: ~D[2023-11-23],
        status: "some status"
      })
      |> SweBack.MaintenanceTasks.create_maintenance_task()

    maintenance_task
  end
end
