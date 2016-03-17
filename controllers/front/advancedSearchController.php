<?php

class advancedSearchController extends FrontController
{
  public $php_self = 'advancedSearch';
  public function initContent()
  {
    parent::initContent();
    $this->addCSS(_THEME_CSS_DIR_.'product_list.css');

    $querySize = "SELECT * FROM "._DB_PREFIX_."attribute_lang WHERE `id_attribute` < 5";
    $resultSize = Db::getInstance()->ExecuteS($querySize);

    $queryColor = "SELECT * FROM "._DB_PREFIX_."attribute_lang WHERE `id_attribute` < 18 AND `id_attribute` > 4";
    $resultColor = Db::getInstance()->ExecuteS($queryColor);

    $queryIntSize = "SELECT * FROM "._DB_PREFIX_."attribute_lang WHERE `id_attribute` > 17";
    $resultIntSize = Db::getInstance()->ExecuteS($queryIntSize);

    // $text = Tools::getValue('rndText');
    // $priceMin = Tools::getValue('priceMin');
    // $priceMax = Tools::getValue('priceMax');
    // $size = Tools::getValue('size');
    // $color = Tools::getValue('color');
    // $stock = Tools::getValue('stock');
    //
    // $this->context->smarty->assign(array(
    //   'rndText'=>$text,
    //   'priceMin'=>$priceMin,
    //   'priceMax'=>$priceMax,
    //   'size'=>$size,
    //   'color'=>$color,
    //   'stock'=>$stock,
    // ));

    $product_per_page = isset($this->context->cookie->nb_item_per_page) ? (int)$this->context->cookie->nb_item_per_page : Configuration::get('PS_PRODUCTS_PER_PAGE');

    if (($query = Tools::getValue('search_query', Tools::getValue('ref'))) && !is_array($query)) {
        $this->productSort();
        $this->n = abs((int)(Tools::getValue('n', $product_per_page)));
        $this->p = abs((int)(Tools::getValue('p', 1)));
        $original_query = $query;
        $query = Tools::replaceAccentedChars(urldecode($query));
        $search = Search::find($this->context->language->id, $query, $this->p, $this->n, $this->orderBy, $this->orderWay);
        if (is_array($search['result'])) {
            foreach ($search['result'] as &$product) {
                $product['link'] .= (strpos($product['link'], '?') === false ? '?' : '&').'search_query='.urlencode($query).'&results='.(int)$search['total'];
            }
        }

        Hook::exec('actionSearch', array('expr' => $query, 'total' => $search['total']));
        $nbProducts = $search['total'];
        $this->pagination($nbProducts);

        $this->addColorsToProductList($search['result']);

        $this->context->smarty->assign(array(
            'resultSize' => $resultSize,
            'resultColor' => $resultColor,
            'resultIntSize' => $resultIntSize,
            'products' => $search['result'], // DEPRECATED (since to 1.4), not use this: conflict with block_cart module
            'search_products' => $search['result'],
            'nbProducts' => $search['total'],
            'search_query' => $original_query,
            'homeSize' => Image::getSize(ImageType::getFormatedName('home'))));
    }

    $this->context->smarty->assign(array('add_prod_display' => Configuration::get('PS_ATTRIBUTE_CATEGORY_DISPLAY'), 'comparator_max_item' => Configuration::get('PS_COMPARATOR_MAX_ITEM')));

    $this->setTemplate(_PS_THEME_DIR_.'letemplate.tpl');
  }
}
