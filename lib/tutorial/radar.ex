defmodule Radar do
  use Crawly.Spider

  # URL du site
  @impl Crawly.Spider
  def base_url(), do: "https://elixir-radar.com/"

  @impl Crawly.Spider
  def init() do
    [
      # URL de la page Web, du site
      start_urls: [
        "https://elixir-radar.com/jobs"
      ]
    ]
  end

  @impl Crawly.Spider
  def parse_item(_response) do
    %Crawly.ParsedItem{:items => [], :requests => []}
  end
end
