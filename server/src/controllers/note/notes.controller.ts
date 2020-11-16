import { NextFunction, Request, Response } from 'express';
import {User} from "../../interfaces/user/users.interface";
import {CreateUserDto} from "../../dtos/user/users.dto";
import NoteService from "../../services/note/notes.service";
import {Note} from "../../interfaces/note/note.interface";
import {CreateNoteDto} from "../../dtos/note/notes.dto";

class NotesController {
    public noteService = new NoteService();

    public getNotes = async (req: Request, res: Response, next: NextFunction) => {
        const userId: string = req.params.userId;
        try {
            const findAllUsersData: Note[] = await this.noteService.findNotes(userId);
            res.status(200).json({ data: findAllUsersData, message: 'findAll' });
        } catch (error) {
            next(error);
        }
    }

    public getNoteById = async (req: Request, res: Response, next: NextFunction) => {
        const noteId: string = req.params.id;

        try {
            const findOneNoteData: Note = await this.noteService.findNoteById(noteId);
            res.status(200).json({ data: findOneNoteData, message: 'findOne' });
        } catch (error) {
            next(error);
        }
    }

    public createNote = async (req: Request, res: Response, next: NextFunction) => {
        const noteData: CreateNoteDto = req.body;

        try {
            const createNoteData: Note = await this.noteService.createNote(noteData);
            res.status(201).json({ data: createNoteData, message: 'created' });
        } catch (error) {
            next(error);
        }
    }

    public updateNote = async (req: Request, res: Response, next: NextFunction) => {
        const noteId: string = req.params.id;
        const noteData: Note = req.body;

        try {
            const updateNoteData: Note = await this.noteService.updateNote(noteId, noteData);
            res.status(200).json({ data: updateNoteData, message: 'updated' });
        } catch (error) {
            next(error);
        }
    }

    public deleteNote = async (req: Request, res: Response, next: NextFunction) => {
        const noteId: string = req.params.id;

        try {
            const deleteNoteData: Note = await this.noteService.deleteNoteData(noteId);
            res.status(200).json({ data: deleteNoteData, message: 'deleted' });
        } catch (error) {
            next(error);
        }
    }
}

export default NotesController;
