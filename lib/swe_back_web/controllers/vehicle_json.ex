defmodule SweBackWeb.VehicleJSON do
  alias SweBack.Vehicles.Vehicle

  @doc """
  Renders a list of vehicles.
  """
  def index(%{vehicles: vehicles}) do
    %{data: for(vehicle <- vehicles, do: data(vehicle))}
  end

  @doc """
  Renders a single vehicle.
  """
  def show(%{vehicle: vehicle}) do
    %{data: data(vehicle)}
  end

  defp data(%Vehicle{} = vehicle) do
    %{
      id: vehicle.id,
      make: vehicle.make,
      model: vehicle.model,
      year: vehicle.year,
      license_plate: vehicle.license_plate,
      type: vehicle.type,
      sitting_capacity: vehicle.sitting_capacity,
      status: vehicle.status,
      latitude: vehicle.latitude,
      longitude: vehicle.longitude
    }
  end
end
