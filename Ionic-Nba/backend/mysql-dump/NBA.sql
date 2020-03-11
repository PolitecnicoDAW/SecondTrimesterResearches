/*
 Navicat Premium Data Transfer

 Source Server         : rafaMysql
 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Host           : 51.91.56.134:3306
 Source Schema         : NBA

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 03/01/2020 15:50:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;


-- ----------------------------
-- Table structure for players
-- ----------------------------
DROP TABLE IF EXISTS `players`;
CREATE TABLE `players`  (
  `playerID` int(11) NOT NULL,
  `teamID` int(11) NULL DEFAULT NULL,
  `team` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `jersey` int(11) NULL DEFAULT NULL,
  `positionCategory` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `firstName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lastName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `height` int(11) NULL DEFAULT NULL,
  `weight` int(11) NULL DEFAULT NULL,
  `birthDate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthCity` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthState` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `college` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `salary` int(11) NULL DEFAULT NULL,
  `photoUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `experience` int(11) NULL DEFAULT NULL,
  INDEX `teamID`(`teamID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of players
-- ----------------------------
INSERT INTO `players` VALUES (20000439, 22, 'HOU', 42, 'C', 'C', 'Nene', 'Hilario', 211, 113, '1982-09-13T00:00:00', 'Sao Carlos', 'Brazil', NULL, 2282630, 'uploads\\\\20000439.jpg', 16);
INSERT INTO `players` VALUES (20000441, 1, 'WAS', 3, 'G', 'SG', 'Bradley', 'Beal', 191, 93, '1993-06-28T00:00:00', 'St. Louis', 'Missouri', 'Florida', 24112787, 'uploads\\\\20000441.jpg', 6);
INSERT INTO `players` VALUES (20000442, 1, 'WAS', 2, 'G', 'PG', 'John', 'Wall', 193, 95, '1990-09-06T00:00:00', 'Raleigh', 'North Carolina', 'Kentucky', 33997110, 'uploads\\\\20000442.jpg', 8);
INSERT INTO `players` VALUES (20000443, 11, 'CHI', 22, 'F', 'SF', 'Otto', 'Porter', 203, 89, '1993-06-03T00:00:00', 'St. Louis', 'Missouri', 'Georgetown', 24253012, 'uploads\\\\20000443.jpg', 5);
INSERT INTO `players` VALUES (20000452, 8, 'BKN', 17, 'G', 'SG', 'Garrett', 'Temple', 196, 88, '1986-05-08T00:00:00', 'Baton Rouge', 'Louisiana', 'LSU', 4242630, 'uploads\\\\20000452.jpg', 8);
INSERT INTO `players` VALUES (20000453, 5, 'ORL', 8, 'G', 'SG', 'Terrence', 'Ross', 198, 93, '1991-02-05T00:00:00', 'Portland', 'Oregon', 'Washington', 11125000, 'uploads\\\\20000453.jpg', 6);
INSERT INTO `players` VALUES (20000455, 21, 'MEM', 17, 'C', 'C', 'Jonas', 'Valanciunas', 211, 119, '1992-05-06T00:00:00', 'Utena', 'Lithuania', NULL, 14240000, 'uploads\\\\20000455.jpg', 6);
INSERT INTO `players` VALUES (20000456, 24, 'SA', 10, 'G', 'SG', 'DeMar', 'DeRozan', 198, 99, '1989-08-07T00:00:00', 'Compton', 'California', 'USC', 24688578, 'uploads\\\\20000456.jpg', 9);
INSERT INTO `players` VALUES (20000457, 10, 'TOR', 7, 'G', 'PG', 'Kyle', 'Lowry', 183, 88, '1986-03-25T00:00:00', 'Philadelphia', 'Pennsylvania', 'Villanova', 31146703, 'uploads\\\\20000457.jpg', 12);
INSERT INTO `players` VALUES (20000459, 28, 'LAC', 23, 'G', 'SG', 'Lou', 'Williams', 185, 79, '1986-10-27T00:00:00', 'Memphis', 'Tennessee', NULL, 7120000, 'uploads\\\\20000459.jpg', 13);
INSERT INTO `players` VALUES (20000460, 28, 'LAC', 54, 'F', 'PF', 'Patrick', 'Patterson', 203, 106, '1989-03-14T00:00:00', 'Washington', 'District of Columbia', 'Kentucky', 1442302, 'uploads\\\\20000460.jpg', 8);
INSERT INTO `players` VALUES (20000464, 4, 'MIA', 16, 'F', 'PF', 'James', 'Johnson', 201, 108, '1987-02-20T00:00:00', 'Cheyenne', 'Wyoming', 'Wake Forest', 13660966, 'uploads\\\\20000464.jpg', 9);
INSERT INTO `players` VALUES (20000466, 21, 'MEM', 5, 'F', 'SF', 'Bruno', 'Caboclo', 206, 98, '1995-09-21T00:00:00', 'Osasco', 'Brazil', NULL, 1642318, 'uploads\\\\20000466.jpg', 4);
INSERT INTO `players` VALUES (20000468, 27, 'LAL', 3, 'F', 'PF', 'Anthony', 'Davis', 208, 114, '1993-03-11T00:00:00', 'Chicago', 'Illinois', 'Kentucky', 24112786, 'uploads\\\\20000468.jpg', 6);
INSERT INTO `players` VALUES (20000471, 22, 'HOU', 10, 'G', 'SG', 'Eric', 'Gordon', 191, 97, '1988-12-25T00:00:00', 'Indianapolis', 'Indiana', 'Indiana', 12511380, 'uploads\\\\20000471.jpg', 10);
INSERT INTO `players` VALUES (20000474, 23, 'NO', 11, 'G', 'PG', 'Jrue', 'Holiday', 191, 92, '1990-06-12T00:00:00', 'Mission Hills', 'California', 'UCLA', 23345689, 'uploads\\\\20000474.jpg', 9);
INSERT INTO `players` VALUES (20000482, 26, 'GS', 23, 'F', 'PF', 'Draymond', 'Green', 198, 104, '1990-03-04T00:00:00', 'Saginaw', 'Michigan', 'Michigan State', 16499826, 'uploads\\\\20000482.jpg', 6);
INSERT INTO `players` VALUES (20000483, 30, 'SAC', 40, 'F', 'SF', 'Harrison', 'Barnes', 203, 101, '1992-05-30T00:00:00', 'Ames', 'Iowa', 'North Carolina', 21491477, 'uploads\\\\20000483.jpg', 6);
INSERT INTO `players` VALUES (20000485, 26, 'GS', 30, 'G', 'PG', 'Stephen', 'Curry', 191, 83, '1988-03-14T00:00:00', 'Akron', 'Ohio', 'Davidson', 35806265, 'uploads\\\\20000485.jpg', 9);
INSERT INTO `players` VALUES (20000486, 26, 'GS', 11, 'G', 'SG', 'Klay', 'Thompson', 198, 97, '1990-02-08T00:00:00', 'Los Angeles', 'California', 'Washington State', 29140380, 'uploads\\\\20000486.jpg', 7);
INSERT INTO `players` VALUES (20000487, 21, 'MEM', 9, 'F', 'SF', 'Andre', 'Iguodala', 198, 97, '1984-01-28T00:00:00', 'Springfield', 'Illinois', 'Arizona', 15294815, 'uploads\\\\20000487.jpg', 14);
INSERT INTO `players` VALUES (20000492, 13, 'IND', 8, 'G', 'SG', 'Justin', 'Holiday', 198, 81, '1989-04-05T00:00:00', 'Mission Hills', 'California', 'Washington', 4242630, 'uploads\\\\20000492.jpg', 5);
INSERT INTO `players` VALUES (20000497, 15, 'MIL', 34, 'F', 'PF', 'Giannis', 'Antetokounmpo', 211, 109, '1994-12-06T00:00:00', 'Athens', 'Greece', NULL, 23000000, 'uploads\\\\20000497.jpg', 5);
INSERT INTO `players` VALUES (20000515, 4, 'MIA', 22, 'G', 'SG', 'Jimmy', 'Butler', 201, 104, '1989-09-14T00:00:00', 'Houston', 'Texas', 'Marquette', 29140380, 'uploads\\\\20000515.jpg', 7);
INSERT INTO `players` VALUES (20000516, 14, 'DET', 25, 'G', 'PG', 'Derrick', 'Rose', 188, 90, '1988-10-04T00:00:00', 'Chicago', 'Illinois', 'Memphis', 6512195, 'uploads\\\\20000516.jpg', 9);
INSERT INTO `players` VALUES (20000524, 23, 'NO', 55, 'G', 'SG', 'E\'Twaun', 'Moore', 191, 86, '1989-02-25T00:00:00', 'East Chicago', 'Indiana', 'Purdue', 7711786, 'uploads\\\\20000524.jpg', 7);
INSERT INTO `players` VALUES (20000526, 3, 'ATL', 31, 'F', 'SF', 'Chandler', 'Parsons', 206, 104, '1988-10-25T00:00:00', 'Casselberry', 'Florida', 'Florida', 22341235, 'uploads\\\\20000526.jpg', 7);
INSERT INTO `players` VALUES (20000528, 22, 'HOU', 19, 'C', 'C', 'Tyson', 'Chandler', 213, 106, '1982-10-02T00:00:00', 'Hanford', 'California', NULL, 1442302, 'uploads\\\\20000528.jpg', 17);
INSERT INTO `players` VALUES (20000530, 27, 'LAL', 9, 'G', 'PG', 'Rajon', 'Rondo', 185, 81, '1986-02-22T00:00:00', 'Louisville', 'Kentucky', 'Kentucky', 2282630, 'uploads\\\\20000530.jpg', 12);
INSERT INTO `players` VALUES (20000541, 30, 'SAC', 0, 'F', 'SF', 'Trevor', 'Ariza', 203, 97, '1985-06-30T00:00:00', 'Miami', 'Florida', 'UCLA', 10853659, 'uploads\\\\20000541.jpg', 14);
INSERT INTO `players` VALUES (20000543, 27, 'LAL', 39, 'C', 'C', 'Dwight', 'Howard', 208, 119, '1985-12-08T00:00:00', 'Atlanta', 'Georgia', NULL, 1442302, 'uploads\\\\20000543.jpg', 14);
INSERT INTO `players` VALUES (20000544, 22, 'HOU', 13, 'G', 'PG', 'James', 'Harden', 196, 99, '1989-08-26T00:00:00', 'Bellflower', 'California', 'Arizona State', 33997110, 'uploads\\\\20000544.jpg', 9);
INSERT INTO `players` VALUES (20000549, 22, 'HOU', 15, 'C', 'C', 'Clint', 'Capela', 208, 108, '1994-05-18T00:00:00', 'Geneva', 'Switzerland', NULL, 13257931, 'uploads\\\\20000549.jpg', 4);
INSERT INTO `players` VALUES (20000554, 28, 'LAC', 21, 'G', 'PG', 'Patrick', 'Beverley', 185, 81, '1988-07-12T00:00:00', 'Chicago', 'Illinois', 'Arkansas', 10987655, 'uploads\\\\20000554.jpg', 6);
INSERT INTO `players` VALUES (20000571, 27, 'LAL', 23, 'F', 'SF', 'LeBron', 'James', 206, 113, '1984-12-30T00:00:00', 'Akron', 'Ohio', NULL, 33318804, 'uploads\\\\20000571.jpg', 15);
INSERT INTO `players` VALUES (20000572, 12, 'CLE', 0, 'F', 'PF', 'Kevin', 'Love', 203, 113, '1988-09-07T00:00:00', 'Santa Monica', 'California', 'UCLA', 25759119, 'uploads\\\\20000572.jpg', 10);
INSERT INTO `players` VALUES (20000574, 8, 'BKN', 11, 'G', 'PG', 'Kyrie', 'Irving', 188, 88, '1992-03-23T00:00:00', 'Melbourne', 'Victoria', 'Duke', 28250380, 'uploads\\\\20000574.jpg', 7);
INSERT INTO `players` VALUES (20000577, 12, 'CLE', 13, 'C', 'C', 'Tristan', 'Thompson', 206, 114, '1991-03-13T00:00:00', 'Brampton', 'Ontario', 'Texas', 16499826, 'uploads\\\\20000577.jpg', 7);
INSERT INTO `players` VALUES (20000579, 12, 'CLE', 18, 'G', 'PG', 'Matthew', 'Dellavedova', 191, 90, '1990-09-08T00:00:00', 'Maryborough', 'Australia', 'Saint Mary&#x27;s', 8550675, 'uploads\\\\20000579.jpg', 5);
INSERT INTO `players` VALUES (20000584, 8, 'BKN', 12, 'F', 'SF', 'Joe', 'Harris', 198, 99, '1991-09-06T00:00:00', 'Chelan', 'Washington', 'Virginia', 6823334, 'uploads\\\\20000584.jpg', 4);
INSERT INTO `players` VALUES (20000587, 11, 'CHI', 21, 'F', 'PF', 'Thaddeus', 'Young', 203, 106, '1988-06-21T00:00:00', 'New Orleans', 'Louisiana', 'Georgia Tech', 11481000, 'uploads\\\\20000587.jpg', 11);
INSERT INTO `players` VALUES (20000588, 15, 'MIL', 11, 'C', 'C', 'Brook', 'Lopez', 213, 127, '1988-04-01T00:00:00', 'Panorama City', 'California', 'Stanford', 10762790, 'uploads\\\\20000588.jpg', 10);
INSERT INTO `players` VALUES (20000591, 17, 'UTA', 44, 'F', 'SF', 'Bojan', 'Bogdanovic', 203, 102, '1989-04-18T00:00:00', 'Mostar', 'Yugoslavia', NULL, 15130000, 'uploads\\\\20000591.jpg', 4);
INSERT INTO `players` VALUES (20000603, 7, 'PHI', 42, 'F', 'PF', 'Al', 'Horford', 206, 108, '1986-06-03T00:00:00', 'Puerto Plata', 'Dominican Republic', 'Florida', 24920000, 'uploads\\\\20000603.jpg', 11);
INSERT INTO `players` VALUES (20000616, 24, 'SA', 12, 'F', 'PF', 'LaMarcus', 'Aldridge', 211, 113, '1985-07-19T00:00:00', 'Dallas', 'Texas', 'Texas', 23140000, 'uploads\\\\20000616.jpg', 12);
INSERT INTO `players` VALUES (20000617, 2, 'CHA', 5, 'G', 'SG', 'Nicolas', 'Batum', 206, 104, '1988-12-14T00:00:00', 'Lisieux', 'France', NULL, 22753043, 'uploads\\\\20000617.jpg', 10);
INSERT INTO `players` VALUES (20000618, 15, 'MIL', 42, 'C', 'C', 'Robin', 'Lopez', 213, 126, '1988-04-01T00:00:00', 'North Hollywood', 'California', 'Stanford', 4242630, 'uploads\\\\20000618.jpg', 10);
INSERT INTO `players` VALUES (20000619, 19, 'POR', 0, 'G', 'PG', 'Damian', 'Lillard', 188, 88, '1990-07-15T00:00:00', 'Oakland', 'California', 'Weber State', 26524066, 'uploads\\\\20000619.jpg', 6);
INSERT INTO `players` VALUES (20000620, 19, 'POR', 3, 'G', 'SG', 'C.J.', 'McCollum', 191, 86, '1991-09-19T00:00:00', 'Canton', 'Ohio', 'Lehigh', 24525694, 'uploads\\\\20000620.jpg', 5);
INSERT INTO `players` VALUES (20000621, 4, 'MIA', 0, 'C', 'C', 'Meyers', 'Leonard', 213, 117, '1992-02-27T00:00:00', 'Robinson', 'Illinois', 'Illinois', 10044999, 'uploads\\\\20000621.jpg', 6);
INSERT INTO `players` VALUES (20000622, 3, 'ATL', 33, 'G', 'SG', 'Allen', 'Crabbe', 196, 95, '1992-04-09T00:00:00', 'Los Angeles', 'California', 'California', 16465000, 'uploads\\\\20000622.jpg', 5);
INSERT INTO `players` VALUES (20000625, 14, 'DET', 12, 'G', 'PG', 'Tim', 'Frazier', 183, 77, '1990-11-01T00:00:00', 'Houston', 'Texas', 'Penn State', 1442302, 'uploads\\\\20000625.jpg', 4);
INSERT INTO `players` VALUES (20000629, 15, 'MIL', 9, 'G', 'SG', 'Wesley', 'Matthews', 193, 99, '1986-10-14T00:00:00', 'San Antonio', 'Texas', 'Marquette', 2282630, 'uploads\\\\20000629.jpg', 9);
INSERT INTO `players` VALUES (20000632, 17, 'UTA', 22, 'F', 'SF', 'Jeff', 'Green', 203, 106, '1986-08-28T00:00:00', 'Cheverly', 'Maryland', 'Georgetown', 1442302, 'uploads\\\\20000632.jpg', 10);
INSERT INTO `players` VALUES (20000633, 10, 'TOR', 33, 'C', 'C', 'Marc', 'Gasol', 211, 115, '1985-01-29T00:00:00', 'Barcelona', 'Spain', NULL, 22780173, 'uploads\\\\20000633.jpg', 10);
INSERT INTO `players` VALUES (20000634, 25, 'DAL', 1, 'G', 'SG', 'Courtney', 'Lee', 196, 97, '1985-10-03T00:00:00', 'Indianapolis', 'Indiana', 'Western Kentucky', 11356106, 'uploads\\\\20000634.jpg', 10);
INSERT INTO `players` VALUES (20000635, 17, 'UTA', 10, 'G', 'PG', 'Mike', 'Conley', 185, 79, '1987-10-11T00:00:00', 'Fayetteville', 'Arkansas', 'Ohio State', 28935345, 'uploads\\\\20000635.jpg', 11);
INSERT INTO `players` VALUES (20000638, 3, 'ATL', 15, 'G', 'SG', 'Vince', 'Carter', 198, 99, '1977-01-26T00:00:00', 'Daytona Beach', 'Florida', 'North Carolina', 1442302, 'uploads\\\\20000638.jpg', 20);
INSERT INTO `players` VALUES (20000642, 28, 'LAC', 4, 'F', 'PF', 'JaMychal', 'Green', 203, 102, '1990-06-21T00:00:00', 'Montgomery', 'Alabama', 'Alabama', 4242630, 'uploads\\\\20000642.jpg', 4);
INSERT INTO `players` VALUES (20000646, 28, 'LAC', 2, 'F', 'SF', 'Kawhi', 'Leonard', 201, 101, '1991-06-29T00:00:00', 'Riverside', 'California', 'San Diego State', 29140380, 'uploads\\\\20000646.jpg', 7);
INSERT INTO `players` VALUES (20000650, 27, 'LAL', 14, 'G', 'SG', 'Danny', 'Green', 198, 97, '1987-06-22T00:00:00', 'North Babylon', 'New York', 'North Carolina', 13024390, 'uploads\\\\20000650.jpg', 9);
INSERT INTO `players` VALUES (20000652, 29, 'PHO', 46, 'C', 'C', 'Aron', 'Baynes', 208, 117, '1986-12-09T00:00:00', 'Gisborne', 'New Zealand', 'Washington State', 4853419, 'uploads\\\\20000652.jpg', 6);
INSERT INTO `players` VALUES (20000654, 24, 'SA', 18, 'G', 'SG', 'Marco', 'Belinelli', 196, 99, '1986-03-25T00:00:00', 'Bologna', 'Italy', NULL, 5203077, 'uploads\\\\20000654.jpg', 11);
INSERT INTO `players` VALUES (20000661, 14, 'DET', 23, 'F', 'PF', 'Blake', 'Griffin', 206, 113, '1989-03-16T00:00:00', 'Oklahoma City', 'Oklahoma', 'Oklahoma', 30660468, 'uploads\\\\20000661.jpg', 8);
INSERT INTO `players` VALUES (20000663, 8, 'BKN', 6, 'C', 'C', 'DeAndre', 'Jordan', 211, 119, '1988-07-21T00:00:00', 'Houston', 'Texas', 'Texas A&amp;M', 8794622, 'uploads\\\\20000663.jpg', 10);
INSERT INTO `players` VALUES (20000664, 18, 'OKC', 3, 'G', 'PG', 'Chris', 'Paul', 185, 79, '1985-05-06T00:00:00', 'Winston-Salem', 'North Carolina', 'Wake Forest', 34270769, 'uploads\\\\20000664.jpg', 13);
INSERT INTO `players` VALUES (20000665, 23, 'NO', 4, 'F', 'SF', 'J.J.', 'Redick', 191, 90, '1984-06-24T00:00:00', 'Cookeville', 'Tennessee', 'Duke', 12002807, 'uploads\\\\20000665.jpg', 12);
INSERT INTO `players` VALUES (20000667, 22, 'HOU', 25, 'G', 'PG', 'Austin', 'Rivers', 191, 90, '1992-08-01T00:00:00', 'Santa Monica', 'California', 'Duke', 1911112, 'uploads\\\\20000667.jpg', 6);
INSERT INTO `players` VALUES (20000676, 7, 'PHI', 12, 'F', 'SF', 'Tobias', 'Harris', 203, 102, '1992-07-15T00:00:00', 'Islip', 'New York', 'Tennessee', 29140380, 'uploads\\\\20000676.jpg', 7);
INSERT INTO `players` VALUES (20000677, 7, 'PHI', 9, 'C', 'C', 'Kyle', 'O\'Quinn', 206, 113, '1990-03-26T00:00:00', 'Jamaica', 'New York', 'Norfolk State', 1442302, 'uploads\\\\20000677.jpg', 6);
INSERT INTO `players` VALUES (20000678, 5, 'ORL', 9, 'C', 'C', 'Nikola', 'Vucevic', 211, 117, '1990-10-24T00:00:00', 'Morges', 'Switzerland', 'USC', 24920000, 'uploads\\\\20000678.jpg', 7);
INSERT INTO `players` VALUES (20000689, 13, 'IND', 4, 'G', 'SG', 'Victor', 'Oladipo', 193, 96, '1992-05-04T00:00:00', 'Upper Marlboro', 'Maryland', 'Indiana', 18690000, 'uploads\\\\20000689.jpg', 5);
INSERT INTO `players` VALUES (20000691, 23, 'NO', 21, 'F', 'SF', 'Darius', 'Miller', 198, 101, '1990-03-21T00:00:00', 'Maysville', 'Kentucky', 'Kentucky', 6230000, 'uploads\\\\20000691.jpg', 4);
INSERT INTO `players` VALUES (20000698, 27, 'LAL', 30, 'G', 'SG', 'Troy', 'Daniels', 193, 90, '1991-07-15T00:00:00', 'Roanoke', 'Virginia', 'Virginia Commonwealth', 1442302, 'uploads\\\\20000698.jpg', 5);
INSERT INTO `players` VALUES (20000707, 17, 'UTA', 17, 'F', 'PF', 'Ed', 'Davis', 206, 98, '1989-06-05T00:00:00', 'Washington', 'District of Columbia', 'North Carolina', 4242630, 'uploads\\\\20000707.jpg', 8);
INSERT INTO `players` VALUES (20000708, 12, 'CLE', 8, 'G', 'PG', 'Jordan', 'Clarkson', 193, 87, '1992-06-07T00:00:00', 'San Antonio', 'Texas', 'Missouri', 11959375, 'uploads\\\\20000708.jpg', 4);
INSERT INTO `players` VALUES (20000710, 6, 'NY', 30, 'F', 'PF', 'Julius', 'Randle', 203, 113, '1994-11-29T00:00:00', 'Dallas', 'Texas', 'Kentucky', 16020000, 'uploads\\\\20000710.jpg', 4);
INSERT INTO `players` VALUES (20000712, 6, 'NY', 2, 'G', 'SG', 'Wayne', 'Ellington', 193, 93, '1987-11-29T00:00:00', 'Wynnewood', 'Pennsylvania', 'North Carolina', 7120000, 'uploads\\\\20000712.jpg', 9);
INSERT INTO `players` VALUES (20000716, 18, 'OKC', 9, 'C', 'C', 'Nerlens', 'Noel', 208, 99, '1994-04-10T00:00:00', 'Malden', 'Massachusetts', 'Kentucky', 1442302, 'uploads\\\\20000716.jpg', 4);
INSERT INTO `players` VALUES (20000724, 13, 'IND', 14, 'F', 'SF', 'Jakarr', 'Sampson', 201, 96, '1993-03-20T00:00:00', 'Cleveland', 'Ohio', 'St. John&#x27;s', 1442302, 'uploads\\\\20000724.jpg', 3);
INSERT INTO `players` VALUES (20000726, 7, 'PHI', 21, 'C', 'C', 'Joel', 'Embiid', 213, 126, '1994-03-16T00:00:00', 'Yaounde', 'Cameroon', 'Kansas', 24479121, 'uploads\\\\20000726.jpg', 2);
INSERT INTO `players` VALUES (20000742, 28, 'LAC', 13, 'F', 'SF', 'Paul', 'George', 203, 99, '1990-05-02T00:00:00', 'Palmdale', 'California', 'Fresno State', 27199023, 'uploads\\\\20000742.jpg', 8);
INSERT INTO `players` VALUES (20000743, 15, 'MIL', 3, 'G', 'PG', 'George', 'Hill', 191, 85, '1986-05-04T00:00:00', 'Indianapolis', 'Indiana', 'IUPUI', 8129177, 'uploads\\\\20000743.jpg', 10);
INSERT INTO `players` VALUES (20000745, 12, 'CLE', 20, 'G', 'PG', 'Brandon', 'Knight', 188, 82, '1991-12-02T00:00:00', 'Miami', 'Florida', 'Kentucky', 13922938, 'uploads\\\\20000745.jpg', 6);
INSERT INTO `players` VALUES (20000748, 2, 'CHA', 14, 'F', 'SF', 'Michael', 'Kidd-Gilchrist', 198, 104, '1993-09-26T00:00:00', 'Philadelphia', 'Pennsylvania', 'Kentucky', 11570000, 'uploads\\\\20000748.jpg', 6);
INSERT INTO `players` VALUES (20000749, 2, 'CHA', 2, 'F', 'PF', 'Marvin', 'Williams', 203, 107, '1986-06-19T00:00:00', 'Bremerton', 'Washington', 'North Carolina', 13355563, 'uploads\\\\20000749.jpg', 13);
INSERT INTO `players` VALUES (20000752, 9, 'BOS', 8, 'G', 'PG', 'Kemba', 'Walker', 183, 83, '1990-05-08T00:00:00', 'Bronx', 'New York', 'Connecticut', 29140380, 'uploads\\\\20000752.jpg', 7);
INSERT INTO `players` VALUES (20000780, 4, 'MIA', 40, 'F', 'PF', 'Udonis', 'Haslem', 203, 106, '1980-06-09T00:00:00', 'Miami', 'Florida', 'Florida', 1442302, 'uploads\\\\20000780.jpg', 15);
INSERT INTO `players` VALUES (20000784, 19, 'POR', 0, 'F', 'PF', 'Carmelo', 'Anthony', 203, 107, '1984-05-29T00:00:00', 'Brooklyn', 'New York', 'Syracuse', 1214142, 'uploads\\\\20000784.jpg', 15);
INSERT INTO `players` VALUES (20000788, 25, 'DAL', 11, 'F', 'SF', 'Tim', 'Hardaway Jr.', 196, 92, '1992-03-16T00:00:00', 'Miami', 'Florida', 'Michigan', 17822363, 'uploads\\\\20000788.jpg', 5);
INSERT INTO `players` VALUES (20000795, 16, 'MIN', 22, 'F', 'SF', 'Andrew', 'Wiggins', 201, 89, '1995-02-23T00:00:00', 'Toronto', 'Ontario', 'Kansas', 24479121, 'uploads\\\\20000795.jpg', 4);
INSERT INTO `players` VALUES (20000797, 29, 'PHO', 11, 'G', 'PG', 'Ricky', 'Rubio', 191, 86, '1990-10-21T00:00:00', 'El Masnou', 'Spain', NULL, 14418000, 'uploads\\\\20000797.jpg', 7);
INSERT INTO `players` VALUES (20000804, 11, 'CHI', 8, 'G', 'PG', 'Zach', 'LaVine', 198, 90, '1995-03-10T00:00:00', 'Renton', 'Washington', 'UCLA', 17355000, 'uploads\\\\20000804.jpg', 4);
INSERT INTO `players` VALUES (20000806, 26, 'GS', 22, 'G', 'SG', 'Glenn', 'Robinson III', 198, 100, '1994-01-08T00:00:00', 'Gary', 'Indiana', 'Michigan', 1442302, 'uploads\\\\20000806.jpg', 4);
INSERT INTO `players` VALUES (20000810, 14, 'DET', 0, 'C', 'C', 'Andre', 'Drummond', 208, 126, '1993-08-10T00:00:00', 'Mount Vernon', 'New York', 'Connecticut', 24112787, 'uploads\\\\20000810.jpg', 6);
INSERT INTO `players` VALUES (20000811, 27, 'LAL', 1, 'G', 'SG', 'Kentavious', 'Caldwell-Pope', 196, 92, '1993-02-18T00:00:00', 'Thomaston', 'Georgia', 'Georgia', 7199461, 'uploads\\\\20000811.jpg', 5);
INSERT INTO `players` VALUES (20000813, 5, 'ORL', 14, 'G', 'PG', 'D.J.', 'Augustin', 180, 82, '1987-11-10T00:00:00', 'New Orleans', 'Louisiana', 'Texas', 6452500, 'uploads\\\\20000813.jpg', 10);
INSERT INTO `players` VALUES (20000816, 8, 'BKN', 8, 'G', 'PG', 'Spencer', 'Dinwiddie', 196, 97, '1993-04-06T00:00:00', 'Los Angeles', 'California', 'Colorado', 9438984, 'uploads\\\\20000816.jpg', 4);
INSERT INTO `players` VALUES (20000822, 18, 'OKC', 8, 'F', 'SF', 'Danilo', 'Gallinari', 208, 105, '1988-08-08T00:00:00', 'Sant\'Angelo Lodigiano', 'Italy', NULL, 20127848, 'uploads\\\\20000822.jpg', 9);
INSERT INTO `players` VALUES (20000824, 8, 'BKN', 21, 'F', 'SF', 'Wilson', 'Chandler', 203, 106, '1987-05-10T00:00:00', 'Benton Harbor', 'Michigan', 'DePaul', 1442302, 'uploads\\\\20000824.jpg', 10);
INSERT INTO `players` VALUES (20000827, 19, 'POR', 27, 'C', 'C', 'Jusuf', 'Nurkic', 213, 131, '1994-08-23T00:00:00', 'Tuzla', 'Bosnia', NULL, 11681250, 'uploads\\\\20000827.jpg', 4);
INSERT INTO `players` VALUES (20000828, 27, 'LAL', 7, 'C', 'C', 'JaVale', 'McGee', 213, 122, '1988-01-19T00:00:00', 'Flint', 'Michigan', 'Nevada', 3560000, 'uploads\\\\20000828.jpg', 10);
INSERT INTO `players` VALUES (20000832, 20, 'DEN', 14, 'G', 'SG', 'Gary', 'Harris', 193, 95, '1994-09-14T00:00:00', 'Fishers', 'Indiana', 'Michigan State', 15876965, 'uploads\\\\20000832.jpg', 4);
INSERT INTO `players` VALUES (20000833, 9, 'BOS', 20, 'F', 'SF', 'Gordon', 'Hayward', 201, 101, '1990-03-23T00:00:00', 'Brownsburg', 'Indiana', 'Butler', 29103614, 'uploads\\\\20000833.jpg', 8);
INSERT INTO `players` VALUES (20000837, 26, 'GS', 8, 'G', 'SG', 'Alec', 'Burks', 198, 96, '1991-07-20T00:00:00', 'Grandview', 'Missouri', 'Colorado', 1442302, 'uploads\\\\20000837.jpg', 7);
INSERT INTO `players` VALUES (20000839, 19, 'POR', 5, 'G', 'SG', 'Rodney', 'Hood', 203, 94, '1992-10-20T00:00:00', 'Meridian', 'Mississippi', 'Duke', 5089020, 'uploads\\\\20000839.jpg', 4);
INSERT INTO `players` VALUES (20000840, 17, 'UTA', 27, 'C', 'C', 'Rudy', 'Gobert', 216, 116, '1992-06-26T00:00:00', 'Saint-Quentin', 'France', NULL, 20685000, 'uploads\\\\20000840.jpg', 5);
INSERT INTO `players` VALUES (20000842, 17, 'UTA', 2, 'F', 'SF', 'Joe', 'Ingles', 201, 99, '1987-10-02T00:00:00', 'Happy Valley', 'South Australia', NULL, 10639546, 'uploads\\\\20000842.jpg', 4);
INSERT INTO `players` VALUES (20000847, 6, 'NY', 13, 'F', 'PF', 'Marcus', 'Morris', 203, 98, '1989-09-02T00:00:00', 'Philadelphia', 'Pennsylvania', 'Kansas', 13350000, 'uploads\\\\20000847.jpg', 7);
INSERT INTO `players` VALUES (20000848, 14, 'DET', 8, 'F', 'PF', 'Markieff', 'Morris', 203, 110, '1989-09-02T00:00:00', 'Philadelphia', 'Pennsylvania', 'Kansas', 2848000, 'uploads\\\\20000848.jpg', 7);
INSERT INTO `players` VALUES (20000849, 4, 'MIA', 7, 'G', 'PG', 'Goran', 'Dragic', 191, 86, '1986-05-06T00:00:00', 'Ljubljana', 'Yugoslavia', NULL, 17103931, 'uploads\\\\20000849.jpg', 10);
INSERT INTO `players` VALUES (20000850, 15, 'MIL', 6, 'G', 'PG', 'Eric', 'Bledsoe', 185, 96, '1989-12-09T00:00:00', 'Birmingham', 'Alabama', 'Kentucky', 13906250, 'uploads\\\\20000850.jpg', 8);
INSERT INTO `players` VALUES (20000851, 22, 'HOU', 14, 'G', 'SG', 'Gerald', 'Green', 198, 92, '1986-01-26T00:00:00', 'Houston', 'Texas', NULL, 1442302, 'uploads\\\\20000851.jpg', 11);
INSERT INTO `players` VALUES (20000852, 3, 'ATL', 25, 'C', 'C', 'Alex', 'Len', 213, 113, '1993-06-16T00:00:00', 'Antratsit', 'Ukraine', 'Maryland', 3702400, 'uploads\\\\20000852.jpg', 5);
INSERT INTO `players` VALUES (20000856, 22, 'HOU', 17, 'F', 'SF', 'P.J.', 'Tucker', 196, 110, '1985-05-05T00:00:00', 'Raleigh', 'North Carolina', 'Texas', 7430645, 'uploads\\\\20000856.jpg', 7);
INSERT INTO `players` VALUES (20000864, 22, 'HOU', 16, 'G', 'SG', 'Ben', 'McLemore', 191, 88, '1993-02-11T00:00:00', 'St. Louis', 'Missouri', 'Kansas', 1805449, 'uploads\\\\20000864.jpg', 5);
INSERT INTO `players` VALUES (20000874, 10, 'TOR', 9, 'F', 'PF', 'Serge', 'Ibaka', 213, 106, '1989-09-18T00:00:00', 'Brazzaville', 'Congo', NULL, 20711728, 'uploads\\\\20000874.jpg', 9);
INSERT INTO `players` VALUES (20000875, 18, 'OKC', 12, 'C', 'C', 'Steven', 'Adams', 211, 119, '1993-07-20T00:00:00', 'Rotorua', 'New Zealand', 'Pittsburgh', 23000000, 'uploads\\\\20000875.jpg', 5);
INSERT INTO `players` VALUES (20000876, 18, 'OKC', 21, 'G', 'SG', 'Andre', 'Roberson', 201, 95, '1991-12-04T00:00:00', 'Las Cruces', 'New Mexico', 'Colorado', 9559259, 'uploads\\\\20000876.jpg', 5);
INSERT INTO `players` VALUES (20000877, 22, 'HOU', 0, 'G', 'PG', 'Russell', 'Westbrook', 191, 90, '1988-11-12T00:00:00', 'Long Beach', 'California', 'UCLA', 34270769, 'uploads\\\\20000877.jpg', 10);
INSERT INTO `players` VALUES (20000884, 8, 'BKN', 7, 'F', 'SF', 'Kevin', 'Durant', 208, 108, '1988-09-29T00:00:00', 'Washington', 'District of Columbia', 'Texas', 33997110, 'uploads\\\\20000884.jpg', 11);
INSERT INTO `players` VALUES (20000933, 25, 'DAL', 30, 'G', 'SG', 'Seth', 'Curry', 188, 83, '1990-08-23T00:00:00', 'Charlotte', 'North Carolina', 'Duke', 6640628, 'uploads\\\\20000933.jpg', 4);

-- ----------------------------
-- Table structure for stading
-- ----------------------------
DROP TABLE IF EXISTS `stading`;
CREATE TABLE `stading`  (
  `teamID` int(11) NULL DEFAULT NULL,
  `wins` int(11) NULL DEFAULT NULL,
  `losses` int(11) NULL DEFAULT NULL,
  `conferenceWins` int(11) NULL DEFAULT NULL,
  `conferenceLosses` int(11) NULL DEFAULT NULL,
  `divisionWins` int(11) NULL DEFAULT NULL,
  `divisionLosses` int(11) NULL DEFAULT NULL,
  `homeWins` int(11) NULL DEFAULT NULL,
  `homeLosses` int(11) NULL DEFAULT NULL,
  `awayWins` int(11) NULL DEFAULT NULL,
  `awayLosses` int(11) NULL DEFAULT NULL,
  INDEX `teamID`(`teamID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stading
-- ----------------------------
INSERT INTO `stading` VALUES (10, 58, 24, 36, 16, 12, 4, 32, 9, 26, 15);
INSERT INTO `stading` VALUES (7, 51, 31, 31, 21, 8, 8, 31, 10, 20, 21);
INSERT INTO `stading` VALUES (9, 49, 33, 35, 17, 10, 6, 28, 13, 21, 20);
INSERT INTO `stading` VALUES (8, 42, 40, 29, 23, 8, 8, 23, 18, 19, 22);
INSERT INTO `stading` VALUES (6, 17, 65, 11, 41, 2, 14, 9, 32, 8, 33);
INSERT INTO `stading` VALUES (15, 60, 22, 40, 12, 14, 2, 33, 8, 27, 14);
INSERT INTO `stading` VALUES (13, 48, 34, 33, 19, 11, 5, 29, 12, 19, 22);
INSERT INTO `stading` VALUES (14, 41, 41, 27, 25, 8, 8, 26, 15, 15, 26);
INSERT INTO `stading` VALUES (11, 22, 60, 16, 36, 3, 13, 9, 32, 13, 28);
INSERT INTO `stading` VALUES (12, 19, 63, 15, 37, 4, 12, 13, 28, 6, 35);
INSERT INTO `stading` VALUES (5, 42, 40, 30, 22, 10, 6, 25, 16, 17, 24);
INSERT INTO `stading` VALUES (2, 39, 43, 29, 23, 10, 6, 25, 16, 14, 27);
INSERT INTO `stading` VALUES (4, 39, 43, 23, 29, 7, 9, 19, 22, 20, 21);
INSERT INTO `stading` VALUES (1, 32, 50, 19, 33, 7, 9, 22, 19, 10, 31);
INSERT INTO `stading` VALUES (3, 29, 53, 16, 36, 6, 10, 17, 24, 12, 29);
INSERT INTO `stading` VALUES (20, 54, 28, 34, 18, 12, 4, 34, 7, 20, 21);
INSERT INTO `stading` VALUES (19, 53, 29, 29, 23, 6, 10, 32, 9, 21, 20);
INSERT INTO `stading` VALUES (17, 50, 32, 30, 22, 8, 8, 29, 12, 21, 20);
INSERT INTO `stading` VALUES (18, 49, 33, 28, 24, 9, 7, 27, 14, 22, 19);
INSERT INTO `stading` VALUES (16, 36, 46, 22, 30, 5, 11, 25, 16, 11, 30);
INSERT INTO `stading` VALUES (26, 57, 25, 35, 17, 13, 3, 30, 11, 27, 14);
INSERT INTO `stading` VALUES (28, 48, 34, 28, 24, 11, 5, 26, 15, 22, 19);
INSERT INTO `stading` VALUES (30, 39, 43, 21, 31, 4, 12, 24, 17, 15, 26);
INSERT INTO `stading` VALUES (27, 37, 45, 25, 27, 9, 7, 22, 19, 15, 26);
INSERT INTO `stading` VALUES (29, 19, 63, 11, 41, 3, 13, 12, 29, 7, 34);
INSERT INTO `stading` VALUES (22, 53, 29, 32, 20, 10, 6, 31, 10, 22, 19);
INSERT INTO `stading` VALUES (24, 48, 34, 30, 22, 10, 6, 32, 9, 16, 25);
INSERT INTO `stading` VALUES (21, 33, 49, 24, 28, 8, 8, 21, 20, 12, 29);
INSERT INTO `stading` VALUES (23, 33, 49, 23, 29, 8, 8, 19, 22, 14, 27);
INSERT INTO `stading` VALUES (25, 33, 49, 18, 34, 4, 12, 24, 17, 9, 32);

-- ----------------------------
-- Table structure for stadiums
-- ----------------------------
DROP TABLE IF EXISTS `stadiums`;
CREATE TABLE `stadiums`  (
  `stadiumID` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `zip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `capacity` int(11) NULL DEFAULT NULL,
  `geoLat` float NULL DEFAULT NULL,
  `geoLong` float NULL DEFAULT NULL,
  INDEX `stadiumID`(`stadiumID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stadiums
-- ----------------------------
INSERT INTO `stadiums` VALUES (1, 'Capital One Arena', '601 F St. N.W.', 'Washington', 'DC', '20004', 20290, 38.8981, -77.0208);
INSERT INTO `stadiums` VALUES (2, 'Spectrum Center', '330 E. Trade St.', 'Charlotte', 'NC', '28202', 19026, 35.225, -80.8392);
INSERT INTO `stadiums` VALUES (3, 'State Farm Arena', '1 State Farm Drive', 'Atlanta', 'GA', '30303', 18118, 33.7572, -84.3964);
INSERT INTO `stadiums` VALUES (4, 'American Airlines Arena', '601 Biscayne Blvd.', 'Miami', 'FL', '33132', 19600, 25.7814, -80.1881);
INSERT INTO `stadiums` VALUES (5, 'Amway Center', '400 W. Church St.', 'Orlando', 'FL', '32801', 18846, 28.5392, -81.3836);
INSERT INTO `stadiums` VALUES (6, 'Madison Square Garden', 'Four Pennsylvania Plaza', 'New York', 'NY', '10001', 19812, 40.7506, -73.9936);
INSERT INTO `stadiums` VALUES (7, 'Wells Fargo Center', '3601 S. Broad St.', 'Philadelphia', 'PA', '19148', 20328, 39.9011, -75.1719);
INSERT INTO `stadiums` VALUES (8, 'Barclays Center', '620 Atlantic Ave.', 'Brooklyn', 'NY', '11217', 18200, 40.6827, -73.9752);
INSERT INTO `stadiums` VALUES (9, 'TD Garden', '100 Legends Way', 'Boston', 'MA', '2114', 17565, 42.3663, -71.0622);
INSERT INTO `stadiums` VALUES (10, 'Scotiabank Arena', '40 Bay St.', 'Toronto', 'ON', 'M5J 2X2', 19800, 43.6433, -79.3792);
INSERT INTO `stadiums` VALUES (11, 'United Center', '1901 W. Madison St.', 'Chicago', 'IL', '60612', 20917, 41.8806, -87.6742);
INSERT INTO `stadiums` VALUES (12, 'Rocket Mortgage FieldHouse', 'One Center Court', 'Cleveland', 'OH', '44115', 20562, 41.4964, -81.6881);
INSERT INTO `stadiums` VALUES (13, 'Bankers Life Fieldhouse', '125 S. Pennsylvania St.', 'Indianapolis', 'IN', '46204', 18165, 39.7639, -86.1556);
INSERT INTO `stadiums` VALUES (14, 'Little Caesars Arena', '2645 Woodward Ave', 'Detroit', 'MI', '48201', 20491, 42.5513, -83.2179);
INSERT INTO `stadiums` VALUES (15, 'Fiserv Forum', '1001 N Fourth St.', 'Milwaukee', 'WI', '53203', 19000, 43.0436, -87.9169);
INSERT INTO `stadiums` VALUES (16, 'Target Center', '600 First Ave. North', 'Minneapolis', 'MN', '55403', 19356, 44.9794, -93.2761);
INSERT INTO `stadiums` VALUES (17, 'Vivint Smart Home Arena', '301 W. South Temple St.', 'Salt Lake City', 'UT', '84101', 19911, 40.7683, -111.901);
INSERT INTO `stadiums` VALUES (18, 'Chesapeake Energy Arena', '100 W. Reno Ave.', 'Oklahoma City', 'OK', '73102', 18203, 35.4633, -97.515);
INSERT INTO `stadiums` VALUES (19, 'Moda Center', '1 Center Court', 'Portland', 'OR', '97227', 19980, 45.5317, -122.667);
INSERT INTO `stadiums` VALUES (20, 'Pepsi Center', '1000 Chopper Circle', 'Denver', 'CO', '80204', 19155, 39.7486, -105.007);
INSERT INTO `stadiums` VALUES (21, 'FedEx Forum', '191 Beale St.', 'Memphis', 'TN', '38103', 18119, 35.1383, -90.0506);
INSERT INTO `stadiums` VALUES (22, 'Toyota Center', '1510 Polk St.', 'Houston', 'TX', '77002', 18043, 29.7508, -95.3622);
INSERT INTO `stadiums` VALUES (23, 'Smoothie King Center', '1501 Girod St.', 'New Orleans', 'LA', '70113', 17188, 29.9489, -90.0819);
INSERT INTO `stadiums` VALUES (24, 'AT&T Center', 'One AT&T Center Parkway', 'San Antonio', 'TX', '78219', 18581, 29.4269, -98.4375);
INSERT INTO `stadiums` VALUES (25, 'American Airlines Center', '2500 Victory Ave.', 'Dallas', 'TX', '75219', 19200, 32.7906, -96.8103);
INSERT INTO `stadiums` VALUES (26, 'Chase Center', 'Mission Bay Blocks 29-32', 'San Francisco', 'CA', '94158', 18064, 37.7681, -122.387);
INSERT INTO `stadiums` VALUES (27, 'Staples Center', '1111 S. Figueroa St.', 'Los Angeles', 'CA', '90015', 18997, 34.0431, -118.267);
INSERT INTO `stadiums` VALUES (28, 'Talking Stick Resort Arena', '201 E. Jefferson St.', 'Phoenix', 'AZ', '85004', 18422, 33.4458, -112.071);
INSERT INTO `stadiums` VALUES (29, 'Golden 1 Center', 'One Sports Parkway', 'Sacramento', 'CA', '95834', 17317, 38.6492, -121.518);

-- ----------------------------
-- Table structure for teams
-- ----------------------------
DROP TABLE IF EXISTS `teams`;
CREATE TABLE `teams`  (
  `teamID` int(20) NULL DEFAULT NULL,
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `stadiumID` int(11) NULL DEFAULT NULL,
  `conference` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `division` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `primaryColor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `secondaryColor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tertiaryColor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `quaternaryColor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `photoUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  INDEX `teamID`(`teamID`) USING BTREE,
  INDEX `stadiumID`(`stadiumID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teams
-- ----------------------------
INSERT INTO `teams` VALUES (1, 'WAS', 'Washington', 'Wizards', 1, 'Eastern', 'Southeast', 'E31837', '002B5C', 'C4CED4', 'FFFFFF', 'https://upload.wikimedia.org/wikipedia/en/0/02/Washington_Wizards_logo.svg');
INSERT INTO `teams` VALUES (2, 'CHA', 'Charlotte', 'Hornets', 2, 'Eastern', 'Southeast', '1D1160', '00788C', 'A1A1A4', '7AB2DD', 'https://upload.wikimedia.org/wikipedia/en/c/c4/Charlotte_Hornets_%282014%29.svg');
INSERT INTO `teams` VALUES (3, 'ATL', 'Atlanta', 'Hawks', 3, 'Eastern', 'Southeast', 'E03A3E', 'C1D32F', '26282A', NULL, 'https://upload.wikimedia.org/wikipedia/en/2/24/Atlanta_Hawks_logo.svg');
INSERT INTO `teams` VALUES (4, 'MIA', 'Miami', 'Heat', 4, 'Eastern', 'Southeast', '98002E', 'F9A01B', '000000', NULL, 'https://upload.wikimedia.org/wikipedia/en/f/fb/Miami_Heat_logo.svg');
INSERT INTO `teams` VALUES (5, 'ORL', 'Orlando', 'Magic', 5, 'Eastern', 'Southeast', '0077C0', '000000', 'C4CED4', NULL, 'https://upload.wikimedia.org/wikipedia/en/1/10/Orlando_Magic_logo.svg');
INSERT INTO `teams` VALUES (6, 'NY', 'New York', 'Knicks', 6, 'Eastern', 'Atlantic', '006BB6', 'F58426', 'BEC0C2', '000000', 'https://upload.wikimedia.org/wikipedia/en/2/25/New_York_Knicks_logo.svg');
INSERT INTO `teams` VALUES (7, 'PHI', 'Philadelphia', '76ers', 7, 'Eastern', 'Atlantic', 'ED174C', '006BB6', '002B5C', 'FFFFFF', 'https://upload.wikimedia.org/wikipedia/en/0/0e/Philadelphia_76ers_logo.svg');
INSERT INTO `teams` VALUES (8, 'BKN', 'Brooklyn', 'Nets', 8, 'Eastern', 'Atlantic', '000000', 'FFFFFF', NULL, NULL, 'https://upload.wikimedia.org/wikipedia/commons/4/44/Brooklyn_Nets_newlogo.svg');
INSERT INTO `teams` VALUES (9, 'BOS', 'Boston', 'Celtics', 9, 'Eastern', 'Atlantic', '008348', 'BB9753', '000000', NULL, 'https://upload.wikimedia.org/wikipedia/en/8/8f/Boston_Celtics.svg');
INSERT INTO `teams` VALUES (10, 'TOR', 'Toronto', 'Raptors', 10, 'Eastern', 'Atlantic', 'CE1141', '000000', 'A1A1A4', 'FFFFFF', 'https://upload.wikimedia.org/wikipedia/en/3/36/Toronto_Raptors_logo.svg');
INSERT INTO `teams` VALUES (11, 'CHI', 'Chicago', 'Bulls', 11, 'Eastern', 'Central', 'CE1141', '000000', NULL, NULL, 'https://upload.wikimedia.org/wikipedia/en/6/67/Chicago_Bulls_logo.svg');
INSERT INTO `teams` VALUES (12, 'CLE', 'Cleveland', 'Cavaliers', 12, 'Eastern', 'Central', '6F263D', 'FDB81C', '041E42', '000000', 'https://upload.wikimedia.org/wikipedia/en/4/4b/Cleveland_Cavaliers_logo.svg');
INSERT INTO `teams` VALUES (13, 'IND', 'Indiana', 'Pacers', 13, 'Eastern', 'Central', '002D62', 'FDBB30', 'BEC0C2', NULL, 'https://upload.wikimedia.org/wikipedia/en/1/1b/Indiana_Pacers.svg');
INSERT INTO `teams` VALUES (14, 'DET', 'Detroit', 'Pistons', 14, 'Eastern', 'Central', '006BB6', 'ED174C', 'BEC0C2', 'FFFFFF', 'https://upload.wikimedia.org/wikipedia/commons/7/7c/Pistons_logo17.svg');
INSERT INTO `teams` VALUES (15, 'MIL', 'Milwaukee', 'Bucks', 15, 'Eastern', 'Central', '00471B', 'EEE1C6', '0077C0', '000000', 'https://upload.wikimedia.org/wikipedia/en/4/4a/Milwaukee_Bucks_logo.svg');
INSERT INTO `teams` VALUES (16, 'MIN', 'Minnesota', 'Timberwolves', 16, 'Western', 'Northwest', '0C2340', '78BE20', '236192', '9EA2A2', 'https://upload.wikimedia.org/wikipedia/en/c/c2/Minnesota_Timberwolves_logo.svg');
INSERT INTO `teams` VALUES (17, 'UTA', 'Utah', 'Jazz', 17, 'Western', 'Northwest', '002B5C', 'F9A01B', '00471B', NULL, 'https://upload.wikimedia.org/wikipedia/en/0/04/Utah_Jazz_logo_%282016%29.svg');
INSERT INTO `teams` VALUES (18, 'OKC', 'Oklahoma City', 'Thunder', 18, 'Western', 'Northwest', '007AC1', 'EF3B24', 'FDBB30', '002D62', 'https://upload.wikimedia.org/wikipedia/en/5/5d/Oklahoma_City_Thunder.svg');
INSERT INTO `teams` VALUES (19, 'POR', 'Portland', 'Trail Blazers', 19, 'Western', 'Northwest', 'E03A3E', '000000', 'FFFFFF', NULL, 'https://upload.wikimedia.org/wikipedia/en/2/21/Portland_Trail_Blazers_logo.svg');
INSERT INTO `teams` VALUES (20, 'DEN', 'Denver', 'Nuggets', 20, 'Western', 'Northwest', '00285E', '5091CD', 'FDB927', NULL, 'https://upload.wikimedia.org/wikipedia/en/7/76/Denver_Nuggets.svg');
INSERT INTO `teams` VALUES (21, 'MEM', 'Memphis', 'Grizzlies', 21, 'Western', 'Southwest', '00285E', '6189B9', 'BED4E9', 'FDB927', 'https://upload.wikimedia.org/wikipedia/en/f/f1/Memphis_Grizzlies.svg');
INSERT INTO `teams` VALUES (22, 'HOU', 'Houston', 'Rockets', 22, 'Western', 'Southwest', 'CE1141', 'C4CED4', '000000', 'FFFFFF', 'https://upload.wikimedia.org/wikipedia/en/2/28/Houston_Rockets.svg');
INSERT INTO `teams` VALUES (23, 'NO', 'New Orleans', 'Pelicans', 23, 'Western', 'Southwest', '002B5C', 'B4975A', 'E31837', NULL, 'https://upload.wikimedia.org/wikipedia/en/0/0d/New_Orleans_Pelicans_logo.svg');
INSERT INTO `teams` VALUES (24, 'SA', 'San Antonio', 'Spurs', 24, 'Western', 'Southwest', '000000', 'C4CED4', NULL, NULL, 'https://upload.wikimedia.org/wikipedia/en/a/a2/San_Antonio_Spurs.svg');
INSERT INTO `teams` VALUES (25, 'DAL', 'Dallas', 'Mavericks', 25, 'Western', 'Southwest', '0053BC', 'BBC4CA', '000000', NULL, 'https://upload.wikimedia.org/wikipedia/en/9/97/Dallas_Mavericks_logo.svg');
INSERT INTO `teams` VALUES (26, 'GS', 'Golden State', 'Warriors', 26, 'Western', 'Pacific', '006BB6', 'FDB927', '26282A', NULL, 'https://upload.wikimedia.org/wikipedia/en/0/01/Golden_State_Warriors_logo.svg');
INSERT INTO `teams` VALUES (27, 'LAL', 'Los Angeles', 'Lakers', 27, 'Western', 'Pacific', '552583', 'FDB927', '000000', NULL, 'https://upload.wikimedia.org/wikipedia/commons/3/3c/Los_Angeles_Lakers_logo.svg');
INSERT INTO `teams` VALUES (28, 'LAC', 'Los Angeles', 'Clippers', 27, 'Western', 'Pacific', 'ED174C', '006BB6', '87ceeb', '000000', 'https://upload.wikimedia.org/wikipedia/en/b/bb/Los_Angeles_Clippers_%282015%29.svg');
INSERT INTO `teams` VALUES (29, 'PHO', 'Phoenix', 'Suns', 28, 'Western', 'Pacific', '1D1160', 'E56020', '000000', 'F9A01B', 'https://upload.wikimedia.org/wikipedia/en/d/dc/Phoenix_Suns_logo.svg');
INSERT INTO `teams` VALUES (30, 'SAC', 'Sacramento', 'Kings', 29, 'Western', 'Pacific', '5A2B81', '63727A', '000000', 'FFFFFF', 'https://upload.wikimedia.org/wikipedia/en/c/c7/SacramentoKings.svg');

SET FOREIGN_KEY_CHECKS = 1;
