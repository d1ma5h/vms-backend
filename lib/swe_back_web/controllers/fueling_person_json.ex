defmodule SweBackWeb.FuelingPersonJSON do
  alias SweBack.FuelingPersons.FuelingPerson

  @doc """
  Renders a list of fueling_persons.
  """
  def index(%{fueling_persons: fueling_persons}) do
    %{data: for(fueling_person <- fueling_persons, do: data(fueling_person))}
  end

  @doc """
  Renders a single fueling_person.
  """
  def show(%{fueling_person: fueling_person}) do
    %{data: data(fueling_person)}
  end

  defp data(%FuelingPerson{} = fueling_person) do
    %{
      id: fueling_person.id,
      name: fueling_person.name,
      surname: fueling_person.surname,
      middle_name: fueling_person.middle_name,
      address: fueling_person.address,
      phone_number: fueling_person.phone_number,
      email: fueling_person.email
    }
  end
end
