const body = document.body;
const tittle = document.getElementById('tittle');

const changeStatus = () => {
  body.style.backgroundColor = navigator.onLine ? 'green' : 'red';
  tittle.innerHTML = navigator.onLine ? 'ONLINE' : 'OFFLINE';
};

changeStatus();
window.addEventListener('online', changeStatus);
window.addEventListener('offline', changeStatus);
