defmodule SweBack.Repo.Migrations.CreateFuelingTasks do
  use Ecto.Migration

  def change do
    create table(:fueling_tasks, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :date_and_time, :naive_datetime
      add :fuel_quantity, :decimal
      add :total_cost, :decimal
      add :gas_station_name, :string
      add :image_links, :text
      add :status, :string
      add :fueling_person_id, references(:fueling_persons, on_delete: :nothing, type: :binary_id)
      add :vehicle_id, references(:vehicles, on_delete: :nothing, type: :binary_id)
      add :driver_id, references(:drivers, on_delete: :nothing, type: :binary_id)

      timestamps(updated_at: false)
    end
  end
end
