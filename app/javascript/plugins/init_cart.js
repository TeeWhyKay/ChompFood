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
      fetch('/my_cart_info', {
        method: 'POST',
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "X-CSRF-Token": csrfToken()
        },
        body: window.localStorage.order
      }).then(response => response.json())
        .then(data => console.log(data));

    } else {
      noItems.classList.remove('d-none')
    }
  }

};

export { initCart };
