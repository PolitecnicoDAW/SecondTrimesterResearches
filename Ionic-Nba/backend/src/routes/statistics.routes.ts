import { Router } from 'express'
import { getStatistics } from '../controllers/stading.controller'

const router = Router();

router.route('/')
    .get(getStatistics)


export default router;