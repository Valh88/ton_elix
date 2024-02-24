defmodule TonElix do
  @moduledoc """
  Documentation for `TonElix`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> TonElix.hello()
      :world

  """
  def hello do
    :world
  end

  def transaction(boc) do
    {:ok, body} = Jason.encode(%{boc: Base.encode64 boc})
    HTTPoison.post("https://toncenter.com/api/v2/sendBoc",
      body,
      ["Content-Type": "application/json",
      "Accept": "application/json"]
    )
  end

  def create_boc() do
    mnemonic = Ton.generate_mnemonic()
    keypair = Ton.mnemonic_to_keypair(mnemonic)
    wallet = Ton.create_wallet(keypair.public_key)
    IO.inspect(keypair.public_key)
    adress_str = Ton.wallet_to_friendly_address(wallet)
    IO.inspect(adress_str)
    {:ok, to_address} = Ton.parse_address("0QC00zKCL2rd2VFjAzSvuA2YpADQF3V1WlmIqsChky3o8jn6")
    params = [
      seqno: 0,
      bounce: true,
      secret_key: keypair.secret_key,
      value: 1,
      to_address: to_address,
      timeout: 60,
      comment: "Hello"
    ]
    Ton.create_transfer_boc(wallet, params)
  end

  def run_get_method(adress) do
    body =
      %{
        address: adress,
        method: "seqno",
        stack: [],
      }
    {:ok, body} = Jason.encode(body)
    HTTPoison.post("https://toncenter.com/api/v2/runGetMethod",
      body,
      ["Content-Type": "application/json",
      "Accept": "application/json"]
    )
  end
end
