import { Request, Response } from 'express'
import { connect } from '../database'


export async function getStatistics(req: Request, res: Response): Promise<Response | void> {
    
    try {
        const conn = await connect();
        const statistics = await conn.query('SELECT * FROM stading');
        return res.json(statistics[0]);
    }
    catch (e) {
        console.log(e)
    }
}


