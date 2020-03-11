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
function getStadium(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        try {
            const conn = yield database_1.connect();
            const stadium = yield conn.query('SELECT * FROM stadiums');
            return res.json(stadium[0]);
        }
        catch (e) {
            console.log(e);
        }
    });
}
exports.getStadium = getStadium;
function getStadiums(req, res) {
    return __awaiter(this, void 0, void 0, function* () {
        const id = req.params.stadiumId;
        const conn = yield database_1.connect();
        const stadiums = yield conn.query('SELECT * FROM stadiums WHERE id = ?', [id]);
        res.json(stadiums[0]);
    });
}
exports.getStadiums = getStadiums;
