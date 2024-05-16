defmodule SweBack.DriverTasks do
  @moduledoc """
  The DriverTasks context.
  """

  import Ecto.Query, warn: false
  alias SweBack.Repo

  alias SweBack.DriverTasks.DriverTask

  @doc """
  Returns the list of driver_tasks.

  ## Examples

      iex> list_driver_tasks()
      [%DriverTask{}, ...]

  """
  def list_driver_tasks do
    Repo.all(DriverTask)
  end

  @doc """
  Gets a single driver_task.

  Raises `Ecto.NoResultsError` if the Driver task does not exist.

  ## Examples

      iex> get_driver_task!(123)
      %DriverTask{}

      iex> get_driver_task!(456)
      ** (Ecto.NoResultsError)

  """
  def get_driver_task!(id), do: Repo.get!(DriverTask, id)

  @doc """
  Creates a driver_task.

  ## Examples

      iex> create_driver_task(%{field: value})
      {:ok, %DriverTask{}}

      iex> create_driver_task(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_driver_task(attrs \\ %{}) do
    %DriverTask{}
    |> DriverTask.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a driver_task.

  ## Examples

      iex> update_driver_task(driver_task, %{field: new_value})
      {:ok, %DriverTask{}}

      iex> update_driver_task(driver_task, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_driver_task(%DriverTask{} = driver_task, attrs) do
    driver_task
    |> DriverTask.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a driver_task.

  ## Examples

      iex> delete_driver_task(driver_task)
      {:ok, %DriverTask{}}

      iex> delete_driver_task(driver_task)
      {:error, %Ecto.Changeset{}}

  """
  def delete_driver_task(%DriverTask{} = driver_task) do
    Repo.delete(driver_task)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking driver_task changes.

  ## Examples

      iex> change_driver_task(driver_task)
      %Ecto.Changeset{data: %DriverTask{}}

  """
  def change_driver_task(%DriverTask{} = driver_task, attrs \\ %{}) do
    DriverTask.changeset(driver_task, attrs)
  end
end
