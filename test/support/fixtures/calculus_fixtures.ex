defmodule Permutation.CalculusFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Permutation.Calculus` context.
  """

  @doc """
  Generate a calculation.
  """
  def calculation_fixture(attrs \\ %{}) do
    {:ok, calculation} =
      attrs
      |> Enum.into(%{
        id: "7488a646-e31f-11e4-aace-600308960662"
      })
      |> Permutation.Calculus.create_calculation()

    calculation
  end

  @doc """
  Generate a calculation.
  """
  def calculation_fixture(attrs \\ %{}) do
    {:ok, calculation} =
      attrs
      |> Enum.into(%{

      })
      |> Permutation.Calculus.create_calculation()

    calculation
  end
end
