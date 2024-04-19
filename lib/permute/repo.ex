defmodule Permutation.Repo do
  use Ecto.Repo,
    otp_app: :permute,
    adapter: Ecto.Adapters.Postgres
end
