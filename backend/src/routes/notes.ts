import 'reflect-metadata'
import express,{response} from 'express'
import NotesController from '../controller/NotesController'


const router = express.Router()

//Notes view table
router.get('/get-notes',NotesController.getNotes)

//Notes view on table
router.get('/get-notes/:userid',NotesController.getuserid)

//Notes create table
router.post('/create-notes',NotesController.createNotes )

// Notes update address
router.put('/update-notes',NotesController.updateNotes )

//Notes delete address
router.delete('/delect-notes',NotesController.delectNotes)



export = router