import { Request, Response } from 'express'
import { connect } from '../database'


export async function getStadium(req: Request, res: Response): Promise<Response | void> {
    
    try {
        const conn = await connect();
        const stadium = await conn.query('SELECT * FROM stadiums');
        return res.json(stadium[0]);
    }
    catch (e) {
        console.log(e)
    }
}

export async function getStadiums(req: Request, res: Response) {
    const id = req.params.stadiumId;
    const conn = await connect();
    const stadiums = await conn.query('SELECT * FROM stadiums WHERE id = ?', [id]);
    res.json(stadiums[0]);
}
