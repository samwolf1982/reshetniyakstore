<?php echo $header; ?>
<div class="container">
	<ul class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } ?>
	</ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9 col-sm-12'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><h3><?php echo $heading_title; ?></h3><?php echo $content_top; ?>
	<?php if ($thumb || $description) { ?>
		<div class="category-info">
			<?php if ($thumb) { ?>
				<div class="category-img"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-thumbnail" /></div>
			<?php } ?>
			<?php if ($description) { ?>
			<div class="category-des"><?php echo $description; ?></div>
			<?php } ?>
		</div>
    <?php } ?>
    <?php if ($categories) { ?>
		<h3><?php echo $text_refine; ?></h3>
		<?php if (count($categories) <= 5) { ?>
		<div class="row">
			<div class="col-sm-3">
			  <ul>
				<?php foreach ($categories as $category) { ?>
				<li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
				<?php } ?>
			  </ul>
			</div>
		</div>
		<?php } else { ?>
		<div class="row">
			<?php foreach (array_chunk($categories, ceil(count($categories) / 4)) as $categories) { ?>
			<div class="col-sm-3">
			  <ul>
				<?php foreach ($categories as $category) { ?>
				<li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
				<?php } ?>
			  </ul>
			</div>
			<?php } ?>
		</div>
		<?php } ?>
	<?php } ?>
	<div class="custom-category">
	<?php if ($products) { ?>
		<div><a href="<?php echo $compare; ?>" id="compare-total" class="btn btn-link"><?php echo $text_compare; ?></a></div>
		<div class="toolbar">
			<div class="toolbar1">
				<div class="btn-group">
					<button type="button" id="list-view" class="btn btn-default"></button>
					<button type="button" id="grid-view" class="btn btn-default"></button>
				</div>
			</div>
			<div class="toolbar3">
				<select id="input-limit" class="form-control" onchange="location = this.value;">
				  <?php foreach ($limits as $limits) { ?>
				  <?php if ($limits['value'] == $limit) { ?>
				  <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
				  <?php } else { ?>
				  <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
				  <?php } ?>
				  <?php } ?>
				</select>
			</div>
			<div class="toolbar2">
				<select id="input-sort" class="form-control" onchange="location = this.value;">
					<?php foreach ($sorts as $sorts) { ?>
					<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
					<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
					<?php } else { ?>
					<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
					<?php } ?>
					<?php } ?>
				</select>
			</div>
		</div>
		<div class="custom-products">
			<div class="row">
			<?php foreach ($products as $product) { ?>
			<div class="product-layout product-list col-xs-12">
				<div class="product-thumb item-inner">
					<div class="images-container">
						<a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
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
						<div class="price-label">
							<div class="box-price">
								<?php if ($product['price']) { ?>
									<p class="price">
									  <?php if (!$product['special']) { ?>
									  <?php echo $product['price']; ?>
									  <?php } else { ?>
									  <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
									  <?php } ?>
									  <?php if ($product['tax']) { ?>
									  <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
									  <?php } ?>
									</p>
								<?php } ?>
							</div>
						</div>
						<p class="product-des"><?php echo $product['description']; ?></p>
						<div class="actions">
							<div class="add-to-links">
								<div class="cart">
									<button class="button btn-cart" type="button" title="<?php echo $button_cart; ?>" onclick="cart.add('<?php echo $product['product_id']; ?>');"><span><span><?php echo $button_cart; ?></span></span></button>
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
			</div>
			<?php } ?>
			</div>
		</div>
		<div class="row toolbar4">
			<div class="col-sm-6"><?php echo $pagination; ?></div>
			<div class="col-sm-6 text-right"><?php echo $results; ?></div>
		</div>
    <?php } ?>
	</div>
      <?php if (!$categories && !$products) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
