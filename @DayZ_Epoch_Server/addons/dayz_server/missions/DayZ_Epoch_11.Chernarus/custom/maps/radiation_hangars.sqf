private ["_aObjs","_bldObj"];
_bldObj	=	objNull;
_aObjs	=	[
					["Land_fort_rampart", [6282.541, 14071.055, -3.0517578e-005], 252.60764, false],
					["Land_fort_rampart", [6290.2856, 14049.596, 3.0517578e-005], -108.61166, false],
					["Land_fort_rampart", [6241.5444, 14050.8, 0.00021362305], -96.432755, false],
					["Land_fort_rampart", [6242.3389, 14041.521, 0.00015258789], -93.18354, false],
					["Land_fort_rampart", [6240.6313, 14060.452, 0.00045776367], -94.825546, false],
					["Land_fort_rampart", [6245.0981, 14067.031, 0.00073242188], -19.239246, false],
					["Land_fort_rampart", [6242.856, 14032.098, 0.00051879883], -93.175484, false],
					["Land_fort_rampart", [6243.666, 14022.436, 0.0010681152], -94.629715, false],
					["Land_fort_rampart", [6244.6631, 14012.666, 0.0007019043], -96.546974, false],
					["Land_fort_rampart", [6246.7261, 14003.064, 0.00061035156], -104.75402, false],
					["Land_fort_rampart", [6257.2637, 13988.561, 9.1552734e-005], -150.21017, false],
					["Land_fort_rampart", [6275.3999, 13981.831, 0.00039672852], -167.63464, false],
					["Land_fort_rampart", [6284.9561, 13979.85, 0.00024414063], -169.79065, false],
					["Land_fort_rampart", [6294.4688, 13978.626, 0.00015258789], -177.42464, false],
					["Land_fort_rampart", [6303.7856, 13978.115, 9.1552734e-005], 179.89751, false],
					["Land_fort_rampart", [6313.6064, 13978.091, 3.0517578e-005], 177.58591, false],
					["Land_fort_rampart", [6341.9023, 13979.568, 0.00021362305], 174.17245, false],
					["Land_fort_rampart", [6351.8267, 13980.39, 0.00024414063], 175.76987, false],
					["Land_fort_rampart", [6361.8975, 13980.907, 0.00030517578], 177.81908, false],
					["Land_fort_rampart", [6371.7393, 13981.057, 0.00033569336], 179.38583, false],
					["Land_fort_rampart", [6381.269, 13981.041, 6.1035156e-005], 179.68779, false],
					["MAP_sign_danger", [6323.4844, 13952.684, 9.1552734e-005], -4.8368058, false],
					["Land_Hlidac_budka", [6356.7314, 13961.271, -6.1035156e-005], 179.80315, false],
					["Misc_TyreHeap", [6373.0127, 13991.085], -34.209198, false],
					["RampConcrete", [6330.5181, 13957.044, 0.23083924], 180.67737, false],
					["RampConcrete", [6325.7178, 13956.824, 0.27028894], 180.70821, false],
					["RampConcrete", [6326.2524, 13966.897, 0.35250953], 0.20002872, false],
					["RampConcrete", [6331.0259, 13966.846, 0.26599011], 0.55803841, false],
					["Land_Mil_hangar_EP1", [6392.1089, 14146.784, -0.024282748], 57.07164, false],
					["Land_Mil_hangar_EP1", [6353.3101, 14175.646, 0.077624716], 19.35136, false],
					["Land_Mil_hangar_EP1", [6304.0537, 14173.65, 0.080202453], -22.894066, false],
					["Land_Mil_hangar_EP1", [6270.1851, 14136.28, -0.035797857], -72.47435, false],
					["Land_Barrack2", [6254.2134, 14028.325], -96.614059, false],
					["Land_Barrack2", [6255.2188, 14018.931], -96.128922, false],
					["76n6ClamShell", [6261.9795, 13998.392, 0.00012207031], 143.85741, false],
					["Land_Barrack2", [6253.8037, 14038.69, -0.16537738], -96.784477, false],
					["TK_WarfareBHeavyFactory_EP1", [6295.1118, 13992.88, 0.00018310547], 187.5918, false],
					["T72Wreck", [6311.4121, 13997.023], 143.7912, false],
					["HMMWVWreck", [6264.8501, 14026.276, 0.00024414063], 206.55489, false],
					["Land_Barrack2", [6375.562, 14029.349, -0.00012207031], 89.888817, false],
					["Land_Barrack2", [6375.6504, 14020.486], -268.82077, false],
					["TK_GUE_WarfareBUAVterminal_EP1", [6263.2212, 14065.76, 0.00015258789], 82.381958, false],
					["UralWreck", [6344.9595, 13970.455, -0.00015258789], -223.38852, false],
					["HMMWVWreck", [6282.6763, 14039.772, -6.1035156e-005], -71.522461, false],
					["HMMWVWreck", [6368.4858, 14036.233], 52.244015, false],
					["Fort_Barracks_USMC", [6382.8267, 14041.564, 3.0517578e-005], -1.6045101, false],
					["Land_Fort_Watchtower", [6285.6182, 14049.223, 0.014597715], 160.17345, false],
					["Land_fort_artillery_nest", [6293.981, 14065.258, -3.0517578e-005], 72.378738, false],
					["ForestLargeCamoNet_DZ", [6381.0161, 13999.202], 97.750443, false],
					["Land_Fort_Watchtower", [6343.811, 13984.167, -9.1552734e-005], 265.62906, false],
					["Land_Fort_Watchtower", [6312.5034, 13982.788, 9.1552734e-005], -89.380577, false],
					["datsun02Wreck", [6336.6196, 13960.73, -9.1552734e-005], 52.780952, false],
					["HMMWVWreck", [6320.3696, 13960.965, 3.0517578e-005], -50.565468, false],
					["Land_fort_rampart", [6385.6382, 13980.875, 0.00030517578], 182.35045, false],
					["Land_fort_rampart", [6390.7949, 13985.394, 6.1035156e-005], 89.585388, false],
					["Land_fort_rampart", [6391.0474, 14004.475, 6.1035156e-005], 89.869774, false],
					["Land_fort_rampart", [6390.9575, 13994.674], 90.483772, false],
					["Land_fort_rampart", [6266.3647, 13984.275, -9.1552734e-005], 198.52023, false],
					["MAP_PowGen_Big", [6257.3711, 14008.299, -6.1035156e-005], -53.578068, false],
					["MAP_Barbedwire", [6338.3877, 13974.69, 3.0517578e-005], -91.699158, false],
					["MAP_Barbedwire", [6338.4819, 13966.716], 88.288628, false],
					["MAP_Barbedwire", [6318.0107, 13973.406], 89.692314, false],
					["MAP_Barbedwire", [6318.2217, 13967.44, -3.0517578e-005], -90.439575, false],
					["Land_fort_rampart", [6336.9644, 13983.562], -93.199921, false],
					["Land_fort_rampart", [6318.2021, 13982.584], 91.302826, false],
					["Land_fort_rampart", [6391.2173, 14013.95, -3.0517578e-005], 90.868523, false],
					["Land_fort_rampart", [6391.3311, 14023.109, 3.0517578e-005], 91.523521, false],
					["Land_fort_rampart", [6391.4961, 14032.979], 89.463455, false],
					["Land_fort_rampart", [6391.5488, 14042.898, 3.0517578e-005], 90.683937, false],
					["Land_fort_rampart", [6391.3916, 14052.753], 88.624039, false],
					["Land_fort_rampart", [6391.144, 14062.657, 0.00012207031], 86.675964, false],
					["Land_fort_rampart", [6390.6333, 14072.637, 0.00018310547], 85.153671, false],
					["Land_fort_rampart", [6250.6353, 13994.555, 0.00012207031], 234.61975, false],
					["US_WarfareBVehicleServicePoint_Base_EP1", [6300.9814, 14140.742, 3.0517578e-005], 222.05942, false],
					["Land_Fire_barrel_burning", [6373.9878, 13994.173, 0.00015258789], 106.70929, false],
					["Land_Fire_barrel_burning", [6374.3276, 14037.749, 0.00012207031], 1234567890, false],
					["Land_transport_crates_EP1", [6371.5879, 14004.519, -3.0517578e-005], -59.117447, false],
					["Land_transport_crates_EP1", [6270.0786, 13997.961, -3.0517578e-005], 107.68438, false],
					["Land_transport_crates_EP1", [6272.5513, 13997.851, 6.1035156e-005], 14.579999, false],
					["Land_transport_crates_EP1", [6378.1201, 14060.463, 0.00036621094], -35.635647, false],
					["Land_transport_crates_EP1", [6288.7905, 14041.488, 9.1552734e-005], 135.50919, false],
					["Fort_Barracks_USMC", [6250.1113, 14057.476, 0.18616661], -183.58623, false],
					["Fort_Barracks_USMC", [6381.5337, 14071.695, 9.1552734e-005], -364.5416, false],
					["ForestLargeCamoNet_DZ", [6290.1724, 14062.536, 3.0517578e-005], 84.908318, false],
					["MAP_Mil_House_dam", [6381.0908, 13960.747, 3.0517578e-005], -88.58902, false],
					["MAP_Barbedwire", [6384.4214, 13939.093, -3.0517578e-005], -0.34549525, false],
					["MAP_Barbedwire", [6378.2192, 13938.989], -0.09410315, false],
					["MAP_Barbedwire", [6371.8804, 13939.209, 6.1035156e-005], 1234567890, false],
					["MAP_Barbedwire", [6365.416, 13939.191, 3.0517578e-005], -0.10621244, false],
					["MAP_Barbedwire", [6361.2607, 13947.986, -6.1035156e-005], -90.539223, false],
					["MAP_Barbedwire", [6361.125, 13941.509, 0.00018310547], 89.240883, false],
					["MAP_Barbedwire", [6361.1592, 13954.264, 6.1035156e-005], 91.027313, false],
					["MAP_Barbedwire", [6388.9351, 13944.524], 93.236526, false],
					["Misc_Cargo1Bo_military", [6380.502, 14002.523, 3.0517578e-005], 90.704117, false],
					["Misc_Cargo1B_military", [6368.7285, 13974.009, 6.1035156e-005], 0.88068467, false],
					["Misc_Cargo1Bo_military", [6360.2212, 13974.234, 3.0517578e-005], 1234567890, false],
					["Misc_Cargo1Bo_military", [6364.5356, 13974.204, -6.1035156e-005], 1234567890, false],
					["HMMWVWreck", [6367.7021, 13996.846, 3.0517578e-005], 62.962173, false],
					["HMMWVWreck", [6366.6406, 13944.226, 3.0517578e-005], 56.526131, false],
					["Land_obstacle_run_duck", [6384.2148, 14060.919, -6.1035156e-005], 275.27185, false],
					["MAP_A_TVTower_Base", [6445.6416, 14006.307, 0.10754643], 96.911522, false],
					["MAP_telek1", [6329.8003, 14172.096, 3.0517578e-005], 87.9767, false],
					["MAP_Vysilac_FM", [6381.0229, 13985.805, 0.00024414063], -89.072815, false],
					["MAP_Ind_TankSmall2", [6352.8369, 13976.523], -1.2139388, false],
					["MAP_misc_amplion_conc", [6336.687, 13989.766, 6.1035156e-005], 1234567890, false],
					["MAP_misc_amplion_conc", [6318.356, 13989.194, 0.0002746582], 1234567890, false],
					["Mi8Wreck", [6345.4448, 14062.745, -0.10287557], 118.70635, false],
					["Land_Mil_hangar_EP1", [6268.9619, 14089.203, 0.0051386985], 254.10904, false],
					["Land_Mil_hangar_EP1", [6407.8755, 14105.046, -0.0081130359], 86.830338, false],
					["Land_fort_rampart", [6390.1084, 14082.509, 0.00024414063], 86.060143, false],
					["Bunker_PMC", [6338.4272, 13850.8, -6.1035156e-005], 1234567890, false]
				];
{
	_bldObj = createVehicle [(_x select 0), (_x select 1), [], 0, "CAN_COLLIDE"];
	if ((_x select 2) != 1234567890) then
		{_bldObj setDir (_x select 2);};
	if (_x select 3) then
		{_bldObj setVehicleInit "this allowDammage false; this enableSimulation false;";};
	_bldObj setPos (_x select 1);
} forEach _aObjs;