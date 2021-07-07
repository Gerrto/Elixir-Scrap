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
  def getHeader(url \\ "https://www.google.fr/") do
    # Traitement de l'URI
    url = URI.decode(url) |> URI.parse()
    # Crawly.fetch est une méthode qui va recuperer via un URL
    # reponse est un liste des métadonnée de la page
    response = Crawly.fetch(url).headers
    #valeur de retour de la fonction
    response
  end
end
