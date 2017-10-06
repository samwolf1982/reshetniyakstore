<div class="banner-ourbrands">
	<div class="container">
		<div class="module-title">
			<h2><?php echo $heading_title; ?></h2>
		</div>
		<div class="row">
		<div id="banner<?php echo $module; ?>">
			<?php foreach ($banners as $banner) { ?>
				<div class="item">
					<?php if ($banner['link']) { ?>
						<a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
					<?php } else { ?>
						<img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
					<?php } ?>
				</div>
			<?php } ?>
		</div>
		</div>
	</div>
</div>
<script type="text/javascript"><!--
$('#banner<?php echo $module; ?>').owlCarousel({
	items: 5,
	autoPlay: false,
	navigation: true,
	pagination: false,
	transitionStyle: 'fade',
	itemsDesktop : [1199,4],
	itemsDesktopSmall : [991,3],
	itemsTablet: [700,2],
	itemsMobile : [400,1],
	slideSpeed : 1000,
});
--></script>
