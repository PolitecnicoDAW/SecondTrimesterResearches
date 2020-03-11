import { Router } from 'express'
import { getPlayers, getPlayer } from '../controllers/player.controller'


const router = Router();

router.route('/')
    .get(getPlayers)
    

router.route('/:PlayerId')
    .get(getPlayer)
   
export default router;