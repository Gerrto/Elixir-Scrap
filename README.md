# Obtenir les métadonnées via une URL

La méthode <b>get_metadata()</b>, prend en paramètre une url et retourne une struct comportant uniquement :
- le titre de la page 
- la description
- la propriété `og:image`
- la propriété `og:description` 

La structure est de ce format:

```elixir
iex(1)> Tutorial.get_metadata("https://developer.mozilla.org/fr/")
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

Le titre de la page est contenu dans la balise ` <title>Ma page</title> `
La description correspond par exemple au contenu de la balise qui à cette forme dans le head : 
```html
<meta name="description" content="MDN Web Docs fournit
 des informations sur les technologies web ouvertes comme HTML,
 CSS et les API utilisées pour les sites web et les applications
 web. On y trouve également de la documentation destinées aux
 développeurs à propos des produits Mozilla tels que les
 outils de développement de Firefox.">
```

Les propriétés og: sont les contenues des balises meta de cette forme : 
```html
<meta property="og:image" content="https://developer.mozilla.org/static/img/opengraph-logo.png">
<meta property="og:description" content="MDN Web Docs fournit des
informations sur les technologies web ouvertes comme HTML, CSS et les API
utilisées pour les sites web et les applications web. On y trouve également
de la documentation destinées aux développeurs à propos des produits
Mozilla tels que les outils de développement de Firefox.">
```

Pour plus d'explication, voir la [documentation MSDN](https://developer.mozilla.org/fr/docs/Learn/HTML/Introduction_to_HTML/The_head_metadata_in_HTML)


