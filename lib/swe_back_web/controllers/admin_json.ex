defmodule SweBackWeb.AdminJSON do
  alias SweBack.Admins.Admin

  @doc """
  Renders a list of admins.
  """
  def index(%{admins: admins}) do
    %{data: for(admin <- admins, do: data(admin))}
  end

  @doc """
  Renders a single admin.
  """
  def show(%{admin: admin}) do
    %{data: data(admin)}
  end

  defp data(%Admin{} = admin) do
    %{
      id: admin.id,
      name: admin.name,
      surname: admin.surname,
      middle_name: admin.middle_name,
      address: admin.address,
      phone_number: admin.phone_number,
      email: admin.email
    }
  end
end
