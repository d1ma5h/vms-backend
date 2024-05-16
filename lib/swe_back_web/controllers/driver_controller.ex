defmodule SweBackWeb.DriverController do
  use SweBackWeb, :controller

  alias SweBack.Drivers
  alias SweBack.Drivers.Driver

  action_fallback SweBackWeb.FallbackController

  def index(conn, _params) do
    drivers = Drivers.list_drivers()
    render(conn, :index, drivers: drivers)
  end

  def create(conn, %{"driver" => driver_params}) do
    with {:ok, %Driver{} = driver} <- Drivers.create_driver(driver_params) do
      conn
      |> put_status(:created)
      |> render(:show, driver: driver)
    end
  end

  def show(conn, %{"id" => id}) do
    driver = Drivers.get_driver!(id)
    render(conn, :show, driver: driver)
  end

  def update(conn, %{"id" => id, "driver" => driver_params}) do
    driver = Drivers.get_driver!(id)

    with {:ok, %Driver{} = driver} <- Drivers.update_driver(driver, driver_params) do
      render(conn, :show, driver: driver)
    end
  end

  def delete(conn, %{"id" => id}) do
    driver = Drivers.get_driver!(id)

    with {:ok, %Driver{}} <- Drivers.delete_driver(driver) do
      send_resp(conn, :no_content, "")
    end
  end
end
