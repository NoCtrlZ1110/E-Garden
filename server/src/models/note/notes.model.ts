import * as mongoose from 'mongoose';
import {Note} from "../../interfaces/note/note.interface";

const noteSchema = new mongoose.Schema({
    userId: Number,
    title: String,
    content: String,
    date : Date,
    status: Boolean,
});

const noteModel = mongoose.model<Note & mongoose.Document>('Note', noteSchema);
export default noteModel;
