<!DOCTYPE html>
<html>
  <head>
    <title>Pay with JuJu</title>
    <link href="css/bill.css" type="text/css" rel="stylesheet" />
  </head>
  <body>
    <div id="bill">
    </div>
    <form action="http:// " method="post">
      <div id="tipSelect">
        <input type="radio" name="tipPercentage" value="15" />15%
        <input type="radio" name="tipPercentage" value="20" />20%
        <input type="radio" name="tipPercentage" value="25" />25%
        <input type="radio" name="tipPercentage" value="custom" />Custom
      </div>
      <div id="paymentinfo">
	      <div id="totals">
		<p><span class="totalsText subtotalText">Subtotal:</span><span class="totalsAmount subtotal">$82.00</span></p>
		<p><span class="totalsText tipText">Tip:</span><span class="totalsAmount tip">$10.00</span></p>
		<p><span class="totalsText taxText">Tax:</span><span class="totalsAmount tax">$8.00</span></p>
		<p><span class="totalsText totalText">Total:</span><span class="totalsAmount total">$100.00</span></p>
	      </div>
	      <div id="buttons">
		<input id="payButton" type="image" src="images/paybutton.png" name="submitButton" value="pay" />
		<input id="splitButton" type="image" src="images/splitbutton.png" name="submitButton" value="split" />  
	      </div>
      </div>
    </form>
    <div id="restaurantBanner">
      <img id="banner" src="images/restaurantbanner.jpg"
           alt="Restaurant Banner"
           title="Restaurant Banner" />
    </div>
  </body>
</html>
