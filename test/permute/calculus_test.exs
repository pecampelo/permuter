defmodule Permutation.CalculusTest do
  use Permutation.DataCase

  alias Permutation.Calculus

  describe "calculations" do
    alias Permutation.Calculus.Calculation

    import Permutation.CalculusFixtures

    @invalid_attrs %{}

    test "list_calculations/0 returns all calculations" do
      calculation = calculation_fixture()
      assert Calculus.list_calculations() == [calculation]
    end

    test "get_calculation!/1 returns the calculation with given id" do
      calculation = calculation_fixture()
      assert Calculus.get_calculation!(calculation.id) == calculation
    end

    test "create_calculation/1 with valid data creates a calculation" do
      valid_attrs = %{}

      assert {:ok, %Calculation{} = calculation} = Calculus.create_calculation(valid_attrs)
    end

    test "create_calculation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Calculus.create_calculation(@invalid_attrs)
    end

    test "update_calculation/2 with valid data updates the calculation" do
      calculation = calculation_fixture()
      update_attrs = %{}

      assert {:ok, %Calculation{} = calculation} = Calculus.update_calculation(calculation, update_attrs)
    end

    test "update_calculation/2 with invalid data returns error changeset" do
      calculation = calculation_fixture()
      assert {:error, %Ecto.Changeset{}} = Calculus.update_calculation(calculation, @invalid_attrs)
      assert calculation == Calculus.get_calculation!(calculation.id)
    end

    test "delete_calculation/1 deletes the calculation" do
      calculation = calculation_fixture()
      assert {:ok, %Calculation{}} = Calculus.delete_calculation(calculation)
      assert_raise Ecto.NoResultsError, fn -> Calculus.get_calculation!(calculation.id) end
    end

    test "change_calculation/1 returns a calculation changeset" do
      calculation = calculation_fixture()
      assert %Ecto.Changeset{} = Calculus.change_calculation(calculation)
    end
  end
end
