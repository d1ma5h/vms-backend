defmodule SweBack.Repo.Migrations.CreateFuelingPersons do
  use Ecto.Migration

  def change do
    create table(:fueling_persons, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :surname, :string
      add :middle_name, :string
      add :address, :string
      add :phone_number, :string
      add :email, :string

      timestamps(updated_at: false)
    end
    create unique_index(:fueling_persons, [:email])

  end
end
