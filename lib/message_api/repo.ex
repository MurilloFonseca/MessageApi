defmodule MessageApi.Repo do
  use Ecto.Repo,
    otp_app: :message_api,
    adapter: Ecto.Adapters.Postgres
end
