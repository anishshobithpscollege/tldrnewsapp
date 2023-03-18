import express from 'express';
import { Scrap } from './scrap.js';

const scrap = new Scrap();
const app = express();

app.get('/', async (_req, res) => {
    return res.send('Hello World!');
});

app.get('/api/tech', async (_req, res) => {
    const data = await scrap.latest('tech');
    res.json(data);
});

app.get('/api/ai', async (_req, res) => {
    const data = await scrap.latest('ai');
    res.json(data);
});

app.get('/api/crypto', async (_req, res) => {
    const data = await scrap.latest('crypto');
    res.json(data);
});

app.listen(3000, () => {
    console.log('Server started on port 3000');
});
