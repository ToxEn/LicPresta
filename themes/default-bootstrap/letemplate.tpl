<html>
<head>
  <title>Advanced search</title>
</head>
<body>
<form name="toto" action="{$link->getPageLink('advancedSearch')}">
  <input type="text" id="search_query" name="search_query" placeholder="Random text"></input>
  <input type="text" id="priceMin" name="priceMin" placeholder="Minimum price"></input>
  <input type="text" id="priceMax" name="priceMax" placeholder="Maximum price"></input>
  <label>Size : </label>
  <select name="size">
    <option value='0'></option>
    {foreach from=$resultSize item=size}
      <option value='{$size.name}'>{$size.name}</option>
    {/foreach}
  </select>
  <label>Color : </label>
  <select name="color">
      <option value='0'></option>
    {foreach from=$resultColor item=color}
      <option value='{$color.name}'>{$color.name}</option>
    {/foreach}
  </select>
  <input type= "radio" name="stock" value="in stock">In stock</input>
  <input type= "radio" name="stock" value="rupture">Rupture</input>

  <button type="submit" class="btn btn-default button-search">Submit</button>
</form>
<br>

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
