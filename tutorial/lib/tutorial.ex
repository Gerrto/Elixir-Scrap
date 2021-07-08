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

  # L'URL par defaut est l'adresse de google.fr
  # TODO tester adr complexe : https://twitter.com/Gerrto12
  def getHeader(url \\ "https://www.google.fr/") do

    # Crawly.fetch est une méthode qui va recuperer via un URL
    # reponse correspond au corp de la reponse a savoir la page web (code HTML)
    {:ok, pbody} = Crawly.fetch(url).body |> Floki.parse_document
    # phead correspond au head (balise head) de la page
    phead = pbody |> Floki.find("head")

    if phead === [] do
      # Si la balise head n'est pas trouver
      # Alors rechercher les balise de métadonnées
      phead = pbody |> Floki.find("meta, link, style, script")
    else
      # valeur de retour de la fonction
      phead
    end


  end
end
