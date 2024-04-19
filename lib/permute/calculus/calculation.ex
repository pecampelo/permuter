defmodule Permutation.Calculus.Calculation do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "calculations" do
    field(:amount, :integer)

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(calculation, attrs) do
    calculation
    |> cast(attrs, [:amount])
    |> validate_required([:amount])
  end
end
