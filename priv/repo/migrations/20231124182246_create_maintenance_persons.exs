defmodule SweBack.Repo.Migrations.CreateMaintenancePersons do
  use Ecto.Migration

  def change do
    create table(:maintenance_persons, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :surname, :string
      add :middle_name, :string
      add :address, :string
      add :phone_number, :string
      add :email, :string

      timestamps(updated_at: false)
    end
    create unique_index(:maintenance_persons, [:email])

  end
end
