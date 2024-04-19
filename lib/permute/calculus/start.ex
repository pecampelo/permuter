defmodule Permute.Calculus.Server do
  @moduledoc false
  use GenServer

  require Logger

  @impl true
  def init(gen_server) do
    {:ok, gen_server}
  end

  @impl true
  def handle_call(:failure, _, state) do
    IO.puts("CAST FAILURE: #{state}")
    {:stop, nil}
  end

  @impl true
  def handle_call(:count, from, state) do
    IO.puts("State: #{state}")

    {:continue, nil}
  end

  @impl true
  def handle_call(:run, from_pid, {_first_place, _second_place} = acc) do
    chunk_func = fn element, {first_place, second_place} ->
      first_place = Kernel.+(first_place, element)
      second_place = Kernel.+(second_place, element * 2)

      Logger.info("First place: #{first_place}")
      Logger.info("Second place: #{second_place}")

      cond do
        second_place / 1000 > first_place ->
          GenServer.cast(from_pid, {:success, "Found it!"})

        second_place > 6_000 ->
          GenServer.call(from_pid, {:failure, {first_place, second_place}})

        true ->
          GenServer.call(from_pid, :count)
      end
    end

    Stream.chunk_while(
      1..10_000,
      acc,
      chunk_func
    )

    :ok

    receive do
      message ->
        Logger.info("Message received: #{message}")
    end
  end

  @impl true
  def handle_cast({:success, _}, state) do
    IO.puts("CAST SUCCESS")

    {:continue, nil}
  end
end
