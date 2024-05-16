defmodule SweBack.FuelingTasks do
  @moduledoc """
  The FuelingTasks context.
  """

  import Ecto.Query, warn: false
  alias SweBack.Repo

  alias SweBack.FuelingTasks.FuelingTask

  @doc """
  Returns the list of fueling_tasks.

  ## Examples

      iex> list_fueling_tasks()
      [%FuelingTask{}, ...]

  """
  def list_fueling_tasks do
    Repo.all(FuelingTask)
  end

  @doc """
  Gets a single fueling_task.

  Raises `Ecto.NoResultsError` if the Fueling task does not exist.

  ## Examples

      iex> get_fueling_task!(123)
      %FuelingTask{}

      iex> get_fueling_task!(456)
      ** (Ecto.NoResultsError)

  """
  def get_fueling_task!(id), do: Repo.get!(FuelingTask, id)

  @doc """
  Creates a fueling_task.

  ## Examples

      iex> create_fueling_task(%{field: value})
      {:ok, %FuelingTask{}}

      iex> create_fueling_task(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_fueling_task(attrs \\ %{}) do
    %FuelingTask{}
    |> FuelingTask.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a fueling_task.

  ## Examples

      iex> update_fueling_task(fueling_task, %{field: new_value})
      {:ok, %FuelingTask{}}

      iex> update_fueling_task(fueling_task, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_fueling_task(%FuelingTask{} = fueling_task, attrs) do
    fueling_task
    |> FuelingTask.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a fueling_task.

  ## Examples

      iex> delete_fueling_task(fueling_task)
      {:ok, %FuelingTask{}}

      iex> delete_fueling_task(fueling_task)
      {:error, %Ecto.Changeset{}}

  """
  def delete_fueling_task(%FuelingTask{} = fueling_task) do
    Repo.delete(fueling_task)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking fueling_task changes.

  ## Examples

      iex> change_fueling_task(fueling_task)
      %Ecto.Changeset{data: %FuelingTask{}}

  """
  def change_fueling_task(%FuelingTask{} = fueling_task, attrs \\ %{}) do
    FuelingTask.changeset(fueling_task, attrs)
  end
end
