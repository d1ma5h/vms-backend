defmodule SweBack.MaintenanceTasks do
  @moduledoc """
  The MaintenanceTasks context.
  """

  import Ecto.Query, warn: false
  alias SweBack.Repo

  alias SweBack.MaintenanceTasks.MaintenanceTask

  @doc """
  Returns the list of maintenance_tasks.

  ## Examples

      iex> list_maintenance_tasks()
      [%MaintenanceTask{}, ...]

  """
  def list_maintenance_tasks do
    Repo.all(MaintenanceTask)
  end

  @doc """
  Gets a single maintenance_task.

  Raises `Ecto.NoResultsError` if the Maintenance task does not exist.

  ## Examples

      iex> get_maintenance_task!(123)
      %MaintenanceTask{}

      iex> get_maintenance_task!(456)
      ** (Ecto.NoResultsError)

  """
  def get_maintenance_task!(id), do: Repo.get!(MaintenanceTask, id)

  @doc """
  Creates a maintenance_task.

  ## Examples

      iex> create_maintenance_task(%{field: value})
      {:ok, %MaintenanceTask{}}

      iex> create_maintenance_task(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_maintenance_task(attrs \\ %{}) do
    %MaintenanceTask{}
    |> MaintenanceTask.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a maintenance_task.

  ## Examples

      iex> update_maintenance_task(maintenance_task, %{field: new_value})
      {:ok, %MaintenanceTask{}}

      iex> update_maintenance_task(maintenance_task, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_maintenance_task(%MaintenanceTask{} = maintenance_task, attrs) do
    maintenance_task
    |> MaintenanceTask.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a maintenance_task.

  ## Examples

      iex> delete_maintenance_task(maintenance_task)
      {:ok, %MaintenanceTask{}}

      iex> delete_maintenance_task(maintenance_task)
      {:error, %Ecto.Changeset{}}

  """
  def delete_maintenance_task(%MaintenanceTask{} = maintenance_task) do
    Repo.delete(maintenance_task)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking maintenance_task changes.

  ## Examples

      iex> change_maintenance_task(maintenance_task)
      %Ecto.Changeset{data: %MaintenanceTask{}}

  """
  def change_maintenance_task(%MaintenanceTask{} = maintenance_task, attrs \\ %{}) do
    MaintenanceTask.changeset(maintenance_task, attrs)
  end
end
