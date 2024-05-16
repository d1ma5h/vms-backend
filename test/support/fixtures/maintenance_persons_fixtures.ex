defmodule SweBack.MaintenancePersonsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SweBack.MaintenancePersons` context.
  """

  @doc """
  Generate a maintenance_person.
  """
  def maintenance_person_fixture(attrs \\ %{}) do
    {:ok, maintenance_person} =
      attrs
      |> Enum.into(%{
        address: "some address",
        email: "some email",
        middle_name: "some middle_name",
        name: "some name",
        phone_number: "some phone_number",
        surname: "some surname"
      })
      |> SweBack.MaintenancePersons.create_maintenance_person()

    maintenance_person
  end
end
