defmodule SweBackWeb.FuelingPersonController do
  use SweBackWeb, :controller

  alias SweBack.FuelingPersons
  alias SweBack.FuelingPersons.FuelingPerson

  action_fallback SweBackWeb.FallbackController

  def index(conn, _params) do
    fueling_persons = FuelingPersons.list_fueling_persons()
    render(conn, :index, fueling_persons: fueling_persons)
  end

  def create(conn, %{"fueling_person" => fueling_person_params}) do
    with {:ok, %FuelingPerson{} = fueling_person} <- FuelingPersons.create_fueling_person(fueling_person_params) do
      conn
      |> put_status(:created)
      |> render(:show, fueling_person: fueling_person)
    end
  end

  def show(conn, %{"id" => id}) do
    fueling_person = FuelingPersons.get_fueling_person!(id)
    render(conn, :show, fueling_person: fueling_person)
  end

  def update(conn, %{"id" => id, "fueling_person" => fueling_person_params}) do
    fueling_person = FuelingPersons.get_fueling_person!(id)

    with {:ok, %FuelingPerson{} = fueling_person} <- FuelingPersons.update_fueling_person(fueling_person, fueling_person_params) do
      render(conn, :show, fueling_person: fueling_person)
    end
  end

  def delete(conn, %{"id" => id}) do
    fueling_person = FuelingPersons.get_fueling_person!(id)

    with {:ok, %FuelingPerson{}} <- FuelingPersons.delete_fueling_person(fueling_person) do
      send_resp(conn, :no_content, "")
    end
  end
end
