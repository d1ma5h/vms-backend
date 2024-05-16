defmodule SweBackWeb.UserJSON do
  alias SweBack.Users.User

  @doc """
  Renders a list of users.
  """
  def index(%{users: users}) do
    %{data: for(user <- users, do: data(user))}
  end

  @doc """
  Renders a single user.
  """
  def show(%{user: user}) do
    %{data: data(user)}
  end

  defp data(%User{} = user) do
    %{
      id: user.id,
      username: user.username,
      password_hash: user.password_hash,
      admin_id: user.admin_id,
      maintenance_id: user.maintenance_id,
      fuelingperson_id: user.fuelingperson_id,
      driver_id: user.driver_id
    }
  end
end
