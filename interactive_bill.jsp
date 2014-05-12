<!DOCTYPE html>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>

<head>
  <title>Pay with JuJu</title>
  <link href="css/bill.css" type="text/css" rel="stylesheet" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://code.jquery.com/mobile/1.4.2/jquery.mobile-1.4.2.min.css">
  <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
  <script src="http://code.jquery.com/mobile/1.4.2/jquery.mobile-1.4.2.min.js"></script>
</head>

<script>
  // Don't forget to load the jQuery library before doing this
  // Initialize jQuery
  $(document).ready(function() {
    // Set the variable $width to the width of our wrapper on page load
    $width = $('#content').width();
    // Target all images inside the #content. 
    //This works best if you want to ignore certain 
    //images that are part of the layout design
    $('#content img').css({
        // Using jQuery CSS we write the $width variable we 
        //previously specified as a pixel value. We use max-width 
        //in case the image is smaller than our viewport it won't 
        //scale it larger. Don't forget to set height to auto or else it will squish your photos.
        'max-width' : $width , 'height' : 'auto'
    });
  });
</script>

<body>
  <div data-role="page" id="billsplitpage">
    <div data-role="header">
      <h1>Bill</h1>
    </div>
    <div id="bill">
      <form id="bill-items">
        <sql:setDataSource var="database" driver="com.mysql.jdbc.Driver"
             url="jdbc:mysql://localhost/juju"
             user="juju"  password="juju"/>
        <sql:query dataSource="${database}" var="result">
             SELECT * from bills where uid = '1';
        </sql:query>
        <c:set var="counter" value="0" scope="page" />
        <c:forEach var="row" items="${result.rows}">
          <input type="checkbox" 
                 name="items"
                 id="item${counter}" 
                 data-price="${row.price}"
                 value="${row.item}"
                 />

           <label for="item${counter}"> 
             <c:out value="${row.item} $${row.price}" />
           </label>

          <c:set var="counter" value="${counter + 1}" scope="page" />
        </c:forEach>
      </form>
    </div>
    <form action="http://54.83.5.31:8080/getbill/Paybill" method="post">
      <div data-role="fieldcontain">
        <fieldset data-role="controlgroup" data-type="horizontal">
          <div class="tipselect">
            <input type="radio" name="tipPercentage" id="tip15" value="15" />
            <label for="tip15">15%</label>
            <input type="radio" name="tipPercentage" id="tip20" value="20" checked="checked" />
            <label for="tip20">20%</label>
            <input type="radio" name="tipPercentage" id="tip25" value="25" />
            <label for="tip25">25%</label>
            <!-- input type="radio" name="tipPercentage" id="tipcustom" value="custom" />
            <label for="tipcustom">Custom</label --> 
          </div>
        </fieldset>
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
    <div id="wrapper">
      <div id="restaurantBanner">
        <div id="content">
          <img id="banner" src="images/restaurantbanner.jpg"
              alt="Restaurant Banner"
              title="Restaurant Banner" />
        </div> 
      </div>
    </div>
  </div>
</body>

</html>
