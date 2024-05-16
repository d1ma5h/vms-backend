defmodule SweBack.FuelingPersonsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SweBack.FuelingPersons` context.
  """

  @doc """
  Generate a fueling_person.
  """
  def fueling_person_fixture(attrs \\ %{}) do
    {:ok, fueling_person} =
      attrs
      |> Enum.into(%{
        address: "some address",
        email: "some email",
        middle_name: "some middle_name",
        name: "some name",
        phone_number: "some phone_number",
        surname: "some surname"
      })
      |> SweBack.FuelingPersons.create_fueling_person()

    fueling_person
  end
end
