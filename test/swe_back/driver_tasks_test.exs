defmodule SweBack.DriverTasksTest do
  use SweBack.DataCase

  alias SweBack.DriverTasks

  describe "driver_tasks" do
    alias SweBack.DriverTasks.DriverTask

    import SweBack.DriverTasksFixtures

    @invalid_attrs %{description: nil, end_time: nil, route_information: nil, start_time: nil, status: nil}

    test "list_driver_tasks/0 returns all driver_tasks" do
      driver_task = driver_task_fixture()
      assert DriverTasks.list_driver_tasks() == [driver_task]
    end

    test "get_driver_task!/1 returns the driver_task with given id" do
      driver_task = driver_task_fixture()
      assert DriverTasks.get_driver_task!(driver_task.id) == driver_task
    end

    test "create_driver_task/1 with valid data creates a driver_task" do
      valid_attrs = %{description: "some description", end_time: ~N[2023-11-23 18:24:00], route_information: "some route_information", start_time: ~N[2023-11-23 18:24:00], status: "some status"}

      assert {:ok, %DriverTask{} = driver_task} = DriverTasks.create_driver_task(valid_attrs)
      assert driver_task.description == "some description"
      assert driver_task.end_time == ~N[2023-11-23 18:24:00]
      assert driver_task.route_information == "some route_information"
      assert driver_task.start_time == ~N[2023-11-23 18:24:00]
      assert driver_task.status == "some status"
    end

    test "create_driver_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = DriverTasks.create_driver_task(@invalid_attrs)
    end

    test "update_driver_task/2 with valid data updates the driver_task" do
      driver_task = driver_task_fixture()
      update_attrs = %{description: "some updated description", end_time: ~N[2023-11-24 18:24:00], route_information: "some updated route_information", start_time: ~N[2023-11-24 18:24:00], status: "some updated status"}

      assert {:ok, %DriverTask{} = driver_task} = DriverTasks.update_driver_task(driver_task, update_attrs)
      assert driver_task.description == "some updated description"
      assert driver_task.end_time == ~N[2023-11-24 18:24:00]
      assert driver_task.route_information == "some updated route_information"
      assert driver_task.start_time == ~N[2023-11-24 18:24:00]
      assert driver_task.status == "some updated status"
    end

    test "update_driver_task/2 with invalid data returns error changeset" do
      driver_task = driver_task_fixture()
      assert {:error, %Ecto.Changeset{}} = DriverTasks.update_driver_task(driver_task, @invalid_attrs)
      assert driver_task == DriverTasks.get_driver_task!(driver_task.id)
    end

    test "delete_driver_task/1 deletes the driver_task" do
      driver_task = driver_task_fixture()
      assert {:ok, %DriverTask{}} = DriverTasks.delete_driver_task(driver_task)
      assert_raise Ecto.NoResultsError, fn -> DriverTasks.get_driver_task!(driver_task.id) end
    end

    test "change_driver_task/1 returns a driver_task changeset" do
      driver_task = driver_task_fixture()
      assert %Ecto.Changeset{} = DriverTasks.change_driver_task(driver_task)
    end
  end
end
