defmodule SweBack.Repo.Migrations.CreateDrivers do
  use Ecto.Migration

  def change do
    create table(:drivers, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :government_id, :string
      add :name, :string
      add :surname, :string
      add :middle_name, :string
      add :address, :string
      add :phone_number, :string
      add :email, :string
      add :driving_license_code, :string
      add :vehicle_id, references(:vehicles, on_delete: :nothing, type: :binary_id)

      timestamps(updated_at: false)
    end
    create unique_index(:drivers, [:email])
  end
end
