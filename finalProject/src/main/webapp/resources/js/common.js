function moneyComma(p){

 var money = p.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
 return money;
}