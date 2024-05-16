defmodule SweBack.DriversFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SweBack.Drivers` context.
  """

  @doc """
  Generate a driver.
  """
  def driver_fixture(attrs \\ %{}) do
    {:ok, driver} =
      attrs
      |> Enum.into(%{
        address: "some address",
        driving_license_code: "some driving_license_code",
        email: "some email",
        government_id: "some government_id",
        middle_name: "some middle_name",
        name: "some name",
        phone_number: "some phone_number",
        surname: "some surname"
      })
      |> SweBack.Drivers.create_driver()

    driver
  end
end
