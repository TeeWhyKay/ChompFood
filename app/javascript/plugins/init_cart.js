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
      fetch('/cart', postOptions)
        .then(res => res.json())
        .then(data => {
          renderCartItems(data, cart)
          activateSubmitBtn(cart);
        })
        .catch(error => {
          console.error('There has been a problem with your fetch operation:', error);
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
    const price = (item.dishPrice.cents / 100).toFixed(2);
    cartItems.innerHTML += `
    <h5 class="card-title">${item.dishName}</h5>
    <h6 class="card-subtitle mb-2 text-muted">Price: $${price} (Quantity: ${item.quantity})</h6>
    <p>Subtotal: $${(price * item.quantity).toFixed(2)}</p>
    `
  });

  const checkoutRestaurantName = cart.querySelector('.checkout-restaurant-name');
  checkoutRestaurantName.innerHTML = `Restaurant: <i>${currentRestaurant}</i>`;

  cartItems.insertAdjacentHTML('beforeend', `<p style="font-size: 1.25rem;">Total: $${data.total.toFixed(2)}</p>`)
};

const activateSubmitBtn = (cart) => {
  const submitBtn = cart.querySelector('.btn-primary');
  submitBtn.addEventListener('click', (e) => {
    fetch('/orders', postOptions)
      .then(res => {
        if (res.status == 200) {
          window.localStorage.clear();
        }
      })
  })
};

export { initCart };
