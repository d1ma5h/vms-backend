defmodule SweBack.FuelingPersonsTest do
  use SweBack.DataCase

  alias SweBack.FuelingPersons

  describe "fueling_persons" do
    alias SweBack.FuelingPersons.FuelingPerson

    import SweBack.FuelingPersonsFixtures

    @invalid_attrs %{address: nil, email: nil, middle_name: nil, name: nil, phone_number: nil, surname: nil}

    test "list_fueling_persons/0 returns all fueling_persons" do
      fueling_person = fueling_person_fixture()
      assert FuelingPersons.list_fueling_persons() == [fueling_person]
    end

    test "get_fueling_person!/1 returns the fueling_person with given id" do
      fueling_person = fueling_person_fixture()
      assert FuelingPersons.get_fueling_person!(fueling_person.id) == fueling_person
    end

    test "create_fueling_person/1 with valid data creates a fueling_person" do
      valid_attrs = %{address: "some address", email: "some email", middle_name: "some middle_name", name: "some name", phone_number: "some phone_number", surname: "some surname"}

      assert {:ok, %FuelingPerson{} = fueling_person} = FuelingPersons.create_fueling_person(valid_attrs)
      assert fueling_person.address == "some address"
      assert fueling_person.email == "some email"
      assert fueling_person.middle_name == "some middle_name"
      assert fueling_person.name == "some name"
      assert fueling_person.phone_number == "some phone_number"
      assert fueling_person.surname == "some surname"
    end

    test "create_fueling_person/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = FuelingPersons.create_fueling_person(@invalid_attrs)
    end

    test "update_fueling_person/2 with valid data updates the fueling_person" do
      fueling_person = fueling_person_fixture()
      update_attrs = %{address: "some updated address", email: "some updated email", middle_name: "some updated middle_name", name: "some updated name", phone_number: "some updated phone_number", surname: "some updated surname"}

      assert {:ok, %FuelingPerson{} = fueling_person} = FuelingPersons.update_fueling_person(fueling_person, update_attrs)
      assert fueling_person.address == "some updated address"
      assert fueling_person.email == "some updated email"
      assert fueling_person.middle_name == "some updated middle_name"
      assert fueling_person.name == "some updated name"
      assert fueling_person.phone_number == "some updated phone_number"
      assert fueling_person.surname == "some updated surname"
    end

    test "update_fueling_person/2 with invalid data returns error changeset" do
      fueling_person = fueling_person_fixture()
      assert {:error, %Ecto.Changeset{}} = FuelingPersons.update_fueling_person(fueling_person, @invalid_attrs)
      assert fueling_person == FuelingPersons.get_fueling_person!(fueling_person.id)
    end

    test "delete_fueling_person/1 deletes the fueling_person" do
      fueling_person = fueling_person_fixture()
      assert {:ok, %FuelingPerson{}} = FuelingPersons.delete_fueling_person(fueling_person)
      assert_raise Ecto.NoResultsError, fn -> FuelingPersons.get_fueling_person!(fueling_person.id) end
    end

    test "change_fueling_person/1 returns a fueling_person changeset" do
      fueling_person = fueling_person_fixture()
      assert %Ecto.Changeset{} = FuelingPersons.change_fueling_person(fueling_person)
    end
  end
end
