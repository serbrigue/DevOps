const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send('¡Hola! Esta es la VERSIÓN 2.0 con actualización automática 🌟');
});

// Endpoint de salud para nuestros scripts de monitoreo
app.get('/health', (req, res) => {
  res.status(200).send('OK');
});

app.listen(port, () => {
  console.log(`App escuchando en el puerto ${port}`);
});