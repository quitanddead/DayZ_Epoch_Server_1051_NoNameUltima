USE_CANBUILD	=	true;	//	Если Вы не хотите указывать свои позиции, зоны будут установлены автоматически, в местах, где нельзя строить.
USE_TraderCity	=	true;	//	Если Вы не хотите указывать свои позиции (для Epoch 1.0.5).
USE_POSITIONS	=	false;	//	Если Вы указываете свои позиции, и радиус зон.
USE_AI_REMOVER	=	true;	//	Удалять ботов с миссий в радиусе 100м т игрока.
USE_AntiSteal	=	true;	//	Использовать блокировку открытия рюкзака, если другой игрок в пределах 3м.
USE_SIGNS		=	false;	//	Запретить строить на территории зоны.
LOG_EnterLeave	=	true;	//	Записывать в RPT кто входил и выходил из сейф зон. (Работает, только, если у Вас установлена админка от infiSTAR, или сборка Ultima)
/* Вы можете одновременно испольовать и USE_CANBUILD, и в тоже время указать свои позиции, для безопасных зон */
_infiSZ	=
[
    [[16835.688,5268.064],100,true]
];
if (isServer) exitWith
	{
		if (USE_SIGNS) then
			{
				{
					_center	=	_x select 0;
					_radius	=	_x select 1;
					_lSign	=	_x select 2;
					if (_lSign) then
						{
							for '_i' from 0 to 360 step (270 / _radius)*2 do
								{
									_location	=	[(_center select 0) + ((cos _i) * _radius), (_center select 1) + ((sin _i) * _radius),0];
									_dir		=	((_center select 0) - (_location select 0)) atan2 ((_center select 1) - (_location select 1));
									_object		=	createVehicle ['SignM_FARP_Winchester_EP1', _location, [], 0, 'CAN_COLLIDE'];
									_object setDir _dir;
								};
						};
				} forEach _infiSZ;
			};
	};
waitUntil { !isNil 'dayz_animalCheck' };
if (isNil 'inSafezone') then
	{inSafezone = false;};
[_infiSZ] spawn
	{
		_infiSZ = _this select 0;
		_startSafeZone =
			{
				if (isNil 'outNow') then
					{
						hint localize "Ultima_Enter_Safe_Zone";
						taskHint [localize "Ultima_Enter_Safe_Zone", [0,1,0,1], 'taskDone'];
						inNow = nil;
						outNow = true;
						if (LOG_EnterLeave) then
							{
								_obj = vehicle player;
								_pos = getPosATL _obj;
								PVDZE_send = [player,'SafeZoneState',[1]];
								publicVariableServer 'PVDZE_send';
							};
					};
				private ["_pUID"];
				_pUID	=	getPlayerUID player;
				if (!(_pUID in Ultima_Low_Admins) && !(_pUID in Ultima_Admins)) then
					{player setVariable["DZE_display_name",true,true];};
				
				player_fired2 = compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\player_fired.sqf';
				player_fired = {_this call player_fired2;deleteVehicle (nearestObject [_this select 0,_this select 4]);};
				player_zombieCheck = {};
				fnc_usec_damageHandler = {};
				fnc_usec_unconscious = {};
				object_monitorGear = {};
				player removeAllEventHandlers 'handleDamage';
				player addEventHandler ['handleDamage', {false}];
				player allowDamage false;
				_x = vehicle player;
				if ((_x isKindOf 'LandVehicle') || (_x isKindOf 'Air') || (_x isKindOf 'Ship')) then
					{
						_szs = _x getVariable ['inSafeZone',0];
						if (_szs == 0) then
							{
								_x removeAllEventHandlers 'Fired';
								_x addEventHandler ['Fired', {_this call player_fired;}];
								_x setVariable ['inSafeZone', 1, true];
								_x removeAllEventHandlers 'HandleDamage';
								_x addEventHandler ['HandleDamage', {false}];
								_x allowDamage false;
							};
					};
				_cwep = currentWeapon player;
				if (_cwep in ['MAAWS']) then
					{
						_swep = '';
							{
								if ((getNumber (configFile >> 'CfgWeapons' >> _x >> 'Type')) == 2) exitWith
									{_swep = _x;};
							} forEach (weapons player);
						if (_swep == '') then
							{
								player playActionNow 'PutDown';
								_iPos		=	getPosATL player;
								_radius		=	1;
								_removed	=	([player,_cwep,1] call BIS_fnc_invRemove);
								if (_removed == 1) then
									{
										_item	=	createVehicle ['WeaponHolder', _iPos, [], _radius, 'CAN_COLLIDE'];
										_item addWeaponCargoGlobal [_cwep,1];
									};
							}
						else
							{player selectweapon _swep;};
					};
			};
		_endSafeZone =
			{
				if (isNil 'inNow') then
					{
						if (str fnc_usec_damageHandler == '{}') then
							{
								hint localize "Ultima_Leave_Safe_Zone";
								taskHint [localize "Ultima_Leave_Safe_Zone", [1,0,0.1,1], 'taskFailed'];
							};
						inNow	=	true;
						outNow	=	nil;
						if (LOG_EnterLeave) then
							{
								_obj	=	vehicle player;
								_pos	=	getPosATL _obj;
								PVDZE_send = [player,'SafeZoneState',[0]];
								publicVariableServer 'PVDZE_send';
							};
					};
				private ["_pUID"];
				_pUID	=	getPlayerUID player;
				if (!(_pUID in Ultima_Low_Admins) && !(_pUID in Ultima_Admins)) then
					{player setVariable["DZE_display_name",false,true];};
				player_fired			=	compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\player_fired.sqf';
				player_zombieCheck		=	compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\player_zombieCheck.sqf';
				fnc_usec_unconscious	=	compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\fn_unconscious.sqf';
				object_monitorGear		=	compile preprocessFileLineNumbers '\z\addons\dayz_code\compile\object_monitorGear.sqf';
				_x = vehicle player;
				if ((_x isKindOf 'LandVehicle') || (_x isKindOf 'Air') || (_x isKindOf 'Ship')) then
					{
						_szs = _x getVariable ['inSafeZone',0];
						if (_szs == 1) then
							{
								_x setVariable ['inSafeZone', 0, true];
								_x removeAllEventHandlers 'HandleDamage';
								_x addeventhandler ['HandleDamage',{ _this call vehicle_handleDamage } ];
								_x allowDamage true;
							};
					};
				_gmdadm	=	false;
				if !(isNil 'gmdadmin') then
					{
						if (gmdadmin == 1) exitWith
							{_gmdadm	=	true;};
					};
				if !(_gmdadm) then
					{
						player allowDamage true;
						fnc_usec_damageHandler	=	compile preprocessFileLineNumbers 'fixes\compile\fn_damageHandler.sqf';
						player removeAllEventHandlers 'HandleDamage';
						player addeventhandler ['HandleDamage',{_this call fnc_usec_damageHandler;} ];
					};
			};
		while {1 == 1} do
			{
				_state = false;
				_obj = vehicle player;
				if (isNil 'inSafeZone') then
					{inSafeZone = false;}
				else
					{
						if (typename inSafeZone != 'BOOL') then
							{ inSafeZone = false; };
					};
				if (isNil 'canbuild') then
					{canbuild = true;}
				else
					{
						if (typename canbuild != 'BOOL') then
							{canbuild = true;};
					};
				if (isNil 'USE_POSITIONS') then
					{USE_POSITIONS = false;}
				else
					{
						if (typename USE_POSITIONS != 'BOOL') then
							{USE_POSITIONS = false;};
					};
				if (isNil 'USE_CANBUILD') then
					{USE_CANBUILD = true;}
				else
					{
						if (typename USE_CANBUILD != 'BOOL') then
							{USE_CANBUILD = true;};
					};
				if (isNil 'USE_TraderCity') then
					{USE_TraderCity = true;} else
						{
							if (typename USE_TraderCity != 'BOOL') then
								{USE_TraderCity = true;};
						};
				if (USE_POSITIONS) then
					{
						{
							_z = _x select 0;
							_r = _x select 1;
							if (_obj distance _z < _r) exitWith {_state = true;};
						} forEach _infiSZ;
					};
				if (USE_CANBUILD) then
					{
						if (!canbuild) then
							{_state = true;};
					};
				if (USE_TraderCity) then
					{
						if (isInTraderCity) then
							{_state = true;};
					};
				if (_state) then
					{
						inSafeZone = true;
						call _startSafeZone;
						{
							if (!isNull _x) then
								{
									if !(isPlayer _x) then
										{_x setPos [0,0,0];};
								};
						} forEach (_obj nearEntities ['zZombie_Base',15]);
						if (isNil 'USE_AI_REMOVER') then { USE_AI_REMOVER = false; } else
							{
								if (typename USE_AI_REMOVER != 'BOOL') then
									{ USE_AI_REMOVER = false; };
							};
						if (USE_AI_REMOVER) then
							{
								{
									if ((!isNull group _x) && (getPlayerUID _x == '')) then
										{_x setPos [0,0,0];};
								} forEach (player nearEntities ['Man',100]);
							};
					}
				else
					{inSafeZone = false;};
				uiSleep 2;
				if (!inSafeZone) then
					{call _endSafeZone;};
			};
	};
if (USE_AntiSteal) then
	{
		[] spawn
			{
				while {1 == 1} do
					{
						if (inSafezone) then
							{
								_cnt = {isPlayer _x && _x != player} count (player nearEntities [['CAManBase'], 3]);
								if ((_cnt > 0) && (!isNull (findDisplay 106))) then
									{
										(findDisplay 106) closedisplay 0;
										closeDialog 0;
										cutText [localize "Ultima_Open_Inventory_Near_Players",'PLAIN'];
										hint localize "Ultima_Open_Inventory_Near_Players";
									};
							}
						else
							{uiSleep 2;};
						uiSleep 0.1;
					};
			};
	};