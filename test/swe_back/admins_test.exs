defmodule SweBack.AdminsTest do
  use SweBack.DataCase

  alias SweBack.Admins

  describe "admins" do
    alias SweBack.Admins.Admin

    import SweBack.AdminsFixtures

    @invalid_attrs %{address: nil, email: nil, middle_name: nil, name: nil, phone_number: nil, surname: nil}

    test "list_admins/0 returns all admins" do
      admin = admin_fixture()
      assert Admins.list_admins() == [admin]
    end

    test "get_admin!/1 returns the admin with given id" do
      admin = admin_fixture()
      assert Admins.get_admin!(admin.id) == admin
    end

    test "create_admin/1 with valid data creates a admin" do
      valid_attrs = %{address: "some address", email: "some email", middle_name: "some middle_name", name: "some name", phone_number: "some phone_number", surname: "some surname"}

      assert {:ok, %Admin{} = admin} = Admins.create_admin(valid_attrs)
      assert admin.address == "some address"
      assert admin.email == "some email"
      assert admin.middle_name == "some middle_name"
      assert admin.name == "some name"
      assert admin.phone_number == "some phone_number"
      assert admin.surname == "some surname"
    end

    test "create_admin/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Admins.create_admin(@invalid_attrs)
    end

    test "update_admin/2 with valid data updates the admin" do
      admin = admin_fixture()
      update_attrs = %{address: "some updated address", email: "some updated email", middle_name: "some updated middle_name", name: "some updated name", phone_number: "some updated phone_number", surname: "some updated surname"}

      assert {:ok, %Admin{} = admin} = Admins.update_admin(admin, update_attrs)
      assert admin.address == "some updated address"
      assert admin.email == "some updated email"
      assert admin.middle_name == "some updated middle_name"
      assert admin.name == "some updated name"
      assert admin.phone_number == "some updated phone_number"
      assert admin.surname == "some updated surname"
    end

    test "update_admin/2 with invalid data returns error changeset" do
      admin = admin_fixture()
      assert {:error, %Ecto.Changeset{}} = Admins.update_admin(admin, @invalid_attrs)
      assert admin == Admins.get_admin!(admin.id)
    end

    test "delete_admin/1 deletes the admin" do
      admin = admin_fixture()
      assert {:ok, %Admin{}} = Admins.delete_admin(admin)
      assert_raise Ecto.NoResultsError, fn -> Admins.get_admin!(admin.id) end
    end

    test "change_admin/1 returns a admin changeset" do
      admin = admin_fixture()
      assert %Ecto.Changeset{} = Admins.change_admin(admin)
    end
  end
end
