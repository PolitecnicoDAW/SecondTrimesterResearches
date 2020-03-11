import { Router } from 'express'
import { getStadium, getStadiums } from '../controllers/stadium.controller'

const router = Router();

router.route('/')
    .get(getStadium)

router.route('/:StadiumId')
    .get(getStadiums);

export default router;