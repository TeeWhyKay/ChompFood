const initLogout = () => {
  const logoutBtn = document.querySelector('#btn-logout');
  if (logoutBtn) {
    logoutBtn.addEventListener('click', (e) => {
      window.localStorage.clear();
    });
  }
};

export { initLogout };
