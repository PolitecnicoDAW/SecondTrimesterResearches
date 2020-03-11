import { Request, Response } from 'express'
import { connect } from '../database'


export async function getPlayers(req: Request, res: Response): Promise<Response | void> {
  
    try {
        const conn = await connect();
        const players = await conn.query('SELECT * FROM players');
        return res.json(players[0]);
    }
    catch (e) {
        console.log(e)
    }
}




export async function getPlayer(req: Request, res: Response) {
    const id = req.params.playerId;
    const conn = await connect();
    const players = await conn.query('SELECT * FROM players WHERE id = ?', [id]);
    res.json(players[0]);
}


