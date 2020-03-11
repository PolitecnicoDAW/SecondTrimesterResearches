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
function getTeam(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const conn = yield database_1.connect();
            const team = yield conn.query('SELECT * FROM teams');
            return res.json(team[0]);
        }
        catch (e) {
            console.log(e);
        }
    });
}
exports.getTeam = getTeam;
function getAllSquad(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        const id = req.params.teamId;
        const conn = yield database_1.connect();
        const players = yield conn.query('SELECT * FROM players WHERE teamID = ?', [id]);
        return res.json(players[0]);
    });
}
exports.getAllSquad = getAllSquad;
