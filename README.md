# Obtenir les métadonnées via une URL

<p>La méthode <b>get_metadata()</b>, prend en paramètre une url et retourne une struct comportant uniquement :<p>
<ul>
  <li>le titre de la page </li>
  <li>la description </li>
  <li>la propriété <code>og:image</code> </li>
  <li>la propriété <code>og:description</code> </li>
</ul>

<p>La structure doit être de ce format:</p>

```Elixir
  iex(1)> Tutorial.get_metadata("https://developer.mozilla.org/fr/") <br>
  %{
    title: "MDN Web Docs",
    description: "MDN Web Docs fournit
      des informations sur les technologies web ouvertes comme HTML,
      CSS et les API utilisées pour les sites web et les applications
      web. On y trouve également de la documentation destinées aux
      développeurs à propos des produits Mozilla tels que les
      outils de développement de Firefox.",
    og_image: "https://developer.mozilla.org/static/img/opengraph-logo.png",
    og_description: "MDN Web Docs fournit des
    informations sur les technologies web ouvertes comme HTML, CSS et les API
    utilisées pour les sites web et les applications web. On y trouve également
    de la documentation destinées aux développeurs à propos des produits
    Mozilla tels que les outils de développement de Firefox."
  }
```

Le titre de la page est contenu dans la balise <code><title>Ma page</title></code>
La description correspond par exemple au contenu de la balise qui à cette forme dans le head :

```HTML5
  <meta name="description" content="MDN Web Docs fournit
   des informations sur les technologies web ouvertes comme HTML,
   CSS et les API utilisées pour les sites web et les applications
   web. On y trouve également de la documentation destinées aux
   développeurs à propos des produits Mozilla tels que les
   outils de développement de Firefox.">
```
 
Les propriétés og: sont les contenues des balises meta de cette forme :

```HTML5
  <meta property="og:image" content="https://developer.mozilla.org/static/img/opengraph-logo.png">
  <meta property="og:description" content="MDN Web Docs fournit des
  informations sur les technologies web ouvertes comme HTML, CSS et les API
  utilisées pour les sites web et les applications web. On y trouve également
  de la documentation destinées aux développeurs à propos des produits
  Mozilla tels que les outils de développement de Firefox.">
```

Pour plus d'explication, voir la [documentation MSDN](https://developer.mozilla.org/fr/docs/Learn/HTML/Introduction_to_HTML/The_head_metadata_in_HTML)

