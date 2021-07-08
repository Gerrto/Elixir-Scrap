defmodule Tutorial do
  @moduledoc """
  Documentation for `Tutorial`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Tutorial.hello()
      :world

  """
  def hello do
    :world
  end

  @doc """
    Prend en parametre un URL, par default le site de mozilla
    retourne les métadonnées de la page (le head ou les information situé dans le head)
  """
  # TODO tester adr complexe : https://twitter.com/Gerrto12
  def get_metadata(url \\ "https://developer.mozilla.org/fr/") do

    {:ok, requestBody} = Crawly.fetch(url).body |> Floki.parse_document

    [title] = requestBody |> Floki.find("meta[property='og:title']") |> Floki.attribute("content")
    [description] = requestBody |> Floki.find("meta[name='description']") |> Floki.attribute("content")
    [og_image] = requestBody |> Floki.find("meta[property='og:image']") |> Floki.attribute("content")
    [og_description] = requestBody |> Floki.find("meta[property='og:description']") |> Floki.attribute("content")

    res = %{
      title: title,
      description: description,
      og_image: og_image,
      og_description: og_description
    }


  end
end
