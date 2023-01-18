import express, { Express, Request, Response } from 'express'
import { AppDataSource } from './data-source'
import bodyParser from 'body-parser'
import NotesRoute from './routes/notes'

const app: Express = express()
//const port: number = 3000
const PORT = process.env.PORT || 3000

app.use(bodyParser.urlencoded({ limit: '1000mb', extended: true, parameterLimit: 1000000 }));
app.use(bodyParser.json({ limit: '1000mb' }));
app.use(bodyParser.raw());
app.use(express.json());

/**
 * Inialize database
 * @author Omar faruk
 */
AppDataSource.initialize()
    .then( async () => {
        console.log('DB is connected')
    })
    .catch ((error) => console.log(error))

app.get('/', (req, res) => {
    res.send('Express + Typescript')
})

app.use('/api/v1/notes',NotesRoute )

app.listen(PORT, () => {
  console.log(`Server is running at http://localhost:${PORT}`)
})