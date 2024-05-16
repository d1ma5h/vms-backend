defmodule SweBack.FuelingTasksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SweBack.FuelingTasks` context.
  """

  @doc """
  Generate a fueling_task.
  """
  def fueling_task_fixture(attrs \\ %{}) do
    {:ok, fueling_task} =
      attrs
      |> Enum.into(%{
        date_and_time: ~N[2023-11-23 18:49:00],
        fuel_quantity: "120.5",
        gas_station_name: "some gas_station_name",
        image_links: "some image_links",
        total_cost: "120.5"
      })
      |> SweBack.FuelingTasks.create_fueling_task()

    fueling_task
  end
end
