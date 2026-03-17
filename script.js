const menuBtn = document.getElementById('menuBtn');
const navLinks = document.getElementById('navLinks');
const closeNews = document.getElementById('closeNews');
const newsletter = document.getElementById('newsletter');

menuBtn?.addEventListener('click', () => {
  navLinks.classList.toggle('show');
});

document.querySelectorAll('.nav-links a').forEach((a) => {
  a.addEventListener('click', () => navLinks.classList.remove('show'));
});

closeNews?.addEventListener('click', () => {
  newsletter?.remove();
});

document.getElementById('year').textContent = new Date().getFullYear();
