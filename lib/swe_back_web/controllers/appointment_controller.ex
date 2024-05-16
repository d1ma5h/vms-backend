defmodule SweBackWeb.EmailController do
  use SweBackWeb, :controller
  alias SweBack.Mailer.EmailService

  def send_appointment(conn, %{"email" => email, "details" => details}) do
    case EmailService.send_appointment_email(email, details) do
      :ok -> json(conn, %{message: "Appointment email sent successfully"})
      :error -> json(conn, %{error: "Failed to send email"})
    end
  end
end
