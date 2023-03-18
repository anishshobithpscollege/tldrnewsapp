import express from 'express';
import { Scrap } from './scrap.js';

const scrap = new Scrap();
const app = express();

app.get('/', async (_req, res) => {
    res.status(200).json({
        message: 'Welcome to the API'
    });
});

app.get('/api/tech', async (_req, res) => {
    const data = await scrap.latest('tech');
    res.status(200).json(data);
});

app.get('/api/ai', async (_req, res) => {
    const data = await scrap.latest('ai');
    res.status(200).json(data);
});

app.get('/api/crypto', async (_req, res) => {
    const data = await scrap.latest('crypto');
    res.status(200).json(data);
});

app.listen(3000, () => {
    console.log('Server started on port 3000');
});
