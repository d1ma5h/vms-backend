defmodule SweBack.Repo.Migrations.CreateMaintenanceTasks do
  use Ecto.Migration

  def change do
    create table(:maintenance_tasks, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :description, :text
      add :status, :string
      add :scheduled_date, :date
      add :completion_date, :date
      add :maintenance_cost, :float
      add :maintenance_person_id, references(:maintenance_persons, on_delete: :nothing, type: :binary_id)
      add :vehicle_id, references(:vehicles, on_delete: :nothing, type: :binary_id)

      timestamps(updated_at: false)
    end
  end
end
