import { post } from "jquery";
import { csrfToken } from "@rails/ujs";

const postOptions = {
        method: 'POST',
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "X-CSRF-Token": csrfToken()
        },
        body: window.localStorage.order
      };

const initCart = () => {
  const cart = document.querySelector('#cart');

  if (cart) {
    const noItems = document.querySelector('.no-items')
    // if local storage has an order
    if (window.localStorage.order) {
      cart.classList.remove('d-none')
      // POST request to db
      fetch('/cart_info', postOptions)
        .then(res => res.json())
        .then(data => {
          renderCartItems(data, cart)
          activateSubmitBtn(cart);
        });

    } else {
      noItems.classList.remove('d-none')
    }
  }

};

const renderCartItems = (data, cart) => {
  const cartItems = cart.querySelector('.card-items');

  const currentRestaurant = data.items[0].restaurant;

  data.items.forEach((item) => {
    cartItems.innerHTML += `
    <p> ${item.dishName} - Price: $${item.dishPrice.cents / 100} </p>
    `
  });

  const checkoutRestaurantName = cart.querySelector('.checkout-restaurant-name');
  checkoutRestaurantName.innerText = currentRestaurant;

  cartItems.insertAdjacentHTML('beforeend', `<p>Total: $${data.total}</p>`)
};

const activateSubmitBtn = (cart) => {
  const submitBtn = cart.querySelector('.btn-primary');
  submitBtn.addEventListener('click', (e) => {
    fetch('/orders', postOptions)
      .then(res => {
        if (res.status == 200) {
          window.localStorage.clear();
          window.location.href = '/success';
        }
      })
  })
};

export { initCart };
