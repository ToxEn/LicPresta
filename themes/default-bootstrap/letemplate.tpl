<html>
<head>
  <title>Advanced search</title>
</head>
<body>
<h2>Recherche avancée</h2>
<form name="toto" id="formulaire" method="post" action="{$link->getPageLink('advancedsearch')}">
  <p class="form-group" id="search">
    <label for="recherche">{l s="Votre recherche"}</label>
    <input type="text" id="search_query" name="search_query" placeholder="Name"/>
  </p>
  <p class="form-group taille">
    <label for="priceMin">{l s="Prix minimum"}</label>
    <input type="text" id="priceMin" name="priceMin" placeholder="Minimum price"/>
  </p>
  <p class="form-group taille">
    <label for="priceMax">{l s="Prix minimum"}</label>
    <input type="text" id="priceMax" name="priceMax" placeholder="Maximum price"/>
  </p>
  <p class="form-group">
    <label for="size">{l s="Taille"}</label>
    <select name="size" id="size" style="width: 90px;" class="form-control">
      <option value='0'></option>
      {foreach from=$resultSize item=size}
        <option value='{$size.name}'>{$size.name}</option>
      {/foreach}
    </select>
  </p>
  <p class="form-group">
    <label for="color">{l s="Couleur"}</label>
    <select name="color" id="color" style="width: 90px;" class="form-control">
      <option value='0'></option>
      {foreach from=$resultColor item=color}
        <option value='{$color.name}'>{$color.name}</option>
      {/foreach}
    </select>
  </p>
  {*<input type= "radio" name="stock" value="in stock">In stock</input>
  <input type= "radio" name="stock" value="rupture">Rupture</input>*}

  <button type="submit" class="btn btn-default button-search">Submit</button>
</form>
<br>

{if $nbProducts>-1}
  <h3>Résultats</h3>
  {if $nbProducts==0}
    <p>Aucun résultat trouvé</p>
  {/if}
{/if}
<!-- {if $rndText or $priceMin or $priceMax or $size or $color or $stock}
  <p>Text : {$rndText}</p>
  <p>Minimum price : {$priceMin}</p>
  <p>Maximum price : {$priceMax}</p>
  <p>Size : {$size}</p>
  <p>Color : {$color}</p>
  <p>Stock : {$stock}</p>
{else}
  Nothing send
{/if} -->

{include file="$tpl_dir./product-list.tpl"}
</body>
