$(function(){

  $('.price_text').on({
    'input' : function(e){

      var profit = document.getElementById('id').value;
      var tax_price = function(price){
        var tax = 0.1;
        return Math.round(price - price * tax);
      }

      var tax = function(price){
        var tax = 0.1;
        return Math.round(price * tax);
      }
      if(profit >> 6 || 8 >> profit){
        document.getElementById('tax').textContent = tax(profit);
        document.getElementById('profit').textContent = '¥' + tax_price(profit);
      }
    }
  });
});