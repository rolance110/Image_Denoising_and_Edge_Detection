/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : R-2020.09
// Date      : Sun Sep 10 20:09:14 2023
/////////////////////////////////////////////////////////////


module top ( clk, reset, forward_di, backward_di, threshold_di, convolution_di, 
        forward_addr, backward_addr, threshold_addr, convolution_addr, 
        forward_wr, forward_rd, backward_wr, backward_rd, threshold_wr, 
        threshold_rd, convolution_wr, convolution_rd, forward_do, backward_do, 
        threshold_do, convolution_do, f_RAM_sel, b_RAM_sel, t_RAM_sel, 
        c_RAM_sel, done );
  input [7:0] forward_di;
  input [7:0] backward_di;
  input [7:0] threshold_di;
  input [7:0] convolution_di;
  output [13:0] forward_addr;
  output [13:0] backward_addr;
  output [13:0] threshold_addr;
  output [13:0] convolution_addr;
  output [7:0] forward_do;
  output [7:0] backward_do;
  output [7:0] convolution_do;
  output [2:0] f_RAM_sel;
  output [2:0] b_RAM_sel;
  output [2:0] t_RAM_sel;
  output [2:0] c_RAM_sel;
  input clk, reset;
  output forward_wr, forward_rd, backward_wr, backward_rd, threshold_wr,
         threshold_rd, convolution_wr, convolution_rd, threshold_do, done;
  wire   n1837, n1838, n1839, n1840, n1841, n1842, n1843, n1844, n1845, n1846,
         n1847, n1848, n1849, n1850, n1851, n1852, n1853, n1854, n1855, n1856,
         n1857, n1858, n1859, n1860, n1861, n1862, n1863, n1864, n1865, n1866,
         n1867, n1868, n1869, n1870, n1871, n1872, n1873, n1874, n1875, n1876,
         n1877, n1878, n1879, n1880, n1881, n1882, n1883, n1884, n1885, n1886,
         n1887, n1888, n1889, n1890, n1891, n1892, n1893, n1894, n1895, n1896,
         n1897, n1898, n1899, n1900, n1901, n1902, n1903, n1904, n1905, n1906,
         n1907, n1908, n1909, n1910, n1911, n1912, n1913, forward_done,
         threshold_done, convolution_done, forward_valid, backward_valid,
         threshold_valid, convolution_valid, change_sel, all_rst,
         \controller/N151 , \controller/N148 , \controller/N146 ,
         \controller/N136 , \controller/N135 , \controller/N134 ,
         \controller/N28 , \controller/N27 , \forward/N88 , \backward/N86 ,
         \backward/ns[2] , \threshold/N21 , \threshold/N15 , \threshold/ns[1] ,
         \convolution/N437 , \convolution/N246 , \convolution/N245 ,
         \convolution/N244 , \convolution/N243 , \convolution/N242 ,
         \convolution/N241 , \convolution/N240 , \convolution/N205 ,
         \convolution/op1 , \convolution/N140 , \convolution/N112 ,
         \convolution/N111 , \convolution/N110 , \convolution/N109 ,
         \convolution/N108 , \convolution/N107 , \convolution/N106 ,
         \convolution/N105 , \convolution/N104 , \convolution/N103 ,
         \convolution/N102 , \convolution/N101 , \convolution/N100 ,
         \convolution/N99 , \convolution/ns[1] , n456, n457, n458, n459, n460,
         n461, n462, n463, n464, n465, n466, n467, n468, n469, n470, n471,
         n472, n473, n474, n475, n476, n477, n478, n479, n480, n481, n482,
         n483, n484, n485, n486, n487, n488, n489, n490, n491, n492, n493,
         n494, n495, n496, n497, n498, n499, n500, n501, n502, n503, n504,
         n505, n506, n507, n508, n509, n510, n511, n512, n513, n514, n515,
         n516, n517, n518, n519, n520, n521, n522, n523, n524, n525, n526,
         n527, n528, n529, n530, n531, n532, n533, n534, n535, n536, n537,
         n538, n539, n540, n541, n542, n543, n544, n545, n546, n547, n548,
         n549, n550, n551, n552, n553, n554, n555, n556, n557, n558, n559,
         n560, n561, n562, n563, n564, n565, n566, n567, n568, n569, n570,
         n571, n572, n573, n574, n575, n576, n577, n578, n579, n580,
         \C1/DATA3_0 , n591, n592, n594, n595, n597, n598, n599, n600, n601,
         n602, n603, n604, n605, n606, n607, n608, n609, n610, n611, n612,
         n617, n618, n619, n620, n621, n622, n623, n624, n625, n626, n628,
         n630, n632, n634, n636, n641, n643, n645, n647, n649, n651, n653,
         n655, n657, n659, n662, n664, n666, n668, n681, n685, n686, n687,
         n688, n689, n690, n691, n692, n693, n694, n695, n696, n697, n698,
         n699, n700, n701, n702, n703, n704, n705, n706, n707, n708, n709,
         n710, n711, n712, n713, n714, n715, n716, n717, n718, n719, n720,
         n721, n722, n723, n724, n725, n726, n727, n728, n729, n730, n731,
         n732, n733, n734, n735, n736, n737, n738, n739, n740, n741, n742,
         n743, n744, n745, n746, n747, n748, n749, n750, n751, n752, n753,
         n754, n755, n756, n757, n758, n759, n760, n761, n762, n763, n764,
         n765, n766, n767, n768, n769, n770, n771, n772, n773, n774, n775,
         n776, n777, n778, n779, n780, n781, n782, n783, n784, n785, n786,
         n787, n788, n789, n790, n791, n792, n793, n794, n795, n796, n797,
         n798, n799, n800, n801, n802, n803, n804, n805, n806, n807, n808,
         n809, n810, n811, n812, n813, n814, n815, n816, n817, n818, n819,
         n820, n821, n822, n823, n824, n825, n826, n827, n828, n829, n830,
         n831, n832, n833, n834, n835, n836, n837, n838, n839, n840, n841,
         n842, n843, n844, n845, n846, n847, n848, n849, n850, n851, n852,
         n853, n854, n855, n856, n857, n858, n859, n860, n861, n862, n863,
         n864, n865, n866, n868, n869, n870, n871, n872, n873, n874, n875,
         n876, n877, n878, n879, n880, n881, n882, n883, n884, n885, n886,
         n887, n888, n889, n890, n891, n892, n893, n894, n895, n896, n897,
         n898, n899, n900, n901, n902, n903, n904, n905, n906, n907, n908,
         n909, n910, n911, n912, n913, n914, n915, n916, n917, n918, n919,
         n920, n921, n922, n923, n924, n925, n926, n927, n928, n929, n930,
         n931, n932, n933, n934, n935, n936, n937, n938, n939, n940, n941,
         n942, n943, n944, n945, n946, n947, n948, n949, n950, n951, n952,
         n953, n954, n955, n956, n957, n958, n959, n960, n961, n962, n963,
         n964, n965, n966, n967, n968, n969, n970, n971, n972, n973, n974,
         n975, n976, n977, n978, n979, n980, n981, n982, n983, n984, n986,
         n987, n988, n989, n990, n991, n992, n993, n994, n995, n996, n997,
         n998, n999, n1000, n1001, n1002, n1003, n1004, n1005, n1006, n1007,
         n1008, n1009, n1010, n1011, n1012, n1013, n1014, n1015, n1016, n1017,
         n1018, n1019, n1020, n1021, n1022, n1023, n1024, n1025, n1026, n1027,
         n1028, n1029, n1030, n1031, n1032, n1033, n1034, n1035, n1036, n1037,
         n1038, n1039, n1040, n1041, n1042, n1043, n1044, n1045, n1046, n1047,
         n1048, n1049, n1050, n1051, n1052, n1053, n1054, n1055, n1056, n1057,
         n1058, n1059, n1060, n1061, n1062, n1063, n1064, n1065, n1066, n1067,
         n1068, n1069, n1070, n1071, n1072, n1073, n1074, n1075, n1076, n1077,
         n1078, n1079, n1080, n1081, n1082, n1083, n1084, n1085, n1086, n1087,
         n1088, n1089, n1090, n1091, n1092, n1093, n1094, n1095, n1096, n1097,
         n1098, n1099, n1100, n1101, n1102, n1103, n1104, n1105, n1106, n1107,
         n1108, n1109, n1110, n1111, n1112, n1113, n1114, n1115, n1116, n1118,
         n1119, n1120, n1121, n1122, n1123, n1124, n1125, n1126, n1127, n1128,
         n1129, n1130, n1131, n1132, n1133, n1134, n1135, n1136, n1137, n1138,
         n1139, n1140, n1141, n1142, n1143, n1144, n1145, n1146, n1147, n1148,
         n1149, n1150, n1151, n1152, n1153, n1154, n1155, n1156, n1157, n1158,
         n1159, n1160, n1161, n1162, n1163, n1164, n1165, n1166, n1167, n1168,
         n1169, n1170, n1171, n1172, n1173, n1174, n1175, n1176, n1177, n1178,
         n1179, n1180, n1181, n1182, n1183, n1184, n1185, n1186, n1187, n1188,
         n1189, n1190, n1191, n1192, n1193, n1194, n1195, n1196, n1197, n1198,
         n1199, n1200, n1201, n1202, n1203, n1204, n1205, n1206, n1207, n1208,
         n1209, n1210, n1211, n1212, n1213, n1214, n1215, n1216, n1217, n1218,
         n1219, n1220, n1221, n1222, n1223, n1224, n1225, n1226, n1227, n1228,
         n1229, n1230, n1231, n1232, n1233, n1234, n1235, n1236, n1237, n1238,
         n1239, n1240, n1241, n1242, n1243, n1244, n1245, n1246, n1247, n1248,
         n1249, n1250, n1251, n1252, n1253, n1254, n1255, n1256, n1257, n1258,
         n1259, n1260, n1261, n1262, n1263, n1264, n1265, n1266, n1267, n1268,
         n1269, n1270, n1271, n1272, n1273, n1274, n1275, n1276, n1277, n1278,
         n1279, n1280, n1281, n1282, n1283, n1284, n1285, n1286, n1287, n1288,
         n1289, n1290, n1291, n1292, n1293, n1294, n1295, n1296, n1297, n1298,
         n1299, n1300, n1301, n1302, n1303, n1304, n1305, n1306, n1307, n1308,
         n1309, n1310, n1311, n1312, n1313, n1314, n1315, n1316, n1317, n1318,
         n1319, n1320, n1321, n1322, n1323, n1324, n1325, n1326, n1327, n1328,
         n1329, n1330, n1331, n1332, n1333, n1334, n1335, n1336, n1337, n1338,
         n1339, n1340, n1341, n1342, n1343, n1344, n1345, n1346, n1347, n1348,
         n1349, n1350, n1351, n1352, n1353, n1354, n1355, n1356, n1357, n1358,
         n1359, n1360, n1361, n1362, n1363, n1364, n1365, n1366, n1367, n1368,
         n1369, n1370, n1371, n1372, n1373, n1374, n1375, n1376, n1377, n1378,
         n1379, n1380, n1381, n1382, n1383, n1384, n1385, n1386, n1387, n1388,
         n1389, n1390, n1391, n1392, n1393, n1394, n1395, n1396, n1397, n1398,
         n1399, n1400, n1401, n1402, n1403, n1404, n1405, n1406, n1407, n1408,
         n1409, n1410, n1411, n1412, n1413, n1414, n1415, n1416, n1417, n1418,
         n1419, n1420, n1421, n1422, n1423, n1424, n1425, n1426, n1427, n1428,
         n1429, n1430, n1431, n1432, n1433, n1434, n1435, n1436, n1437, n1438,
         n1439, n1440, n1441, n1442, n1443, n1444, n1445, n1446, n1447, n1448,
         n1449, n1450, n1451, n1452, n1453, n1454, n1455, n1456, n1457, n1458,
         n1459, n1460, n1461, n1462, n1463, n1464, n1465, n1466, n1467, n1468,
         n1469, n1470, n1471, n1472, n1473, n1474, n1475, n1476, n1477, n1478,
         n1479, n1480, n1481, n1482, n1483, n1484, n1485, n1486, n1487, n1488,
         n1489, n1490, n1491, n1492, n1493, n1494, n1495, n1496, n1497, n1498,
         n1499, n1500, n1501, n1502, n1503, n1504, n1505, n1506, n1507, n1508,
         n1509, n1510, n1511, n1512, n1513, n1514, n1515, n1516, n1517, n1518,
         n1519, n1520, n1521, n1522, n1523, n1524, n1525, n1526, n1527, n1528,
         n1529, n1530, n1531, n1532, n1533, n1534, n1535, n1536, n1537, n1538,
         n1539, n1540, n1541, n1542, n1543, n1544, n1545, n1546, n1547, n1548,
         n1549, n1550, n1551, n1552, n1553, n1554, n1555, n1556, n1557, n1558,
         n1559, n1560, n1561, n1562, n1563, n1564, n1565, n1566, n1567, n1568,
         n1569, n1570, n1571, n1572, n1573, n1574, n1575, n1576, n1577, n1578,
         n1579, n1580, n1581, n1582, n1583, n1584, n1585, n1586, n1587, n1588,
         n1589, n1590, n1591, n1592, n1593, n1594, n1595, n1596, n1597, n1598,
         n1599, n1600, n1601, n1602, n1603, n1604, n1605, n1606, n1607, n1608,
         n1609, n1610, n1611, n1612, n1613, n1614, n1615, n1616, n1617, n1618,
         n1619, n1620, n1621, n1622, n1623, n1624, n1625, n1626, n1627, n1628,
         n1629, n1630, n1633, n1634, n1635, n1636, n1637, n1638, n1639, n1640,
         n1641, n1642, n1643, n1644, n1645, n1646, n1647, n1648, n1649, n1650,
         n1651, n1652, n1653, n1654, n1655, n1656, n1657, n1658, n1659, n1660,
         n1661, n1662, n1663, n1664, n1665, n1666, n1667, n1668, n1669, n1670,
         n1671, n1672, n1673, n1674, n1675, n1676, n1677, n1678, n1679, n1680,
         n1681, n1682, n1683, n1684, n1685, n1686, n1687, n1688, n1689, n1690,
         n1691, n1692, n1693, n1694, n1695, n1696, n1697, n1698, n1699, n1700,
         n1701, n1702, n1703, n1704, n1705, n1706, n1707, n1708, n1709, n1710,
         n1711, n1712, n1713, n1714, n1715, n1716, n1717, n1718, n1719, n1720,
         n1721, n1722, n1723, n1724, n1725, n1726, n1727, n1728, n1729, n1730,
         n1731, n1732, n1733, n1734, n1735, n1738, n1741, n1746, n1748, n1751,
         n1753, n1755, n1757, n1759, n1761, n1763, n1765, n1767, n1769, n1771,
         n1772, n1773, n1774, n1775, n1777, n1781, n1784, n1786, n1789, n1791,
         n1794, n1796, n1798, n1800, n1802, n1827, n1828, n1829, n1830, n1831,
         n1832, n1833, n1834, n1835, n1836, n1914, n1915;
  wire   [3:0] \controller/pic_cnt ;
  wire   [1:0] \controller/done_cnt ;
  wire   [7:0] \forward/min ;
  wire   [3:0] \forward/counter ;
  wire   [2:0] \forward/ns ;
  wire   [2:0] \forward/cs ;
  wire   [7:0] \backward/min ;
  wire   [3:0] \backward/counter ;
  wire   [2:0] \backward/cs ;
  wire   [1:0] \threshold/cs ;
  wire   [6:0] \convolution/conv_out1 ;
  wire   [6:0] \convolution/window_x ;
  wire   [6:0] \convolution/window_y ;
  wire   [3:0] \convolution/conv_cnt ;
  wire   [2:0] \convolution/cs ;
  assign convolution_do[6] = 1'b0;
  assign convolution_do[7] = 1'b0;

  DFFRX1 \controller/done_cnt_reg[1]  ( .D(\controller/N28 ), .CK(clk), .RN(
        n1228), .Q(\controller/done_cnt [1]) );
  DFFRX1 \threshold/cs_reg[0]  ( .D(n1658), .CK(clk), .RN(n1827), .Q(
        \threshold/cs [0]), .QN(n1658) );
  DFFRX1 \threshold/done_reg  ( .D(n537), .CK(clk), .RN(n1834), .Q(
        threshold_done), .QN(n1638) );
  DFFRX1 \forward/done_reg  ( .D(n517), .CK(clk), .RN(n1834), .Q(forward_done), 
        .QN(n1691) );
  DFFRX1 \forward/cs_reg[1]  ( .D(n1629), .CK(clk), .RN(n1834), .Q(
        \forward/cs [1]), .QN(n1729) );
  DFFRX1 \forward/cs_reg[2]  ( .D(\forward/ns [2]), .CK(clk), .RN(n1834), .Q(
        \forward/cs [2]), .QN(n1651) );
  DFFRX4 \controller/backward_valid_reg  ( .D(\controller/N146 ), .CK(clk), 
        .RN(n1228), .Q(backward_valid), .QN(n1662) );
  DFFRX1 \controller/done_cnt_reg[0]  ( .D(\controller/N27 ), .CK(clk), .RN(
        n1228), .Q(\controller/done_cnt [0]) );
  DFFRX4 \convolution/conv_cnt_reg[3]  ( .D(n462), .CK(clk), .RN(n1828), .Q(
        \convolution/conv_cnt [3]), .QN(n1670) );
  DFFRX4 \convolution/conv_cnt_reg[0]  ( .D(n464), .CK(clk), .RN(n1834), .Q(
        \convolution/conv_cnt [0]), .QN(n1671) );
  DFFRX4 \convolution/conv_cnt_reg[1]  ( .D(n465), .CK(clk), .RN(n1834), .Q(
        \convolution/conv_cnt [1]), .QN(n1672) );
  DFFRX1 \convolution/change_sel_reg  ( .D(\convolution/N437 ), .CK(clk), .RN(
        n1827), .Q(change_sel) );
  DFFRX4 \convolution/conv_cnt_reg[2]  ( .D(n463), .CK(clk), .RN(n1834), .Q(
        \convolution/conv_cnt [2]), .QN(n1683) );
  DFFRX1 \convolution/conv_out1_reg[0]  ( .D(\convolution/N240 ), .CK(clk), 
        .RN(n1834), .Q(\convolution/conv_out1 [0]) );
  DFFRX1 \convolution/conv_out1_reg[1]  ( .D(\convolution/N241 ), .CK(clk), 
        .RN(n1834), .Q(\convolution/conv_out1 [1]), .QN(n1687) );
  DFFRX1 \convolution/conv_out1_reg[2]  ( .D(\convolution/N242 ), .CK(clk), 
        .RN(n1834), .Q(\convolution/conv_out1 [2]) );
  DFFRX1 \convolution/conv_out1_reg[3]  ( .D(\convolution/N243 ), .CK(clk), 
        .RN(n1834), .Q(\convolution/conv_out1 [3]) );
  DFFRX1 \convolution/conv_out1_reg[4]  ( .D(\convolution/N244 ), .CK(clk), 
        .RN(n1834), .Q(\convolution/conv_out1 [4]), .QN(n1644) );
  DFFRX4 \convolution/c_addr_reg[3]  ( .D(n476), .CK(clk), .RN(n1834), .Q(
        n1879), .QN(n1765) );
  DFFSX1 \forward/counter_reg[0]  ( .D(n514), .CK(clk), .SN(n1830), .Q(
        \forward/counter [0]), .QN(n1650) );
  DFFSX1 \backward/counter_reg[3]  ( .D(n549), .CK(clk), .SN(n1830), .Q(
        \backward/counter [3]), .QN(n1716) );
  DFFSX1 \backward/counter_reg[0]  ( .D(n551), .CK(clk), .SN(n1834), .Q(
        \backward/counter [0]) );
  DFFSX1 \convolution/window_x_reg[6]  ( .D(\convolution/N105 ), .CK(clk), 
        .SN(n1830), .Q(\convolution/window_x [6]), .QN(n1674) );
  DFFSX1 \convolution/window_y_reg[1]  ( .D(\convolution/N107 ), .CK(clk), 
        .SN(n1834), .Q(\convolution/window_y [1]), .QN(n1656) );
  DFFSX1 \convolution/window_y_reg[4]  ( .D(\convolution/N110 ), .CK(clk), 
        .SN(n1834), .Q(\convolution/window_y [4]), .QN(n1655) );
  DFFSX1 \convolution/window_y_reg[5]  ( .D(\convolution/N111 ), .CK(clk), 
        .SN(n1830), .Q(\convolution/window_y [5]), .QN(n1700) );
  DFFSX1 \convolution/window_y_reg[6]  ( .D(\convolution/N112 ), .CK(clk), 
        .SN(n1828), .Q(\convolution/window_y [6]), .QN(n1640) );
  DFFSX1 \convolution/window_x_reg[2]  ( .D(\convolution/N101 ), .CK(clk), 
        .SN(n1830), .Q(\convolution/window_x [2]), .QN(n1711) );
  DFFSX4 \controller/forward_valid_reg  ( .D(n1836), .CK(clk), .SN(n1228), .Q(
        forward_valid), .QN(n1734) );
  DFFRX1 \forward/cs_reg[0]  ( .D(\forward/ns [0]), .CK(clk), .RN(n1834), .Q(
        \forward/cs [0]), .QN(n1704) );
  DFFSX1 \controller/b_RAM_sel_reg[1]  ( .D(n540), .CK(clk), .SN(n1228), .Q(
        n1906), .QN(n1777) );
  DFFSX1 \threshold/t_do_reg  ( .D(n521), .CK(clk), .SN(n1834), .QN(n1786) );
  DFFSX1 \controller/t_RAM_sel_reg[1]  ( .D(n520), .CK(clk), .SN(n1228), .Q(
        n1909), .QN(n1775) );
  DFFSX1 \controller/f_RAM_sel_reg[1]  ( .D(n482), .CK(clk), .SN(n1228), .Q(
        n1903), .QN(n1784) );
  DFFSX1 \controller/b_RAM_sel_reg[0]  ( .D(n539), .CK(clk), .SN(n1228), .Q(
        n1907), .QN(n1791) );
  DFFSX1 \controller/t_RAM_sel_reg[0]  ( .D(n519), .CK(clk), .SN(n1228), .Q(
        n1910), .QN(n1789) );
  DFFRX1 \threshold/t_addr_reg[4]  ( .D(n532), .CK(clk), .RN(n1834), .Q(n1864), 
        .QN(n1741) );
  DFFRX1 \threshold/t_addr_reg[1]  ( .D(n536), .CK(clk), .RN(n1834), .Q(n1867), 
        .QN(n1748) );
  DFFRX1 \threshold/t_addr_reg[6]  ( .D(n530), .CK(clk), .RN(n626), .Q(n1862), 
        .QN(n1735) );
  DFFSX1 \threshold/t_addr_reg[7]  ( .D(n529), .CK(clk), .SN(n1834), .Q(n1861), 
        .QN(n1730) );
  DFFRX1 \threshold/t_addr_reg[3]  ( .D(n533), .CK(clk), .RN(n626), .Q(n1865), 
        .QN(n1727) );
  DFFRX1 \threshold/t_addr_reg[2]  ( .D(n534), .CK(clk), .RN(n1834), .Q(n1866), 
        .QN(n1724) );
  DFFRX2 \backward/min_reg[5]  ( .D(n555), .CK(clk), .RN(n1829), .Q(n625), 
        .QN(n1710) );
  DFFRX1 \convolution/cs_reg[1]  ( .D(\convolution/ns[1] ), .CK(clk), .RN(
        n1834), .Q(\convolution/cs [1]), .QN(n1681) );
  DFFSX1 \controller/f_RAM_sel_reg[0]  ( .D(n481), .CK(clk), .SN(n1228), .Q(
        n1904), .QN(n1800) );
  DFFRX1 \convolution/cs_reg[0]  ( .D(n1833), .CK(clk), .RN(n1834), .Q(
        \convolution/cs [0]), .QN(n1645) );
  DFFRX2 \forward/f_addr_reg[11]  ( .D(n493), .CK(clk), .RN(n1834), .Q(n628), 
        .QN(n1637) );
  DFFSX2 \backward/b_addr_reg[1]  ( .D(n574), .CK(clk), .SN(n1830), .Q(n1854), 
        .QN(n1665) );
  DFFRX2 \forward/f_addr_reg[10]  ( .D(n494), .CK(clk), .RN(n1834), .QN(n1635)
         );
  DFFRX4 \convolution/done_reg  ( .D(n580), .CK(clk), .RN(n1834), .Q(
        convolution_done), .QN(n1633) );
  DFFSX1 \controller/f_RAM_sel_reg[2]  ( .D(n480), .CK(clk), .SN(n1228), .Q(
        n1902), .QN(n1738) );
  DFFSX1 \controller/c_RAM_sel_reg[2]  ( .D(\controller/N136 ), .CK(clk), .SN(
        n1228), .Q(n1911), .QN(n1746) );
  DFFSX1 \controller/b_RAM_sel_reg[2]  ( .D(n538), .CK(clk), .SN(n1228), .Q(
        n1905), .QN(n1794) );
  DFFSX1 \controller/t_RAM_sel_reg[2]  ( .D(n518), .CK(clk), .SN(n1228), .Q(
        n1908), .QN(n1796) );
  DFFRX1 \threshold/t_addr_reg[10]  ( .D(n526), .CK(clk), .RN(n626), .Q(n1858), 
        .QN(n1706) );
  DFFRX1 \convolution/conv_out1_reg[5]  ( .D(\convolution/N245 ), .CK(clk), 
        .RN(n1834), .Q(\convolution/conv_out1 [5]), .QN(n1703) );
  DFFSX1 \controller/c_RAM_sel_reg[1]  ( .D(\controller/N135 ), .CK(clk), .SN(
        n1228), .Q(n1912), .QN(n1798) );
  DFFRX1 \threshold/t_addr_reg[9]  ( .D(n527), .CK(clk), .RN(n626), .Q(n1859), 
        .QN(n727) );
  DFFRX1 \threshold/t_addr_reg[8]  ( .D(n528), .CK(clk), .RN(n1834), .Q(n1860), 
        .QN(n1721) );
  DFFRX1 \backward/cs_reg[1]  ( .D(n1630), .CK(clk), .RN(n1827), .Q(
        \backward/cs [1]), .QN(n1696) );
  DFFSX1 \threshold/t_addr_reg[0]  ( .D(n535), .CK(clk), .SN(n1834), .Q(n1868), 
        .QN(n1719) );
  DFFRX2 \forward/f_addr_reg[12]  ( .D(n492), .CK(clk), .RN(n1834), .Q(n1838), 
        .QN(n1639) );
  DFFSX2 \convolution/window_x_reg[1]  ( .D(\convolution/N100 ), .CK(clk), 
        .SN(n1830), .Q(\convolution/window_x [1]), .QN(n1715) );
  DFFRX1 \controller/threshold_valid_reg  ( .D(\controller/N148 ), .CK(clk), 
        .RN(n1228), .Q(threshold_valid), .QN(n1634) );
  DFFSX2 \convolution/window_y_reg[0]  ( .D(\convolution/N106 ), .CK(clk), 
        .SN(n1828), .Q(\convolution/window_y [0]), .QN(n1667) );
  DFFRX2 \forward/f_addr_reg[2]  ( .D(n502), .CK(clk), .RN(n1834), .Q(n1641), 
        .QN(n1647) );
  DFFRX2 \forward/f_addr_reg[1]  ( .D(n516), .CK(clk), .RN(n1834), .Q(n1842), 
        .QN(n728) );
  DFFRX2 \forward/f_addr_reg[5]  ( .D(n499), .CK(clk), .RN(n1834), .Q(n1642), 
        .QN(n1680) );
  DFFRX2 \forward/f_addr_reg[3]  ( .D(n501), .CK(clk), .RN(n1834), .Q(n1841), 
        .QN(n1636) );
  DFFRX2 \forward/f_addr_reg[13]  ( .D(n491), .CK(clk), .RN(n1834), .Q(n1837), 
        .QN(n1666) );
  DFFRX2 \forward/f_addr_reg[4]  ( .D(n500), .CK(clk), .RN(n1834), .QN(n1678)
         );
  DFFSX1 \backward/b_addr_reg[9]  ( .D(n565), .CK(clk), .SN(n1834), .Q(n1847), 
        .QN(n729) );
  DFFRX2 \forward/f_addr_reg[6]  ( .D(n498), .CK(clk), .RN(n1834), .Q(n624), 
        .QN(n1648) );
  DFFRX4 \threshold/t_addr_reg[5]  ( .D(n531), .CK(clk), .RN(n1827), .Q(n1863), 
        .QN(n1676) );
  DFFSX2 \backward/b_addr_reg[13]  ( .D(n561), .CK(clk), .SN(n1830), .Q(n1843), 
        .QN(n1722) );
  DFFRX2 \backward/b_addr_reg[7]  ( .D(n567), .CK(clk), .RN(n1828), .Q(n1915), 
        .QN(n1649) );
  DFFSX2 \backward/b_addr_reg[6]  ( .D(n568), .CK(clk), .SN(n1830), .Q(n1849), 
        .QN(n1723) );
  DFFSX2 \backward/b_addr_reg[5]  ( .D(n569), .CK(clk), .SN(n1829), .Q(n1850), 
        .QN(n1661) );
  DFFSX2 \backward/b_addr_reg[3]  ( .D(n571), .CK(clk), .SN(n1834), .Q(n1852), 
        .QN(n1660) );
  DFFRX2 \forward/min_reg[3]  ( .D(n508), .CK(clk), .RN(n1834), .Q(
        \forward/min [3]), .QN(n1653) );
  DFFRX2 \forward/min_reg[5]  ( .D(n506), .CK(clk), .RN(n1834), .Q(
        \forward/min [5]), .QN(n1654) );
  DFFRX2 \forward/min_reg[7]  ( .D(n504), .CK(clk), .RN(n1828), .Q(
        \forward/min [7]) );
  DFFRX2 \forward/min_reg[6]  ( .D(n505), .CK(clk), .RN(n1828), .Q(
        \forward/min [6]), .QN(n1713) );
  DFFRX2 \forward/min_reg[4]  ( .D(n507), .CK(clk), .RN(n1828), .Q(
        \forward/min [4]), .QN(n1701) );
  DFFRX2 \forward/min_reg[2]  ( .D(n509), .CK(clk), .RN(n1834), .Q(
        \forward/min [2]), .QN(n1708) );
  DFFRX2 \forward/min_reg[0]  ( .D(n511), .CK(clk), .RN(n1828), .Q(
        \forward/min [0]) );
  DFFRX2 \forward/min_reg[1]  ( .D(n510), .CK(clk), .RN(n1834), .Q(
        \forward/min [1]) );
  DFFRX2 \convolution/op1_reg  ( .D(\convolution/N205 ), .CK(clk), .RN(n1834), 
        .Q(\convolution/op1 ), .QN(n1693) );
  DFFRX2 \backward/min_reg[2]  ( .D(n558), .CK(clk), .RN(n1829), .Q(
        \backward/min [2]), .QN(n1702) );
  DFFRX2 \backward/min_reg[0]  ( .D(n559), .CK(clk), .RN(n1829), .Q(n725), 
        .QN(n1733) );
  DFFSX1 \controller/all_rst_reg  ( .D(n1835), .CK(clk), .SN(n1228), .Q(
        all_rst), .QN(n626) );
  DFFSX2 \backward/b_addr_reg[10]  ( .D(n564), .CK(clk), .SN(n1827), .Q(n1846), 
        .QN(n726) );
  DFFRX4 \backward/b_done_reg  ( .D(n575), .CK(clk), .RN(n1834), .Q(n1669), 
        .QN(n1677) );
  DFFRX1 \threshold/t_addr_reg[12]  ( .D(n524), .CK(clk), .RN(n1834), .Q(n1856), .QN(n1686) );
  DFFRX1 \threshold/t_addr_reg[13]  ( .D(n523), .CK(clk), .RN(n1829), .Q(n1855), .QN(n1689) );
  DFFRX1 \forward/f_do_reg[0]  ( .D(n490), .CK(clk), .RN(n1828), .Q(n1887), 
        .QN(n681) );
  DFFRX2 \convolution/c_addr_reg[10]  ( .D(n469), .CK(clk), .RN(n1834), .Q(
        n1872), .QN(n1774) );
  DFFRX1 \convolution/c_addr_reg[13]  ( .D(n466), .CK(clk), .RN(n1834), .Q(
        n1869), .QN(n1771) );
  DFFRX2 \backward/b_do_reg[1]  ( .D(n541), .CK(clk), .RN(n1829), .Q(n1894) );
  DFFRX2 \backward/b_do_reg[2]  ( .D(n542), .CK(clk), .RN(n1829), .Q(n1893) );
  DFFRX2 \backward/b_do_reg[3]  ( .D(n543), .CK(clk), .RN(n1829), .Q(n1892) );
  DFFRX2 \backward/b_do_reg[4]  ( .D(n544), .CK(clk), .RN(n1834), .Q(n1891) );
  DFFRX2 \backward/b_do_reg[5]  ( .D(n545), .CK(clk), .RN(n1834), .Q(n1890) );
  DFFRX2 \backward/b_do_reg[6]  ( .D(n546), .CK(clk), .RN(n1834), .Q(n1889) );
  DFFRX2 \backward/b_do_reg[7]  ( .D(n547), .CK(clk), .RN(n1834), .Q(n1888) );
  DFFRX2 \backward/b_do_reg[0]  ( .D(n548), .CK(clk), .RN(n1829), .Q(n1895) );
  DFFRX1 \threshold/t_addr_reg[11]  ( .D(n525), .CK(clk), .RN(n1834), .Q(n1857), .QN(n1685) );
  DFFRX1 \convolution/c_do_reg[5]  ( .D(n456), .CK(clk), .RN(n1829), .Q(n1896), 
        .QN(n659) );
  DFFRX1 \convolution/c_do_reg[4]  ( .D(n457), .CK(clk), .RN(n1829), .Q(n1897), 
        .QN(n657) );
  DFFRX1 \convolution/c_do_reg[3]  ( .D(n458), .CK(clk), .RN(n1829), .Q(n1898), 
        .QN(n655) );
  DFFRX1 \convolution/c_do_reg[2]  ( .D(n459), .CK(clk), .RN(n1834), .Q(n1899), 
        .QN(n653) );
  DFFRX1 \convolution/c_do_reg[1]  ( .D(n460), .CK(clk), .RN(n1834), .Q(n1900), 
        .QN(n651) );
  DFFRX1 \convolution/c_do_reg[0]  ( .D(n461), .CK(clk), .RN(n1834), .Q(n1901), 
        .QN(n649) );
  DFFRX1 \convolution/c_rd_reg  ( .D(n1802), .CK(clk), .RN(n1827), .QN(n647)
         );
  DFFRX1 \convolution/c_wr_reg  ( .D(\convolution/N140 ), .CK(clk), .RN(n1827), 
        .QN(n645) );
  DFFRX1 \backward/b_wr_reg  ( .D(\backward/N86 ), .CK(clk), .RN(n1827), .QN(
        n643) );
  DFFRX1 \backward/b_rd_reg  ( .D(n1695), .CK(clk), .RN(n1827), .QN(n641) );
  DFFRX1 \forward/f_do_reg[7]  ( .D(n489), .CK(clk), .RN(n1827), .QN(n1690) );
  DFFRX1 \forward/f_wr_reg  ( .D(\forward/N88 ), .CK(clk), .RN(n1827), .QN(
        n636) );
  DFFRX1 \forward/f_rd_reg  ( .D(n1694), .CK(clk), .RN(n1827), .QN(n634) );
  DFFRX1 \threshold/t_rd_reg  ( .D(\threshold/N15 ), .CK(clk), .RN(n1829), 
        .QN(n632) );
  DFFRX1 \threshold/t_wr_reg  ( .D(\threshold/N21 ), .CK(clk), .RN(n1827), 
        .QN(n630) );
  DFFRX1 \controller/done_reg  ( .D(n522), .CK(clk), .RN(n1228), .QN(n1699) );
  DFFSX2 \backward/counter_reg[2]  ( .D(n550), .CK(clk), .SN(n1834), .Q(
        \backward/counter [2]), .QN(n1652) );
  DFFRX2 \forward/f_addr_reg[9]  ( .D(n495), .CK(clk), .RN(n1834), .Q(n1839), 
        .QN(n1646) );
  DFFSX4 \backward/b_addr_reg[2]  ( .D(n572), .CK(clk), .SN(n1830), .Q(n1853), 
        .QN(n1663) );
  DFFSX4 \backward/b_addr_reg[4]  ( .D(n570), .CK(clk), .SN(n1828), .Q(n1851), 
        .QN(n1725) );
  DFFRX2 \forward/f_do_reg[4]  ( .D(n486), .CK(clk), .RN(n1828), .Q(n1883), 
        .QN(n662) );
  DFFRX2 \forward/f_do_reg[3]  ( .D(n485), .CK(clk), .RN(n1828), .Q(n1884), 
        .QN(n664) );
  DFFRX2 \forward/f_do_reg[2]  ( .D(n484), .CK(clk), .RN(n1828), .Q(n1885), 
        .QN(n666) );
  DFFRX2 \forward/f_do_reg[1]  ( .D(n483), .CK(clk), .RN(n1828), .Q(n1886), 
        .QN(n668) );
  DFFRX1 \convolution/c_addr_reg[7]  ( .D(n472), .CK(clk), .RN(n1834), .Q(
        n1875), .QN(n1763) );
  DFFRX1 \convolution/c_addr_reg[8]  ( .D(n471), .CK(clk), .RN(n1834), .Q(
        n1874), .QN(n1755) );
  DFFRX1 \convolution/c_addr_reg[11]  ( .D(n468), .CK(clk), .RN(n1834), .Q(
        n1871), .QN(n1753) );
  DFFRX1 \convolution/c_addr_reg[1]  ( .D(n479), .CK(clk), .RN(n1834), .Q(
        n1881), .QN(n1769) );
  DFFRX1 \convolution/c_addr_reg[0]  ( .D(n478), .CK(clk), .RN(n1834), .Q(
        n1882), .QN(n1759) );
  DFFRX1 \convolution/c_addr_reg[2]  ( .D(n477), .CK(clk), .RN(n1834), .Q(
        n1880), .QN(n1767) );
  DFFRX1 \convolution/c_addr_reg[4]  ( .D(n475), .CK(clk), .RN(n1834), .Q(
        n1878), .QN(n1761) );
  DFFSX1 \convolution/window_y_reg[3]  ( .D(\convolution/N109 ), .CK(clk), 
        .SN(n1830), .Q(\convolution/window_y [3]), .QN(n1709) );
  DFFRX1 \backward/min_reg[6]  ( .D(n554), .CK(clk), .RN(n1834), .Q(
        \backward/min [6]), .QN(n1707) );
  DFFRX1 \controller/convolution_valid_reg  ( .D(\controller/N151 ), .CK(clk), 
        .RN(n1228), .Q(convolution_valid), .QN(n1682) );
  DFFRX2 \controller/pic_cnt_reg[1]  ( .D(n578), .CK(clk), .RN(n1228), .Q(
        \controller/pic_cnt [1]) );
  DFFRX1 \threshold/cs_reg[1]  ( .D(\threshold/ns[1] ), .CK(clk), .RN(n1834), 
        .Q(\threshold/cs [1]), .QN(n1712) );
  DFFSX1 \controller/c_RAM_sel_reg[0]  ( .D(\controller/N134 ), .CK(clk), .SN(
        n1228), .Q(n1913), .QN(n1781) );
  DFFSX1 \backward/counter_reg[1]  ( .D(n552), .CK(clk), .SN(n1830), .Q(
        \backward/counter [1]) );
  DFFRX1 \backward/min_reg[3]  ( .D(n557), .CK(clk), .RN(n1829), .Q(
        \backward/min [3]), .QN(n1684) );
  DFFSX2 \convolution/window_y_reg[2]  ( .D(\convolution/N108 ), .CK(clk), 
        .SN(n1827), .Q(\convolution/window_y [2]) );
  DFFRX2 \convolution/conv_out1_reg[6]  ( .D(\convolution/N246 ), .CK(clk), 
        .RN(n1834), .Q(\convolution/conv_out1 [6]) );
  DFFRX1 \backward/cs_reg[0]  ( .D(n1832), .CK(clk), .RN(n1827), .Q(
        \backward/cs [0]), .QN(n1675) );
  DFFSX2 \convolution/window_x_reg[0]  ( .D(\convolution/N99 ), .CK(clk), .SN(
        n1830), .Q(\convolution/window_x [0]), .QN(n1726) );
  DFFRX1 \convolution/c_addr_reg[6]  ( .D(n473), .CK(clk), .RN(n1834), .Q(
        n1876), .QN(n1751) );
  DFFSX1 \forward/f_addr_reg[7]  ( .D(n497), .CK(clk), .SN(n1834), .Q(n1840), 
        .QN(n1664) );
  DFFRX1 \convolution/c_addr_reg[5]  ( .D(n474), .CK(clk), .RN(n1834), .Q(
        n1877), .QN(n1757) );
  DFFRX2 \controller/pic_cnt_reg[0]  ( .D(n579), .CK(clk), .RN(n1228), .Q(
        \controller/pic_cnt [0]), .QN(n1643) );
  DFFSX2 \convolution/window_x_reg[5]  ( .D(\convolution/N104 ), .CK(clk), 
        .SN(n1830), .Q(\convolution/window_x [5]), .QN(n1714) );
  DFFSX2 \convolution/window_x_reg[4]  ( .D(\convolution/N103 ), .CK(clk), 
        .SN(n1830), .Q(\convolution/window_x [4]), .QN(n1718) );
  DFFSX2 \convolution/window_x_reg[3]  ( .D(\convolution/N102 ), .CK(clk), 
        .SN(n1830), .Q(\convolution/window_x [3]), .QN(n1728) );
  DFFRX2 \backward/cs_reg[2]  ( .D(\backward/ns[2] ), .CK(clk), .RN(n1828), 
        .Q(\backward/cs [2]) );
  DFFSX1 \forward/f_addr_reg[0]  ( .D(n503), .CK(clk), .SN(n1827), .Q(n1831), 
        .QN(n1732) );
  DFFRX4 \forward/f_addr_reg[8]  ( .D(n496), .CK(clk), .RN(n1834), .Q(n1668), 
        .QN(n1679) );
  DFFRHQX2 \backward/min_reg[4]  ( .D(n556), .CK(clk), .RN(n1829), .Q(n598) );
  DFFRHQX2 \backward/min_reg[1]  ( .D(n560), .CK(clk), .RN(n1829), .Q(n600) );
  DFFSX2 \backward/b_addr_reg[12]  ( .D(n562), .CK(clk), .SN(n1830), .Q(n1844), 
        .QN(n1720) );
  DFFSX2 \backward/b_addr_reg[11]  ( .D(n563), .CK(clk), .SN(n1834), .Q(n1845), 
        .QN(n1659) );
  DFFRHQX2 \backward/min_reg[7]  ( .D(n553), .CK(clk), .RN(n1834), .Q(n603) );
  DFFRX1 \convolution/c_addr_reg[12]  ( .D(n467), .CK(clk), .RN(n1834), .Q(
        n1870), .QN(n1772) );
  DFFRX1 \convolution/c_addr_reg[9]  ( .D(n470), .CK(clk), .RN(n1834), .Q(
        n1873), .QN(n1773) );
  DFFRX1 \controller/pic_cnt_reg[2]  ( .D(n577), .CK(clk), .RN(n1228), .Q(
        \controller/pic_cnt [2]), .QN(n1688) );
  DFFSX1 \forward/counter_reg[3]  ( .D(n512), .CK(clk), .SN(n1834), .Q(
        \forward/counter [3]), .QN(n1717) );
  DFFRX1 \controller/pic_cnt_reg[3]  ( .D(n576), .CK(clk), .RN(n1228), .Q(
        \controller/pic_cnt [3]), .QN(n1673) );
  DFFSX1 \forward/counter_reg[1]  ( .D(n515), .CK(clk), .SN(n1828), .Q(
        \forward/counter [1]), .QN(n1705) );
  DFFSX1 \forward/counter_reg[2]  ( .D(n513), .CK(clk), .SN(n1829), .Q(
        \forward/counter [2]), .QN(n1692) );
  DFFRX1 \forward/f_do_reg[6]  ( .D(n488), .CK(clk), .RN(n1827), .QN(n1698) );
  DFFRX1 \forward/f_do_reg[5]  ( .D(n487), .CK(clk), .RN(n1828), .QN(n1697) );
  AO21X1 U640 ( .A0(n1461), .A1(n1455), .B0(n1454), .Y(n471) );
  AO21X2 U641 ( .A0(n938), .A1(n1203), .B0(n937), .Y(n555) );
  AO22X2 U642 ( .A0(n1587), .A1(\forward/min [2]), .B0(forward_di[2]), .B1(
        n1586), .Y(n509) );
  AO22X2 U643 ( .A0(n1587), .A1(\forward/min [6]), .B0(forward_di[6]), .B1(
        n1586), .Y(n505) );
  AO22X2 U644 ( .A0(n1587), .A1(\forward/min [4]), .B0(forward_di[4]), .B1(
        n1586), .Y(n507) );
  AO22X2 U645 ( .A0(n1587), .A1(\forward/min [5]), .B0(forward_di[5]), .B1(
        n1586), .Y(n506) );
  AO22X2 U646 ( .A0(n1587), .A1(\forward/min [7]), .B0(forward_di[7]), .B1(
        n1586), .Y(n504) );
  OAI21X1 U647 ( .A0(n894), .A1(n606), .B0(n893), .Y(n565) );
  OAI211X1 U648 ( .A0(n1534), .A1(n1692), .B0(n1597), .C0(n1530), .Y(n513) );
  AND2X2 U649 ( .A(n1221), .B(n1638), .Y(n1434) );
  NAND2X6 U650 ( .A(n1579), .B(n1578), .Y(n1587) );
  NAND2X6 U651 ( .A(n722), .B(n597), .Y(n716) );
  OR2X1 U652 ( .A(n939), .B(n1791), .Y(n1371) );
  NOR2X1 U653 ( .A(n1238), .B(\convolution/conv_out1 [6]), .Y(n1219) );
  NOR2X1 U654 ( .A(n705), .B(n1669), .Y(n704) );
  NAND2X2 U655 ( .A(n722), .B(n622), .Y(n724) );
  NAND3X1 U656 ( .A(n1608), .B(n1887), .C(n1597), .Y(n1188) );
  NAND2X1 U657 ( .A(n1490), .B(\convolution/window_y [2]), .Y(n1448) );
  CLKINVX3 U658 ( .A(n1221), .Y(n1435) );
  BUFX8 U659 ( .A(n1124), .Y(n607) );
  BUFX16 U660 ( .A(n1134), .Y(n611) );
  INVX3 U661 ( .A(n1390), .Y(n959) );
  NOR2X4 U662 ( .A(n1630), .B(n1832), .Y(n1539) );
  OAI21XL U663 ( .A0(n738), .A1(n1909), .B0(n1367), .Y(n739) );
  INVX12 U664 ( .A(n609), .Y(n1608) );
  AOI2BB2X2 U665 ( .B0(n1204), .B1(\forward/min [7]), .A0N(n1204), .A1N(
        \forward/min [7]), .Y(n1205) );
  NAND2X1 U667 ( .A(n1638), .B(n1437), .Y(n1221) );
  NOR2X1 U668 ( .A(n964), .B(backward_addr[12]), .Y(n965) );
  NOR2X1 U669 ( .A(n1483), .B(\convolution/window_x [0]), .Y(n1339) );
  CLKBUFX8 U670 ( .A(n688), .Y(n1630) );
  INVX1 U671 ( .A(n1525), .Y(n1527) );
  AND2X4 U672 ( .A(n759), .B(n1218), .Y(n1485) );
  OAI21X2 U673 ( .A0(n1580), .A1(n1561), .B0(n1560), .Y(n1583) );
  NOR2X1 U675 ( .A(n1399), .B(n1398), .Y(n1401) );
  NAND3X6 U676 ( .A(n1546), .B(n688), .C(n1677), .Y(n1134) );
  NOR3X4 U677 ( .A(n783), .B(n1531), .C(n773), .Y(n768) );
  NAND2X2 U678 ( .A(n818), .B(n817), .Y(n1024) );
  NOR2X1 U679 ( .A(n1207), .B(n626), .Y(n1370) );
  BUFX12 U680 ( .A(n778), .Y(n1390) );
  OAI2BB1X2 U681 ( .A0N(n1344), .A1N(\convolution/window_x [0]), .B0(n1343), 
        .Y(n1462) );
  NOR2X2 U682 ( .A(n859), .B(n858), .Y(n1079) );
  NAND2BX1 U683 ( .AN(n887), .B(n703), .Y(n702) );
  INVX6 U684 ( .A(n1606), .Y(n608) );
  OR2X4 U685 ( .A(n1526), .B(n764), .Y(n781) );
  NAND2X1 U686 ( .A(n1148), .B(n1677), .Y(n1202) );
  ADDHX1 U687 ( .A(\forward/min [5]), .B(n1600), .CO(n1603), .S(n1601) );
  NOR2X1 U688 ( .A(n795), .B(n822), .Y(n957) );
  INVX16 U689 ( .A(n1526), .Y(n783) );
  NOR2X1 U690 ( .A(n1512), .B(n1255), .Y(n1324) );
  BUFX4 U691 ( .A(n1314), .Y(n706) );
  NAND2X4 U692 ( .A(n935), .B(n621), .Y(n712) );
  NAND3X6 U693 ( .A(n691), .B(n891), .C(n617), .Y(n892) );
  CLKINVX1 U694 ( .A(n1213), .Y(n1406) );
  NOR2X1 U695 ( .A(n889), .B(\backward/counter [2]), .Y(n703) );
  OR2X1 U697 ( .A(\forward/counter [0]), .B(\forward/counter [1]), .Y(n779) );
  CLKINVX1 U698 ( .A(n1394), .Y(n689) );
  NAND2X1 U699 ( .A(n696), .B(n687), .Y(n877) );
  NAND3X2 U700 ( .A(n876), .B(n869), .C(n692), .Y(n871) );
  NAND2X2 U701 ( .A(n1314), .B(n1035), .Y(n1041) );
  NOR2X1 U702 ( .A(n1053), .B(backward_addr[11]), .Y(n895) );
  NOR3X4 U703 ( .A(n930), .B(n1399), .C(n927), .Y(n685) );
  CLKINVX1 U704 ( .A(backward_di[3]), .Y(n1400) );
  NAND3X2 U705 ( .A(n719), .B(n907), .C(\backward/cs [1]), .Y(n908) );
  NAND2X4 U706 ( .A(n912), .B(n915), .Y(n920) );
  NOR2X1 U707 ( .A(n1585), .B(n1573), .Y(n1562) );
  NAND2X2 U708 ( .A(n1254), .B(n1253), .Y(n1512) );
  OR2X2 U709 ( .A(backward_addr[8]), .B(backward_addr[7]), .Y(n881) );
  NOR2X1 U710 ( .A(n624), .B(forward_addr[5]), .Y(n953) );
  OAI2BB1X2 U711 ( .A0N(n929), .A1N(n1139), .B0(n911), .Y(n912) );
  OA21XL U712 ( .A0(n888), .A1(n1652), .B0(n1716), .Y(n620) );
  NAND2X2 U713 ( .A(n934), .B(n928), .Y(n930) );
  NAND2X1 U714 ( .A(n1315), .B(n1675), .Y(n1039) );
  NAND2X2 U715 ( .A(n721), .B(n720), .Y(n719) );
  NAND2X2 U716 ( .A(n915), .B(backward_di[3]), .Y(n927) );
  CLKBUFX3 U718 ( .A(backward_di[7]), .Y(n1394) );
  BUFX4 U719 ( .A(n1691), .Y(n1597) );
  NOR2X1 U720 ( .A(n1493), .B(n1693), .Y(n1360) );
  OAI22X2 U721 ( .A0(backward_di[5]), .A1(n1710), .B0(backward_di[6]), .B1(
        n1707), .Y(n711) );
  INVX1 U722 ( .A(forward_di[7]), .Y(n1550) );
  INVX1 U723 ( .A(forward_di[6]), .Y(n1551) );
  ADDHXL U724 ( .A(\convolution/window_x [1]), .B(\convolution/window_x [0]), 
        .CO(n1259), .S(n1467) );
  NAND4BBXL U725 ( .AN(\backward/counter [3]), .BN(\backward/counter [1]), .C(
        \backward/counter [2]), .D(\backward/counter [0]), .Y(n1037) );
  OR2X1 U726 ( .A(\forward/counter [3]), .B(\forward/counter [1]), .Y(n1552)
         );
  INVX16 U729 ( .A(n1647), .Y(forward_addr[2]) );
  INVX16 U730 ( .A(n1680), .Y(forward_addr[5]) );
  NAND2X2 U731 ( .A(\controller/pic_cnt [2]), .B(\controller/pic_cnt [1]), .Y(
        n1411) );
  CLKINVX3 U732 ( .A(backward_di[6]), .Y(n904) );
  BUFX8 U733 ( .A(backward_di[2]), .Y(n1139) );
  BUFX16 U734 ( .A(n1850), .Y(backward_addr[5]) );
  NAND2X4 U736 ( .A(n876), .B(n694), .Y(n693) );
  NOR2X2 U737 ( .A(n1514), .B(n1683), .Y(n755) );
  INVX4 U738 ( .A(backward_di[0]), .Y(n929) );
  NOR2X4 U739 ( .A(backward_di[1]), .B(backward_di[2]), .Y(n876) );
  NOR2X1 U740 ( .A(n1850), .B(n1851), .Y(n1030) );
  INVX4 U741 ( .A(n1678), .Y(n1270) );
  BUFX4 U742 ( .A(\convolution/conv_cnt [2]), .Y(n1286) );
  NAND2XL U743 ( .A(backward_addr[2]), .B(backward_addr[3]), .Y(n878) );
  INVXL U744 ( .A(n826), .Y(n828) );
  NOR2XL U745 ( .A(n1848), .B(n1849), .Y(n1029) );
  NAND2XL U746 ( .A(n994), .B(n1031), .Y(n976) );
  NOR2X4 U747 ( .A(backward_di[0]), .B(backward_di[6]), .Y(n694) );
  NOR2XL U748 ( .A(n834), .B(forward_addr[10]), .Y(n835) );
  NAND2XL U749 ( .A(n1866), .B(n1865), .Y(n1190) );
  NOR2X4 U750 ( .A(n1187), .B(\forward/ns [0]), .Y(n1606) );
  NOR2XL U751 ( .A(n1089), .B(n1056), .Y(n1057) );
  NAND2XL U752 ( .A(n1191), .B(n1213), .Y(n1195) );
  NAND2XL U753 ( .A(n1651), .B(n1273), .Y(n1181) );
  NOR2XL U754 ( .A(n1360), .B(n1353), .Y(n1351) );
  INVXL U755 ( .A(n1623), .Y(n1416) );
  NAND2XL U756 ( .A(n1339), .B(n1715), .Y(n1464) );
  NOR2X1 U757 ( .A(n1195), .B(n1192), .Y(n1422) );
  OR2X2 U758 ( .A(n1675), .B(\backward/cs [2]), .Y(n886) );
  INVXL U759 ( .A(n1429), .Y(n1432) );
  NAND2XL U760 ( .A(n1345), .B(n1480), .Y(n1348) );
  AOI21X1 U761 ( .A0(n1344), .A1(\convolution/window_x [1]), .B0(n1462), .Y(
        n1468) );
  NOR2X6 U762 ( .A(n1584), .B(n1583), .Y(n1586) );
  INVXL U763 ( .A(n1211), .Y(n1212) );
  INVXL U764 ( .A(n1411), .Y(n1239) );
  CLKINVX1 U766 ( .A(n1524), .Y(\convolution/N246 ) );
  OAI211XL U767 ( .A0(n1321), .A1(\convolution/window_y [0]), .B0(n1320), .C0(
        n1319), .Y(n472) );
  AND3X1 U768 ( .A(\forward/ns [0]), .B(forward_valid), .C(n1597), .Y(n1694)
         );
  OAI211XL U769 ( .A0(n1625), .A1(n1624), .B0(n1623), .C0(n1622), .Y(
        \controller/N136 ) );
  OAI211XL U770 ( .A0(n1419), .A1(n1791), .B0(n1369), .C0(n1208), .Y(n539) );
  OAI211XL U771 ( .A0(n1359), .A1(n1674), .B0(n1358), .C0(n1633), .Y(
        \convolution/N105 ) );
  OR2X2 U772 ( .A(n976), .B(n874), .Y(n591) );
  CLKINVX1 U774 ( .A(n1354), .Y(\convolution/N243 ) );
  NAND2X6 U775 ( .A(n1525), .B(n1186), .Y(\forward/ns [0]) );
  INVX3 U777 ( .A(n1483), .Y(n1344) );
  AOI2BB2X2 U778 ( .B0(n1356), .B1(\convolution/window_x [6]), .A0N(n1356), 
        .A1N(\convolution/window_x [6]), .Y(n1481) );
  INVX1 U779 ( .A(n715), .Y(n714) );
  NAND2X1 U780 ( .A(n1427), .B(n1860), .Y(n1408) );
  INVX1 U781 ( .A(n995), .Y(n1109) );
  OAI211X1 U782 ( .A0(n779), .A1(\forward/counter [2]), .B0(n763), .C0(n1597), 
        .Y(n765) );
  INVX1 U783 ( .A(n1545), .Y(n1543) );
  INVX1 U784 ( .A(n987), .Y(n1111) );
  NAND2X1 U787 ( .A(n1861), .B(n1862), .Y(n1189) );
  INVX1 U789 ( .A(n598), .Y(n599) );
  NOR2X4 U790 ( .A(n1671), .B(\convolution/conv_cnt [1]), .Y(n1502) );
  NAND2X1 U791 ( .A(n1831), .B(n1842), .Y(n803) );
  OAI31X1 U792 ( .A0(n1607), .A1(n610), .A2(n1698), .B0(n1605), .Y(n488) );
  OAI31X1 U793 ( .A0(n610), .A1(n1607), .A2(n1697), .B0(n1602), .Y(n487) );
  OAI2BB1X1 U794 ( .A0N(n1291), .A1N(n1361), .B0(n1290), .Y(n1292) );
  INVX1 U795 ( .A(n1462), .Y(n1465) );
  INVX1 U796 ( .A(n1474), .Y(n1477) );
  NOR2X1 U797 ( .A(n1361), .B(n1291), .Y(n1289) );
  INVX3 U798 ( .A(n1544), .Y(n1542) );
  NAND2X1 U799 ( .A(n1328), .B(n1461), .Y(n1026) );
  NAND2X1 U800 ( .A(n1481), .B(n1480), .Y(n1487) );
  NAND2X1 U801 ( .A(n1311), .B(n1480), .Y(n1312) );
  INVX1 U802 ( .A(n1318), .Y(n1319) );
  INVX3 U803 ( .A(n1159), .Y(n594) );
  NOR2X1 U804 ( .A(n1309), .B(n1514), .Y(n1287) );
  INVX6 U805 ( .A(n1832), .Y(n1546) );
  AOI21X1 U806 ( .A0(n1247), .A1(\convolution/conv_out1 [2]), .B0(n1350), .Y(
        n1248) );
  OAI211X1 U807 ( .A0(n1359), .A1(n1711), .B0(n1258), .C0(n1633), .Y(
        \convolution/N101 ) );
  NAND2X1 U808 ( .A(n1481), .B(n1357), .Y(n1358) );
  NOR2X6 U809 ( .A(\convolution/conv_out1 [2]), .B(n1247), .Y(n1350) );
  NAND2X4 U810 ( .A(n1184), .B(n1183), .Y(n1525) );
  NAND2X1 U811 ( .A(n1479), .B(n1357), .Y(n1282) );
  NAND2X1 U812 ( .A(n1473), .B(n1357), .Y(n1266) );
  NAND2X1 U813 ( .A(n1357), .B(n1726), .Y(n1264) );
  NAND2X1 U814 ( .A(n1330), .B(n1446), .Y(n1331) );
  NAND2X1 U815 ( .A(n1328), .B(n1446), .Y(n1329) );
  NAND2X1 U816 ( .A(n1455), .B(n1446), .Y(n1327) );
  AOI22X1 U817 ( .A0(n1616), .A1(n1620), .B0(n1615), .B1(n1614), .Y(n1617) );
  NAND2BX2 U818 ( .AN(n591), .B(n895), .Y(n964) );
  NAND2X1 U819 ( .A(n1460), .B(n1446), .Y(n1326) );
  AOI21X1 U820 ( .A0(n1240), .A1(\convolution/conv_out1 [0]), .B0(n1245), .Y(
        n1244) );
  NAND2X2 U821 ( .A(n1583), .B(n1597), .Y(n1579) );
  NAND2X1 U822 ( .A(n1422), .B(n1856), .Y(n1193) );
  NAND2X1 U823 ( .A(n1427), .B(n1424), .Y(n1425) );
  INVX12 U824 ( .A(n737), .Y(n1526) );
  INVX3 U826 ( .A(n1195), .Y(n1427) );
  NAND2X1 U827 ( .A(n1394), .B(n1402), .Y(n1395) );
  OR2X1 U829 ( .A(n738), .B(n1789), .Y(n1368) );
  NOR2X4 U831 ( .A(n1411), .B(n1421), .Y(n1413) );
  NAND2X2 U832 ( .A(n941), .B(n1419), .Y(n939) );
  NOR2X1 U833 ( .A(n1556), .B(\forward/min [7]), .Y(n1559) );
  INVX1 U834 ( .A(n1443), .Y(n1237) );
  NAND2X1 U835 ( .A(backward_addr[4]), .B(backward_addr[5]), .Y(n978) );
  INVX1 U836 ( .A(n1270), .Y(n794) );
  NAND2X1 U837 ( .A(\controller/pic_cnt [3]), .B(n1420), .Y(n1628) );
  ADDHX1 U838 ( .A(\forward/min [2]), .B(n1590), .CO(n1593), .S(n1592) );
  NOR2X1 U839 ( .A(\controller/pic_cnt [3]), .B(n1420), .Y(\controller/N148 )
         );
  INVX1 U840 ( .A(n1016), .Y(n1009) );
  INVX1 U841 ( .A(n1499), .Y(n1500) );
  INVX1 U842 ( .A(n1272), .Y(n1230) );
  NAND2X1 U843 ( .A(\convolution/window_x [1]), .B(\convolution/window_x [3]), 
        .Y(n1252) );
  INVX1 U844 ( .A(threshold_valid), .Y(n1011) );
  NOR2X1 U845 ( .A(n603), .B(\backward/min [6]), .Y(n905) );
  NOR4X1 U846 ( .A(threshold_di[5]), .B(threshold_di[4]), .C(threshold_di[3]), 
        .D(threshold_di[2]), .Y(n1225) );
  INVX4 U847 ( .A(reset), .Y(n1228) );
  NOR2X1 U848 ( .A(threshold_di[7]), .B(threshold_di[6]), .Y(n1226) );
  INVX1 U849 ( .A(forward_di[4]), .Y(n1563) );
  INVX1 U850 ( .A(n1365), .Y(\convolution/N245 ) );
  INVX1 U851 ( .A(n1292), .Y(\convolution/N244 ) );
  NOR2X4 U852 ( .A(n1521), .B(n1520), .Y(n1522) );
  OAI2BB1X1 U853 ( .A0N(n1364), .A1N(n1519), .B0(n1363), .Y(n1365) );
  OAI211X1 U854 ( .A0(n1488), .A1(n1674), .B0(n1487), .C0(n1486), .Y(n473) );
  OAI2BB1X1 U855 ( .A0N(n1461), .A1N(n1460), .B0(n1459), .Y(n468) );
  OAI211X1 U856 ( .A0(n1027), .A1(n1700), .B0(n1026), .C0(n1025), .Y(n467) );
  OAI2BB1X1 U857 ( .A0N(n1360), .A1N(n1353), .B0(n1352), .Y(n1354) );
  NOR2X1 U858 ( .A(n1521), .B(n1362), .Y(n1363) );
  OAI211X1 U859 ( .A0(n1449), .A1(n1321), .B0(n1022), .C0(n1021), .Y(n470) );
  NOR2X4 U860 ( .A(\convolution/conv_out1 [6]), .B(n1523), .Y(n1520) );
  OAI211X1 U861 ( .A0(n1468), .A1(n1711), .B0(n1313), .C0(n1312), .Y(n477) );
  OAI211X1 U862 ( .A0(n1488), .A1(n1714), .B0(n1348), .C0(n1347), .Y(n474) );
  OAI211X1 U863 ( .A0(n1342), .A1(\convolution/window_x [0]), .B0(n1341), .C0(
        n1340), .Y(n478) );
  INVX3 U864 ( .A(n611), .Y(n1166) );
  NOR2X1 U865 ( .A(n1521), .B(n1289), .Y(n1290) );
  NAND3X2 U866 ( .A(n724), .B(n1403), .C(n723), .Y(n557) );
  INVX6 U867 ( .A(n611), .Y(n595) );
  INVX1 U868 ( .A(n1339), .Y(n1340) );
  OAI211X1 U869 ( .A0(n1542), .A1(\backward/counter [0]), .B0(n1677), .C0(
        n1133), .Y(n551) );
  NAND4X1 U870 ( .A(n1549), .B(n1677), .C(n1548), .D(n1547), .Y(n550) );
  OAI211X1 U871 ( .A0(\convolution/window_y [0]), .A1(n1492), .B0(n1491), .C0(
        n1633), .Y(\convolution/N106 ) );
  NAND2X1 U872 ( .A(n1539), .B(\backward/counter [1]), .Y(n1540) );
  INVX1 U873 ( .A(n1461), .Y(n1321) );
  NAND2X1 U874 ( .A(n1318), .B(n1656), .Y(n1452) );
  INVX1 U875 ( .A(n1293), .Y(n1297) );
  NOR2X1 U876 ( .A(n1248), .B(n1521), .Y(\convolution/N242 ) );
  INVX1 U877 ( .A(n1480), .Y(n1342) );
  OAI211X1 U879 ( .A0(n1359), .A1(n1714), .B0(n1260), .C0(n1633), .Y(
        \convolution/N104 ) );
  OAI211X1 U881 ( .A0(n1359), .A1(n1718), .B0(n1282), .C0(n1633), .Y(
        \convolution/N103 ) );
  NOR2X1 U882 ( .A(n1246), .B(n1521), .Y(\convolution/N241 ) );
  OAI211X1 U883 ( .A0(n1359), .A1(n1715), .B0(n1261), .C0(n1633), .Y(
        \convolution/N100 ) );
  NOR2X1 U884 ( .A(n1244), .B(n1521), .Y(\convolution/N240 ) );
  OAI211X1 U885 ( .A0(n1359), .A1(n1726), .B0(n1264), .C0(n1633), .Y(
        \convolution/N99 ) );
  OAI211X1 U886 ( .A0(change_sel), .A1(n1618), .B0(n1623), .C0(n1617), .Y(
        \controller/N135 ) );
  XOR2X1 U887 ( .A(n964), .B(n1720), .Y(n700) );
  OAI211X1 U888 ( .A0(n943), .A1(n1371), .B0(n942), .C0(n1369), .Y(n538) );
  XOR2X1 U889 ( .A(n875), .B(backward_addr[9]), .Y(n885) );
  NAND2X1 U890 ( .A(n1905), .B(n940), .Y(n942) );
  NOR2X1 U891 ( .A(n1238), .B(n1682), .Y(\convolution/N140 ) );
  INVX1 U893 ( .A(n1359), .Y(n1322) );
  INVX1 U894 ( .A(n1446), .Y(n1492) );
  INVX1 U895 ( .A(n1305), .Y(n1238) );
  NOR3X1 U896 ( .A(n1316), .B(\backward/cs [2]), .C(n1315), .Y(
        \backward/ns[2] ) );
  INVX1 U897 ( .A(n1412), .Y(n1418) );
  AOI211X1 U898 ( .A0(n1280), .A1(n1729), .B0(forward_addr[0]), .C0(n1279), 
        .Y(\forward/ns [2]) );
  INVX3 U899 ( .A(n859), .Y(n1376) );
  NOR4X1 U900 ( .A(\threshold/cs [0]), .B(threshold_done), .C(n1609), .D(n1634), .Y(\threshold/N15 ) );
  NAND2X6 U901 ( .A(n736), .B(n735), .Y(n737) );
  NAND2X4 U902 ( .A(n920), .B(n919), .Y(n923) );
  OR2X1 U903 ( .A(n1609), .B(n1443), .Y(\threshold/ns[1] ) );
  NAND4X4 U904 ( .A(n734), .B(n733), .C(n732), .D(n731), .Y(n736) );
  AOI211X1 U905 ( .A0(n1902), .A1(n1800), .B0(n1834), .C0(n1784), .Y(n1209) );
  INVX3 U906 ( .A(n1202), .Y(n597) );
  INVX2 U907 ( .A(n1413), .Y(n1613) );
  AND3X2 U908 ( .A(n1730), .B(n1719), .C(n1442), .Y(n1609) );
  NOR2X1 U909 ( .A(n1239), .B(\controller/pic_cnt [3]), .Y(n1836) );
  NAND3X4 U910 ( .A(n932), .B(n938), .C(n1710), .Y(n707) );
  INVX1 U911 ( .A(n1018), .Y(n1449) );
  INVX1 U912 ( .A(n755), .Y(n756) );
  NAND2X2 U913 ( .A(n755), .B(\convolution/conv_cnt [3]), .Y(n1299) );
  NOR2X1 U914 ( .A(n780), .B(n1692), .Y(n782) );
  OAI21X1 U915 ( .A0(n1552), .A1(n1185), .B0(n1557), .Y(n1186) );
  INVX1 U916 ( .A(n851), .Y(n852) );
  NOR3X6 U917 ( .A(forward_di[7]), .B(forward_di[0]), .C(n730), .Y(n734) );
  INVX1 U918 ( .A(n808), .Y(n809) );
  NOR4X1 U920 ( .A(n1441), .B(n1440), .C(n1439), .D(n1438), .Y(n1442) );
  NOR3X1 U921 ( .A(threshold_done), .B(n1634), .C(n1237), .Y(\threshold/N21 )
         );
  AOI211X2 U922 ( .A0(n1564), .A1(n1563), .B0(n1562), .C0(\forward/min [5]), 
        .Y(n1571) );
  NOR4X1 U923 ( .A(n1234), .B(n1233), .C(convolution_done), .D(n1682), .Y(
        \convolution/N437 ) );
  NOR2X1 U924 ( .A(n1189), .B(n1214), .Y(n1191) );
  NOR2X1 U925 ( .A(n890), .B(n1669), .Y(n891) );
  AND2X1 U926 ( .A(n1597), .B(n624), .Y(n784) );
  INVX1 U927 ( .A(n887), .Y(n888) );
  AND2X1 U928 ( .A(n1597), .B(n1270), .Y(n801) );
  AND2X1 U929 ( .A(n1691), .B(forward_addr[12]), .Y(n866) );
  NAND2X1 U930 ( .A(n1669), .B(n1607), .Y(n1333) );
  NAND2X1 U931 ( .A(n1864), .B(threshold_addr[5]), .Y(n1214) );
  NOR3X1 U932 ( .A(n1552), .B(\forward/counter [2]), .C(n1650), .Y(n1556) );
  AND2X1 U933 ( .A(n1597), .B(forward_addr[1]), .Y(n813) );
  AND2X1 U934 ( .A(n1597), .B(forward_addr[5]), .Y(n792) );
  INVX1 U935 ( .A(n1624), .Y(n1621) );
  NAND3X1 U936 ( .A(n1419), .B(n1903), .C(n1904), .Y(n1236) );
  OAI2BB1X1 U937 ( .A0N(convolution_valid), .A1N(n1489), .B0(n1633), .Y(n580)
         );
  INVX1 U938 ( .A(n1514), .Y(n1303) );
  INVX1 U939 ( .A(n779), .Y(n780) );
  NAND2X1 U940 ( .A(n1913), .B(n1912), .Y(n1624) );
  AND2X1 U941 ( .A(n1691), .B(n628), .Y(n840) );
  NAND2X1 U942 ( .A(n1860), .B(n1859), .Y(n1196) );
  NAND2X1 U943 ( .A(n1681), .B(\convolution/cs [0]), .Y(n749) );
  NAND2X1 U944 ( .A(\forward/counter [0]), .B(\forward/counter [2]), .Y(n1185)
         );
  NAND2XL U945 ( .A(n1909), .B(n1796), .Y(n742) );
  NAND2X1 U946 ( .A(\forward/min [4]), .B(\forward/min [3]), .Y(n1573) );
  NAND2X1 U947 ( .A(convolution_done), .B(threshold_done), .Y(n1332) );
  NAND2X1 U948 ( .A(n1868), .B(n1867), .Y(n1429) );
  NOR3X1 U949 ( .A(n1696), .B(\backward/cs [2]), .C(\backward/cs [0]), .Y(n890) );
  NOR2X1 U950 ( .A(\threshold/cs [0]), .B(n1712), .Y(n1437) );
  INVX1 U951 ( .A(n603), .Y(n604) );
  NAND3X6 U952 ( .A(n722), .B(\backward/min [2]), .C(n597), .Y(n1143) );
  OAI22X2 U953 ( .A0(n1160), .A1(n1390), .B0(n1159), .B1(n1158), .Y(n495) );
  INVX12 U955 ( .A(n892), .Y(n1124) );
  OAI211X1 U956 ( .A0(n1449), .A1(n1492), .B0(n1633), .C0(n1448), .Y(
        \convolution/N108 ) );
  NAND3X4 U958 ( .A(n722), .B(n603), .C(n597), .Y(n1396) );
  NAND2X4 U959 ( .A(n928), .B(n931), .Y(n713) );
  OAI2BB2X2 U961 ( .B0(n1391), .B1(n1390), .A0N(n1389), .A1N(n1388), .Y(n494)
         );
  NAND2X1 U962 ( .A(n1444), .B(n1446), .Y(n1445) );
  OAI2BB2X4 U963 ( .B0(n810), .B1(n1390), .A0N(n594), .A1N(n809), .Y(n502) );
  NAND2X1 U964 ( .A(n1485), .B(n1874), .Y(n1451) );
  BUFX12 U965 ( .A(n1854), .Y(backward_addr[1]) );
  BUFX20 U966 ( .A(n872), .Y(n1122) );
  NOR2BX1 U967 ( .AN(n1732), .B(n1842), .Y(n804) );
  INVX3 U968 ( .A(n1139), .Y(n1144) );
  AND2X4 U969 ( .A(n602), .B(n601), .Y(n910) );
  AND3X4 U970 ( .A(n928), .B(n905), .C(n904), .Y(n602) );
  NAND3X4 U971 ( .A(n722), .B(n600), .C(n597), .Y(n1147) );
  OAI211X1 U972 ( .A0(n1465), .A1(n1715), .B0(n1464), .C0(n1463), .Y(n1466) );
  INVX4 U973 ( .A(backward_di[4]), .Y(n696) );
  NAND2X8 U974 ( .A(backward_di[3]), .B(backward_di[2]), .Y(n924) );
  OAI2BB1X1 U975 ( .A0N(n1592), .A1N(n610), .B0(n1591), .Y(n484) );
  OAI2BB1X1 U976 ( .A0N(n1599), .A1N(n610), .B0(n1598), .Y(n486) );
  NOR2X1 U977 ( .A(forward_addr[3]), .B(forward_addr[2]), .Y(n771) );
  NAND2X4 U978 ( .A(n1200), .B(n1139), .Y(n1399) );
  OAI2BB1X1 U979 ( .A0N(n1595), .A1N(n610), .B0(n1594), .Y(n485) );
  OAI2BB1X1 U980 ( .A0N(n1589), .A1N(n610), .B0(n1588), .Y(n483) );
  OAI21X2 U981 ( .A0(n1585), .A1(n1653), .B0(n1701), .Y(n1564) );
  BUFX20 U982 ( .A(forward_di[3]), .Y(n1585) );
  NAND2X6 U984 ( .A(n688), .B(n620), .Y(n691) );
  OR2X8 U985 ( .A(n688), .B(n1148), .Y(n617) );
  NAND3X1 U986 ( .A(n1387), .B(n960), .C(n959), .Y(n961) );
  AOI21X2 U987 ( .A0(n1389), .A1(forward_addr[7]), .B0(n1607), .Y(n962) );
  NAND2X6 U988 ( .A(backward_di[4]), .B(backward_di[5]), .Y(n720) );
  BUFX20 U989 ( .A(n1124), .Y(n605) );
  BUFX20 U990 ( .A(n1840), .Y(forward_addr[7]) );
  AOI22X2 U991 ( .A0(n902), .A1(n1118), .B0(n1122), .B1(n700), .Y(n699) );
  INVX3 U992 ( .A(n1013), .Y(n1010) );
  OAI22X2 U993 ( .A0(n1575), .A1(forward_di[4]), .B0(n1574), .B1(n1573), .Y(
        n1581) );
  INVX3 U994 ( .A(n1572), .Y(n1574) );
  AO21X2 U995 ( .A0(n1479), .A1(n1480), .B0(n1478), .Y(n475) );
  OAI211X1 U996 ( .A0(n1477), .A1(n1718), .B0(n1476), .C0(n1475), .Y(n1478) );
  AND2X8 U997 ( .A(n926), .B(n933), .Y(n717) );
  AO21X4 U998 ( .A0(n1480), .A1(n1467), .B0(n1466), .Y(n479) );
  OAI211X1 U999 ( .A0(n1453), .A1(n1656), .B0(n1452), .C0(n1451), .Y(n1454) );
  AOI211X1 U1000 ( .A0(n1620), .A1(n1781), .B0(n1615), .C0(n1416), .Y(n1417)
         );
  INVX12 U1001 ( .A(n608), .Y(n610) );
  INVX3 U1002 ( .A(n1582), .Y(n1577) );
  NOR3X4 U1003 ( .A(n1582), .B(n1581), .C(n1580), .Y(n1584) );
  NOR4X2 U1004 ( .A(n1771), .B(n1772), .C(n1773), .D(n1774), .Y(n744) );
  NAND2X2 U1005 ( .A(\convolution/window_x [2]), .B(\convolution/window_x [4]), 
        .Y(n1250) );
  NOR4X6 U1006 ( .A(n1482), .B(\convolution/window_x [6]), .C(
        \convolution/window_x [4]), .D(\convolution/window_x [5]), .Y(n1516)
         );
  NOR2X2 U1007 ( .A(n831), .B(n822), .Y(n824) );
  OAI211X1 U1008 ( .A0(n1390), .A1(n963), .B0(n962), .C0(n961), .Y(n497) );
  AOI22X1 U1009 ( .A0(n1382), .A1(n956), .B0(n1385), .B1(n955), .Y(n963) );
  NAND2X2 U1010 ( .A(n1551), .B(\forward/min [6]), .Y(n1554) );
  AOI21X4 U1011 ( .A0(n1203), .A1(n935), .B0(n623), .Y(n690) );
  ADDHX1 U1012 ( .A(\convolution/window_x [5]), .B(n1355), .CO(n1356), .S(
        n1345) );
  AOI211X1 U1013 ( .A0(n1458), .A1(\convolution/window_y [4]), .B0(n1457), 
        .C0(n1456), .Y(n1459) );
  INVX3 U1014 ( .A(n1015), .Y(n1008) );
  NAND2BX2 U1015 ( .AN(n1404), .B(n1203), .Y(n723) );
  AOI21X2 U1016 ( .A0(n605), .A1(backward_addr[9]), .B0(n1669), .Y(n893) );
  NAND2X4 U1017 ( .A(backward_addr[8]), .B(backward_addr[9]), .Y(n1068) );
  BUFX20 U1018 ( .A(n1847), .Y(backward_addr[9]) );
  OAI211X1 U1019 ( .A0(n1542), .A1(n1541), .B0(n1677), .C0(n1540), .Y(n552) );
  CLKINVX1 U1020 ( .A(n1273), .Y(n730) );
  OAI21X4 U1022 ( .A0(n1004), .A1(n1634), .B0(n1003), .Y(n1005) );
  BUFX20 U1023 ( .A(n1915), .Y(backward_addr[7]) );
  INVX3 U1024 ( .A(n906), .Y(n721) );
  NAND2X4 U1025 ( .A(backward_di[6]), .B(n905), .Y(n906) );
  NAND2X1 U1026 ( .A(convolution_valid), .B(n1006), .Y(n1003) );
  OAI2BB1X2 U1027 ( .A0N(n1119), .A1N(n903), .B0(n699), .Y(n698) );
  NAND3X1 U1028 ( .A(n1673), .B(\controller/pic_cnt [0]), .C(n1420), .Y(n941)
         );
  NOR2X1 U1029 ( .A(n1834), .B(n1613), .Y(n1414) );
  NOR2X1 U1030 ( .A(n1429), .B(n1190), .Y(n1213) );
  NOR2X2 U1031 ( .A(convolution_valid), .B(n1006), .Y(n1004) );
  OAI2BB1X1 U1032 ( .A0N(\convolution/conv_out1 [6]), .A1N(n1523), .B0(n1522), 
        .Y(n1524) );
  OAI33X4 U1033 ( .A0(\convolution/conv_out1 [5]), .A1(
        \convolution/conv_out1 [4]), .A2(n1519), .B0(n1703), .B1(n1518), .B2(
        n1644), .Y(n1523) );
  AOI2BB2X4 U1034 ( .B0(\controller/done_cnt [1]), .B1(n1005), .A0N(
        \controller/done_cnt [1]), .A1N(n1005), .Y(n1015) );
  AOI22X2 U1036 ( .A0(n1572), .A1(\forward/min [3]), .B0(\forward/min [4]), 
        .B1(\forward/min [5]), .Y(n1575) );
  NOR2X4 U1037 ( .A(n1585), .B(n1654), .Y(n1572) );
  NOR2X4 U1038 ( .A(n1688), .B(n1627), .Y(n1626) );
  OAI21X4 U1039 ( .A0(n716), .A1(n1707), .B0(n690), .Y(n554) );
  NOR2X2 U1040 ( .A(n1581), .B(n619), .Y(n1576) );
  NAND2X1 U1041 ( .A(backward_addr[4]), .B(backward_addr[3]), .Y(n880) );
  NAND3X4 U1042 ( .A(n923), .B(n932), .C(n922), .Y(n925) );
  NOR4XL U1043 ( .A(n1640), .B(n1656), .C(n1709), .D(n1494), .Y(n1508) );
  OA21X1 U1044 ( .A0(n1516), .A1(n1498), .B0(n1497), .Y(n1507) );
  NAND2XL U1045 ( .A(n1030), .B(n873), .Y(n874) );
  NOR2XL U1046 ( .A(n1849), .B(n1915), .Y(n873) );
  NAND2XL U1047 ( .A(backward_addr[11]), .B(backward_addr[10]), .Y(n896) );
  INVXL U1048 ( .A(n796), .Y(n845) );
  INVXL U1049 ( .A(forward_addr[5]), .Y(n786) );
  INVXL U1050 ( .A(n804), .Y(n846) );
  NAND2XL U1051 ( .A(n1379), .B(n860), .Y(n1081) );
  NOR2XL U1052 ( .A(n899), .B(backward_addr[11]), .Y(n900) );
  INVXL U1053 ( .A(n1058), .Y(n899) );
  NOR4X1 U1054 ( .A(\convolution/window_x [2]), .B(\convolution/window_x [0]), 
        .C(\convolution/window_x [1]), .D(\convolution/window_x [3]), .Y(n1346) );
  INVX3 U1055 ( .A(n612), .Y(n1482) );
  NOR2X2 U1056 ( .A(n1255), .B(convolution_done), .Y(n1305) );
  INVX3 U1057 ( .A(n1019), .Y(n818) );
  BUFX2 U1058 ( .A(forward_done), .Y(n1607) );
  CLKINVX1 U1059 ( .A(n1308), .Y(n1515) );
  NAND2XL U1060 ( .A(n1070), .B(n1058), .Y(n1059) );
  INVXL U1061 ( .A(n1044), .Y(n1045) );
  NAND2XL U1062 ( .A(n1070), .B(n969), .Y(n970) );
  AND2X1 U1063 ( .A(n1028), .B(n1058), .Y(n969) );
  NAND2XL U1064 ( .A(n1616), .B(n1610), .Y(n1611) );
  INVXL U1065 ( .A(n1372), .Y(n1373) );
  NAND2BX1 U1066 ( .AN(n1545), .B(n907), .Y(n701) );
  BUFX12 U1067 ( .A(n944), .Y(n1159) );
  CLKINVX1 U1068 ( .A(n1148), .Y(n1402) );
  AOI211X1 U1069 ( .A0(n1906), .A1(n1794), .B0(n1907), .C0(n939), .Y(n1207) );
  AND2X4 U1070 ( .A(n1832), .B(n1630), .Y(n1544) );
  NAND2X2 U1071 ( .A(n1301), .B(n1300), .Y(n1483) );
  ADDHXL U1072 ( .A(\convolution/window_x [2]), .B(n1259), .CO(n1265), .S(
        n1311) );
  AOI211XL U1073 ( .A0(n1308), .A1(n1502), .B0(n1510), .C0(n1495), .Y(n1310)
         );
  NOR2X1 U1074 ( .A(n1024), .B(\convolution/window_y [4]), .Y(n1456) );
  AND3X1 U1075 ( .A(n1802), .B(n1500), .C(n1302), .Y(n1461) );
  INVX4 U1076 ( .A(n1802), .Y(n1309) );
  NAND2XL U1077 ( .A(n1675), .B(\backward/cs [2]), .Y(n1229) );
  NAND2XL U1078 ( .A(n1467), .B(n1357), .Y(n1261) );
  XOR2X1 U1079 ( .A(n1868), .B(n1221), .Y(n1222) );
  INVXL U1080 ( .A(n1255), .Y(n1833) );
  NAND2XL U1081 ( .A(n1311), .B(n1357), .Y(n1258) );
  NAND4XL U1082 ( .A(forward_addr[9]), .B(forward_addr[5]), .C(n1668), .D(n624), .Y(n1277) );
  NAND2X2 U1083 ( .A(n1139), .B(n913), .Y(n914) );
  NAND2X1 U1084 ( .A(forward_addr[7]), .B(n624), .Y(n831) );
  NAND3XL U1085 ( .A(n1837), .B(n1838), .C(\forward/cs [0]), .Y(n1169) );
  AND4X1 U1086 ( .A(n1880), .B(n1881), .C(n1882), .D(n1871), .Y(n745) );
  NOR2X1 U1087 ( .A(n1852), .B(n1853), .Y(n1031) );
  NOR2X4 U1088 ( .A(n711), .B(n921), .Y(n932) );
  NOR2X1 U1089 ( .A(backward_di[7]), .B(n604), .Y(n921) );
  AOI31XL U1090 ( .A0(n1499), .A1(n1496), .A2(n1512), .B0(n1495), .Y(n1497) );
  NAND4XL U1091 ( .A(\convolution/window_y [4]), .B(\convolution/window_y [5]), 
        .C(\convolution/window_y [2]), .D(\convolution/window_y [0]), .Y(n1494) );
  NAND2XL U1092 ( .A(forward_di[6]), .B(n1713), .Y(n1561) );
  INVXL U1093 ( .A(n994), .Y(n1107) );
  INVXL U1094 ( .A(n1437), .Y(n1439) );
  AOI2BB2X2 U1095 ( .B0(\controller/done_cnt [0]), .B1(n1007), .A0N(
        \controller/done_cnt [0]), .A1N(n1007), .Y(n1013) );
  NOR2X1 U1096 ( .A(n856), .B(n855), .Y(n1077) );
  INVXL U1097 ( .A(n1274), .Y(n1177) );
  NAND2XL U1098 ( .A(n1302), .B(n1503), .Y(n1498) );
  NOR3X1 U1099 ( .A(n754), .B(\convolution/window_y [2]), .C(
        \convolution/window_y [0]), .Y(n817) );
  OR2X2 U1100 ( .A(\convolution/window_y [1]), .B(\convolution/window_y [3]), 
        .Y(n754) );
  NOR2X2 U1101 ( .A(\convolution/conv_cnt [0]), .B(\convolution/conv_cnt [1]), 
        .Y(n1499) );
  NOR2X2 U1102 ( .A(n1635), .B(n1637), .Y(n1274) );
  NAND2XL U1103 ( .A(n1837), .B(n1842), .Y(n1271) );
  NAND2XL U1105 ( .A(n1111), .B(backward_addr[3]), .Y(n988) );
  NOR2XL U1106 ( .A(n591), .B(n1066), .Y(n1067) );
  INVXL U1107 ( .A(n1065), .Y(n1066) );
  NAND2XL U1108 ( .A(n1070), .B(n729), .Y(n1071) );
  NAND2XL U1109 ( .A(n951), .B(n950), .Y(n952) );
  NOR2XL U1110 ( .A(n949), .B(forward_addr[6]), .Y(n950) );
  AND2X2 U1111 ( .A(n1036), .B(\backward/cs [0]), .Y(n1035) );
  AND2X1 U1112 ( .A(n597), .B(\backward/min [3]), .Y(n622) );
  NOR2XL U1113 ( .A(n1107), .B(backward_addr[2]), .Y(n1108) );
  NAND2XL U1114 ( .A(n1109), .B(backward_addr[2]), .Y(n1110) );
  NAND2XL U1115 ( .A(n1097), .B(n1725), .Y(n1098) );
  NAND4XL U1116 ( .A(n1857), .B(n1859), .C(n1856), .D(n1866), .Y(n1441) );
  NAND4XL U1117 ( .A(n1860), .B(n1862), .C(n1855), .D(n1858), .Y(n1438) );
  NAND2XL U1118 ( .A(n951), .B(n948), .Y(n772) );
  NAND2XL U1119 ( .A(n954), .B(n786), .Y(n770) );
  NOR2XL U1120 ( .A(n591), .B(backward_addr[8]), .Y(n875) );
  NOR2XL U1121 ( .A(n845), .B(forward_addr[3]), .Y(n797) );
  NAND2XL U1122 ( .A(n1380), .B(n1082), .Y(n1083) );
  NOR2XL U1123 ( .A(n846), .B(forward_addr[2]), .Y(n847) );
  NAND2XL U1124 ( .A(n843), .B(forward_addr[2]), .Y(n844) );
  NAND2XL U1125 ( .A(n951), .B(n794), .Y(n788) );
  NOR2XL U1126 ( .A(n795), .B(n794), .Y(n787) );
  INVXL U1127 ( .A(n811), .Y(n812) );
  NAND2XL U1128 ( .A(n1597), .B(forward_addr[2]), .Y(n808) );
  CLKINVX1 U1129 ( .A(n1447), .Y(n1490) );
  NOR2X1 U1130 ( .A(\controller/pic_cnt [2]), .B(\controller/pic_cnt [1]), .Y(
        n1420) );
  NAND2XL U1131 ( .A(n1374), .B(n854), .Y(n825) );
  CLKBUFX3 U1132 ( .A(backward_di[6]), .Y(n934) );
  NOR2BX1 U1133 ( .AN(n625), .B(n1202), .Y(n715) );
  NOR2XL U1134 ( .A(n1089), .B(n897), .Y(n898) );
  ADDHXL U1135 ( .A(\convolution/window_y [1]), .B(\convolution/window_y [0]), 
        .CO(n1017), .S(n1455) );
  NAND2X2 U1136 ( .A(n1526), .B(n1597), .Y(n1187) );
  NOR2X4 U1137 ( .A(n1585), .B(forward_di[4]), .Y(n1268) );
  BUFX16 U1139 ( .A(n1852), .Y(backward_addr[3]) );
  NAND2XL U1140 ( .A(n1020), .B(\convolution/window_y [2]), .Y(n1021) );
  NAND2XL U1141 ( .A(n1597), .B(forward_addr[9]), .Y(n1158) );
  AOI222X1 U1142 ( .A0(n1387), .A1(n1157), .B0(n1385), .B1(n1156), .C0(n1155), 
        .C1(n1382), .Y(n1160) );
  AOI21XL U1143 ( .A0(\convolution/window_x [6]), .A1(
        \convolution/window_x [5]), .B0(n1516), .Y(n1484) );
  OAI211X1 U1144 ( .A0(n1534), .A1(n1705), .B0(n1597), .C0(n1528), .Y(n515) );
  NAND2BX2 U1145 ( .AN(n1405), .B(n1145), .Y(n1146) );
  NAND2XL U1146 ( .A(backward_di[3]), .B(n1402), .Y(n1403) );
  XNOR2X1 U1147 ( .A(\backward/counter [1]), .B(\backward/counter [0]), .Y(
        n1541) );
  AND3X1 U1148 ( .A(convolution_di[0]), .B(n1802), .C(n1517), .Y(
        \convolution/N205 ) );
  INVXL U1149 ( .A(n1493), .Y(n1511) );
  AO22X2 U1150 ( .A0(n1587), .A1(\forward/min [1]), .B0(forward_di[1]), .B1(
        n1586), .Y(n510) );
  XOR2X1 U1151 ( .A(n1054), .B(backward_addr[11]), .Y(n1062) );
  AOI222X1 U1153 ( .A0(n1122), .A1(n1050), .B0(n1049), .B1(n1119), .C0(n1118), 
        .C1(n1048), .Y(n1052) );
  OAI21X1 U1154 ( .A0(n975), .A1(n606), .B0(n974), .Y(n561) );
  OAI22X1 U1155 ( .A0(n1132), .A1(n1390), .B0(n1159), .B1(n1131), .Y(n496) );
  NAND2XL U1156 ( .A(n1597), .B(n1668), .Y(n1131) );
  AOI21XL U1157 ( .A0(n1643), .A1(n1410), .B0(n1249), .Y(n579) );
  OAI22XL U1158 ( .A0(n1626), .A1(n1673), .B0(n1410), .B1(n1610), .Y(n576) );
  INVXL U1159 ( .A(n1196), .Y(n1197) );
  OAI211XL U1160 ( .A0(n1911), .A1(n1621), .B0(n1620), .C0(n1619), .Y(n1622)
         );
  NAND2XL U1161 ( .A(n1911), .B(n1621), .Y(n1619) );
  OAI211XL U1162 ( .A0(n1902), .A1(n1236), .B0(forward_valid), .C0(n1235), .Y(
        n480) );
  NAND2XL U1163 ( .A(n1902), .B(n1236), .Y(n1235) );
  AND2X1 U1164 ( .A(n1597), .B(forward_addr[10]), .Y(n1388) );
  AOI222X1 U1165 ( .A0(n1387), .A1(n1386), .B0(n1385), .B1(n1384), .C0(n1383), 
        .C1(n1382), .Y(n1391) );
  AND2X1 U1166 ( .A(n934), .B(n1402), .Y(n623) );
  NAND2XL U1167 ( .A(n1345), .B(n1357), .Y(n1260) );
  XOR2X1 U1168 ( .A(n1430), .B(n1727), .Y(n1431) );
  NAND2XL U1169 ( .A(n1432), .B(n1866), .Y(n1430) );
  XNOR2X1 U1170 ( .A(n1868), .B(n1748), .Y(n1436) );
  XOR2X1 U1171 ( .A(n1406), .B(n1741), .Y(n1407) );
  INVXL U1172 ( .A(n1207), .Y(n1208) );
  NAND4XL U1173 ( .A(n1443), .B(n1226), .C(n1225), .D(n1224), .Y(n1227) );
  NAND2X2 U1174 ( .A(n704), .B(n697), .Y(n562) );
  NAND2X1 U1175 ( .A(n698), .B(n892), .Y(n697) );
  NOR2X1 U1176 ( .A(n892), .B(n1720), .Y(n705) );
  OAI211X1 U1177 ( .A0(n1538), .A1(\forward/counter [0]), .B0(n1537), .C0(
        n1597), .Y(n514) );
  NAND2XL U1178 ( .A(n1536), .B(\forward/counter [0]), .Y(n1537) );
  NAND2XL U1179 ( .A(n1485), .B(n1878), .Y(n1475) );
  AND2X1 U1180 ( .A(n1485), .B(n1879), .Y(n1469) );
  NAND2XL U1181 ( .A(n1485), .B(n1881), .Y(n1463) );
  AND2X1 U1182 ( .A(n1485), .B(n1871), .Y(n1457) );
  INVXL U1183 ( .A(n1450), .Y(n1453) );
  NAND2XL U1184 ( .A(n1288), .B(n1296), .Y(n463) );
  INVXL U1185 ( .A(n1496), .Y(n1234) );
  INVXL U1186 ( .A(n1502), .Y(n1233) );
  NAND2XL U1187 ( .A(n1284), .B(n1296), .Y(n464) );
  NAND3XL U1188 ( .A(n1608), .B(n1886), .C(n1691), .Y(n1588) );
  NAND3XL U1189 ( .A(n1608), .B(n1885), .C(n1597), .Y(n1591) );
  NAND3XL U1190 ( .A(n1608), .B(n1884), .C(n1691), .Y(n1594) );
  NAND3XL U1191 ( .A(n1608), .B(n1883), .C(n1597), .Y(n1598) );
  NOR2XL U1192 ( .A(n1835), .B(n1335), .Y(\controller/N28 ) );
  AND2X4 U1193 ( .A(n712), .B(n707), .Y(n618) );
  OR2X2 U1194 ( .A(n1580), .B(n1607), .Y(n619) );
  AND2X2 U1195 ( .A(n1394), .B(n1707), .Y(n621) );
  NAND2X2 U1196 ( .A(n907), .B(n1696), .Y(n1148) );
  CLKINVX1 U1197 ( .A(n907), .Y(n889) );
  NOR2X2 U1198 ( .A(n886), .B(n1669), .Y(n907) );
  NAND2X4 U1200 ( .A(n1670), .B(n1286), .Y(n1294) );
  OAI211XL U1201 ( .A0(n1285), .A1(n1672), .B0(n1296), .C0(n1263), .Y(n465) );
  INVXL U1202 ( .A(n1285), .Y(n1283) );
  INVX12 U1203 ( .A(n1637), .Y(forward_addr[11]) );
  OAI211XL U1204 ( .A0(n1447), .A1(n1655), .B0(n1326), .C0(n1633), .Y(
        \convolution/N110 ) );
  OAI211XL U1205 ( .A0(n1447), .A1(n1700), .B0(n1329), .C0(n1633), .Y(
        \convolution/N111 ) );
  OAI211XL U1206 ( .A0(n1447), .A1(n1656), .B0(n1633), .C0(n1327), .Y(
        \convolution/N107 ) );
  NOR2X4 U1207 ( .A(backward_di[7]), .B(\backward/cs [1]), .Y(n692) );
  INVX16 U1208 ( .A(n1777), .Y(b_RAM_sel[1]) );
  INVX16 U1209 ( .A(n728), .Y(forward_addr[1]) );
  NOR2XL U1210 ( .A(n628), .B(forward_addr[10]), .Y(n860) );
  NAND2X1 U1211 ( .A(n857), .B(n628), .Y(n858) );
  NAND2XL U1212 ( .A(n854), .B(n628), .Y(n855) );
  NAND4XL U1213 ( .A(n1270), .B(forward_addr[2]), .C(forward_addr[3]), .D(
        forward_addr[12]), .Y(n1278) );
  NOR2XL U1214 ( .A(n1081), .B(forward_addr[12]), .Y(n1082) );
  NAND2XL U1215 ( .A(n1079), .B(forward_addr[12]), .Y(n1080) );
  NAND2XL U1216 ( .A(n1077), .B(forward_addr[12]), .Y(n1078) );
  INVX16 U1217 ( .A(n1639), .Y(forward_addr[12]) );
  INVX12 U1218 ( .A(n1699), .Y(done) );
  INVX12 U1219 ( .A(n630), .Y(threshold_wr) );
  INVX12 U1220 ( .A(n632), .Y(threshold_rd) );
  INVX12 U1221 ( .A(n634), .Y(forward_rd) );
  INVX12 U1222 ( .A(n636), .Y(forward_wr) );
  INVX12 U1223 ( .A(n1690), .Y(forward_do[7]) );
  INVX12 U1224 ( .A(n1698), .Y(forward_do[6]) );
  INVX12 U1225 ( .A(n1697), .Y(forward_do[5]) );
  INVX12 U1226 ( .A(n641), .Y(backward_rd) );
  AND3X1 U1227 ( .A(n1832), .B(backward_valid), .C(n1677), .Y(n1695) );
  INVX12 U1228 ( .A(n643), .Y(backward_wr) );
  NOR2X1 U1229 ( .A(n611), .B(n1662), .Y(\backward/N86 ) );
  INVX12 U1230 ( .A(n645), .Y(convolution_wr) );
  INVX12 U1231 ( .A(n647), .Y(convolution_rd) );
  BUFX8 U1232 ( .A(n1301), .Y(n1802) );
  BUFX12 U1233 ( .A(n1668), .Y(forward_addr[8]) );
  INVX12 U1234 ( .A(n649), .Y(convolution_do[0]) );
  INVX12 U1235 ( .A(n651), .Y(convolution_do[1]) );
  INVX12 U1236 ( .A(n653), .Y(convolution_do[2]) );
  INVX12 U1237 ( .A(n655), .Y(convolution_do[3]) );
  INVX12 U1238 ( .A(n657), .Y(convolution_do[4]) );
  INVX12 U1239 ( .A(n659), .Y(convolution_do[5]) );
  BUFX12 U1240 ( .A(n1857), .Y(threshold_addr[11]) );
  INVX12 U1241 ( .A(n1773), .Y(convolution_addr[9]) );
  INVX12 U1242 ( .A(n662), .Y(forward_do[4]) );
  INVX12 U1243 ( .A(n664), .Y(forward_do[3]) );
  INVX12 U1244 ( .A(n666), .Y(forward_do[2]) );
  INVX12 U1245 ( .A(n668), .Y(forward_do[1]) );
  BUFX12 U1246 ( .A(n1895), .Y(backward_do[0]) );
  OAI2BB1X2 U1247 ( .A0N(n595), .A1N(n725), .B0(n1163), .Y(n548) );
  BUFX12 U1248 ( .A(n1888), .Y(backward_do[7]) );
  OAI2BB1X2 U1249 ( .A0N(n595), .A1N(n603), .B0(n1168), .Y(n547) );
  BUFX12 U1250 ( .A(n1889), .Y(backward_do[6]) );
  OAI2BB1X2 U1251 ( .A0N(n595), .A1N(\backward/min [6]), .B0(n1161), .Y(n546)
         );
  BUFX12 U1252 ( .A(n1890), .Y(backward_do[5]) );
  OAI2BB1X2 U1253 ( .A0N(n595), .A1N(n625), .B0(n1162), .Y(n545) );
  BUFX12 U1254 ( .A(n1891), .Y(backward_do[4]) );
  OAI2BB1X2 U1255 ( .A0N(n1166), .A1N(n598), .B0(n1167), .Y(n544) );
  BUFX12 U1256 ( .A(n1892), .Y(backward_do[3]) );
  OAI2BB1X2 U1257 ( .A0N(n1166), .A1N(\backward/min [3]), .B0(n1165), .Y(n543)
         );
  BUFX12 U1258 ( .A(n1893), .Y(backward_do[2]) );
  OAI2BB1X2 U1259 ( .A0N(n595), .A1N(\backward/min [2]), .B0(n1164), .Y(n542)
         );
  BUFX12 U1260 ( .A(n1894), .Y(backward_do[1]) );
  OAI2BB1X2 U1261 ( .A0N(n1166), .A1N(n600), .B0(n1135), .Y(n541) );
  INVX12 U1262 ( .A(n1772), .Y(convolution_addr[12]) );
  AOI22XL U1263 ( .A0(n1456), .A1(n1700), .B0(n1870), .B1(n1485), .Y(n1025) );
  INVX12 U1264 ( .A(n1771), .Y(convolution_addr[13]) );
  AOI22XL U1265 ( .A0(n819), .A1(n818), .B0(n1869), .B1(n1485), .Y(n820) );
  INVX12 U1266 ( .A(n1774), .Y(convolution_addr[10]) );
  NAND2XL U1267 ( .A(n1485), .B(n1872), .Y(n760) );
  INVX12 U1268 ( .A(n681), .Y(forward_do[0]) );
  OAI21X1 U1269 ( .A0(n1608), .A1(\forward/min [0]), .B0(n1188), .Y(n490) );
  INVX12 U1270 ( .A(n1689), .Y(threshold_addr[13]) );
  AO22X1 U1271 ( .A0(n1194), .A1(n1435), .B0(n1855), .B1(n1434), .Y(n523) );
  INVX12 U1272 ( .A(n1686), .Y(threshold_addr[12]) );
  AOI21X1 U1273 ( .A0(n605), .A1(backward_addr[4]), .B0(n1669), .Y(n992) );
  AOI21X1 U1274 ( .A0(n605), .A1(backward_addr[2]), .B0(n1669), .Y(n999) );
  AOI21X1 U1275 ( .A0(n605), .A1(\C1/DATA3_0 ), .B0(n1669), .Y(n1001) );
  AOI21X1 U1276 ( .A0(n605), .A1(backward_addr[8]), .B0(n1669), .Y(n1095) );
  OR2X8 U1277 ( .A(n1397), .B(n603), .Y(n718) );
  XOR2X4 U1278 ( .A(n685), .B(n689), .Y(n1397) );
  NOR2BX1 U1280 ( .AN(\backward/counter [2]), .B(n688), .Y(n686) );
  NAND3X6 U1281 ( .A(n696), .B(n687), .C(n692), .Y(n695) );
  NOR2X8 U1282 ( .A(backward_di[5]), .B(backward_di[3]), .Y(n687) );
  NOR2X8 U1283 ( .A(n1314), .B(n886), .Y(n688) );
  NOR2X8 U1284 ( .A(n695), .B(n693), .Y(n1314) );
  NOR2X8 U1285 ( .A(n706), .B(n701), .Y(n1118) );
  NOR2X8 U1286 ( .A(n706), .B(n702), .Y(n1119) );
  XNOR2X4 U1287 ( .A(n708), .B(backward_di[5]), .Y(n938) );
  NAND3X6 U1288 ( .A(backward_di[4]), .B(n710), .C(n709), .Y(n708) );
  INVX3 U1289 ( .A(n1140), .Y(n709) );
  INVX3 U1290 ( .A(n924), .Y(n710) );
  XOR2X4 U1291 ( .A(n713), .B(n904), .Y(n935) );
  NAND2X2 U1292 ( .A(n1203), .B(n1136), .Y(n1137) );
  NAND2X2 U1293 ( .A(n1203), .B(n1141), .Y(n1142) );
  OAI21X2 U1294 ( .A0(n1203), .A1(n714), .B0(n936), .Y(n937) );
  OAI21X2 U1295 ( .A0(n1733), .A1(n716), .B0(n1201), .Y(n559) );
  INVX12 U1296 ( .A(n1405), .Y(n1203) );
  NAND4X8 U1297 ( .A(n718), .B(n717), .C(n618), .D(n925), .Y(n1405) );
  BUFX20 U1299 ( .A(n1405), .Y(n722) );
  NOR2X8 U1300 ( .A(n924), .B(n1140), .Y(n931) );
  NAND2X2 U1301 ( .A(backward_di[3]), .B(n1684), .Y(n916) );
  OAI21X2 U1302 ( .A0(n1139), .A1(n1702), .B0(n924), .Y(n911) );
  INVX4 U1303 ( .A(n929), .Y(n1200) );
  INVX16 U1304 ( .A(n1646), .Y(forward_addr[9]) );
  NAND2XL U1305 ( .A(n600), .B(\backward/min [2]), .Y(n913) );
  INVXL U1306 ( .A(n948), .Y(n949) );
  AND4X1 U1307 ( .A(n1879), .B(n1878), .C(n1877), .D(n1876), .Y(n746) );
  NAND2XL U1308 ( .A(n1503), .B(n1308), .Y(n1298) );
  NAND2XL U1309 ( .A(n1557), .B(n1597), .Y(n1558) );
  INVXL U1310 ( .A(n1081), .Y(n861) );
  NAND2XL U1311 ( .A(n957), .B(n624), .Y(n958) );
  AOI21X2 U1312 ( .A0(n980), .A1(n882), .B0(n881), .Y(n1070) );
  NAND2XL U1313 ( .A(n1380), .B(n1379), .Y(n1381) );
  OAI21XL U1314 ( .A0(n1515), .A1(n1672), .B0(n1307), .Y(n753) );
  NOR2XL U1315 ( .A(n1272), .B(n1271), .Y(n1275) );
  NAND2XL U1316 ( .A(n1614), .B(n1611), .Y(n1612) );
  INVXL U1317 ( .A(n1121), .Y(n1120) );
  NOR2X1 U1318 ( .A(n1182), .B(n1181), .Y(n1183) );
  ADDHXL U1319 ( .A(\convolution/window_y [2]), .B(n1017), .CO(n815), .S(n1018) );
  NOR2XL U1320 ( .A(forward_di[7]), .B(forward_di[2]), .Y(n1267) );
  OAI21X2 U1321 ( .A0(n1834), .A1(n1613), .B0(change_sel), .Y(n1625) );
  XNOR2X1 U1322 ( .A(n1432), .B(n1724), .Y(n1433) );
  NAND4XL U1323 ( .A(n1269), .B(n1565), .C(n1268), .D(n1267), .Y(n1280) );
  OAI211X1 U1324 ( .A0(n1534), .A1(n1717), .B0(n1597), .C0(n1533), .Y(n512) );
  OA21XL U1325 ( .A0(\controller/pic_cnt [1]), .A1(n1249), .B0(n1627), .Y(n578) );
  AO22X1 U1326 ( .A0(n1199), .A1(n1435), .B0(n1434), .B1(threshold_addr[10]), 
        .Y(n526) );
  OAI211XL U1327 ( .A0(n1447), .A1(n1709), .B0(n1331), .C0(n1633), .Y(
        \convolution/N109 ) );
  NOR2XL U1328 ( .A(n1835), .B(n1338), .Y(\controller/N27 ) );
  NAND2X1 U1329 ( .A(\forward/cs [1]), .B(\forward/cs [0]), .Y(n1273) );
  NOR2X4 U1330 ( .A(forward_di[5]), .B(forward_di[1]), .Y(n733) );
  NOR2X6 U1331 ( .A(forward_di[4]), .B(forward_di[2]), .Y(n732) );
  BUFX4 U1333 ( .A(n1526), .Y(n1629) );
  BUFX4 U1334 ( .A(all_rst), .Y(n1419) );
  NAND3BX2 U1335 ( .AN(n1421), .B(n1688), .C(\controller/pic_cnt [1]), .Y(n740) );
  NAND2X1 U1336 ( .A(n740), .B(n1419), .Y(n738) );
  AOI211X1 U1337 ( .A0(n1909), .A1(n1796), .B0(n1910), .C0(n738), .Y(n1211) );
  NOR2X1 U1338 ( .A(n1211), .B(n1834), .Y(n1367) );
  NAND2X1 U1339 ( .A(n1908), .B(n739), .Y(n741) );
  OAI21X1 U1340 ( .A0(n1834), .A1(n740), .B0(n1634), .Y(n1366) );
  OAI211X1 U1341 ( .A0(n742), .A1(n1368), .B0(n741), .C0(n1366), .Y(n518) );
  AND2X2 U1342 ( .A(n1875), .B(n1874), .Y(n743) );
  AND4X2 U1343 ( .A(n746), .B(n745), .C(n744), .D(n743), .Y(n747) );
  NOR2X8 U1344 ( .A(n1672), .B(\convolution/conv_cnt [0]), .Y(n1503) );
  NOR2X4 U1345 ( .A(\convolution/conv_cnt [2]), .B(n1670), .Y(n1496) );
  NAND2X4 U1346 ( .A(n1503), .B(n1496), .Y(n750) );
  NOR2X2 U1347 ( .A(n747), .B(n750), .Y(n748) );
  NOR2X2 U1348 ( .A(n748), .B(n1681), .Y(n1256) );
  NAND2X4 U1349 ( .A(n1256), .B(n1645), .Y(n1325) );
  NAND2X2 U1350 ( .A(n1325), .B(n749), .Y(\convolution/ns[1] ) );
  NAND2X4 U1351 ( .A(n750), .B(\convolution/cs [1]), .Y(n751) );
  NAND2X6 U1352 ( .A(n751), .B(n1645), .Y(n1255) );
  NAND2X4 U1353 ( .A(n1255), .B(n1633), .Y(n758) );
  NOR2X2 U1354 ( .A(n1645), .B(n1681), .Y(n1489) );
  NOR2X4 U1355 ( .A(n758), .B(n1489), .Y(n1301) );
  NOR2X4 U1356 ( .A(\convolution/conv_cnt [2]), .B(\convolution/conv_cnt [3]), 
        .Y(n1308) );
  NAND2X4 U1357 ( .A(\convolution/conv_cnt [0]), .B(\convolution/conv_cnt [1]), 
        .Y(n1514) );
  OAI21X1 U1358 ( .A0(\convolution/conv_cnt [1]), .A1(n1515), .B0(n1299), .Y(
        n752) );
  NAND2X4 U1359 ( .A(n1802), .B(n752), .Y(n1019) );
  INVX4 U1360 ( .A(n1294), .Y(n1302) );
  NAND2X1 U1361 ( .A(n1499), .B(n1302), .Y(n1307) );
  AOI21X2 U1362 ( .A0(n1802), .A1(n753), .B0(n1305), .Y(n1317) );
  OAI2BB1X4 U1363 ( .A0N(\convolution/window_y [0]), .A1N(n818), .B0(n1317), 
        .Y(n1450) );
  AO21X1 U1364 ( .A0(n818), .A1(\convolution/window_y [1]), .B0(n1450), .Y(
        n1020) );
  AOI21X1 U1365 ( .A0(n818), .A1(\convolution/window_y [2]), .B0(n1020), .Y(
        n761) );
  NAND2X1 U1366 ( .A(n756), .B(\convolution/conv_cnt [3]), .Y(n757) );
  NAND2X2 U1367 ( .A(\convolution/ns[1] ), .B(n757), .Y(n759) );
  CLKINVX1 U1368 ( .A(n758), .Y(n1218) );
  OAI211X1 U1369 ( .A0(n761), .A1(n1709), .B0(n1024), .C0(n760), .Y(n762) );
  AO21X2 U1370 ( .A0(n1461), .A1(n1330), .B0(n762), .Y(n469) );
  INVX20 U1371 ( .A(n1636), .Y(forward_addr[3]) );
  NOR2X1 U1372 ( .A(n1650), .B(n1705), .Y(n1529) );
  OAI21XL U1373 ( .A0(n1529), .A1(\forward/counter [2]), .B0(n779), .Y(n763)
         );
  NOR2X1 U1374 ( .A(\forward/cs [1]), .B(\forward/cs [0]), .Y(n1272) );
  OR3X2 U1375 ( .A(n1272), .B(\forward/cs [2]), .C(n1607), .Y(n764) );
  OAI21X4 U1376 ( .A0(n783), .A1(n765), .B0(n781), .Y(n766) );
  BUFX12 U1377 ( .A(n766), .Y(n1387) );
  NAND2X1 U1378 ( .A(forward_addr[2]), .B(forward_addr[3]), .Y(n767) );
  NOR2X1 U1379 ( .A(n803), .B(n767), .Y(n823) );
  INVX3 U1380 ( .A(n823), .Y(n795) );
  XNOR2X1 U1381 ( .A(n957), .B(n1648), .Y(n777) );
  CLKINVX1 U1382 ( .A(n1529), .Y(n1531) );
  NAND2X1 U1383 ( .A(n1692), .B(n1597), .Y(n773) );
  BUFX12 U1384 ( .A(n768), .Y(n1385) );
  NOR2X1 U1385 ( .A(n1641), .B(n1842), .Y(n796) );
  NOR2X1 U1386 ( .A(n1270), .B(forward_addr[3]), .Y(n769) );
  NAND2X1 U1387 ( .A(n796), .B(n769), .Y(n827) );
  CLKINVX1 U1388 ( .A(n827), .Y(n954) );
  XNOR2X1 U1389 ( .A(n770), .B(n624), .Y(n776) );
  NAND2X1 U1390 ( .A(n804), .B(n771), .Y(n833) );
  NOR2X1 U1392 ( .A(forward_addr[5]), .B(n1270), .Y(n948) );
  XNOR2X1 U1393 ( .A(n772), .B(n624), .Y(n775) );
  NOR3X6 U1394 ( .A(n783), .B(n779), .C(n773), .Y(n774) );
  BUFX20 U1395 ( .A(n774), .Y(n1382) );
  AOI222X4 U1396 ( .A0(n1387), .A1(n777), .B0(n1385), .B1(n776), .C0(n775), 
        .C1(n1382), .Y(n785) );
  NOR2X4 U1397 ( .A(n783), .B(n1717), .Y(n778) );
  OAI31X4 U1398 ( .A0(n783), .A1(\forward/counter [3]), .A2(n782), .B0(n781), 
        .Y(n944) );
  OAI2BB2X4 U1399 ( .B0(n785), .B1(n1390), .A0N(n594), .A1N(n784), .Y(n498) );
  XNOR2X1 U1400 ( .A(n787), .B(n786), .Y(n791) );
  XOR2X1 U1401 ( .A(n954), .B(forward_addr[5]), .Y(n790) );
  XNOR2X1 U1402 ( .A(n788), .B(forward_addr[5]), .Y(n789) );
  AOI222X4 U1403 ( .A0(n1387), .A1(n791), .B0(n1385), .B1(n790), .C0(n789), 
        .C1(n1382), .Y(n793) );
  OAI2BB2X4 U1404 ( .B0(n793), .B1(n1390), .A0N(n594), .A1N(n792), .Y(n499) );
  XOR2X1 U1405 ( .A(n795), .B(n794), .Y(n800) );
  XOR2X1 U1406 ( .A(n797), .B(n1270), .Y(n799) );
  XOR2X1 U1407 ( .A(n951), .B(n1270), .Y(n798) );
  AOI222X4 U1408 ( .A0(n1387), .A1(n800), .B0(n1385), .B1(n799), .C0(n798), 
        .C1(n1382), .Y(n802) );
  OAI2BB2X4 U1409 ( .B0(n802), .B1(n1390), .A0N(n592), .A1N(n801), .Y(n500) );
  XNOR2X1 U1410 ( .A(n843), .B(n1647), .Y(n807) );
  XNOR2X1 U1411 ( .A(forward_addr[2]), .B(forward_addr[1]), .Y(n806) );
  XNOR2X1 U1412 ( .A(n846), .B(forward_addr[2]), .Y(n805) );
  AOI222X4 U1413 ( .A0(n1387), .A1(n807), .B0(n1385), .B1(n806), .C0(n805), 
        .C1(n1382), .Y(n810) );
  BUFX16 U1414 ( .A(n1831), .Y(forward_addr[0]) );
  XNOR2X1 U1415 ( .A(forward_addr[0]), .B(forward_addr[1]), .Y(n811) );
  AOI222X4 U1416 ( .A0(n1387), .A1(n812), .B0(n1385), .B1(n728), .C0(n811), 
        .C1(n1382), .Y(n814) );
  OAI2BB2X4 U1417 ( .B0(n814), .B1(n1390), .A0N(n594), .A1N(n813), .Y(n516) );
  OAI21X1 U1418 ( .A0(n817), .A1(n1019), .B0(n1317), .Y(n1458) );
  AOI21X1 U1419 ( .A0(n818), .A1(\convolution/window_y [4]), .B0(n1458), .Y(
        n1027) );
  ADDHXL U1420 ( .A(\convolution/window_y [3]), .B(n815), .CO(n1323), .S(n1330) );
  AOI2BB2X1 U1421 ( .B0(n816), .B1(\convolution/window_y [6]), .A0N(n816), 
        .A1N(\convolution/window_y [6]), .Y(n1444) );
  NAND2X1 U1422 ( .A(n1444), .B(n1461), .Y(n821) );
  OAI2BB1X1 U1423 ( .A0N(\convolution/window_y [6]), .A1N(
        \convolution/window_y [5]), .B0(n1506), .Y(n819) );
  OAI211X1 U1424 ( .A0(n1027), .A1(n1640), .B0(n821), .C0(n820), .Y(n466) );
  INVX16 U1425 ( .A(n1635), .Y(forward_addr[10]) );
  NAND2X2 U1426 ( .A(n824), .B(n823), .Y(n856) );
  CLKINVX1 U1427 ( .A(n856), .Y(n1374) );
  NAND2X1 U1428 ( .A(n1668), .B(forward_addr[9]), .Y(n1372) );
  INVX3 U1429 ( .A(forward_addr[10]), .Y(n1377) );
  NOR2X1 U1430 ( .A(n1372), .B(n1377), .Y(n854) );
  XOR2X1 U1431 ( .A(n825), .B(n1637), .Y(n839) );
  NAND2X1 U1432 ( .A(forward_addr[7]), .B(n1668), .Y(n826) );
  NOR2X1 U1433 ( .A(n826), .B(n953), .Y(n829) );
  MXI2X2 U1434 ( .A(n829), .B(n828), .S0(n827), .Y(n859) );
  INVX1 U1435 ( .A(forward_addr[9]), .Y(n1153) );
  NOR2X1 U1436 ( .A(n1153), .B(n1377), .Y(n857) );
  NAND2X1 U1437 ( .A(n1376), .B(n857), .Y(n830) );
  XOR2X1 U1438 ( .A(n830), .B(n1637), .Y(n838) );
  OAI21X1 U1439 ( .A0(n1664), .A1(n948), .B0(n831), .Y(n832) );
  AOI21X4 U1440 ( .A0(n833), .A1(forward_addr[7]), .B0(n832), .Y(n1380) );
  NOR2X2 U1441 ( .A(forward_addr[9]), .B(n1668), .Y(n1379) );
  INVX1 U1442 ( .A(n1379), .Y(n834) );
  NAND2X1 U1443 ( .A(n1380), .B(n835), .Y(n836) );
  XNOR2X1 U1444 ( .A(n836), .B(n628), .Y(n837) );
  AOI222X4 U1445 ( .A0(n1387), .A1(n839), .B0(n1385), .B1(n838), .C0(n837), 
        .C1(n1382), .Y(n842) );
  OAI2BB2X4 U1447 ( .B0(n842), .B1(n1390), .A0N(n841), .A1N(n840), .Y(n493) );
  XOR2X1 U1448 ( .A(n844), .B(n1636), .Y(n850) );
  XNOR2X1 U1449 ( .A(n845), .B(forward_addr[3]), .Y(n849) );
  XOR2X1 U1450 ( .A(n847), .B(forward_addr[3]), .Y(n848) );
  AOI222X4 U1451 ( .A0(n1387), .A1(n850), .B0(n1385), .B1(n849), .C0(n848), 
        .C1(n1382), .Y(n853) );
  NAND2XL U1452 ( .A(n1691), .B(forward_addr[3]), .Y(n851) );
  OAI2BB2X4 U1453 ( .B0(n853), .B1(n1390), .A0N(n592), .A1N(n852), .Y(n501) );
  XNOR2X1 U1454 ( .A(n1077), .B(n1639), .Y(n865) );
  XNOR2X1 U1455 ( .A(n1079), .B(n1639), .Y(n864) );
  NAND2X1 U1456 ( .A(n1380), .B(n861), .Y(n862) );
  XNOR2X1 U1457 ( .A(n862), .B(forward_addr[12]), .Y(n863) );
  AOI222X4 U1458 ( .A0(n1387), .A1(n865), .B0(n1385), .B1(n864), .C0(n863), 
        .C1(n1382), .Y(n868) );
  OAI2BB2X4 U1460 ( .B0(n868), .B1(n1390), .A0N(n592), .A1N(n866), .Y(n492) );
  BUFX16 U1461 ( .A(n1848), .Y(backward_addr[8]) );
  BUFX16 U1462 ( .A(n1851), .Y(backward_addr[4]) );
  BUFX16 U1463 ( .A(n1853), .Y(backward_addr[2]) );
  BUFX16 U1464 ( .A(n1849), .Y(backward_addr[6]) );
  NOR3X2 U1465 ( .A(n1200), .B(backward_di[6]), .C(n889), .Y(n869) );
  OR2X1 U1466 ( .A(\backward/counter [1]), .B(\backward/counter [0]), .Y(n887)
         );
  NAND2X1 U1467 ( .A(\backward/counter [0]), .B(\backward/counter [1]), .Y(
        n1545) );
  AOI211X1 U1468 ( .A0(n887), .A1(n1545), .B0(\backward/counter [2]), .C0(n890), .Y(n870) );
  OAI22X4 U1469 ( .A0(n871), .A1(n877), .B0(n1669), .B1(n870), .Y(n872) );
  NOR2X2 U1470 ( .A(n978), .B(n1723), .Y(n1044) );
  NAND2X1 U1471 ( .A(n1854), .B(\C1/DATA3_0 ), .Y(n995) );
  NOR2X2 U1472 ( .A(n878), .B(n995), .Y(n977) );
  AOI21X4 U1473 ( .A0(n1044), .A1(n977), .B0(backward_addr[7]), .Y(n1089) );
  NOR2X1 U1474 ( .A(n1089), .B(n1657), .Y(n879) );
  XNOR2X1 U1475 ( .A(n879), .B(n729), .Y(n884) );
  NAND2X1 U1476 ( .A(n1853), .B(n1854), .Y(n987) );
  NOR2X2 U1477 ( .A(n880), .B(n987), .Y(n980) );
  NAND2X2 U1478 ( .A(backward_addr[6]), .B(backward_addr[5]), .Y(n1090) );
  INVX1 U1479 ( .A(n1090), .Y(n882) );
  XOR2X1 U1480 ( .A(n1070), .B(backward_addr[9]), .Y(n883) );
  AOI222X2 U1481 ( .A0(n1122), .A1(n885), .B0(n1119), .B1(n884), .C0(n1118), 
        .C1(n883), .Y(n894) );
  BUFX16 U1482 ( .A(n1846), .Y(backward_addr[10]) );
  BUFX16 U1483 ( .A(n1845), .Y(backward_addr[11]) );
  BUFX20 U1484 ( .A(n1844), .Y(backward_addr[12]) );
  NOR2X1 U1485 ( .A(n1848), .B(backward_addr[9]), .Y(n1065) );
  NAND2X1 U1486 ( .A(n1065), .B(n726), .Y(n1053) );
  NOR2X1 U1487 ( .A(n1068), .B(n896), .Y(n966) );
  XNOR2X1 U1489 ( .A(n898), .B(n1720), .Y(n903) );
  NOR2X2 U1490 ( .A(n1847), .B(n1846), .Y(n1058) );
  NAND2X1 U1491 ( .A(n1070), .B(n900), .Y(n901) );
  XNOR2X1 U1492 ( .A(n901), .B(backward_addr[12]), .Y(n902) );
  NOR2X2 U1493 ( .A(n601), .B(n906), .Y(n909) );
  NOR3X4 U1494 ( .A(n910), .B(n909), .C(n908), .Y(n926) );
  NAND2X2 U1495 ( .A(n916), .B(n914), .Y(n918) );
  INVX2 U1496 ( .A(n915), .Y(n1398) );
  AOI22X4 U1497 ( .A0(n918), .A1(n1398), .B0(n917), .B1(n1144), .Y(n919) );
  AOI2BB2X2 U1498 ( .B0(n1400), .B1(\backward/min [3]), .A0N(backward_di[4]), 
        .A1N(n599), .Y(n922) );
  XOR2X4 U1499 ( .A(n931), .B(backward_di[4]), .Y(n1136) );
  NAND3X2 U1500 ( .A(n1136), .B(n932), .C(n599), .Y(n933) );
  NAND2X1 U1501 ( .A(backward_di[5]), .B(n1402), .Y(n936) );
  NAND2XL U1502 ( .A(b_RAM_sel[1]), .B(n1794), .Y(n943) );
  OAI21XL U1503 ( .A0(n939), .A1(b_RAM_sel[1]), .B0(n1370), .Y(n940) );
  OAI21X1 U1504 ( .A0(n1834), .A1(n941), .B0(n1662), .Y(n1369) );
  AOI22X1 U1505 ( .A0(n1382), .A1(n1732), .B0(n1385), .B1(forward_addr[0]), 
        .Y(n947) );
  INVX6 U1506 ( .A(n944), .Y(n1389) );
  AOI21X2 U1507 ( .A0(n1389), .A1(forward_addr[0]), .B0(n1607), .Y(n946) );
  NAND3X1 U1508 ( .A(n1387), .B(n1732), .C(n959), .Y(n945) );
  OAI211X1 U1509 ( .A0(n1390), .A1(n947), .B0(n946), .C0(n945), .Y(n503) );
  XNOR2X1 U1510 ( .A(n952), .B(n1664), .Y(n956) );
  NAND2X1 U1511 ( .A(n954), .B(n953), .Y(n1126) );
  XNOR2X1 U1512 ( .A(n1126), .B(n1664), .Y(n955) );
  XOR2X1 U1513 ( .A(n958), .B(n1664), .Y(n960) );
  XOR2X1 U1514 ( .A(n965), .B(n1843), .Y(n973) );
  NOR2X1 U1516 ( .A(n1089), .B(n967), .Y(n968) );
  XNOR2X1 U1517 ( .A(n968), .B(n1722), .Y(n972) );
  NOR2X2 U1518 ( .A(n1845), .B(backward_addr[12]), .Y(n1028) );
  XNOR2X1 U1519 ( .A(n970), .B(n1843), .Y(n971) );
  AOI222X2 U1520 ( .A0(n1122), .A1(n973), .B0(n972), .B1(n1119), .C0(n1118), 
        .C1(n971), .Y(n975) );
  AOI21X2 U1521 ( .A0(n606), .A1(n1843), .B0(n1669), .Y(n974) );
  CLKINVX1 U1522 ( .A(n976), .Y(n1097) );
  NAND2X1 U1523 ( .A(n1097), .B(n1030), .Y(n1042) );
  XNOR2X1 U1524 ( .A(n1042), .B(backward_addr[6]), .Y(n984) );
  CLKINVX1 U1525 ( .A(n977), .Y(n1099) );
  NOR2X1 U1526 ( .A(n1099), .B(n978), .Y(n979) );
  XNOR2X1 U1527 ( .A(n979), .B(n1723), .Y(n983) );
  CLKINVX1 U1528 ( .A(n980), .Y(n1101) );
  NOR2X1 U1529 ( .A(n1101), .B(n1661), .Y(n981) );
  XNOR2X1 U1530 ( .A(n981), .B(n1723), .Y(n982) );
  AOI222X1 U1531 ( .A0(n1122), .A1(n984), .B0(n983), .B1(n1119), .C0(n1118), 
        .C1(n982), .Y(n986) );
  OAI21X2 U1532 ( .A0(n986), .A1(n606), .B0(n1914), .Y(n568) );
  XOR2X1 U1533 ( .A(n1097), .B(backward_addr[4]), .Y(n991) );
  XOR2X1 U1534 ( .A(n1099), .B(n1725), .Y(n990) );
  XOR2X1 U1535 ( .A(n988), .B(n1725), .Y(n989) );
  AOI222X1 U1536 ( .A0(n1122), .A1(n991), .B0(n990), .B1(n1119), .C0(n1118), 
        .C1(n989), .Y(n993) );
  OAI21X2 U1537 ( .A0(n993), .A1(n607), .B0(n992), .Y(n570) );
  XNOR2X1 U1538 ( .A(n1107), .B(backward_addr[2]), .Y(n998) );
  XNOR2X1 U1539 ( .A(n1109), .B(n1663), .Y(n997) );
  XNOR2X1 U1540 ( .A(n1663), .B(n1854), .Y(n996) );
  AOI222X1 U1541 ( .A0(n1122), .A1(n998), .B0(n997), .B1(n1119), .C0(n1118), 
        .C1(n996), .Y(n1000) );
  OAI21X2 U1542 ( .A0(n1000), .A1(n606), .B0(n999), .Y(n572) );
  AOI222X1 U1543 ( .A0(n1122), .A1(n1731), .B0(n1731), .B1(n1119), .C0(n1118), 
        .C1(\C1/DATA3_0 ), .Y(n1002) );
  OAI21X2 U1544 ( .A0(n1002), .A1(n607), .B0(n1001), .Y(n573) );
  NAND2X4 U1545 ( .A(forward_valid), .B(backward_valid), .Y(n1016) );
  OA21X4 U1546 ( .A0(forward_valid), .A1(backward_valid), .B0(n1016), .Y(n1006) );
  AOI2BB2X2 U1547 ( .B0(n1682), .B1(n1006), .A0N(n1682), .A1N(n1006), .Y(n1007) );
  AO22X4 U1548 ( .A0(n1011), .A1(n1010), .B0(n1009), .B1(n1008), .Y(n1012) );
  AOI21X1 U1549 ( .A0(n1013), .A1(threshold_valid), .B0(n1012), .Y(n1014) );
  OAI2BB1X2 U1550 ( .A0N(n1016), .A1N(n1015), .B0(n1014), .Y(n1410) );
  INVX3 U1551 ( .A(n1410), .Y(n1835) );
  NOR2X1 U1552 ( .A(n1643), .B(n1410), .Y(n1249) );
  NAND3X2 U1553 ( .A(\controller/pic_cnt [1]), .B(\controller/pic_cnt [0]), 
        .C(n1835), .Y(n1627) );
  NOR2X1 U1554 ( .A(n1019), .B(\convolution/window_y [0]), .Y(n1318) );
  AOI2BB2X1 U1555 ( .B0(n1485), .B1(n1873), .A0N(n1452), .A1N(
        \convolution/window_y [2]), .Y(n1022) );
  ADDHX2 U1556 ( .A(\convolution/window_y [5]), .B(n1023), .CO(n816), .S(n1328) );
  NAND4X1 U1557 ( .A(n1030), .B(n1029), .C(n1058), .D(n1028), .Y(n1034) );
  NOR2X1 U1558 ( .A(\C1/DATA3_0 ), .B(n1843), .Y(n1032) );
  NOR2X2 U1560 ( .A(n1034), .B(n1033), .Y(n1036) );
  INVX1 U1561 ( .A(n1036), .Y(n1315) );
  AOI21X1 U1562 ( .A0(n1037), .A1(\backward/cs [0]), .B0(n1696), .Y(n1038) );
  AOI21X1 U1563 ( .A0(n1039), .A1(n1038), .B0(\backward/cs [2]), .Y(n1040) );
  AND2X8 U1564 ( .A(n1041), .B(n1040), .Y(n1832) );
  NOR2X1 U1565 ( .A(n1042), .B(backward_addr[6]), .Y(n1043) );
  XOR2X1 U1566 ( .A(n1043), .B(backward_addr[7]), .Y(n1050) );
  NOR2X1 U1567 ( .A(n1045), .B(n1099), .Y(n1046) );
  XNOR2X1 U1568 ( .A(n1046), .B(backward_addr[7]), .Y(n1049) );
  NOR2X1 U1569 ( .A(n1101), .B(n1090), .Y(n1047) );
  XNOR2X1 U1570 ( .A(n1047), .B(backward_addr[7]), .Y(n1048) );
  NAND2X2 U1571 ( .A(n607), .B(backward_addr[7]), .Y(n1051) );
  OAI21X2 U1572 ( .A0(n1052), .A1(n606), .B0(n1051), .Y(n567) );
  NOR2X1 U1573 ( .A(n591), .B(n1053), .Y(n1054) );
  XNOR2X1 U1576 ( .A(n1057), .B(n1659), .Y(n1061) );
  XNOR2X1 U1577 ( .A(n1059), .B(backward_addr[11]), .Y(n1060) );
  AOI222X1 U1578 ( .A0(n1122), .A1(n1062), .B0(n1061), .B1(n1119), .C0(n1118), 
        .C1(n1060), .Y(n1064) );
  AOI21X2 U1579 ( .A0(n607), .A1(backward_addr[11]), .B0(n1669), .Y(n1063) );
  OAI21X2 U1580 ( .A0(n1064), .A1(n606), .B0(n1063), .Y(n563) );
  XOR2X1 U1581 ( .A(n1067), .B(backward_addr[10]), .Y(n1074) );
  NOR2X1 U1582 ( .A(n1089), .B(n1068), .Y(n1069) );
  XNOR2X1 U1583 ( .A(n1069), .B(n726), .Y(n1073) );
  XNOR2X1 U1584 ( .A(n1071), .B(backward_addr[10]), .Y(n1072) );
  AOI222X1 U1585 ( .A0(n1122), .A1(n1074), .B0(n1073), .B1(n1119), .C0(n1118), 
        .C1(n1072), .Y(n1076) );
  AOI21X2 U1586 ( .A0(n607), .A1(backward_addr[10]), .B0(n1669), .Y(n1075) );
  OAI21X2 U1587 ( .A0(n1076), .A1(n607), .B0(n1075), .Y(n564) );
  XOR2X1 U1588 ( .A(n1078), .B(n1666), .Y(n1086) );
  XOR2X1 U1589 ( .A(n1080), .B(n1666), .Y(n1085) );
  XNOR2X1 U1590 ( .A(n1083), .B(n1837), .Y(n1084) );
  AOI222X2 U1591 ( .A0(n1387), .A1(n1086), .B0(n1385), .B1(n1085), .C0(n1084), 
        .C1(n1382), .Y(n1088) );
  NAND2XL U1592 ( .A(n1597), .B(n1837), .Y(n1087) );
  OAI22X2 U1593 ( .A0(n1088), .A1(n1390), .B0(n1159), .B1(n1087), .Y(n491) );
  XNOR2X1 U1594 ( .A(n591), .B(backward_addr[8]), .Y(n1094) );
  XOR2X1 U1595 ( .A(n1089), .B(n1657), .Y(n1093) );
  OAI21X1 U1596 ( .A0(n1101), .A1(n1090), .B0(n1649), .Y(n1091) );
  XNOR2X1 U1597 ( .A(backward_addr[8]), .B(n1091), .Y(n1092) );
  AOI222X1 U1598 ( .A0(n1122), .A1(n1094), .B0(n1093), .B1(n1119), .C0(n1118), 
        .C1(n1092), .Y(n1096) );
  OAI21X2 U1599 ( .A0(n1096), .A1(n607), .B0(n1095), .Y(n566) );
  XNOR2X1 U1600 ( .A(n1098), .B(backward_addr[5]), .Y(n1104) );
  NOR2X1 U1601 ( .A(n1099), .B(n1725), .Y(n1100) );
  XNOR2X1 U1602 ( .A(n1100), .B(n1661), .Y(n1103) );
  XOR2X1 U1603 ( .A(n1101), .B(n1661), .Y(n1102) );
  AOI222X1 U1604 ( .A0(n1122), .A1(n1104), .B0(n1103), .B1(n1119), .C0(n1118), 
        .C1(n1102), .Y(n1106) );
  AOI21X2 U1605 ( .A0(n606), .A1(backward_addr[5]), .B0(n1669), .Y(n1105) );
  OAI21X2 U1606 ( .A0(n1106), .A1(n606), .B0(n1105), .Y(n569) );
  XOR2X1 U1607 ( .A(n1108), .B(backward_addr[3]), .Y(n1114) );
  XOR2X1 U1608 ( .A(n1110), .B(n1660), .Y(n1113) );
  XNOR2X1 U1609 ( .A(n1111), .B(n1660), .Y(n1112) );
  AOI222X1 U1610 ( .A0(n1122), .A1(n1114), .B0(n1113), .B1(n1119), .C0(n1118), 
        .C1(n1112), .Y(n1116) );
  AOI21X2 U1611 ( .A0(n607), .A1(backward_addr[3]), .B0(n1669), .Y(n1115) );
  OAI21X2 U1612 ( .A0(n1116), .A1(n607), .B0(n1115), .Y(n571) );
  XNOR2X1 U1613 ( .A(n1854), .B(backward_addr[0]), .Y(n1121) );
  AOI222X1 U1614 ( .A0(n1122), .A1(n1121), .B0(n1120), .B1(n1119), .C0(n1118), 
        .C1(n1665), .Y(n1125) );
  AOI21X2 U1615 ( .A0(n606), .A1(n1854), .B0(n1669), .Y(n1123) );
  OAI21X2 U1616 ( .A0(n1125), .A1(n607), .B0(n1123), .Y(n574) );
  XNOR2X1 U1617 ( .A(n1374), .B(n1679), .Y(n1130) );
  XOR2X1 U1618 ( .A(n1380), .B(n1668), .Y(n1129) );
  NAND2X1 U1619 ( .A(n1126), .B(forward_addr[7]), .Y(n1127) );
  XOR2X1 U1620 ( .A(n1127), .B(n1679), .Y(n1128) );
  AOI222X2 U1621 ( .A0(n1387), .A1(n1130), .B0(n1382), .B1(n1129), .C0(n1385), 
        .C1(n1128), .Y(n1132) );
  NAND2X1 U1622 ( .A(n1539), .B(\backward/counter [0]), .Y(n1133) );
  NAND3X1 U1623 ( .A(n611), .B(backward_do[1]), .C(n1677), .Y(n1135) );
  NAND3X4 U1624 ( .A(n722), .B(n598), .C(n597), .Y(n1138) );
  OAI211X1 U1625 ( .A0(n1148), .A1(n696), .B0(n1138), .C0(n1137), .Y(n556) );
  XNOR2X1 U1626 ( .A(n1140), .B(n1139), .Y(n1141) );
  OAI211X1 U1627 ( .A0(n1148), .A1(n1144), .B0(n1143), .C0(n1142), .Y(n558) );
  XOR2X1 U1628 ( .A(n1200), .B(n915), .Y(n1145) );
  OAI211X1 U1629 ( .A0(n1148), .A1(n1398), .B0(n1147), .C0(n1146), .Y(n560) );
  AOI21X1 U1630 ( .A0(n1630), .A1(n1545), .B0(n1539), .Y(n1151) );
  OAI21XL U1631 ( .A0(n1545), .A1(\backward/counter [3]), .B0(
        \backward/counter [2]), .Y(n1149) );
  OAI211X1 U1632 ( .A0(\backward/counter [2]), .A1(\backward/counter [3]), 
        .B0(n1544), .C0(n1149), .Y(n1150) );
  OAI211X1 U1633 ( .A0(n1151), .A1(n1716), .B0(n1150), .C0(n1677), .Y(n549) );
  NAND2X1 U1634 ( .A(n1374), .B(n1668), .Y(n1152) );
  XOR2X1 U1635 ( .A(n1152), .B(n1153), .Y(n1157) );
  XNOR2X1 U1636 ( .A(n1376), .B(n1153), .Y(n1156) );
  NAND2X1 U1637 ( .A(n1380), .B(n1679), .Y(n1154) );
  XNOR2X1 U1638 ( .A(n1154), .B(forward_addr[9]), .Y(n1155) );
  NAND3X1 U1639 ( .A(n611), .B(backward_do[6]), .C(n1677), .Y(n1161) );
  NAND3X1 U1640 ( .A(n611), .B(backward_do[5]), .C(n1677), .Y(n1162) );
  NAND3X1 U1641 ( .A(n611), .B(backward_do[0]), .C(n1677), .Y(n1163) );
  NAND3X1 U1642 ( .A(n611), .B(backward_do[2]), .C(n1677), .Y(n1164) );
  NAND3X1 U1643 ( .A(n611), .B(backward_do[3]), .C(n1677), .Y(n1165) );
  NAND3X1 U1644 ( .A(n611), .B(backward_do[4]), .C(n1677), .Y(n1167) );
  NAND3X1 U1645 ( .A(n611), .B(backward_do[7]), .C(n1677), .Y(n1168) );
  NAND3X1 U1646 ( .A(n1274), .B(n1842), .C(n624), .Y(n1170) );
  NAND3X2 U1647 ( .A(n1270), .B(n1641), .C(n1841), .Y(n1175) );
  NAND3X1 U1648 ( .A(n1839), .B(n1642), .C(n1668), .Y(n1178) );
  NOR4X1 U1649 ( .A(n1170), .B(n1175), .C(n1169), .D(n1178), .Y(n1171) );
  NOR2BX1 U1650 ( .AN(n1171), .B(forward_addr[7]), .Y(n1172) );
  NAND2BX1 U1651 ( .AN(forward_addr[0]), .B(n1172), .Y(n1173) );
  NOR3X4 U1652 ( .A(forward_di[7]), .B(forward_di[2]), .C(n1173), .Y(n1174) );
  NOR2X4 U1653 ( .A(forward_di[5]), .B(forward_di[6]), .Y(n1269) );
  NAND4X4 U1654 ( .A(n1565), .B(n1174), .C(n1268), .D(n1269), .Y(n1184) );
  INVX1 U1655 ( .A(n1175), .Y(n1176) );
  NAND4X1 U1656 ( .A(n1176), .B(n1838), .C(n624), .D(\forward/cs [1]), .Y(
        n1179) );
  NOR4X1 U1657 ( .A(n1179), .B(n1178), .C(n1177), .D(n1271), .Y(n1180) );
  NOR3BX1 U1658 ( .AN(n1180), .B(forward_addr[0]), .C(forward_addr[7]), .Y(
        n1182) );
  NOR2X1 U1659 ( .A(n1273), .B(\forward/cs [2]), .Y(n1557) );
  INVX16 U1660 ( .A(n1676), .Y(threshold_addr[5]) );
  NOR2X1 U1661 ( .A(n1196), .B(n1706), .Y(n1424) );
  NAND2X1 U1662 ( .A(n1424), .B(n1857), .Y(n1192) );
  XOR2X1 U1663 ( .A(n1193), .B(n1689), .Y(n1194) );
  INVX12 U1664 ( .A(n1706), .Y(threshold_addr[10]) );
  XOR2X1 U1665 ( .A(n1198), .B(n1706), .Y(n1199) );
  MXI2X2 U1666 ( .A(n1203), .B(n1402), .S0(n1200), .Y(n1201) );
  NAND2X1 U1667 ( .A(n1205), .B(n610), .Y(n1206) );
  OAI31X1 U1668 ( .A0(n1607), .A1(n610), .A2(n1690), .B0(n1206), .Y(n489) );
  AOI2BB1X1 U1669 ( .A0N(n626), .A1N(n1800), .B0(n1903), .Y(n1210) );
  OAI21XL U1670 ( .A0(n1210), .A1(n1209), .B0(forward_valid), .Y(n482) );
  OAI211XL U1671 ( .A0(n1419), .A1(n1789), .B0(n1366), .C0(n1212), .Y(n519) );
  NOR2X1 U1672 ( .A(n1406), .B(n1214), .Y(n1392) );
  NAND2X1 U1673 ( .A(n1392), .B(n1862), .Y(n1215) );
  XOR2X1 U1674 ( .A(n1215), .B(n1730), .Y(n1216) );
  NAND2X1 U1675 ( .A(n1216), .B(n1435), .Y(n1217) );
  OAI211XL U1676 ( .A0(n1435), .A1(n1730), .B0(n1217), .C0(n1638), .Y(n529) );
  AO22X1 U1677 ( .A0(n1219), .A1(\convolution/conv_out1 [1]), .B0(n1218), .B1(
        n1900), .Y(n460) );
  AO22X1 U1678 ( .A0(n1219), .A1(\convolution/conv_out1 [5]), .B0(n1218), .B1(
        n1896), .Y(n456) );
  AO22X1 U1679 ( .A0(n1219), .A1(\convolution/conv_out1 [4]), .B0(n1218), .B1(
        n1897), .Y(n457) );
  AO22X1 U1681 ( .A0(n1219), .A1(\convolution/conv_out1 [3]), .B0(n1218), .B1(
        n1898), .Y(n458) );
  AO22X1 U1682 ( .A0(n1219), .A1(\convolution/conv_out1 [2]), .B0(n1218), .B1(
        n1899), .Y(n459) );
  OAI211XL U1683 ( .A0(n1902), .A1(n1784), .B0(n1419), .C0(n1800), .Y(n1220)
         );
  OAI211XL U1684 ( .A0(n1419), .A1(n1800), .B0(forward_valid), .C0(n1220), .Y(
        n481) );
  NAND2XL U1685 ( .A(n1222), .B(n1638), .Y(n535) );
  NOR2X1 U1686 ( .A(\threshold/cs [1]), .B(n1658), .Y(n1443) );
  OAI22XL U1687 ( .A0(\controller/pic_cnt [1]), .A1(n1421), .B0(
        \controller/pic_cnt [3]), .B1(\controller/pic_cnt [2]), .Y(n1223) );
  OAI21XL U1688 ( .A0(threshold_di[0]), .A1(n1223), .B0(threshold_di[1]), .Y(
        n1224) );
  OAI211XL U1689 ( .A0(n1443), .A1(n1786), .B0(n1638), .C0(n1227), .Y(n521) );
  CLKBUFX3 U1690 ( .A(n1834), .Y(n1830) );
  CLKBUFX3 U1691 ( .A(n1834), .Y(n1827) );
  CLKBUFX3 U1692 ( .A(n1834), .Y(n1829) );
  CLKBUFX3 U1693 ( .A(n1834), .Y(n1828) );
  INVX12 U1694 ( .A(n1769), .Y(convolution_addr[1]) );
  INVX12 U1695 ( .A(n1759), .Y(convolution_addr[0]) );
  INVX12 U1696 ( .A(n1757), .Y(convolution_addr[5]) );
  INVX12 U1697 ( .A(n1767), .Y(convolution_addr[2]) );
  INVX12 U1698 ( .A(n1765), .Y(convolution_addr[3]) );
  INVX12 U1699 ( .A(n1755), .Y(convolution_addr[8]) );
  INVX12 U1700 ( .A(n1751), .Y(convolution_addr[6]) );
  INVX12 U1701 ( .A(n1763), .Y(convolution_addr[7]) );
  INVX12 U1702 ( .A(n1753), .Y(convolution_addr[11]) );
  INVX12 U1703 ( .A(n1761), .Y(convolution_addr[4]) );
  BUFX12 U1704 ( .A(\C1/DATA3_0 ), .Y(backward_addr[0]) );
  INVX12 U1705 ( .A(n1648), .Y(forward_addr[6]) );
  INVX12 U1706 ( .A(n1738), .Y(f_RAM_sel[2]) );
  INVX12 U1707 ( .A(n1796), .Y(t_RAM_sel[2]) );
  INVX12 U1708 ( .A(n1798), .Y(c_RAM_sel[1]) );
  INVX12 U1709 ( .A(n1746), .Y(c_RAM_sel[2]) );
  INVX12 U1710 ( .A(n1678), .Y(forward_addr[4]) );
  INVX12 U1711 ( .A(n1727), .Y(threshold_addr[3]) );
  INVX12 U1712 ( .A(n1748), .Y(threshold_addr[1]) );
  INVX12 U1713 ( .A(n1724), .Y(threshold_addr[2]) );
  INVX12 U1714 ( .A(n1786), .Y(threshold_do) );
  INVX12 U1715 ( .A(n1775), .Y(t_RAM_sel[1]) );
  INVX12 U1716 ( .A(n1719), .Y(threshold_addr[0]) );
  INVX12 U1717 ( .A(n1722), .Y(backward_addr[13]) );
  BUFX12 U1718 ( .A(n1837), .Y(forward_addr[13]) );
  OAI31XL U1719 ( .A0(n1229), .A1(\backward/cs [1]), .A2(n1662), .B0(n1677), 
        .Y(n575) );
  INVX12 U1720 ( .A(n1741), .Y(threshold_addr[4]) );
  INVX12 U1721 ( .A(n1794), .Y(b_RAM_sel[2]) );
  INVX12 U1722 ( .A(n1784), .Y(f_RAM_sel[1]) );
  INVX12 U1723 ( .A(n1730), .Y(threshold_addr[7]) );
  OAI22XL U1724 ( .A0(\controller/pic_cnt [0]), .A1(n1628), .B0(
        \controller/pic_cnt [3]), .B1(n1411), .Y(\controller/N151 ) );
  BUFX12 U1725 ( .A(n1860), .Y(threshold_addr[8]) );
  OAI31XL U1726 ( .A0(n1734), .A1(n1651), .A2(n1230), .B0(n1597), .Y(n517) );
  INVX12 U1727 ( .A(n1800), .Y(f_RAM_sel[0]) );
  XNOR2X1 U1728 ( .A(n1231), .B(n1676), .Y(n1232) );
  AO22X1 U1729 ( .A0(n1232), .A1(n1435), .B0(n1434), .B1(threshold_addr[5]), 
        .Y(n531) );
  INVX12 U1730 ( .A(n1735), .Y(threshold_addr[6]) );
  INVX12 U1731 ( .A(n1789), .Y(t_RAM_sel[0]) );
  INVX12 U1732 ( .A(n1791), .Y(b_RAM_sel[0]) );
  INVX12 U1733 ( .A(n1781), .Y(c_RAM_sel[0]) );
  INVX12 U1734 ( .A(n727), .Y(threshold_addr[9]) );
  NAND2X4 U1735 ( .A(n1302), .B(n1502), .Y(n1493) );
  NAND2X2 U1736 ( .A(\convolution/op1 ), .B(n1493), .Y(n1240) );
  NOR2X4 U1737 ( .A(\convolution/conv_out1 [0]), .B(n1240), .Y(n1245) );
  NOR2X1 U1738 ( .A(n1286), .B(\convolution/conv_cnt [1]), .Y(n1241) );
  NOR2X1 U1739 ( .A(n1241), .B(n1670), .Y(n1242) );
  AOI21X1 U1740 ( .A0(n1499), .A1(n1308), .B0(n1242), .Y(n1243) );
  NAND2X2 U1741 ( .A(n1802), .B(n1243), .Y(n1521) );
  NAND2X4 U1742 ( .A(n1245), .B(n1687), .Y(n1247) );
  OA21XL U1743 ( .A0(n1245), .A1(n1687), .B0(n1247), .Y(n1246) );
  NOR2X1 U1745 ( .A(n1251), .B(n1250), .Y(n1254) );
  NOR2X1 U1746 ( .A(n1674), .B(n1252), .Y(n1253) );
  INVX1 U1747 ( .A(n1256), .Y(n1257) );
  NAND2X2 U1748 ( .A(n1257), .B(n1305), .Y(n1296) );
  NOR2X4 U1749 ( .A(n1324), .B(n1296), .Y(n1357) );
  CLKINVX1 U1750 ( .A(\convolution/ns[1] ), .Y(n1262) );
  NAND2X1 U1751 ( .A(n1262), .B(n1633), .Y(n1285) );
  OAI21XL U1752 ( .A0(n1503), .A1(n1502), .B0(n1802), .Y(n1263) );
  NAND4XL U1754 ( .A(n1275), .B(n1274), .C(n1273), .D(n1651), .Y(n1276) );
  OR4X2 U1755 ( .A(forward_addr[7]), .B(n1278), .C(n1277), .D(n1276), .Y(n1279) );
  ADDHXL U1756 ( .A(\convolution/window_x [4]), .B(n1281), .CO(n1355), .S(
        n1479) );
  MXI2X1 U1757 ( .A(n1802), .B(n1283), .S0(\convolution/conv_cnt [0]), .Y(
        n1284) );
  OAI21X1 U1758 ( .A0(n1303), .A1(n1309), .B0(n1285), .Y(n1293) );
  MXI2X1 U1759 ( .A(n1287), .B(n1293), .S0(n1286), .Y(n1288) );
  OAI2BB2XL U1760 ( .B0(n1644), .B1(\convolution/conv_out1 [3]), .A0N(n1644), 
        .A1N(\convolution/conv_out1 [3]), .Y(n1291) );
  NOR2X4 U1761 ( .A(\convolution/conv_out1 [3]), .B(n1350), .Y(n1349) );
  NOR2X4 U1762 ( .A(n1360), .B(n1349), .Y(n1361) );
  NOR2X1 U1763 ( .A(n1294), .B(n1514), .Y(n1495) );
  OAI21XL U1764 ( .A0(n1496), .A1(n1495), .B0(n1802), .Y(n1295) );
  OAI211X1 U1765 ( .A0(n1297), .A1(n1670), .B0(n1296), .C0(n1295), .Y(n462) );
  NAND3X1 U1766 ( .A(n1493), .B(n1299), .C(n1298), .Y(n1300) );
  OAI21XL U1767 ( .A0(n1499), .A1(n1303), .B0(n1308), .Y(n1304) );
  AOI21X2 U1768 ( .A0(n1498), .A1(n1304), .B0(n1309), .Y(n1306) );
  NOR2X4 U1769 ( .A(n1306), .B(n1305), .Y(n1343) );
  AOI2BB2X1 U1770 ( .B0(n1880), .B1(n1485), .A0N(n1464), .A1N(
        \convolution/window_x [2]), .Y(n1313) );
  CLKINVX1 U1771 ( .A(n1307), .Y(n1510) );
  NOR2X2 U1772 ( .A(n1310), .B(n1309), .Y(n1480) );
  MXI2X1 U1773 ( .A(n1314), .B(\backward/cs [1]), .S0(n1675), .Y(n1316) );
  AOI2BB2X1 U1774 ( .B0(n1485), .B1(n1875), .A0N(n1317), .A1N(n1667), .Y(n1320) );
  NOR2X4 U1775 ( .A(n1357), .B(n1322), .Y(n1447) );
  ADDHX2 U1776 ( .A(\convolution/window_y [4]), .B(n1323), .CO(n1023), .S(
        n1460) );
  AND2X2 U1777 ( .A(n1325), .B(n1324), .Y(n1446) );
  OAI21XL U1778 ( .A0(n1607), .A1(n1669), .B0(n1333), .Y(n1336) );
  OAI21XL U1779 ( .A0(threshold_done), .A1(convolution_done), .B0(n1332), .Y(
        n1337) );
  XOR2X1 U1780 ( .A(n1333), .B(n1332), .Y(n1334) );
  AOI2BB1X1 U1781 ( .A0N(n1336), .A1N(n1337), .B0(n1334), .Y(n1335) );
  XNOR2X1 U1782 ( .A(n1337), .B(n1336), .Y(n1338) );
  AOI2BB2X1 U1783 ( .B0(n1882), .B1(n1485), .A0N(n1343), .A1N(n1726), .Y(n1341) );
  OAI21X1 U1784 ( .A0(n612), .A1(n1483), .B0(n1343), .Y(n1474) );
  AOI21X1 U1785 ( .A0(n1344), .A1(\convolution/window_x [4]), .B0(n1474), .Y(
        n1488) );
  NOR2X1 U1786 ( .A(n1482), .B(n1483), .Y(n1470) );
  NAND2X1 U1787 ( .A(n1470), .B(n1718), .Y(n1476) );
  AOI2BB2X1 U1788 ( .B0(n1877), .B1(n1485), .A0N(n1476), .A1N(
        \convolution/window_x [5]), .Y(n1347) );
  AOI21X1 U1789 ( .A0(n1350), .A1(\convolution/conv_out1 [3]), .B0(n1349), .Y(
        n1353) );
  NOR2X1 U1790 ( .A(n1521), .B(n1351), .Y(n1352) );
  OAI22XL U1791 ( .A0(\convolution/conv_out1 [5]), .A1(
        \convolution/conv_out1 [4]), .B0(n1703), .B1(n1644), .Y(n1364) );
  OAI21X1 U1792 ( .A0(n1360), .A1(n1644), .B0(\convolution/conv_out1 [3]), .Y(
        n1518) );
  OAI21X4 U1793 ( .A0(\convolution/conv_out1 [4]), .A1(n1361), .B0(n1518), .Y(
        n1519) );
  NOR2X1 U1794 ( .A(n1519), .B(n1364), .Y(n1362) );
  OAI221XL U1795 ( .A0(n1909), .A1(n1368), .B0(n1775), .B1(n1367), .C0(n1366), 
        .Y(n520) );
  OAI221XL U1796 ( .A0(b_RAM_sel[1]), .A1(n1371), .B0(n1777), .B1(n1370), .C0(
        n1369), .Y(n540) );
  NAND2X1 U1797 ( .A(n1374), .B(n1373), .Y(n1375) );
  XOR2X1 U1798 ( .A(n1375), .B(n1377), .Y(n1386) );
  XOR2X1 U1800 ( .A(n1378), .B(n1377), .Y(n1384) );
  XNOR2X1 U1801 ( .A(n1381), .B(forward_addr[10]), .Y(n1383) );
  XNOR2X1 U1802 ( .A(n1392), .B(n1735), .Y(n1393) );
  OAI211X1 U1804 ( .A0(n722), .A1(n1397), .B0(n1396), .C0(n1395), .Y(n553) );
  XOR2X1 U1805 ( .A(n1401), .B(n1400), .Y(n1404) );
  AO22X1 U1806 ( .A0(n1407), .A1(n1435), .B0(n1434), .B1(n1864), .Y(n532) );
  XOR2X1 U1807 ( .A(n1408), .B(n727), .Y(n1409) );
  AO22X1 U1808 ( .A0(n1409), .A1(n1435), .B0(n1434), .B1(n1859), .Y(n527) );
  NAND3BX1 U1809 ( .AN(n1411), .B(\controller/pic_cnt [0]), .C(n1673), .Y(
        n1610) );
  NOR3X1 U1810 ( .A(n1413), .B(change_sel), .C(n1834), .Y(n1620) );
  NOR2X1 U1811 ( .A(n1912), .B(n1781), .Y(n1616) );
  NOR2X1 U1812 ( .A(n1616), .B(n1625), .Y(n1615) );
  NAND2X1 U1813 ( .A(n1419), .B(n1625), .Y(n1415) );
  AOI2BB2X2 U1814 ( .B0(n1911), .B1(n1415), .A0N(convolution_valid), .A1N(
        n1414), .Y(n1623) );
  OAI31XL U1815 ( .A0(n1419), .A1(change_sel), .A2(n1418), .B0(n1417), .Y(
        \controller/N134 ) );
  AO22X1 U1816 ( .A0(n1836), .A1(n1421), .B0(\controller/N148 ), .B1(n1643), 
        .Y(\controller/N146 ) );
  OAI31XL U1817 ( .A0(n1658), .A1(n1634), .A2(n1712), .B0(n1638), .Y(n537) );
  XNOR2X1 U1818 ( .A(n1422), .B(n1686), .Y(n1423) );
  AO22X1 U1819 ( .A0(n1423), .A1(n1435), .B0(n1434), .B1(n1856), .Y(n524) );
  XOR2X1 U1820 ( .A(n1425), .B(n1685), .Y(n1426) );
  AO22X1 U1821 ( .A0(n1426), .A1(n1435), .B0(n1434), .B1(threshold_addr[11]), 
        .Y(n525) );
  XNOR2X1 U1822 ( .A(n1427), .B(n1721), .Y(n1428) );
  AO22X1 U1823 ( .A0(n1428), .A1(n1435), .B0(n1434), .B1(threshold_addr[8]), 
        .Y(n528) );
  AO22X1 U1824 ( .A0(n1431), .A1(n1435), .B0(n1434), .B1(n1865), .Y(n533) );
  AO22X1 U1825 ( .A0(n1433), .A1(n1435), .B0(n1434), .B1(n1866), .Y(n534) );
  AO22X1 U1826 ( .A0(n1436), .A1(n1435), .B0(n1434), .B1(n1867), .Y(n536) );
  NAND4XL U1827 ( .A(n1864), .B(n1863), .C(n1865), .D(n1867), .Y(n1440) );
  OAI211XL U1828 ( .A0(n1447), .A1(n1640), .B0(n1445), .C0(n1633), .Y(
        \convolution/N112 ) );
  OAI21XL U1829 ( .A0(n1483), .A1(n1711), .B0(n1468), .Y(n1471) );
  AOI211X1 U1830 ( .A0(n1471), .A1(\convolution/window_x [3]), .B0(n1470), 
        .C0(n1469), .Y(n1472) );
  OAI2BB1X1 U1831 ( .A0N(n1480), .A1N(n1473), .B0(n1472), .Y(n476) );
  AOI2BB2X1 U1832 ( .B0(n1876), .B1(n1485), .A0N(n1484), .A1N(n1483), .Y(n1486) );
  NAND2X1 U1833 ( .A(n1490), .B(\convolution/window_y [0]), .Y(n1491) );
  NOR2X2 U1834 ( .A(n1516), .B(n1500), .Y(n1501) );
  AOI211X2 U1835 ( .A0(n1503), .A1(n1512), .B0(n1502), .C0(n1501), .Y(n1504)
         );
  NOR2X1 U1836 ( .A(n1504), .B(n1515), .Y(n1505) );
  OAI2BB2X1 U1837 ( .B0(n1508), .B1(n1507), .A0N(n1506), .A1N(n1505), .Y(n1509) );
  AOI211X2 U1838 ( .A0(n1512), .A1(n1511), .B0(n1510), .C0(n1509), .Y(n1513)
         );
  OAI31XL U1839 ( .A0(n1516), .A1(n1515), .A2(n1514), .B0(n1513), .Y(n1517) );
  NOR2X2 U1840 ( .A(n1527), .B(n1526), .Y(n1536) );
  AOI31X4 U1841 ( .A0(n1629), .A1(\forward/ns [0]), .A2(n1531), .B0(n1536), 
        .Y(n1534) );
  CLKAND2X3 U1842 ( .A(\forward/ns [0]), .B(n1629), .Y(n1535) );
  NAND3X1 U1843 ( .A(n1535), .B(\forward/counter [0]), .C(n1531), .Y(n1528) );
  NAND3X1 U1844 ( .A(n1535), .B(n1529), .C(n1692), .Y(n1530) );
  OAI21XL U1845 ( .A0(n1531), .A1(\forward/counter [3]), .B0(
        \forward/counter [2]), .Y(n1532) );
  OAI211X1 U1846 ( .A0(\forward/counter [2]), .A1(\forward/counter [3]), .B0(
        n1535), .C0(n1532), .Y(n1533) );
  INVX1 U1847 ( .A(n1535), .Y(n1538) );
  NAND3X1 U1848 ( .A(n1544), .B(n1543), .C(n1652), .Y(n1549) );
  NAND4X1 U1849 ( .A(n1832), .B(\backward/counter [2]), .C(n1630), .D(n1545), 
        .Y(n1548) );
  NAND2X2 U1850 ( .A(n1550), .B(\forward/min [7]), .Y(n1555) );
  NAND3X4 U1851 ( .A(n1555), .B(n1554), .C(n1553), .Y(n1580) );
  AOI21X1 U1852 ( .A0(forward_di[7]), .A1(n1559), .B0(n1558), .Y(n1560) );
  NOR2BX1 U1853 ( .AN(\forward/min [2]), .B(forward_di[2]), .Y(n1568) );
  AOI2BB2X4 U1854 ( .B0(forward_di[0]), .B1(forward_di[1]), .A0N(n1565), .A1N(
        \forward/min [1]), .Y(n1567) );
  AOI22X2 U1855 ( .A0(n1585), .A1(n1653), .B0(n1701), .B1(forward_di[4]), .Y(
        n1566) );
  OA21X4 U1856 ( .A0(n1568), .A1(n1567), .B0(n1566), .Y(n1570) );
  AOI22X1 U1857 ( .A0(forward_di[5]), .A1(n1654), .B0(forward_di[2]), .B1(
        n1708), .Y(n1569) );
  OAI2BB2X4 U1858 ( .B0(n1571), .B1(forward_di[5]), .A0N(n1570), .A1N(n1569), 
        .Y(n1582) );
  AO22X2 U1859 ( .A0(n1587), .A1(\forward/min [3]), .B0(n1585), .B1(n1586), 
        .Y(n508) );
  AO22X2 U1860 ( .A0(n1587), .A1(\forward/min [0]), .B0(forward_di[0]), .B1(
        n1586), .Y(n511) );
  ADDHXL U1861 ( .A(\forward/min [1]), .B(\forward/min [0]), .CO(n1590), .S(
        n1589) );
  ADDHXL U1862 ( .A(\forward/min [3]), .B(n1593), .CO(n1596), .S(n1595) );
  ADDHXL U1863 ( .A(\forward/min [4]), .B(n1596), .CO(n1600), .S(n1599) );
  NAND2X1 U1864 ( .A(n610), .B(n1601), .Y(n1602) );
  ADDHX1 U1865 ( .A(\forward/min [6]), .B(n1603), .CO(n1204), .S(n1604) );
  NAND2X1 U1866 ( .A(n610), .B(n1604), .Y(n1605) );
  NOR2X1 U1867 ( .A(n1608), .B(n1734), .Y(\forward/N88 ) );
  NAND2XL U1868 ( .A(n1912), .B(n1781), .Y(n1614) );
  OAI21XL U1869 ( .A0(n1613), .A1(n1834), .B0(n1612), .Y(n1618) );
  AOI21X1 U1871 ( .A0(n1688), .A1(n1627), .B0(n1626), .Y(n577) );
  OAI21XL U1872 ( .A0(n1628), .A1(n1643), .B0(n1699), .Y(n522) );
  DFFSX2 \backward/b_addr_reg[0]  ( .D(n573), .CK(clk), .SN(n1830), .Q(
        \C1/DATA3_0 ), .QN(n1731) );
  DFFSX2 \backward/b_addr_reg[8]  ( .D(n566), .CK(clk), .SN(n1834), .Q(n1848), 
        .QN(n1657) );
  NAND4X1 U1559 ( .A(n1665), .B(n1032), .C(n1031), .D(backward_addr[7]), .Y(
        n1033) );
  NOR2X4 U1332 ( .A(forward_di[6]), .B(forward_di[3]), .Y(n731) );
  NAND2X6 U1298 ( .A(backward_di[0]), .B(backward_di[1]), .Y(n1140) );
  NOR2X1 U788 ( .A(\forward/cs [2]), .B(n1704), .Y(n735) );
  NOR2X4 U1138 ( .A(forward_di[0]), .B(forward_di[1]), .Y(n1565) );
  BUFX4 U728 ( .A(backward_di[1]), .Y(n915) );
  NAND2X2 U1021 ( .A(n1673), .B(n1643), .Y(n1421) );
  NOR2X1 U1035 ( .A(\C1/DATA3_0 ), .B(n1854), .Y(n994) );
  OAI21X2 U957 ( .A0(\backward/min [2]), .A1(n600), .B0(n916), .Y(n917) );
  NAND2X1 U717 ( .A(n1270), .B(forward_addr[5]), .Y(n822) );
  BUFX8 U960 ( .A(n931), .Y(n601) );
  CLKAND2X3 U696 ( .A(n1325), .B(n1833), .Y(n1359) );
  ADDHXL U1753 ( .A(\convolution/window_x [3]), .B(n1265), .CO(n1281), .S(
        n1473) );
  INVX6 U674 ( .A(n608), .Y(n609) );
  BUFX12 U954 ( .A(n1124), .Y(n606) );
  INVX16 U773 ( .A(n1419), .Y(n1834) );
  INVXL U666 ( .A(n1068), .Y(n1055) );
  INVXL U727 ( .A(n966), .Y(n897) );
  NAND2XL U735 ( .A(\convolution/window_x [0]), .B(\convolution/window_x [5]), 
        .Y(n1251) );
  NAND2XL U765 ( .A(n1055), .B(backward_addr[10]), .Y(n1056) );
  INVX4 U776 ( .A(n720), .Y(n928) );
  INVXL U785 ( .A(n1556), .Y(n1553) );
  NAND2XL U786 ( .A(n966), .B(backward_addr[12]), .Y(n967) );
  BUFX2 U825 ( .A(n1346), .Y(n612) );
  NAND4X1 U828 ( .A(n817), .B(n1640), .C(n1655), .D(n1700), .Y(n1506) );
  INVX2 U830 ( .A(n833), .Y(n951) );
  INVXL U878 ( .A(n803), .Y(n843) );
  NAND2XL U880 ( .A(n1376), .B(forward_addr[9]), .Y(n1378) );
  AOI211XL U892 ( .A0(n1610), .A1(n1913), .B0(n1912), .C0(n1413), .Y(n1412) );
  NAND2X2 U919 ( .A(n1577), .B(n1576), .Y(n1578) );
  NOR2XL U983 ( .A(n1406), .B(n1741), .Y(n1231) );
  NAND2XL U1104 ( .A(n1427), .B(n1197), .Y(n1198) );
  NAND2XL U1152 ( .A(n1546), .B(n686), .Y(n1547) );
  INVX1 U1199 ( .A(n1159), .Y(n841) );
  OAI211XL U1279 ( .A0(n1359), .A1(n1728), .B0(n1266), .C0(n1633), .Y(
        \convolution/N102 ) );
  AO22XL U1391 ( .A0(n1219), .A1(\convolution/conv_out1 [0]), .B0(n1218), .B1(
        n1901), .Y(n461) );
  AO22XL U1446 ( .A0(n1393), .A1(n1435), .B0(n1434), .B1(threshold_addr[6]), 
        .Y(n530) );
  AOI21X1 U1459 ( .A0(n605), .A1(backward_addr[6]), .B0(n1669), .Y(n1914) );
  INVX2 U1488 ( .A(n1159), .Y(n592) );
endmodule

