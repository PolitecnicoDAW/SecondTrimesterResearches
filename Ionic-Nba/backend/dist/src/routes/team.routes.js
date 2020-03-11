"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const team_controller_1 = require("../controllers/team.controller");
const router = express_1.Router();
router.route('/')
    .get(team_controller_1.getTeam);
router.route('/:teamId')
    .get(team_controller_1.getAllSquad);
exports.default = router;
