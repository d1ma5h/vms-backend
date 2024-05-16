defmodule SweBackWeb.DriverJSON do
  alias SweBack.Drivers.Driver

  @doc """
  Renders a list of drivers.
  """
  def index(%{drivers: drivers}) do
    %{data: for(driver <- drivers, do: data(driver))}
  end

  @doc """
  Renders a single driver.
  """
  def show(%{driver: driver}) do
    %{data: data(driver)}
  end

  defp data(%Driver{} = driver) do
    %{
      id: driver.id,
      government_id: driver.government_id,
      name: driver.name,
      surname: driver.surname,
      middle_name: driver.middle_name,
      address: driver.address,
      phone_number: driver.phone_number,
      email: driver.email,
      driving_license_code: driver.driving_license_code,
      vehicle_id: driver.vehicle_id
    }
  end
end
