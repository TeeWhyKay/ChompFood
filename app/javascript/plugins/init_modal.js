const initModal = () => {
  const modal = document.querySelector('#exampleModal');

  /**
   * Cart mechanics
   */
  const findOrderInCart = (dishId, orderArray) => {
    return orderArray.find((el) => el.dishId === dishId)
  };

  const writeToLocalStorage = (orderItem) => {
    // if have key for storing items
    if (window.localStorage.order) {
      // add order item directly to it
      const orderArray = JSON.parse(window.localStorage.order);
      const orderInCart = findOrderInCart(orderItem.dishId, orderArray);
      // if the new quantity is more than 0, update instead of make new
      if (orderItem.quantity > 0) {
      // if orderItem.id is in the order
        if (orderInCart) {
          orderInCart.quantity = orderItem.quantity;
          orderInCart.instructions = orderItem.instructions;
          stringifyToLocalStorage(orderArray);
        } else {
          // else, add to cart normally
          const orderArray = JSON.parse(window.localStorage.order);
          orderArray.push(orderItem);
          stringifyToLocalStorage(orderArray);
        }
      } else if (orderItem.quantity == 0) {
        if (orderInCart) {
          // delete the obj w the same dishId
          const orderInCartIndex = orderArray.indexOf(orderInCart);
          orderArray.splice(orderInCartIndex , 1)
          // if the orders left nothing after deleting the order with input "0" by the user
          if (orderArray.length == 0) {
            window.localStorage.clear();
          } else {
            stringifyToLocalStorage(orderArray);
          }
        }
      }
    } else {
      // else, start it & add item
      window.localStorage.order = JSON.stringify([orderItem]);
    }
    // ! Turn this OFF in production
    // console.log(window.localStorage.order);
  };

  const stringifyToLocalStorage = (orderArray) => {
    window.localStorage.order = JSON.stringify(orderArray);
  };

  const initAddToCart = () => {
    // select modal button
    const addToCartBtn = document.querySelector('.btn-modal');
    // when clicked
    addToCartBtn.addEventListener('click', () => {
      // get id from modal div current dish
      const currentDishId = document.querySelector('.modal').dataset.currentFoodId;
      const currentRestaurant = document.querySelector('.btn-cart').dataset.restaurantName;
      // get quantity from form
      const quantity = document.querySelector('#food-quantity').value;
      // get special instructions
      const instructions = document.querySelector('#special-instructions').value;

      const orderItem = {
        "restaurant": currentRestaurant,
        "dishId": currentDishId,
        "quantity": quantity,
        "instructions": instructions
      }

      writeToLocalStorage(orderItem)
      // when add to cart is clicked and success, add "show" to exampleModal class
      modal.classList.remove('show');
      // ! Turn this ON in production. This is needed else the cart won't show until you refresh the page once
      location.reload();
    })

  };

  const prefillInputs = (modal, foodId) => {
    // if dishId is in local storage
    // update the modal inputs content
    // else, modal inputs content should be empty
    if (window.localStorage.order) {
      const orderArray = JSON.parse(window.localStorage.order);
      const orderInCart = findOrderInCart(foodId.toString(), orderArray);
      if (orderInCart) {
        modal.find('#food-quantity').val(orderInCart.quantity)
        modal.find('#special-instructions').val(orderInCart.instructions)
      } else {
        modal.find('#food-quantity').val('')
        modal.find('#special-instructions').val('')
      }
    }
  }

    if (modal) {
      $('#exampleModal').on('show.bs.modal', function (event) {

        var button = $(event.relatedTarget) // Button that triggered the modal
        var foodName = button.data('food-name') // Extract info from data-* attributes
        var foodPrice = button.data('food-price')
        var foodId = button.data('food-id')

        var modal = $(this)
        modal.find('.modal-title').text(foodName)
        modal.find('.modal-price').text('S$' + foodPrice)
        modal.attr('data-current-food-id', foodId)
        // prefill the modal with the current dish id
        prefillInputs(modal, foodId);
      })
      initAddToCart();
    }

  };

export { initModal };
