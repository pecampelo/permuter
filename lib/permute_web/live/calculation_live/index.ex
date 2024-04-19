defmodule PermutationWeb.CalculationLive.Index do
  use PermutationWeb, :live_view

  alias Permutation.Calculus
  alias Permutation.Calculus.Calculation

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :calculations, Calculus.list_calculations())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Calculation")
    |> assign(:calculation, Calculus.get_calculation!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Calculation")
    |> assign(:calculation, %Calculation{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Calculations")
    |> assign(:calculation, nil)
  end

  @impl true
  def handle_info({PermutationWeb.CalculationLive.FormComponent, {:saved, calculation}}, socket) do
    {:noreply, stream_insert(socket, :calculations, calculation)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    calculation = Calculus.get_calculation!(id)
    {:ok, _} = Calculus.delete_calculation(calculation)

    {:noreply, stream_delete(socket, :calculations, calculation)}
  end
end
