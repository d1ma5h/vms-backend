defmodule SweBack.AdminsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SweBack.Admins` context.
  """

  @doc """
  Generate a admin.
  """
  def admin_fixture(attrs \\ %{}) do
    {:ok, admin} =
      attrs
      |> Enum.into(%{
        address: "some address",
        email: "some email",
        middle_name: "some middle_name",
        name: "some name",
        phone_number: "some phone_number",
        surname: "some surname"
      })
      |> SweBack.Admins.create_admin()

    admin
  end
end
