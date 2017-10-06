<?php if (count($currencies) > 1) { ?>
<div class="currency">
<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-currency">
  <div class="btn-group">
	<label><?php echo $text_currency; ?></label>
    <button class="btn-link dropdown-toggle btn-currency" data-toggle="dropdown">
    <?php foreach ($currencies as $currency) { ?>
		<?php if ($currency['code'] == $code) { ?>
			<span><?php echo $currency['code']; ?></span>
		<?php } ?>
    <?php } ?>
	</button>
    <ul class="dropdown-menu">
      <?php foreach ($currencies as $currency) { ?>
		<?php if ($currency['code'] == $code) { ?>
			<li><button class="currency-select currency-selected btn btn-link btn-block" type="button" name="<?php echo $currency['code']; ?>"><?php echo $currency['title']; ?></button></li>
		<?php } else { ?>
			<li><button class="currency-select btn btn-link btn-block" type="button" name="<?php echo $currency['code']; ?>"><?php echo $currency['title']; ?></button></li>
		<?php } ?>
      <?php } ?>
    </ul>
  </div>
  <input type="hidden" name="code" value="" />
  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>
</div>
<?php } ?>
