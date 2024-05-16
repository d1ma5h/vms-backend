defmodule SweBack.FuelingPersons do
  @moduledoc """
  The FuelingPersons context.
  """

  import Ecto.Query, warn: false
  alias SweBack.Repo

  alias SweBack.FuelingPersons.FuelingPerson

  @doc """
  Returns the list of fueling_persons.

  ## Examples

      iex> list_fueling_persons()
      [%FuelingPerson{}, ...]

  """
  def list_fueling_persons do
    Repo.all(FuelingPerson)
  end

  @doc """
  Gets a single fueling_person.

  Raises `Ecto.NoResultsError` if the Fueling person does not exist.

  ## Examples

      iex> get_fueling_person!(123)
      %FuelingPerson{}

      iex> get_fueling_person!(456)
      ** (Ecto.NoResultsError)

  """
  def get_fueling_person!(id), do: Repo.get!(FuelingPerson, id)

  @doc """
  Creates a fueling_person.

  ## Examples

      iex> create_fueling_person(%{field: value})
      {:ok, %FuelingPerson{}}

      iex> create_fueling_person(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_fueling_person(attrs \\ %{}) do
    %FuelingPerson{}
    |> FuelingPerson.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a fueling_person.

  ## Examples

      iex> update_fueling_person(fueling_person, %{field: new_value})
      {:ok, %FuelingPerson{}}

      iex> update_fueling_person(fueling_person, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_fueling_person(%FuelingPerson{} = fueling_person, attrs) do
    fueling_person
    |> FuelingPerson.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a fueling_person.

  ## Examples

      iex> delete_fueling_person(fueling_person)
      {:ok, %FuelingPerson{}}

      iex> delete_fueling_person(fueling_person)
      {:error, %Ecto.Changeset{}}

  """
  def delete_fueling_person(%FuelingPerson{} = fueling_person) do
    Repo.delete(fueling_person)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking fueling_person changes.

  ## Examples

      iex> change_fueling_person(fueling_person)
      %Ecto.Changeset{data: %FuelingPerson{}}

  """
  def change_fueling_person(%FuelingPerson{} = fueling_person, attrs \\ %{}) do
    FuelingPerson.changeset(fueling_person, attrs)
  end
end
