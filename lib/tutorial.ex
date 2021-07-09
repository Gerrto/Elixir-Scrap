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

  def formalisation(var) do
    if var == [] do
      var
    else
      [var] = var |> Floki.attribute("content")
      var
    end
  end

  @doc """
    Prend en parametre un URL, par default le site de mozilla
    retourne les métadonnées de la page (le head ou les information situé dans le head)
  """
  # TODO tester adr complexe : https://twitter.com/Gerrto12
  # https://www.smitegame.com/
  def get_metadata(url \\ "https://developer.mozilla.org/fr/") do

    {:ok, requestBody} = Crawly.fetch(url).body |> Floki.parse_document

    titre = requestBody |> Floki.find("meta[property='og:title']")
    if titre == [] do
      titre = requestBody |> Floki.find("title")
    end
    description = requestBody |> Floki.find("meta[name='description']")
    og_image = requestBody |> Floki.find("meta[property='og:image']")
    og_description = requestBody |> Floki.find("meta[property='og:description']")

    titre = formalisation(titre)
    description = formalisation(description)
    og_image = formalisation(og_image)
    og_description = formalisation(og_description)

    res = %{
      title: titre,
      description: description,
      og_image: og_image,
      og_description: og_description
    }

    if res == %{description: [], og_description: [], og_image: [], title: []} do
      {:ok, requestBody} = Crawly.fetch(url).body |> Floki.parse_document
      res = requestBody |> Floki.find("head")
    else
      res
    end

  end
end
