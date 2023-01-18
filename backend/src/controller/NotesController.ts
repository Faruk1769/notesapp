import { NextFunction, Request, Response } from "express";
import {Notes} from '../entity/Note';

const NAMESPACE = 'NotesController'

const getNotes = async (req: Request, res: Response, next: NextFunction) => {

     const note= await Notes.find()
    //  const note= await Notes.findOne({
    //      where :{
    //          id : 1
    //      }
    //  })
 
     return res.status(201).json({
         status: 'success',
         message: 'User fetched successfully',
         data: note
     })
 }

 const getuserid = async (req: Request, res: Response, next: NextFunction) => {

    // const addr= await Notes.find()
     const note= await Notes.find({
         where :{
             userid : req.params.userid
         }
     })
 
     return res.status(201).json({
         status: 'success',
         message: 'User fetched successfully',
         data: note
     })
 }

 const createNotes = async (req: Request, res: Response, next: NextFunction) => {
    // Form data
    const { userid,title,content } = req.body

    // Insert to database
    const note = Notes.create({ userid,title,content })
    await note.save()

    return res.status(201).json({
        status: 'success',
        message: 'User inserted successfully',
        data: note
    })
}
const updateNotes = async (req: Request, res: Response, next: NextFunction) => {
    const {id, title, content } = req.body

    const note = await Notes.findOne({ where: { id: id } });

    //note.userid = userid || note.userid
    note.title = title || note.title
    note.content = content || note.content
   
    await note.save()

    if (!note) {
        return res.status(404).json({
            status: 'success',
            message: 'User not found',
            data: note
        })
    }

    return res.status(201).json({
        status: 'success',
        message: 'User updated successfully',
        data: note
    })
}

const delectNotes = async (req: Request, res: Response, next: NextFunction) => {

    const { id } = req.body

    //const user = await User.delete(parseInt(id));
    // const user = await User.softRemove([id]);
    await Notes.createQueryBuilder()
                .softDelete()
                .where("id = :id", {id: id})
                .execute()
   

    return res.status(201).json({
        status: 'success',
        message: 'Profile delected successfully',
        data: []
    })

        
}

 export default{
    getNotes,
    getuserid,
    createNotes,
    updateNotes,
    delectNotes
 }