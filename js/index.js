// Fecha de finalización (30 de agosto a las 00:00 horas)
const countdownDate = new Date('2023-08-30T00:00:00').getTime();

// Actualizar el contador cada segundo
const countdown = setInterval(function() {
  // Obtener la fecha y hora actual
  const now = new Date().getTime();

  // Calcular la diferencia entre la fecha de finalización y la fecha actual
  const difference = countdownDate - now;

  // Calcular días, horas, minutos y segundos restantes
  const days = Math.floor(difference / (1000 * 60 * 60 * 24));
  const hours = Math.floor((difference % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  const minutes = Math.floor((difference % (1000 * 60 * 60)) / (1000 * 60));
  const seconds = Math.floor((difference % (1000 * 60)) / 1000);

  // Mostrar los valores en el contador
  document.getElementById('days').textContent = days;
  document.getElementById('hours').textContent = hours;
  document.getElementById('minutes').textContent = minutes;
  document.getElementById('seconds').textContent = seconds;

  // Si la cuenta regresiva ha terminado, mostrar un mensaje
  if (difference < 0) {
    clearInterval(countdown);
    document.getElementById('countdown').textContent = '¡La cuenta regresiva ha terminado!';
  }
}, 1000);

function changeVideo(videoId) {
    var videoIframe = document.getElementById("video-iframe");
    videoIframe.src = "https://www.youtube.com/embed/" + videoId;
  }
//contraseña sitio
  //wyU8Zu-M+zNjhH5
  