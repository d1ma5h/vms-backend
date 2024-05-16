defmodule SweBack.Vehicles.Vehicle do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "vehicles" do
    field :license_plate, :string
    field :make, :string
    field :model, :string
    field :sitting_capacity, :integer
    field :status, :string
    field :type, :string
    field :year, :integer
    field :latitude, :float
    field :longitude, :float
    has_one :driver, SweBack.Drivers.Driver
    has_many :maintenance_tasks, SweBack.MaintenanceTasks.MaintenanceTask
    timestamps(updated_at: false)
  end

  @doc false
  def changeset(vehicle, attrs) do
    vehicle
    |> cast(attrs, [:make, :model, :year, :license_plate, :type, :sitting_capacity, :status, :latitude,:longitude])
    |> validate_required([:make, :model, :year, :license_plate, :type, :sitting_capacity, :status, :latitude, :longitude])
  end
end
