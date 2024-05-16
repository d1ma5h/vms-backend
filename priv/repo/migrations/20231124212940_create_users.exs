defmodule SweBack.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :username, :string
      add :password_hash, :string
      add :admin_id, references(:admins, on_delete: :nothing, type: :binary_id), null: true
      add :maintenance_id, references(:maintenance_persons, on_delete: :nothing, type: :binary_id), null: true
      add :fuelingperson_id, references(:fueling_persons, on_delete: :nothing, type: :binary_id), null: true
      add :driver_id, references(:drivers, on_delete: :nothing, type: :binary_id), null: true

      timestamps(updated_at: false)
    end
    create unique_index(:users, [:admin_id])
    create unique_index(:users, [:maintenance_id])
    create unique_index(:users, [:fuelingperson_id])
    create unique_index(:users, [:driver_id])
  end
end
