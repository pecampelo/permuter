defmodule PermutationWeb.CalculationLive.Show do
  use PermutationWeb, :live_view

  alias Permutation.Calculus

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:calculation, Calculus.get_calculation!(id))}
  end

  defp page_title(:show), do: "Show Calculation"
  defp page_title(:edit), do: "Edit Calculation"
end
