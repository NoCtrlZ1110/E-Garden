import 'dotenv/config';
import App from './app';
import IndexRoute from './routes/index.route';
import UsersRoute from './routes/user/users.route';
import AuthRoute from './routes/auth.route';
import validateEnv from './utils/validateEnv';
import NotesRoute from "./routes/note/notes.route";

validateEnv();

const app = new App([
  new IndexRoute(),
  new UsersRoute(),
  new NotesRoute(),
  new AuthRoute(),
]);

app.listen();
