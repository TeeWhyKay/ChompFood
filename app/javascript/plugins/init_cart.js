const initCart = () => {
  const cart = document.querySelector('#cart');

  if (cart) {
    const noItems = document.querySelector('.no-items')
    // if local storage has an order
    if (window.localStorage.order) {
      console.log('there is sth in ls');
      cart.classList.remove('d-none')
    } else {
      noItems.classList.remove('d-none')
    }
  }

};

export { initCart };
