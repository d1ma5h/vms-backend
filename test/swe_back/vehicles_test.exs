defmodule SweBack.VehiclesTest do
  use SweBack.DataCase

  alias SweBack.Vehicles

  describe "vehicles" do
    alias SweBack.Vehicles.Vehicle

    import SweBack.VehiclesFixtures

    @invalid_attrs %{license_plate: nil, make: nil, model: nil, sitting_capacity: nil, status: nil, type: nil, year: nil}

    test "list_vehicles/0 returns all vehicles" do
      vehicle = vehicle_fixture()
      assert Vehicles.list_vehicles() == [vehicle]
    end

    test "get_vehicle!/1 returns the vehicle with given id" do
      vehicle = vehicle_fixture()
      assert Vehicles.get_vehicle!(vehicle.id) == vehicle
    end

    test "create_vehicle/1 with valid data creates a vehicle" do
      valid_attrs = %{license_plate: "some license_plate", make: "some make", model: "some model", sitting_capacity: 42, status: "some status", type: "some type", year: 42}

      assert {:ok, %Vehicle{} = vehicle} = Vehicles.create_vehicle(valid_attrs)
      assert vehicle.license_plate == "some license_plate"
      assert vehicle.make == "some make"
      assert vehicle.model == "some model"
      assert vehicle.sitting_capacity == 42
      assert vehicle.status == "some status"
      assert vehicle.type == "some type"
      assert vehicle.year == 42
    end

    test "create_vehicle/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Vehicles.create_vehicle(@invalid_attrs)
    end

    test "update_vehicle/2 with valid data updates the vehicle" do
      vehicle = vehicle_fixture()
      update_attrs = %{license_plate: "some updated license_plate", make: "some updated make", model: "some updated model", sitting_capacity: 43, status: "some updated status", type: "some updated type", year: 43}

      assert {:ok, %Vehicle{} = vehicle} = Vehicles.update_vehicle(vehicle, update_attrs)
      assert vehicle.license_plate == "some updated license_plate"
      assert vehicle.make == "some updated make"
      assert vehicle.model == "some updated model"
      assert vehicle.sitting_capacity == 43
      assert vehicle.status == "some updated status"
      assert vehicle.type == "some updated type"
      assert vehicle.year == 43
    end

    test "update_vehicle/2 with invalid data returns error changeset" do
      vehicle = vehicle_fixture()
      assert {:error, %Ecto.Changeset{}} = Vehicles.update_vehicle(vehicle, @invalid_attrs)
      assert vehicle == Vehicles.get_vehicle!(vehicle.id)
    end

    test "delete_vehicle/1 deletes the vehicle" do
      vehicle = vehicle_fixture()
      assert {:ok, %Vehicle{}} = Vehicles.delete_vehicle(vehicle)
      assert_raise Ecto.NoResultsError, fn -> Vehicles.get_vehicle!(vehicle.id) end
    end

    test "change_vehicle/1 returns a vehicle changeset" do
      vehicle = vehicle_fixture()
      assert %Ecto.Changeset{} = Vehicles.change_vehicle(vehicle)
    end
  end
end
