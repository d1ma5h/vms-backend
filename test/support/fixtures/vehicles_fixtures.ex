defmodule SweBack.VehiclesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SweBack.Vehicles` context.
  """

  @doc """
  Generate a vehicle.
  """
  def vehicle_fixture(attrs \\ %{}) do
    {:ok, vehicle} =
      attrs
      |> Enum.into(%{
        license_plate: "some license_plate",
        make: "some make",
        model: "some model",
        sitting_capacity: 42,
        status: "some status",
        type: "some type",
        year: 42
      })
      |> SweBack.Vehicles.create_vehicle()

    vehicle
  end
end
