defmodule SweBack.DriverTasksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SweBack.DriverTasks` context.
  """

  @doc """
  Generate a driver_task.
  """
  def driver_task_fixture(attrs \\ %{}) do
    {:ok, driver_task} =
      attrs
      |> Enum.into(%{
        description: "some description",
        end_time: ~N[2023-11-23 18:24:00],
        route_information: "some route_information",
        start_time: ~N[2023-11-23 18:24:00],
        status: "some status"
      })
      |> SweBack.DriverTasks.create_driver_task()

    driver_task
  end
end
