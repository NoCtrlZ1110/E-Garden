import * as mongoose from 'mongoose';
import UsersRoute from "../../routes/user/users.route";
import App from "../../app";
import {request} from "express";

afterAll(async () => {
  await new Promise(resolve => setTimeout(() => resolve(), 500));
});

describe('Testing Users', () => {
  describe('GET /users', () => {
    it('response All Users', () => {
      const usersRoute = new UsersRoute();
      usersRoute.usersController.userService.users.find = jest
      .fn()
      .mockReturnValue(Promise.resolve([{
        email: 'example@gmail.com',
        password: 'q1w2e3r4!',
      },
      ]));

      (mongoose as any).connect = jest.fn();
      const app = new App([usersRoute]);
      // @ts-ignore
      return request(app.getServer())
      .get(`${usersRoute.path}`)
      .expect(200);
    });
  });
});
