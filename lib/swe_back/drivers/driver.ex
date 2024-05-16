defmodule SweBack.Drivers.Driver do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "drivers" do
    field :address, :string
    field :driving_license_code, :string
    field :email, :string
    field :government_id, :string
    field :middle_name, :string
    field :name, :string
    field :phone_number, :string
    field :surname, :string
    belongs_to :vehicle, SweBack.Vehicles.Vehicle, foreign_key: :vehicle_id
    has_one :user, SweBack.Users.User, foreign_key: :driver_id
    timestamps(updated_at: false)
  end

  @doc false
  def changeset(driver, attrs) do
    driver
    |> cast(attrs, [:government_id, :name, :surname, :middle_name, :address, :phone_number, :email, :driving_license_code, :vehicle_id])
    |> validate_required([:government_id, :name, :surname, :middle_name, :address, :phone_number, :email, :driving_license_code, :vehicle_id])
    |> validate_format(:email, ~r/^[^\s]+@[^\s]+$/, message: "must have the @ sign and no spaces")
    |> validate_length(:email, max: 160)
    |> unique_constraint(:email)
  end
end
