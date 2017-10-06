<div class="bestseller-container quickview-products">
	<div class="module-title">
		<h2><?php echo $title; ?></h2>
	</div>
	<div class="bestseller-products">
		<div class="bestseller-products-slider">
			<?php
				$count = 0;
				$rows = $config_slide['f_rows'];
				if(!$rows) { $rows=1; }
			?>
			<?php if($products): ?>
				<?php foreach ($products as $product) { ?>
				<?php if($count++ % $rows == 0 ) { echo '<div class="row_items">'; } ?>
				<div class="item">
					<div class="item-inner">
						<?php if($config_slide['f_show_label']): ?>
							<?php if ($product['is_new']):
								if($product['special']): ?>
									<div class="sale"><?php echo $text_sale; ?></div>
								<?php else: ?>
									<div class="new"><?php echo $text_new; ?></div>
								<?php endif; ?>
							<?php else: ?>
								<?php if($product['special']): ?>
									<div class="sale"><?php echo $text_sale; ?></div>
								<?php endif; ?>
							<?php endif; ?>
						<?php endif; ?>
						<div class="images-container">
							<a class="product-image" href="<?php echo $product['href']; ?>">
								<img class="image1" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" />
								<?php if($product['rotator_image']): ?>
									<img class="image2" src="<?php echo $product['rotator_image']; ?>" alt="<?php echo $product['name']; ?>" />
								<?php endif; ?>
							</a>
							<div class="actions">
								<div class="add-to-links">
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
						</div><!--images-container-->
						<div class="des-container">
							<div class="des-content">
								<!-- <?php //if (isset($product['rating'])) { ?>
								  <div class="ratings">
									  <div class="rating-box">
										  <?php //for ($i = 0; $i <= 5; $i++) { ?>
											  <?php //if ($product['rating'] == $i) {
												  //$class_r= "rating".$i;
												  //echo '<div class="'.$class_r.'">rating</div>';
											  //} 
										  //}  ?>
									  </div>
								  </div>
								<?php //} ?> -->
								<h2 class="product-name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h2>
								<?php if($config_slide['f_show_des']){ ?>
									<p class="product-des"><?php echo $product['description']; ?></p>
								<?php } ?>
								<div class="price-label">
									<div class="box-price">
										<?php if($config_slide['f_show_price']){ ?>
										<?php if ($product['price']) { ?>
											<p class="price">
												<?php if (!$product['special']) { ?>
												<?php echo $product['price']; ?>
												<?php } else { ?>
												<span class="price-new"><?php echo $product['special']; ?></span> <span
													class="price-old"><?php echo $product['price']; ?></span>
												<?php } ?>
												<?php if ($product['tax']) { ?>
												<span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
												<?php } ?>
											</p> <?php } ?>
										<?php } ?>
									</div>
								</div>
							</div>
							<div class="item-hover">
								<div class="cart">
									<?php if($config_slide['f_show_addtocart']) { ?>
										<button class="button btn-cart" type="button" data-toggle="tooltip" title="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>');">
											<span><span><?php echo $button_cart; ?></span></span>
										</button>
									<?php } ?>
								</div>
							</div>
						</div>
					</div>
				</div>
				<?php if($count % $rows == 0 || $count == count($products)) { echo '</div>'; } ?>
				<?php } ?>
			<?php else: ?>
				<p><?php echo $text_empty; ?></p>
			<?php endif; ?>
		</div>
	</div>
</div>
<script type="text/javascript">
$(document).ready(function() {
    $(".bestseller-products-slider").owlCarousel({
        autoPlay: <?php if($config_slide['autoplay']) { echo 'true' ;} else { echo 'false'; } ?>,
        items : <?php if($config_slide['items']) { echo $config_slide['items'] ;} else { echo 3; } ?>,
        slideSpeed : <?php if($config_slide['f_speed']) { echo $config_slide['f_speed']; } else { echo 200;} ?>,
        navigation : <?php if($config_slide['f_show_nextback']) { echo 'true' ;} else { echo 'false'; } ?>,
        paginationNumbers : true,
        pagination : <?php if($config_slide['f_show_ctr']) { echo 'true' ;} else { echo 'false';} ?>,
        stopOnHover : false,
		itemsDesktop : [1199,2],
		itemsDesktopSmall : [991,3],
		itemsTablet: [700,2],
		itemsMobile : [480,1]
    });

});
</script>