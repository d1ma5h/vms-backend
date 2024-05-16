defmodule SweBack.MaintenanceTasks.MaintenanceTask do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "maintenance_tasks" do
    field :completion_date, :date
    field :description, :string
    field :maintenance_cost, :float
    field :scheduled_date, :date
    field :status, :string
    belongs_to :maintenance_person, SweBack.MaintenancePersons.MaintenancePerson, foreign_key: :maintenance_person_id
    belongs_to :vehicle, SweBack.Vehicles.Vehicle, foreign_key: :vehicle_id

    timestamps(updated_at: false)
  end

  @doc false
  def changeset(maintenance_task, attrs) do
    maintenance_task
    |> cast(attrs, [:description, :status, :scheduled_date, :completion_date, :maintenance_cost, :maintenance_person_id, :vehicle_id])
    |> validate_required([:description, :status, :scheduled_date, :completion_date, :maintenance_cost, :maintenance_person_id, :vehicle_id])
  end
end
