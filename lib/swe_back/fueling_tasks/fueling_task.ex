defmodule SweBack.FuelingTasks.FuelingTask do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "fueling_tasks" do
    field :date_and_time, :naive_datetime
    field :fuel_quantity, :decimal
    field :gas_station_name, :string
    field :image_links, :string
    field :total_cost, :decimal
    field :status, :string
    belongs_to :driver, SweBack.Drivers.Driver, foreign_key: :driver_id
    belongs_to :vehicle, SweBack.Vehicles.Vehicle, foreign_key: :vehicle_id
    belongs_to :fueling_person, SweBack.FuelingPersons.FuelingPerson, foreign_key: :fueling_person_id
    timestamps(updated_at: false)
  end

  @doc false
  def changeset(fueling_task, attrs) do
    fueling_task
    |> cast(attrs, [:date_and_time, :fuel_quantity, :total_cost, :gas_station_name, :image_links, :driver_id, :vehicle_id, :fueling_person_id,:status])
    |> validate_required([:date_and_time, :fuel_quantity, :total_cost, :gas_station_name, :image_links, :driver_id, :vehicle_id, :fueling_person_id, :status])
  end
end
