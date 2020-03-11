"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const stading_controller_1 = require("../controllers/stading.controller");
const router = express_1.Router();
router.route('/')
    .get(stading_controller_1.getStatistics);
exports.default = router;
