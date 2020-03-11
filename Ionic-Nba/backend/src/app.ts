import morgan from 'morgan';
import express, { Application } from 'express'

import cors from 'cors';

import IndexRoutes from './routes/index.routes'
import TeamRoutes from './routes/team.routes';
import PlayerRoutes from './routes/player.routes';

import path from 'path';
export class App {

    app;

    constructor(
        private port?: number | string
    ) {
        this.app = express();
        this.settings();
        this.middlewares();
        this.routes();
    }

    private settings() {
        this.app.set('port', this.port || process.env.PORT || 3000);
    }

    private middlewares() {
        this.app.use(morgan('dev'));
        this.app.use(cors())
        this.app.use(express.json());
    }

    private routes() {
        this.app.use(IndexRoutes);
        this.app.use('/teams', TeamRoutes);
        this.app.use('/players', PlayerRoutes);
        this.app.use('/uploads', express.static(path.resolve('uploads')))
    }

    async listen(): Promise<void> {
        await this.app.listen(this.app.get('port'));
        console.log('Server on port', this.app.get('port'));
    }

}
