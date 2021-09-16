const initModal = () => {
  const modal = document.querySelector('#exampleModal');

  const writeToLocalStorage = (orderItem) => {
    // if have key for storing items
    // add order item directly to it
    if (window.localStorage.order) {
      const orderArray = JSON.parse(window.localStorage.order);
      orderArray.push(orderItem);
      window.localStorage.order = JSON.stringify(orderArray);
    } else {
      // if not, start it & add item
      // orderArray = []
      window.localStorage.order = JSON.stringify([orderArray]);
    }
    cconsole.log(window.localStorage.order);
  };

  const initAddToCart = () => {
    // selec modal button
    const addToCartBtn = document.querySelector('.btn-modal');
    // when clicked
    addToCartBtn.addEventListener('click', () => {
      // get id from modal div current dish
      const currentDishId = document.querySelector('.modal').dataset.currentFoodId;
      // get quantity from form
      const quantity = document.querySelector('#food-quantity').value;
      // get special instructions
      const instructions = document.querySelector('#special-instructions').value;

      orderItem = {
        dishId: currentDishId,
        quantity: quantity,
        instructions: instructions
      }

      // write to localstorage
      writeToLocalStorage(orderItem)
    })

  };

  if (modal) {
    $('#exampleModal').on('show.bs.modal', function (event) {
      var button = $(event.relatedTarget) // Button that triggered the modal
      var foodName = button.data('food-name') // Extract info from data-* attributes
      var foodPrice = button.data('food-price')
      var foodId = button.data('food-id')
      // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
      // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
      var modal = $(this)
      modal.find('.modal-title').text(foodName)
      modal.find('.modal-price').text('S$' + foodPrice)
      modal.attr('data-current-food-id', foodId)
    })
    initAddToCart();
  }


};

export { initModal };
