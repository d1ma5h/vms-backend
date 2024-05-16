defmodule SweBack.DriversTest do
  use SweBack.DataCase

  alias SweBack.Drivers

  describe "drivers" do
    alias SweBack.Drivers.Driver

    import SweBack.DriversFixtures

    @invalid_attrs %{address: nil, driving_license_code: nil, email: nil, government_id: nil, middle_name: nil, name: nil, phone_number: nil, surname: nil}

    test "list_drivers/0 returns all drivers" do
      driver = driver_fixture()
      assert Drivers.list_drivers() == [driver]
    end

    test "get_driver!/1 returns the driver with given id" do
      driver = driver_fixture()
      assert Drivers.get_driver!(driver.id) == driver
    end

    test "create_driver/1 with valid data creates a driver" do
      valid_attrs = %{address: "some address", driving_license_code: "some driving_license_code", email: "some email", government_id: "some government_id", middle_name: "some middle_name", name: "some name", phone_number: "some phone_number", surname: "some surname"}

      assert {:ok, %Driver{} = driver} = Drivers.create_driver(valid_attrs)
      assert driver.address == "some address"
      assert driver.driving_license_code == "some driving_license_code"
      assert driver.email == "some email"
      assert driver.government_id == "some government_id"
      assert driver.middle_name == "some middle_name"
      assert driver.name == "some name"
      assert driver.phone_number == "some phone_number"
      assert driver.surname == "some surname"
    end

    test "create_driver/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Drivers.create_driver(@invalid_attrs)
    end

    test "update_driver/2 with valid data updates the driver" do
      driver = driver_fixture()
      update_attrs = %{address: "some updated address", driving_license_code: "some updated driving_license_code", email: "some updated email", government_id: "some updated government_id", middle_name: "some updated middle_name", name: "some updated name", phone_number: "some updated phone_number", surname: "some updated surname"}

      assert {:ok, %Driver{} = driver} = Drivers.update_driver(driver, update_attrs)
      assert driver.address == "some updated address"
      assert driver.driving_license_code == "some updated driving_license_code"
      assert driver.email == "some updated email"
      assert driver.government_id == "some updated government_id"
      assert driver.middle_name == "some updated middle_name"
      assert driver.name == "some updated name"
      assert driver.phone_number == "some updated phone_number"
      assert driver.surname == "some updated surname"
    end

    test "update_driver/2 with invalid data returns error changeset" do
      driver = driver_fixture()
      assert {:error, %Ecto.Changeset{}} = Drivers.update_driver(driver, @invalid_attrs)
      assert driver == Drivers.get_driver!(driver.id)
    end

    test "delete_driver/1 deletes the driver" do
      driver = driver_fixture()
      assert {:ok, %Driver{}} = Drivers.delete_driver(driver)
      assert_raise Ecto.NoResultsError, fn -> Drivers.get_driver!(driver.id) end
    end

    test "change_driver/1 returns a driver changeset" do
      driver = driver_fixture()
      assert %Ecto.Changeset{} = Drivers.change_driver(driver)
    end
  end
end
