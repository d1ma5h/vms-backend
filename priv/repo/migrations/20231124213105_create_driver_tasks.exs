defmodule SweBack.Repo.Migrations.CreateDriverTasks do
  use Ecto.Migration

  def change do
    create table(:driver_tasks, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :start_time, :naive_datetime
      add :end_time, :naive_datetime
      add :status, :string
      add :description, :text
      add :route_information, :text
      add :driver_id, references(:drivers, on_delete: :nothing, type: :binary_id)
      add :vehicle_id, references(:vehicles, on_delete: :nothing, type: :binary_id)

      timestamps(updated_at: false)
    end

  end
end
