import noteModel from "../../models/note/notes.model";
import {Note} from "../../interfaces/note/note.interface";
import {CreateNoteDto} from "../../dtos/note/notes.dto";
import HttpException from "../../exceptions/HttpException";
import {isEmptyObject} from "../../utils/util";


class NotesService {
    public notes = noteModel;

    public async findNotes(userId: string): Promise<Note[]> {
        const notes: Note[] = await this.notes.find();
        return notes;
    }

    public async findNoteById(noteId: string): Promise<Note> {
        const findUser: Note = await this.notes.findById(noteId);
        if (!findUser) throw new HttpException(409, "You're not user");

        return findUser;
    }

    public async createNote(noteData: CreateNoteDto): Promise<Note> {
        if (isEmptyObject(noteData)) throw new HttpException(400, "You're not noteData");

        // const findUser: Note = await this.notes.findOne({ email: noteData.email });
        // if (findUser) throw new HttpException(409, `You're email ${userData.email} already exists`);

        // const hashedPassword = await bcrypt.hash(userData.password, 10);
        const createNoteData: Note = await this.notes.create(noteData);
        return createNoteData;
    }

    public async updateNote(noteId: string, noteData: Note): Promise<Note> {
        if (isEmptyObject(noteData)) throw new HttpException(400, "You're not userData");

        // const hashedPassword = await bcrypt.hash(userData.password, 10);
        const updateNoteById: Note = await this.notes.findByIdAndUpdate(noteId,noteData);
        if (!updateNoteById) throw new HttpException(409, "You're not user");

        return updateNoteById;
    }

    public async deleteNoteData(noteId: string): Promise<Note> {
        const deletNoteById: Note = await this.notes.findByIdAndDelete(noteId);
        if (!deletNoteById) throw new HttpException(409, "You're not user");

        return deletNoteById;
    }
}
 export default NotesService;
