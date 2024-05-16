defmodule SweBack.MaintenanceTasksTest do
  use SweBack.DataCase

  alias SweBack.MaintenanceTasks

  describe "maintenance_tasks" do
    alias SweBack.MaintenanceTasks.MaintenanceTask

    import SweBack.MaintenanceTasksFixtures

    @invalid_attrs %{completion_date: nil, description: nil, maintenance_cost: nil, scheduled_date: nil, status: nil}

    test "list_maintenance_tasks/0 returns all maintenance_tasks" do
      maintenance_task = maintenance_task_fixture()
      assert MaintenanceTasks.list_maintenance_tasks() == [maintenance_task]
    end

    test "get_maintenance_task!/1 returns the maintenance_task with given id" do
      maintenance_task = maintenance_task_fixture()
      assert MaintenanceTasks.get_maintenance_task!(maintenance_task.id) == maintenance_task
    end

    test "create_maintenance_task/1 with valid data creates a maintenance_task" do
      valid_attrs = %{completion_date: ~D[2023-11-23], description: "some description", maintenance_cost: 120.5, scheduled_date: ~D[2023-11-23], status: "some status"}

      assert {:ok, %MaintenanceTask{} = maintenance_task} = MaintenanceTasks.create_maintenance_task(valid_attrs)
      assert maintenance_task.completion_date == ~D[2023-11-23]
      assert maintenance_task.description == "some description"
      assert maintenance_task.maintenance_cost == 120.5
      assert maintenance_task.scheduled_date == ~D[2023-11-23]
      assert maintenance_task.status == "some status"
    end

    test "create_maintenance_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = MaintenanceTasks.create_maintenance_task(@invalid_attrs)
    end

    test "update_maintenance_task/2 with valid data updates the maintenance_task" do
      maintenance_task = maintenance_task_fixture()
      update_attrs = %{completion_date: ~D[2023-11-24], description: "some updated description", maintenance_cost: 456.7, scheduled_date: ~D[2023-11-24], status: "some updated status"}

      assert {:ok, %MaintenanceTask{} = maintenance_task} = MaintenanceTasks.update_maintenance_task(maintenance_task, update_attrs)
      assert maintenance_task.completion_date == ~D[2023-11-24]
      assert maintenance_task.description == "some updated description"
      assert maintenance_task.maintenance_cost == 456.7
      assert maintenance_task.scheduled_date == ~D[2023-11-24]
      assert maintenance_task.status == "some updated status"
    end

    test "update_maintenance_task/2 with invalid data returns error changeset" do
      maintenance_task = maintenance_task_fixture()
      assert {:error, %Ecto.Changeset{}} = MaintenanceTasks.update_maintenance_task(maintenance_task, @invalid_attrs)
      assert maintenance_task == MaintenanceTasks.get_maintenance_task!(maintenance_task.id)
    end

    test "delete_maintenance_task/1 deletes the maintenance_task" do
      maintenance_task = maintenance_task_fixture()
      assert {:ok, %MaintenanceTask{}} = MaintenanceTasks.delete_maintenance_task(maintenance_task)
      assert_raise Ecto.NoResultsError, fn -> MaintenanceTasks.get_maintenance_task!(maintenance_task.id) end
    end

    test "change_maintenance_task/1 returns a maintenance_task changeset" do
      maintenance_task = maintenance_task_fixture()
      assert %Ecto.Changeset{} = MaintenanceTasks.change_maintenance_task(maintenance_task)
    end
  end
end
