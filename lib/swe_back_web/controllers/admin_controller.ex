defmodule SweBackWeb.AdminController do
  use SweBackWeb, :controller

  alias SweBack.Admins
  alias SweBack.Admins.Admin

  action_fallback SweBackWeb.FallbackController

  # GET /api/admins/read/:id
  def show(conn, %{"id" => id}) do
    case Admins.get_admin!(id) do
      nil ->
        conn
        |> put_status(:not_found)
        |> json(%{error: "Admin not found"})
      admin ->
        json(conn, %{admin: admin})
    end
  end

  # PUT /api/admins/update/:id
  def update(conn, %{"id" => id, "admin" => admin_params}) do
    admin = Admins.get_admin!(id)

    case Admins.update_admin(admin, admin_params) do
      {:ok, admin} ->
        conn
        |> put_status(:ok)
        |> json(%{admin: admin})
      {:error, %Ecto.Changeset{errors: errors}} when is_map_key(errors, :email) ->
        conn
        |> put_status(:unprocessable_entity)
        |> json(%{error: "Email has already been taken"})
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> json(%{error: changeset})
    end
  end


  # DELETE /api/admins/delete/:id
  def delete(conn, %{"id" => id}) do
    case Admins.get_admin!(id) do
      nil ->
        conn
        |> put_status(:not_found)
        |> json(%{error: "Admin not found"})
      admin ->
        case Admins.delete_admin(admin) do
          {:ok, _admin} ->
            send_resp(conn, :no_content, "")
          {:error, changeset} ->
            conn
            |> put_status(:unprocessable_entity)
            |> json(%{error: changeset})
        end
    end
  end
  def index(conn, _params) do
    admins = Admins.list_admins()
    render(conn, :index, admins: admins)
  end

  def create(conn, %{"admin" => admin_params}) do
    with {:ok, %Admin{} = admin} <- Admins.create_admin(admin_params) do
      conn
      |> put_status(:created)
      |> render(:show, admin: admin)
    end
  end

  # def show(conn, %{"id" => id}) do
  #   admin = Admins.get_admin!(id)
  #   render(conn, :show, admin: admin)
  # end

  # def update(conn, %{"id" => id, "admin" => admin_params}) do
  #   admin = Admins.get_admin!(id)

  #   with {:ok, %Admin{} = admin} <- Admins.update_admin(admin, admin_params) do
  #     render(conn, :show, admin: admin)
  #   end
  # end

  # def delete(conn, %{"id" => id}) do
  #   admin = Admins.get_admin!(id)

  #   with {:ok, %Admin{}} <- Admins.delete_admin(admin) do
  #     send_resp(conn, :no_content, "")
  #   end
  # end
end
