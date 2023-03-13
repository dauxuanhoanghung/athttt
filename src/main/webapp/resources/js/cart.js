 const cart = {
		 addToCart(id,name, price, thumbnail ) {
             let listItem = JSON.parse(localStorage.getItem("listItem")) || []
             const totalQuantity = listItem.reduce((accumulator, currentValue) => {
                 return accumulator + currentValue.quantity;
             }, 0);

             if (listItem.filter(item => item.product.id == id).length == 0){
                 listItem.push({product: {id, name, price, thumbnail} , quantity: 1})
             }
             else
             {
                 listItem.forEach(item => {
                     if (item.product.id == id) {
                         item.quantity+=1;
                     }
                 })
             }

             const numberDOM = document.querySelector(".header__nav__option .number").innerHTML = totalQuantity + 1;
             localStorage.setItem("listItem", JSON.stringify(listItem));
         }           
}
export default cart