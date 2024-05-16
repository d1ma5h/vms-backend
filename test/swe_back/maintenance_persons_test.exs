defmodule SweBack.MaintenancePersonsTest do
  use SweBack.DataCase

  alias SweBack.MaintenancePersons

  describe "maintenance_persons" do
    alias SweBack.MaintenancePersons.MaintenancePerson

    import SweBack.MaintenancePersonsFixtures

    @invalid_attrs %{address: nil, email: nil, middle_name: nil, name: nil, phone_number: nil, surname: nil}

    test "list_maintenance_persons/0 returns all maintenance_persons" do
      maintenance_person = maintenance_person_fixture()
      assert MaintenancePersons.list_maintenance_persons() == [maintenance_person]
    end

    test "get_maintenance_person!/1 returns the maintenance_person with given id" do
      maintenance_person = maintenance_person_fixture()
      assert MaintenancePersons.get_maintenance_person!(maintenance_person.id) == maintenance_person
    end

    test "create_maintenance_person/1 with valid data creates a maintenance_person" do
      valid_attrs = %{address: "some address", email: "some email", middle_name: "some middle_name", name: "some name", phone_number: "some phone_number", surname: "some surname"}

      assert {:ok, %MaintenancePerson{} = maintenance_person} = MaintenancePersons.create_maintenance_person(valid_attrs)
      assert maintenance_person.address == "some address"
      assert maintenance_person.email == "some email"
      assert maintenance_person.middle_name == "some middle_name"
      assert maintenance_person.name == "some name"
      assert maintenance_person.phone_number == "some phone_number"
      assert maintenance_person.surname == "some surname"
    end

    test "create_maintenance_person/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = MaintenancePersons.create_maintenance_person(@invalid_attrs)
    end

    test "update_maintenance_person/2 with valid data updates the maintenance_person" do
      maintenance_person = maintenance_person_fixture()
      update_attrs = %{address: "some updated address", email: "some updated email", middle_name: "some updated middle_name", name: "some updated name", phone_number: "some updated phone_number", surname: "some updated surname"}

      assert {:ok, %MaintenancePerson{} = maintenance_person} = MaintenancePersons.update_maintenance_person(maintenance_person, update_attrs)
      assert maintenance_person.address == "some updated address"
      assert maintenance_person.email == "some updated email"
      assert maintenance_person.middle_name == "some updated middle_name"
      assert maintenance_person.name == "some updated name"
      assert maintenance_person.phone_number == "some updated phone_number"
      assert maintenance_person.surname == "some updated surname"
    end

    test "update_maintenance_person/2 with invalid data returns error changeset" do
      maintenance_person = maintenance_person_fixture()
      assert {:error, %Ecto.Changeset{}} = MaintenancePersons.update_maintenance_person(maintenance_person, @invalid_attrs)
      assert maintenance_person == MaintenancePersons.get_maintenance_person!(maintenance_person.id)
    end

    test "delete_maintenance_person/1 deletes the maintenance_person" do
      maintenance_person = maintenance_person_fixture()
      assert {:ok, %MaintenancePerson{}} = MaintenancePersons.delete_maintenance_person(maintenance_person)
      assert_raise Ecto.NoResultsError, fn -> MaintenancePersons.get_maintenance_person!(maintenance_person.id) end
    end

    test "change_maintenance_person/1 returns a maintenance_person changeset" do
      maintenance_person = maintenance_person_fixture()
      assert %Ecto.Changeset{} = MaintenancePersons.change_maintenance_person(maintenance_person)
    end
  end
end
