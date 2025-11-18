const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send('¡Hola! Soy la versión 1.0 desplegada con DevOps 🚀');
});

// Endpoint de salud para nuestros scripts de monitoreo
app.get('/health', (req, res) => {
  res.status(200).send('OK');
});

app.listen(port, () => {
  console.log(`App escuchando en el puerto ${port}`);
});