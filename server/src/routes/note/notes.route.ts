import { Router } from 'express';
import validationMiddleware from "../../middlewares/validation.middleware";
import {CreateNoteDto} from "../../dtos/note/notes.dto";
import Route from "../../interfaces/routes.interface";
import NotesController from "../../controllers/note/notes.controller";


class NotesRoute implements Route {
    public path = '/notes';
    public router = Router();
    public notesController = new NotesController();

    constructor() {
        this.initializeRoutes();
    }

    private initializeRoutes() {
        this.router.get(`${this.path}`, this.notesController.getNotes);
        this.router.get(`${this.path}/:id`, this.notesController.getNoteById);
        this.router.post(`${this.path}`, this.notesController.createNote);
        this.router.put(`${this.path}/:id`, this.notesController.updateNote);
        this.router.delete(`${this.path}/:id`, this.notesController.deleteNote);
    }
}

export default NotesRoute;
