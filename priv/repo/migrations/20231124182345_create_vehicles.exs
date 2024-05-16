defmodule SweBack.Repo.Migrations.CreateVehicles do
  use Ecto.Migration

  def change do
    create table(:vehicles, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :make, :string
      add :model, :string
      add :year, :integer
      add :license_plate, :string
      add :type, :string
      add :sitting_capacity, :integer
      add :status, :string
      add :latitude, :float
      add :longitude, :float
      timestamps(updated_at: false)
    end
  end
end
