"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
const database_1 = require("../database");
function getPlayers(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const conn = yield database_1.connect();
            const players = yield conn.query('SELECT * FROM players');
            return res.json(players[0]);
        }
        catch (e) {
            console.log(e);
        }
    });
}
exports.getPlayers = getPlayers;
function getPlayer(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        const id = req.params.playerId;
        const conn = yield database_1.connect();
        const players = yield conn.query('SELECT * FROM players WHERE id = ?', [id]);
        res.json(players[0]);
    });
}
exports.getPlayer = getPlayer;
