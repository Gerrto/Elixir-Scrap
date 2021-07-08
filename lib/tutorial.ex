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
  def getHeader(url \\ "https://developer.mozilla.org/fr/") do

    {:ok, requestBody} = Crawly.fetch(url).body |> Floki.parse_document
    pageHead = requestBody |> Floki.find("head")

    # Si la balise head n'est pas  Alors rechercher les balise de métadonnées
    if pageHead === [] do
      _metadonnee = requestBody |> Floki.find("meta, link, style, script")
    else
      pageHead
    end

  end
end
