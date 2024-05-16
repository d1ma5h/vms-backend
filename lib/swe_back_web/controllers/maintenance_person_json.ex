defmodule SweBackWeb.MaintenancePersonJSON do
  alias SweBack.MaintenancePersons.MaintenancePerson

  @doc """
  Renders a list of maintenance_persons.
  """
  def index(%{maintenance_persons: maintenance_persons}) do
    %{data: for(maintenance_person <- maintenance_persons, do: data(maintenance_person))}
  end

  @doc """
  Renders a single maintenance_person.
  """
  def show(%{maintenance_person: maintenance_person}) do
    %{data: data(maintenance_person)}
  end

  defp data(%MaintenancePerson{} = maintenance_person) do
    %{
      id: maintenance_person.id,
      name: maintenance_person.name,
      surname: maintenance_person.surname,
      middle_name: maintenance_person.middle_name,
      address: maintenance_person.address,
      phone_number: maintenance_person.phone_number,
      email: maintenance_person.email
    }
  end
end
