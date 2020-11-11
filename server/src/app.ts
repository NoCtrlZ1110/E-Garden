import * as cookieParser from 'cookie-parser';
import * as cors from 'cors';
import * as express from 'express';
import * as helmet from 'helmet';
import * as hpp from 'hpp';
import * as mongoose from 'mongoose';
import * as logger from 'morgan';
import Routes from './interfaces/routes.interface';
import errorMiddleware from './middlewares/error.middleware';

class App {
    public app: express.Application;
    public port: (string | number);
    public env: boolean;
    express = require("express");
    url = require("url");
    swagger = require("swagger-node-express");

    constructor(routes: Routes[]) {
        this.app = express();
        this.port = process.env.PORT || 3000;
        this.env = process.env.NODE_ENV === 'production';

        this.connectToDatabase();
        this.initializeMiddlewares();
        this.initializeRoutes(routes);
        this.initializeSwagger();
        this.initializeErrorHandling();
    }

    public listen() {
        this.app.listen(this.port, () => {
            console.log(`🚀 App listening on the port ${this.port}`);
        });
    }

    public getServer() {
        return this.app;
    }

    private initializeMiddlewares() {
        if (this.env) {
            this.app.use(hpp());
            this.app.use(helmet());
            this.app.use(logger('combined'));
            this.app.use(cors({origin: 'your.domain.com', credentials: true}));
        } else {
            this.app.use(logger('dev'));
            this.app.use(cors({origin: true, credentials: true}));
        }

        this.app.use(express.json());
        this.app.use(express.urlencoded({extended: true}));
        this.app.use(cookieParser());
    }

    private initializeRoutes(routes: Routes[]) {
        routes.forEach((route) => {
            this.app.use('/', route.router);
        });
    }

    private initializeErrorHandling() {
        this.app.use(errorMiddleware);
    }

    private connectToDatabase() {
        const {MONGO_USER, MONGO_PASSWORD, MONGO_PATH, MONGO_DATABASE} = process.env;
        const options = {
            useCreateIndex: true,
            useNewUrlParser: true,
            useUnifiedTopology: true,
            useFindAndModify: false
        };
        if (MONGO_USER == '') {
            mongoose.connect(`mongodb://${MONGO_PATH}/${MONGO_DATABASE}`, {...options}).then(() => {
                console.log("conected")
            });

        } else {
            mongoose.connect(`mongodb://${MONGO_USER}:${MONGO_PASSWORD}${MONGO_PATH}/${MONGO_DATABASE}`, {...options}).then(() => {
                console.log("conected")
            });
        }
    }

    private initializeSwagger() {
        const swaggerJSDoc = require('swagger-jsdoc');
        const swaggerUi = require('swagger-ui-express');

        const options = {
            swaggerDefinition: {
                info: {         
                    title: 'REST API',
                    version: '1.0.0',
                    description: 'Example docs',
                },
            },
            apis: ['swagger.yaml'],
        };

        const specs = swaggerJSDoc(options);
        this.app.use('/swagger', swaggerUi.serve, swaggerUi.setup(specs));
    }


}

export default App;
