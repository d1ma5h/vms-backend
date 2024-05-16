defmodule SweBack.DriverTasks.DriverTask do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "driver_tasks" do
    field :description, :string
    field :end_time, :naive_datetime
    field :route_information, :string
    field :start_time, :naive_datetime
    field :status, :string
    belongs_to :driver, SweBack.Drivers.Driver, foreign_key: :driver_id
    belongs_to :vehicle, SweBack.Vehicles.Vehicle, foreign_key: :vehicle_id

    timestamps(updated_at: false)
  end

  @doc false
  def changeset(driver_task, attrs) do
    driver_task
    |> cast(attrs, [:start_time, :end_time, :status, :description, :route_information, :driver_id, :vehicle_id])
    |> validate_required([:start_time, :end_time, :status, :description, :route_information, :driver_id, :vehicle_id])
  end
end
