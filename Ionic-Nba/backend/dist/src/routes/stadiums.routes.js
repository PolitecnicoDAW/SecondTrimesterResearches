"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const stadium_controller_1 = require("../controllers/stadium.controller");
const router = express_1.Router();
router.route('/')
    .get(stadium_controller_1.getStadium);
router.route('/:StadiumId')
    .get(stadium_controller_1.getStadiums);
exports.default = router;
