import noteModel from "../../models/note/notes.model";
import {Note} from "../../interfaces/note/note.interface";


class NoteService {
    public notes = noteModel;

    public async findAllUser(): Promise<Note[]> {
        const notes: Note[] = await this.notes.find();
        return notes;
    }

    public async findUserById(userId: string): Promise<Note> {
        const findUser: Note = await this.notes.findById(userId);
        if (!findUser) throw new HttpException(409, "You're not user");

        return findUser;
    }

    public async createUser(userData: CreateUserDto): Promise<User> {
        if (isEmptyObject(userData)) throw new HttpException(400, "You're not userData");

        const findUser: Note = await this.notes.findOne({ email: userData.email });
        if (findUser) throw new HttpException(409, `You're email ${userData.email} already exists`);

        const hashedPassword = await bcrypt.hash(userData.password, 10);
        const createUserData: User = await this.notes.create({ ...userData, password: hashedPassword });
        return createUserData;
    }

    public async updateUser(userId: string, userData: User): Promise<User> {
        if (isEmptyObject(userData)) throw new HttpException(400, "You're not userData");

        const hashedPassword = await bcrypt.hash(userData.password, 10);
        const updateUserById: User = await this.notes.findByIdAndUpdate(userId, { ...userData, password: hashedPassword });
        if (!updateUserById) throw new HttpException(409, "You're not user");

        return updateUserById;
    }

    public async deleteUserData(userId: string): Promise<User> {
        const deleteUserById: User = await this.notes.findByIdAndDelete(userId);
        if (!deleteUserById) throw new HttpException(409, "You're not user");

        return deleteUserById;
    }
}


export default NoteService;
