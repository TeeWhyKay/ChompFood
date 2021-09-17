import { post } from "jquery";
import { csrfToken } from "@rails/ujs";

const initCart = () => {
  const cart = document.querySelector('#cart');

  if (cart) {
    const noItems = document.querySelector('.no-items')
    // if local storage has an order
    if (window.localStorage.order) {
      cart.classList.remove('d-none')
      // POST request to db
      fetch('/cart_info', {
        method: 'POST',
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "X-CSRF-Token": csrfToken()
        },
        body: window.localStorage.order
      }).then(res => res.json())
        .then(data => renderCartItems(data, cart));

    } else {
      noItems.classList.remove('d-none')
    }
  }

};

const renderCartItems = (data, cart) => {
  const cartItems = cart.querySelector('.card-items')
  data.items.forEach((item) => {
    cartItems.innerHTML += `
    <p> ${item.dishName} - Price: $${item.dishPrice} </p>
    `
  });
  cartItems.insertAdjacentHTML('beforeend', `<p>Total: $${data.total}</p>`)
};

export { initCart };
