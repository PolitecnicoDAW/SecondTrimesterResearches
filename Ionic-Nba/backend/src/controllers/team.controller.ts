import { Request, Response } from 'express'
import { connect } from '../database'


export async function getTeam(req: Request, res: Response): Promise<Response | void> {
    try {
        const conn = await connect();
        const team = await conn.query('SELECT * FROM teams');
        return res.json(team[0]);
    }
    catch (e) {
        console.log(e)
    }
}


export async function getAllSquad(req: Request, res: Response){
    
        const id = req.params.teamId
        
        const conn = await connect();
        const players = await conn.query('SELECT * FROM players WHERE teamID = ?', [id]);
        
        return res.json(players[0]);
    
    
}


