import { NextFunction, Request, Response } from 'express';
import {User} from "../../interfaces/user/users.interface";
import {CreateUserDto} from "../../dtos/user/users.dto";
import NoteService from "../../services/note/notes.service";
import {Note} from "../../interfaces/note/note.interface";

class UsersController {
    public userService = new NoteService();

    public getUsers = async (req: Request, res: Response, next: NextFunction) => {
        const userId: string = req.params.id;
        try {
            const findAllUsersData: Note[] = await this.userService.findNotes(userId);
            res.status(200).json({ data: findAllUsersData, message: 'findAll' });
        } catch (error) {
            next(error);
        }
    }

    public getUserById = async (req: Request, res: Response, next: NextFunction) => {
        const userId: string = req.params.id;

        try {
            const findOneUserData: Note = await this.userService.findUserById(userId);
            res.status(200).json({ data: findOneUserData, message: 'findOne' });
        } catch (error) {
            next(error);
        }
    }

    public createUser = async (req: Request, res: Response, next: NextFunction) => {
        const userData: CreateUserDto = req.body;

        try {
            const createUserData: User = await this.userService.createUser(userData);
            res.status(201).json({ data: createUserData, message: 'created' });
        } catch (error) {
            next(error);
        }
    }

    public updateUser = async (req: Request, res: Response, next: NextFunction) => {
        const userId: string = req.params.id;
        const userData: User = req.body;

        try {
            const updateUserData: User = await this.userService.updateUser(userId, userData);
            res.status(200).json({ data: updateUserData, message: 'updated' });
        } catch (error) {
            next(error);
        }
    }

    public deleteUser = async (req: Request, res: Response, next: NextFunction) => {
        const userId: string = req.params.id;

        try {
            const deleteUserData: User = await this.userService.deleteUserData(userId);
            res.status(200).json({ data: deleteUserData, message: 'deleted' });
        } catch (error) {
            next(error);
        }
    }
}

export default NotesController;
