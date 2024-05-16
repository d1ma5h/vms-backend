defmodule SweBack.MaintenancePersons do
  @moduledoc """
  The MaintenancePersons context.
  """

  import Ecto.Query, warn: false
  alias SweBack.Repo

  alias SweBack.MaintenancePersons.MaintenancePerson

  @doc """
  Returns the list of maintenance_persons.

  ## Examples

      iex> list_maintenance_persons()
      [%MaintenancePerson{}, ...]

  """
  def list_maintenance_persons do
    Repo.all(MaintenancePerson)
  end

  @doc """
  Gets a single maintenance_person.

  Raises `Ecto.NoResultsError` if the Maintenance person does not exist.

  ## Examples

      iex> get_maintenance_person!(123)
      %MaintenancePerson{}

      iex> get_maintenance_person!(456)
      ** (Ecto.NoResultsError)

  """
  def get_maintenance_person!(id), do: Repo.get!(MaintenancePerson, id)

  @doc """
  Creates a maintenance_person.

  ## Examples

      iex> create_maintenance_person(%{field: value})
      {:ok, %MaintenancePerson{}}

      iex> create_maintenance_person(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_maintenance_person(attrs \\ %{}) do
    %MaintenancePerson{}
    |> MaintenancePerson.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a maintenance_person.

  ## Examples

      iex> update_maintenance_person(maintenance_person, %{field: new_value})
      {:ok, %MaintenancePerson{}}

      iex> update_maintenance_person(maintenance_person, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_maintenance_person(%MaintenancePerson{} = maintenance_person, attrs) do
    maintenance_person
    |> MaintenancePerson.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a maintenance_person.

  ## Examples

      iex> delete_maintenance_person(maintenance_person)
      {:ok, %MaintenancePerson{}}

      iex> delete_maintenance_person(maintenance_person)
      {:error, %Ecto.Changeset{}}

  """
  def delete_maintenance_person(%MaintenancePerson{} = maintenance_person) do
    Repo.delete(maintenance_person)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking maintenance_person changes.

  ## Examples

      iex> change_maintenance_person(maintenance_person)
      %Ecto.Changeset{data: %MaintenancePerson{}}

  """
  def change_maintenance_person(%MaintenancePerson{} = maintenance_person, attrs \\ %{}) do
    MaintenancePerson.changeset(maintenance_person, attrs)
  end
end
