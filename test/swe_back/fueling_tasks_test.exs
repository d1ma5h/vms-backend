defmodule SweBack.FuelingTasksTest do
  use SweBack.DataCase

  alias SweBack.FuelingTasks

  describe "fueling_tasks" do
    alias SweBack.FuelingTasks.FuelingTask

    import SweBack.FuelingTasksFixtures

    @invalid_attrs %{date_and_time: nil, fuel_quantity: nil, gas_station_name: nil, image_links: nil, total_cost: nil}

    test "list_fueling_tasks/0 returns all fueling_tasks" do
      fueling_task = fueling_task_fixture()
      assert FuelingTasks.list_fueling_tasks() == [fueling_task]
    end

    test "get_fueling_task!/1 returns the fueling_task with given id" do
      fueling_task = fueling_task_fixture()
      assert FuelingTasks.get_fueling_task!(fueling_task.id) == fueling_task
    end

    test "create_fueling_task/1 with valid data creates a fueling_task" do
      valid_attrs = %{date_and_time: ~N[2023-11-23 18:49:00], fuel_quantity: "120.5", gas_station_name: "some gas_station_name", image_links: "some image_links", total_cost: "120.5"}

      assert {:ok, %FuelingTask{} = fueling_task} = FuelingTasks.create_fueling_task(valid_attrs)
      assert fueling_task.date_and_time == ~N[2023-11-23 18:49:00]
      assert fueling_task.fuel_quantity == Decimal.new("120.5")
      assert fueling_task.gas_station_name == "some gas_station_name"
      assert fueling_task.image_links == "some image_links"
      assert fueling_task.total_cost == Decimal.new("120.5")
    end

    test "create_fueling_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = FuelingTasks.create_fueling_task(@invalid_attrs)
    end

    test "update_fueling_task/2 with valid data updates the fueling_task" do
      fueling_task = fueling_task_fixture()
      update_attrs = %{date_and_time: ~N[2023-11-24 18:49:00], fuel_quantity: "456.7", gas_station_name: "some updated gas_station_name", image_links: "some updated image_links", total_cost: "456.7"}

      assert {:ok, %FuelingTask{} = fueling_task} = FuelingTasks.update_fueling_task(fueling_task, update_attrs)
      assert fueling_task.date_and_time == ~N[2023-11-24 18:49:00]
      assert fueling_task.fuel_quantity == Decimal.new("456.7")
      assert fueling_task.gas_station_name == "some updated gas_station_name"
      assert fueling_task.image_links == "some updated image_links"
      assert fueling_task.total_cost == Decimal.new("456.7")
    end

    test "update_fueling_task/2 with invalid data returns error changeset" do
      fueling_task = fueling_task_fixture()
      assert {:error, %Ecto.Changeset{}} = FuelingTasks.update_fueling_task(fueling_task, @invalid_attrs)
      assert fueling_task == FuelingTasks.get_fueling_task!(fueling_task.id)
    end

    test "delete_fueling_task/1 deletes the fueling_task" do
      fueling_task = fueling_task_fixture()
      assert {:ok, %FuelingTask{}} = FuelingTasks.delete_fueling_task(fueling_task)
      assert_raise Ecto.NoResultsError, fn -> FuelingTasks.get_fueling_task!(fueling_task.id) end
    end

    test "change_fueling_task/1 returns a fueling_task changeset" do
      fueling_task = fueling_task_fixture()
      assert %Ecto.Changeset{} = FuelingTasks.change_fueling_task(fueling_task)
    end
  end
end
