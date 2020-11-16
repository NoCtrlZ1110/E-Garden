import { Router } from 'express';
import validationMiddleware from "../../middlewares/validation.middleware";
import {CreateUserDto} from "../../dtos/user/users.dto";
import Route from "../../interfaces/routes.interface";
import UsersController from "../../controllers/user/users.controller";


class UsersRoute implements Route {
  public path = '/users';
  public router = Router();
  public usersController = new UsersController();

  constructor() {
    this.initializeRoutes();
  }

  private initializeRoutes() {
    this.router.get(`${this.path}`, this.usersController.getUsers);
    this.router.get(`${this.path}/:id`, this.usersController.getUserById);
    this.router.post(`${this.path}`, validationMiddleware(CreateUserDto), this.usersController.createUser);
    this.router.put(`${this.path}/:id`, validationMiddleware(CreateUserDto, true), this.usersController.updateUser);
    this.router.delete(`${this.path}/:id`, this.usersController.deleteUser);
  }
}

export default UsersRoute;
