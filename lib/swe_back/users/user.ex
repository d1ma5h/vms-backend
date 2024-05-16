defmodule SweBack.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :password_hash, :string
    field :username, :string
    belongs_to :admin, SweBack.Admins.Admin, foreign_key: :admin_id
    belongs_to :maintenance_person, SweBack.MaintenancePersons.MaintenancePerson, foreign_key: :maintenance_id
    belongs_to :fueling_person, SweBack.FuelingPersons.FuelingPerson, foreign_key: :fuelingperson_id
    belongs_to :driver, SweBack.Drivers.Driver, foreign_key: :driver_id

    timestamps(updated_at: false)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :password_hash, :admin_id, :maintenance_id, :fuelingperson_id, :driver_id])
    |> validate_required([:username, :password_hash])
    |> unique_constraint(:admin_id)
    |> unique_constraint(:maintenance_id)
    |> unique_constraint(:fuelingperson_id)
    |> unique_constraint(:driver_id)
    |> foreign_key_constraint(:fuelingperson_id)
    |> foreign_key_constraint(:maintenance_id)
    |> foreign_key_constraint(:driver_id)
    |> foreign_key_constraint(:admin_id)
    |> validate_single_role()
  end

  defp validate_single_role(changeset) do
    role_fields = [:admin_id, :maintenance_id, :fuelingperson_id, :driver_id]
    filled_roles = Enum.filter(role_fields, fn field -> get_field(changeset, field) != nil end)

    case length(filled_roles) do
      1 -> changeset
      _ -> add_error(changeset, :base, "Only one role id should be filled")
    end
  end
end
