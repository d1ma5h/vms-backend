defmodule SweBack.UsersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SweBack.Users` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        password_hash: "some password_hash",
        username: "some username"
      })
      |> SweBack.Users.create_user()

    user
  end
end
