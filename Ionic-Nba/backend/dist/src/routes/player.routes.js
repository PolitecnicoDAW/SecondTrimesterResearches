"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const player_controller_1 = require("../controllers/player.controller");
const multer_1 = __importDefault(require("../libs/multer"));
const router = express_1.Router();
router.route('/')
    .get(player_controller_1.getPlayers)
    .post(multer_1.default.single('image'), player_controller_1.createPlayer);
router.route('/:PlayerId')
    .get(player_controller_1.getPlayer)
    .delete(player_controller_1.deletePlayer)
    .put(player_controller_1.updatePlayer);
exports.default = router;
