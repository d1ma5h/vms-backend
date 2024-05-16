defmodule SweBackWeb.MaintenancePersonController do
  use SweBackWeb, :controller

  alias SweBack.MaintenancePersons
  alias SweBack.MaintenancePersons.MaintenancePerson

  action_fallback SweBackWeb.FallbackController

  def index(conn, _params) do
    maintenance_persons = MaintenancePersons.list_maintenance_persons()
    render(conn, :index, maintenance_persons: maintenance_persons)
  end

  # def create(conn, %{"maintenance_person" => maintenance_person_params}) do
  #   with {:ok, %MaintenancePerson{} = admin} <- MaintenancePersons.create_maintenance_person(maintenance_person_params) do
  #     conn
  #     |> put_status(:created)
  #     |> render(:show, maintenance_person: maintenance_person)
  #   end
  # end


  def create(conn, %{"maintenance_person" => maintenance_person_params}) do
    case MaintenancePersons.create_maintenance_person(maintenance_person_params) do
      {:ok, maintenance_person} ->
        conn
        |> put_status(:created)
        |> json(%{maintenance_person: maintenance_person})
      {:error, changeset} ->
        # Extract error messages from changeset and send as JSON
        errors = Ecto.Changeset.traverse_errors(changeset, fn {msg, opts} ->
          Enum.reduce(opts, msg, fn {key, value}, acc ->
            String.replace(acc, "%{#{key}}", to_string(value))
          end)
        end)
        conn
        |> put_status(:unprocessable_entity)
        |> json(%{errors: errors})
    end
  end


  # def create(conn, %{"maintenance_person" => maintenance_person_params}) do
  #   case MaintenancePersons.create_maintenance_person(maintenance_person_params) do
  #     {:ok, maintenance_person} ->
  #       conn
  #       |> put_status(:created)
  #       |> json(%{maintenance_person: maintenance_person})
  #     {:error, changeset} ->
  #       conn
  #       |> put_status(:unprocessable_entity)
  #       |> json(%{error: changeset})
  #   end
  # end

  def show(conn, %{"id" => id}) do
    maintenance_person = MaintenancePersons.get_maintenance_person!(id)
    render(conn, :show, maintenance_person: maintenance_person)
  end

  def update(conn, %{"id" => id, "maintenance_person" => maintenance_person_params}) do
    maintenance_person = MaintenancePersons.get_maintenance_person!(id)

    with {:ok, %MaintenancePerson{} = maintenance_person} <- MaintenancePersons.update_maintenance_person(maintenance_person, maintenance_person_params) do
      render(conn, :show, maintenance_person: maintenance_person)
    end
  end

  def delete(conn, %{"id" => id}) do
    maintenance_person = MaintenancePersons.get_maintenance_person!(id)

    with {:ok, %MaintenancePerson{}} <- MaintenancePersons.delete_maintenance_person(maintenance_person) do
      send_resp(conn, :no_content, "")
    end
  end
end
