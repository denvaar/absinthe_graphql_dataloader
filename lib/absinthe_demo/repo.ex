defmodule AbsintheDemo.Repo do
  use Ecto.Repo,
    otp_app: :absinthe_demo,
    adapter: Ecto.Adapters.Postgres
end
