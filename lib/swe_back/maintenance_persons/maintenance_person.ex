defmodule SweBack.MaintenancePersons.MaintenancePerson do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @derive {Jason.Encoder, only: [:id, :address, :email, :middle_name, :name, :phone_number, :surname, :inserted_at]}
  schema "maintenance_persons" do
    field :address, :string
    field :email, :string
    field :middle_name, :string
    field :name, :string
    field :phone_number, :string
    field :surname, :string
    has_one :user, SweBack.Users.User, foreign_key: :maintenance_id
    has_many :maintenance_tasks, SweBack.MaintenanceTasks.MaintenanceTask
    timestamps(updated_at: false)
  end

  @doc false
  def changeset(maintenance_person, attrs) do
    maintenance_person
    |> cast(attrs, [:name, :surname, :middle_name, :address, :phone_number, :email])
    |> validate_required([:name, :surname, :middle_name, :address, :phone_number, :email])
    |> validate_format(:email, ~r/^[^\s]+@[^\s]+$/, message: "must have the @ sign and no spaces")
    |> validate_length(:email, max: 160)
    |> unique_constraint(:email)
  end
end
