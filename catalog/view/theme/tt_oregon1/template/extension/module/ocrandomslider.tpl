<div class="randomproduct-module">
<div class="module-title">
	<h2><?php echo $title; ?></h2>
</div>
<div class="row">
<div class="random-products-slider">
  <?php 
	$count = 0;
	$rows = $config_slide['f_rows']; 
	if(!$rows) { $rows=1; }
  ?>
  <?php if($products): ?>
    <?php foreach ($products as $product) { ?>
    <?php if($count++ % $rows == 0 ) { echo '<div class="row_items">'; }  ?>
    <div class="product-layout product-grid item-inner">
		<div class="images-container">
			<?php if($config_slide['f_show_label']): ?>
			<?php if($product['is_new'] && !$product['special']){ ?>
				<div class="label-product">
				  <span><?php echo $text_new; ?></span>
				</div>
			<?php } if(($product['special'] && $product['is_new'])||($product['special'] && !	$product['is_new'])) { ?>
				<div class="label-product l-sale">
				  <span><?php echo round(($product['special_num']-$product['price_num'])/$product['price_num']*100)."%"; ?></span>
				</div>
			<?php }?>
			<?php endif;?>
			<a class="product-image" href="<?php echo $product['href']; ?>">
				<?php if ($product['thumb']) { ?>
				<?php if($product['rotator_image']){ ?><img class="img-r lazy image2" src="<?php echo $product['rotator_image']; ?>" alt="<?php echo $product['name']; ?>" /><?php } ?>
				<?php } else { ?>
				<img src="image/cache/no_image-100x100.png" alt="<?php echo $product['name']; ?>" />
				<?php } ?>
				<img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive lazy image1" />
			</a>
		</div>
		<div class="des-container">
			<h2 class="product-name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h2>
			<?php if (isset($product['rating'])) { ?>
			  <div class="ratings">
				  <div class="rating-box">
					  <?php for ($i = 0; $i <= 5; $i++) { ?>
						  <?php if ($product['rating'] == $i) {
							  $class_r= "rating".$i;
							  echo '<div class="'.$class_r.'">rating</div>';
						  } 
					  }  ?>
				  </div>
			  </div>
			<?php } ?>
			<?php if($config_slide['f_show_des']) { ?>
				<p class="product-des"><?php echo $product['description']; ?></p>
			<?php } ?>
			<div class="price-label">
				<div class="box-price">
					<?php if($config_slide['f_show_price']) { ?>
						<?php if ($product['price']) { ?>
							<p class="price">
							  <?php if (!$product['special']) { ?>
							  <?php echo $product['price']; ?>
							  <?php } else { ?>
							  <span class="price-new"><?php echo $product['special']; ?></span>
							  <span class="price-old"><?php echo $product['price']; ?></span>
							  <?php } ?>
							</p>
						<?php } ?>
					<?php } ?>
				</div>
			</div>
			<div class="actions">
				<div class="add-to-links">
					<div class="cart">
						<?php if($config_slide['f_show_addtocart']) { ?>
							<button class="button btn-cart" type="button" data-toggle="tooltip" title="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>');">
								<span><span><?php echo $button_cart; ?></span></span>
							</button>
						<?php } ?>
					</div>
					<div class="wishlist">
						<a class="link-wishlist" title="<?php echo $button_wishlist; ?>" data-toggle="tooltip" onclick="wishlist.add('<?php echo $product['product_id']; ?>');">
							<em><?php echo $button_wishlist; ?></em>
						</a>
					</div>
					<div class="compare">
						<a class="link-compare" title="<?php echo $button_compare; ?>" data-toggle="tooltip" onclick="compare.add('<?php echo $product['product_id']; ?>');">
							<em><?php echo $button_compare; ?></em>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
    <?php if($count % $rows == 0 || $count == count($products)) { echo '</div>'; }  ?>
    <?php } ?>
  <?php else: ?>
    <p><?php echo $text_empty; ?></p>
  <?php endif; ?>
</div>
</div>
<script type="text/javascript">
$(document).ready(function() { 
  $(".random-products-slider").owlCarousel({
    autoPlay: <?php if($config_slide['autoplay']) { echo 'true' ;} else { echo 'false'; } ?>,
    items : <?php if($config_slide['items']) { echo $config_slide['items'] ;} else { echo 3; } ?>,
    slideSpeed : <?php if($config_slide['f_speed']) { echo $config_slide['f_speed']; } else { echo 200;} ?>,
    navigation : <?php if($config_slide['f_show_nextback']) { echo 'true' ;} else { echo 'false'; } ?>,
    paginationNumbers : true,
    pagination : <?php if($config_slide['f_show_ctr']) { echo 'true' ;} else { echo 'false';} ?>,
    stopOnHover : false,
	navigationText : ['<i class="fa fa-angle-left"></i>','<i class="fa fa-angle-right"></i>'],
	itemsDesktop : [1199,1],
	itemsDesktopSmall : [991,2],
	itemsTablet: [700,1],
	itemsMobile : [480,1],
  });
});
</script></div>