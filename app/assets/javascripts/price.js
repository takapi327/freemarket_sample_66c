$(function(){

  $('.price_text').on({
    'input' : function(e){
    // console.log('hello');

      var profit = document.getElementById('id').value;
      var tax_price = function(price){
        var tax = 0.1;
        return price - price * tax;
      }

      var tax = function(price){
        var tax = 0.1;
        return price * tax;
      }
      if(profit >> 5){
        document.getElementById('tax').textContent = tax(profit);
        document.getElementById('profit').textContent = '¥' + tax_price(profit);
      }
    }
  });
});