defmodule SweBack.Admins.Admin do
  use Ecto.Schema
  import Ecto.Changeset
  @derive {Jason.Encoder, only: [:id, :address, :email, :middle_name, :name, :phone_number, :surname, :inserted_at]}
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "admins" do
    field :address, :string
    field :email, :string
    field :middle_name, :string
    field :name, :string
    field :phone_number, :string
    field :surname, :string
    has_one :user, SweBack.Users.User, foreign_key: :admin_id
    timestamps(updated_at: false)
  end

  @doc false
  def changeset(admin, attrs) do
    admin
    |> cast(attrs, [:name, :surname, :middle_name, :address, :phone_number, :email])
    |> validate_required([:name, :surname, :middle_name, :address, :phone_number, :email])
    |> validate_format(:email, ~r/^[^\s]+@[^\s]+$/, message: "must have the @ sign and no spaces")
    |> validate_length(:email, max: 160)
    |> unique_constraint(:email)
  end
end
