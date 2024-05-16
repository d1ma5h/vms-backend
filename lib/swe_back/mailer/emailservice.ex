defmodule SweBack.Mailer.EmailService do
  import Bamboo.Email
  use Bamboo.Mailer, otp_app: :swe_back

  def send_appointment_email(email, details) do
    new_email(
      to: email,
      from: "toy.bernier77@ethereal.email",
      subject: "Appointment Details",
      html_body: "<strong>#{details}</strong> ",
      text_body: details
    )
    |> deliver_now()
    |> handle_delivery_response()
    |> IO.inspect()
  end
  defp handle_delivery_response({:ok, _response}), do: :ok
  defp handle_delivery_response({:error, _reason}), do: :error
end
