--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.8) ~  Much Love, Ferib 

]]--

local v0 = tonumber;
local v1 = string.byte;
local v2 = string.char;
local v3 = string.sub;
local v4 = string.gsub;
local v5 = string.rep;
local v6 = table.concat;
local v7 = table.insert;
local v8 = math.ldexp;
local v9 = getfenv or function()
	return _ENV;
end;
local v10 = setmetatable;
local v11 = pcall;
local v12 = select;
local v13 = unpack or table.unpack;
local v14 = tonumber;
local function v15(v16, v17, ...)
	local v18 = 1;
	local v19;
	v16 = v4(v3(v16, 5), "..", function(v30)
		if (v1(v30, 2) == 81) then
			local v89 = 0;
			while true do
				if (v89 == 0) then
					v19 = v0(v3(v30, 1, 1));
					return "";
				end
			end
		else
			local v90 = 0;
			local v91;
			while true do
				if (v90 == 0) then
					v91 = v2(v0(v30, 16));
					if v19 then
						local v122 = v5(v91, v19);
						v19 = nil;
						return v122;
					else
						return v91;
					end
					break;
				end
			end
		end
	end);
	local function v20(v31, v32, v33)
		if v33 then
			local v92 = 0 - (1637 - (1523 + 114));
			local v93;
			while true do
				if (v92 == (0 - 0)) then
					v93 = (v31 / (2 ^ (v32 - ((1 + 0) - 0)))) % ((4 - 2) ^ (((v33 - (620 - (555 + (91 - 27)))) - (v32 - (932 - (857 + 74)))) + 1));
					return v93 - (v93 % (569 - (367 + (1266 - (68 + 997)))));
				end
			end
		else
			local v94 = (929 - (214 + 713)) ^ (v32 - ((878 - (282 + 595)) + 0));
			return (((v31 % (v94 + v94)) >= v94) and 1) or ((1270 - (226 + 1044)) + 0);
		end
	end
	local function v21()
		local v34 = 0 - 0;
		local v35;
		while true do
			if ((118 - (32 + 85)) == v34) then
				return v35;
			end
			if (v34 == 0) then
				v35 = v1(v16, v18, v18);
				v18 = v18 + 1 + 0;
				v34 = (958 - (892 + 65)) + 0;
			end
		end
	end
	local function v22()
		local v36, v37 = v1(v16, v18, v18 + (4 - 2));
		v18 = v18 + 2;
		return (v37 * (472 - 216)) + v36;
	end
	local function v23()
		local v38, v39, v40, v41 = v1(v16, v18, v18 + (183 - (67 + (449 - 336))));
		v18 = v18 + (7 - 3);
		return (v41 * 16777216) + (v40 * ((161853 - (802 + 150)) - 95365)) + (v39 * (606 - ((234 - 147) + 263))) + v38;
	end
	local function v24()
		local v42 = v23();
		local v43 = v23();
		local v44 = (1 + 0) - 0;
		local v45 = (v20(v43, 1 + 0, 1017 - (915 + 82)) * ((5 - (4 - 1)) ^ (19 + 13))) + v42;
		local v46 = v20(v43, 21, 40 - 9);
		local v47 = ((v20(v43, 32) == ((1626 - (145 + 293)) - (1069 + 118))) and -(2 - 1)) or (1 - 0);
		if (v46 == ((430 - (44 + 386)) + 0)) then
			if (v45 == (0 - (1486 - (998 + 488)))) then
				return v47 * (0 + 0);
			else
				v46 = 792 - (368 + 423);
				v44 = 0;
			end
		elseif (v46 == (651 + 1396)) then
			return ((v45 == (0 - 0)) and (v47 * ((19 - (10 + 8)) / (0 - 0)))) or (v47 * NaN);
		end
		return v8(v47, v46 - (1465 - (416 + 26))) * (v44 + (v45 / (2 ^ (165 - (93 + 20)))));
	end
	local function v25(v48)
		local v49;
		if not v48 then
			local v95 = (2818 - 2046) - (201 + 571);
			while true do
				if (v95 == (1138 - (116 + 1022))) then
					v48 = v23();
					if (v48 == 0) then
						return "";
					end
					break;
				end
			end
		end
		v49 = v3(v16, v18, (v18 + v48) - (4 - 3));
		v18 = v18 + v48;
		local v50 = {};
		for v66 = 1 + 0, #v49 do
			v50[v66] = v2(v1(v3(v49, v66, v66)));
		end
		return v6(v50);
	end
	local v26 = v23;
	local function v27(...)
		return {...}, v12("#", ...);
	end
	local function v28()
		local v51 = (function()
			return function(v96, v97, v98, v99, v100, v101, v102, v103, v104)
				local v105 = (function()
					return 698 - (208 + 490);
				end)();
				local v96 = (function()
					return;
				end)();
				local v97 = (function()
					return;
				end)();
				while true do
					if (v105 == (1 + 0)) then
						local v117 = (function()
							return 0;
						end)();
						while true do
							if (v117 ~= (0 + 0)) then
							else
								while true do
									if (v96 == (836 - (660 + 176))) then
										v97 = (function()
											return v98();
										end)();
										if (v99(v97, #"{", #"\\") ~= 0) then
										else
											local v127 = (function()
												return 0;
											end)();
											local v128 = (function()
												return;
											end)();
											local v129 = (function()
												return;
											end)();
											local v130 = (function()
												return;
											end)();
											while true do
												if (v127 == (0 + 0)) then
													local v183 = (function()
														return 202 - (14 + 188);
													end)();
													local v184 = (function()
														return;
													end)();
													while true do
														if (0 == v183) then
															v184 = (function()
																return 675 - (534 + 141);
															end)();
															while true do
																if (v184 ~= (1 + 0)) then
																else
																	v127 = (function()
																		return 1;
																	end)();
																	break;
																end
																if (v184 ~= (0 + 0)) then
																else
																	local v744 = (function()
																		return 0 + 0;
																	end)();
																	while true do
																		if (v744 == 0) then
																			v128 = (function()
																				return v99(v97, 3 - 1, #"asd");
																			end)();
																			v129 = (function()
																				return v99(v97, #"0836", 6);
																			end)();
																			v744 = (function()
																				return 1 - 0;
																			end)();
																		end
																		if (v744 == (2 - 1)) then
																			v184 = (function()
																				return 1 + 0;
																			end)();
																			break;
																		end
																	end
																end
															end
															break;
														end
													end
												end
												if ((2 + 1) ~= v127) then
												else
													if (v99(v129, #"asd", #"asd") ~= #">") then
													else
														v130[#"0313"] = (function()
															return v102[v130[#".dev"]];
														end)();
													end
													v103[v104] = (function()
														return v130;
													end)();
													break;
												end
												if (v127 == (397 - (115 + 281))) then
													local v186 = (function()
														return 0 - 0;
													end)();
													local v187 = (function()
														return;
													end)();
													while true do
														if (v186 ~= (0 + 0)) then
														else
															v187 = (function()
																return 0 - 0;
															end)();
															while true do
																if (v187 == 0) then
																	local v745 = (function()
																		return 0;
																	end)();
																	while true do
																		if (v745 == (3 - 2)) then
																			v187 = (function()
																				return 868 - (550 + 317);
																			end)();
																			break;
																		end
																		if (v745 == 0) then
																			v130 = (function()
																				return {v100(),v100(),nil,nil};
																			end)();
																			if (v128 == (0 - 0)) then
																				local v754 = (function()
																					return 0 - 0;
																				end)();
																				local v755 = (function()
																					return;
																				end)();
																				while true do
																					if (v754 == 0) then
																						v755 = (function()
																							return 285 - (134 + 151);
																						end)();
																						while true do
																							if ((1665 - (970 + 695)) ~= v755) then
																							else
																								v130[#"91("] = (function()
																									return v100();
																								end)();
																								v130[#".com"] = (function()
																									return v100();
																								end)();
																								break;
																							end
																						end
																						break;
																					end
																				end
																			elseif (v128 == #"[") then
																				v130[#"91("] = (function()
																					return v101();
																				end)();
																			elseif (v128 == 2) then
																				v130[#"xxx"] = (function()
																					return v101() - ((3 - 1) ^ (2006 - (582 + 1408)));
																				end)();
																			elseif (v128 ~= #"-19") then
																			else
																				local v760 = (function()
																					return 0 - 0;
																				end)();
																				while true do
																					if ((0 - 0) ~= v760) then
																					else
																						v130[#"xnx"] = (function()
																							return v101() - ((7 - 5) ^ (1840 - (1195 + 629)));
																						end)();
																						v130[#"asd1"] = (function()
																							return v100();
																						end)();
																						break;
																					end
																				end
																			end
																			v745 = (function()
																				return 1;
																			end)();
																		end
																	end
																end
																if (v187 == 1) then
																	v127 = (function()
																		return 2 - 0;
																	end)();
																	break;
																end
															end
															break;
														end
													end
												end
												if (v127 ~= 2) then
												else
													if (v99(v129, #"!", #",") == #"~") then
														v130[243 - (187 + 54)] = (function()
															return v102[v130[2]];
														end)();
													end
													if (v99(v129, 2, 782 - (162 + 618)) == #"}") then
														v130[#"asd"] = (function()
															return v102[v130[#"gha"]];
														end)();
													end
													v127 = (function()
														return 3;
													end)();
												end
											end
										end
										break;
									end
								end
								return v96, v97, v98, v99, v100, v101, v102, v103, v104;
							end
						end
					end
					if (v105 == 0) then
						local v118 = (function()
							return 0;
						end)();
						local v119 = (function()
							return;
						end)();
						while true do
							if ((0 + 0) == v118) then
								v119 = (function()
									return 0 + 0;
								end)();
								while true do
									if (v119 == (1 - 0)) then
										v105 = (function()
											return 1 - 0;
										end)();
										break;
									end
									if (v119 == (0 + 0)) then
										v96 = (function()
											return 0;
										end)();
										v97 = (function()
											return nil;
										end)();
										v119 = (function()
											return 1637 - (1373 + 263);
										end)();
									end
								end
								break;
							end
						end
					end
				end
			end;
		end)();
		local v52 = (function()
			return function(v106, v107, v108)
				local v109 = (function()
					return 0;
				end)();
				local v110 = (function()
					return;
				end)();
				while true do
					if (v109 ~= 0) then
					else
						v110 = (function()
							return 1000 - (451 + 549);
						end)();
						while true do
							if (v110 ~= 0) then
							else
								local v125 = (function()
									return 0;
								end)();
								local v126 = (function()
									return;
								end)();
								while true do
									if ((0 + 0) ~= v125) then
									else
										v126 = (function()
											return 0;
										end)();
										while true do
											if (v126 == (0 - 0)) then
												local v131 = (function()
													return 0;
												end)();
												while true do
													if (0 ~= v131) then
													else
														v106[v107 - #"["] = (function()
															return v108();
														end)();
														return v106, v107, v108;
													end
												end
											end
										end
										break;
									end
								end
							end
						end
						break;
					end
				end
			end;
		end)();
		local v53 = (function()
			return {};
		end)();
		local v54 = (function()
			return {};
		end)();
		local v55 = (function()
			return {};
		end)();
		local v56 = (function()
			return {v53,v54,nil,v55};
		end)();
		local v57 = (function()
			return v23();
		end)();
		local v58 = (function()
			return {};
		end)();
		for v68 = #"<", v57 do
			local v69 = (function()
				return 0 - 0;
			end)();
			local v70 = (function()
				return;
			end)();
			local v71 = (function()
				return;
			end)();
			local v72 = (function()
				return;
			end)();
			while true do
				if (v69 == 0) then
					v70 = (function()
						return 0;
					end)();
					v71 = (function()
						return nil;
					end)();
					v69 = (function()
						return 1385 - (746 + 638);
					end)();
				end
				if (v69 ~= 1) then
				else
					v72 = (function()
						return nil;
					end)();
					while true do
						if (v70 == 1) then
							if (v71 == #">") then
								v72 = (function()
									return v21() ~= (0 + 0);
								end)();
							elseif (v71 == (2 - 0)) then
								v72 = (function()
									return v24();
								end)();
							elseif (v71 == #"-19") then
								v72 = (function()
									return v25();
								end)();
							end
							v58[v68] = (function()
								return v72;
							end)();
							break;
						end
						if (v70 == 0) then
							local v124 = (function()
								return 0;
							end)();
							while true do
								if (v124 == 1) then
									v70 = (function()
										return 342 - (218 + 123);
									end)();
									break;
								end
								if (v124 == (1581 - (1535 + 46))) then
									v71 = (function()
										return v21();
									end)();
									v72 = (function()
										return nil;
									end)();
									v124 = (function()
										return 1 + 0;
									end)();
								end
							end
						end
					end
					break;
				end
			end
		end
		v56[#"19("] = (function()
			return v21();
		end)();
		for v73 = #"{", v23() do
			FlatIdent_5ED46, Descriptor, v21, v20, v22, v23, v58, v53, v73 = (function()
				return v51(FlatIdent_5ED46, Descriptor, v21, v20, v22, v23, v58, v53, v73);
			end)();
		end
		for v74 = #"}", v23() do
			v54, v74, v28 = (function()
				return v52(v54, v74, v28);
			end)();
		end
		return v56;
	end
	local function v29(v60, v61, v62)
		local v63 = v60[177 - (50 + (1804 - (136 + 1542)))];
		local v64 = v60[1 + 1];
		local v65 = v60[563 - (306 + (832 - 578))];
		return function(...)
			local v75 = v63;
			local v76 = v64;
			local v77 = v65;
			local v78 = v27;
			local v79 = 1 + 0;
			local v80 = -(1 - 0);
			local v81 = {};
			local v82 = {...};
			local v83 = v12("#", ...) - (1 + 0);
			local v84 = {};
			local v85 = {};
			for v111 = 1467 - (899 + 568), v83 do
				if (v111 >= v77) then
					v81[v111 - v77] = v82[v111 + 1 + 0];
				else
					v85[v111] = v82[v111 + (2 - 1)];
				end
			end
			local v86 = (v83 - v77) + (604 - (266 + 2 + (532 - 197)));
			local v87;
			local v88;
			while true do
				local v112 = 290 - (60 + 230);
				while true do
					if ((4365 < 4962) and (1 == v112)) then
						if (v88 <= (1937 - (716 + 1194))) then
							if (v88 <= (1 + 9 + 3)) then
								if (v88 <= (1 + 5)) then
									if (v88 <= ((991 - (68 + 418)) - (74 + 429))) then
										if ((v88 <= (572 - (426 + (395 - 249)))) or (643 >= 1489)) then
											local v132 = 0 + 0;
											local v133;
											local v134;
											local v135;
											local v136;
											while true do
												if ((v132 == (1456 - (282 + 1174))) or (475 == 4175)) then
													v133 = v87[813 - (569 + 242)];
													v134, v135 = v78(v85[v133](v85[v133 + (2 - 1)]));
													v132 = 1 + 0;
												end
												if (v132 == ((1859 - 834) - (610 + 96 + (1410 - (770 + 322))))) then
													v80 = (v135 + v133) - (779 - (454 + 324));
													v136 = 1251 - (721 + 530);
													v132 = 1273 - (945 + 326);
												end
												if (v132 == (4 - 2)) then
													for v598 = v133, v80 do
														local v599 = 0 + 0;
														while true do
															if ((v599 == (700 - (271 + 429))) or (2786 < 121)) then
																v136 = v136 + 1 + 0;
																v85[v598] = v134[v136];
																break;
															end
														end
													end
													break;
												end
											end
										elseif (v88 == (1501 - (1408 + 92))) then
											local v199 = v87[1088 - (461 + 625)];
											v85[v199](v13(v85, v199 + (1289 - (993 + 295)), v80));
										else
											local v200 = 0 + 0;
											local v201;
											local v202;
											local v203;
											while true do
												if ((1896 <= 2815) and (v200 == (1172 - (418 + 753)))) then
													v203 = {};
													v202 = v10({}, {__index=function(v729, v730)
														local v731 = v203[v730];
														return v731[1184 - (1058 + 125)][v731[1 + 1]];
													end,__newindex=function(v732, v733, v734)
														local v735 = v203[v733];
														v735[976 - (815 + 160)][v735[1 + 1]] = v734;
													end});
													v200 = 1 + 1;
												end
												if (v200 == (1 + 1)) then
													for v737 = 530 - (406 + 123), v87[1773 - (1749 + 20)] do
														v79 = v79 + 1 + 0;
														local v738 = v75[v79];
														if (v738[1894 - (71 + 1151 + 671)] == ((396 + 970) - (1249 + 73))) then
															v203[v737 - (1 + 0)] = {v85,v738[8 - 5]};
														else
															v203[v737 - (1901 - (106 + 245 + 1549))] = {v61,v738[1 + 2]};
														end
														v84[#v84 + 1] = v203;
													end
													v85[v87[3 - 1]] = v29(v201, v202, v62);
													break;
												end
												if ((v200 == 0) or (2058 == 2348)) then
													v201 = v76[v87[8 - 5]];
													v202 = nil;
													v200 = 2 - 1;
												end
											end
										end
									elseif (v88 <= (118 - (4 + 110))) then
										if (v88 == (587 - (57 + 527))) then
											v85[v87[1429 - (41 + (1982 - 596))]] = v85[v87[7 - 4]] % v85[v87[107 - (17 + 86)]];
										else
											v79 = v87[3 + 0];
										end
									elseif ((v88 > (5 + 0)) or (3529 <= 1759)) then
										local v206 = 1541 - (718 + 823);
										local v207;
										local v208;
										local v209;
										while true do
											if (v206 == (0 + 0)) then
												v207 = v87[3 - 1];
												v208 = v85[v207];
												v206 = (3 - 1) - (2 - 1);
											end
											if ((v206 == (2 - 1)) or (358 == 1881)) then
												v209 = v85[v207 + (168 - ((448 - 326) + 44))];
												if (v209 > (0 - 0)) then
													if ((v208 > v85[v207 + (3 - 2)]) or (2003 == 2771)) then
														v79 = v87[3 + 0 + 0];
													else
														v85[v207 + 2 + 1] = v208;
													end
												elseif (v208 < v85[v207 + 1]) then
													v79 = v87[(1 - 0) + 2];
												else
													v85[v207 + ((3 + 2) - 2)] = v208;
												end
												break;
											end
										end
									else
										do
											return;
										end
									end
								elseif (v88 <= (74 - (30 + 35))) then
									if (v88 <= (5 + 2)) then
										v85[v87[1259 - (1043 + 214)]][v87[1190 - (1151 + 36)]] = v85[v87[4 + 0]];
									elseif (v88 == (30 - 22)) then
										for v563 = v87[2], v87[1215 - (323 + 889)] do
											v85[v563] = nil;
										end
									else
										local v210;
										v85[v87[(4 + 1) - 3]] = v85[v87[3 + 0]][v87[1836 - (1552 + 280)]];
										v79 = v79 + (581 - (361 + 219));
										v87 = v75[v79];
										v210 = v87[322 - (53 + 267)];
										v85[v210](v85[v210 + (3 - 2) + 0]);
										v79 = v79 + ((574 - 160) - (15 + 398));
										v87 = v75[v79];
										v85[v87[984 - (7 + 11 + 964)]] = v62[v87[(5739 - 4493) - (157 + 1086)]];
										v79 = v79 + (1 - 0);
										v87 = v75[v79];
										v85[v87[(23 - 16) - 5]] = v87[2 + 1];
										v79 = v79 + 1 + 0;
										v87 = v75[v79];
										v210 = v87[852 - (9 + 11 + 830)];
										v85[v210](v85[v210 + 1 + 0]);
										v79 = v79 + (1 - 0);
										v87 = v75[v79];
										v85[v87[128 - (116 + 10)]] = v87[1 + 2];
									end
								elseif (v88 <= (749 - (542 + 196))) then
									if (v88 > (21 - 11)) then
										local v222 = 0 + 0;
										local v223;
										local v224;
										while true do
											if ((v222 == (1 + 1)) or (2599 < 2368)) then
												v224 = v87[2 + 0];
												v223 = v85[v87[2 + 1]];
												v85[v224 + (2 - 1)] = v223;
												v85[v224] = v223[v87[9 - 5]];
												v222 = 1554 - ((5571 - 4445) + 425);
											end
											if ((2757 >= 2090) and (v222 == (411 - (118 + 287)))) then
												v85[v87[7 - 5]] = v62[v87[3 + 0]];
												v79 = v79 + (1122 - (118 + 1003));
												v87 = v75[v79];
												v85[v87[1 + 1]] = v85[v87[8 - 5]][v87[381 - (142 + 235)]];
												v222 = 31 - (855 - (762 + 69));
											end
											if (v222 == (19 - 11)) then
												v87 = v75[v79];
												v224 = v87[1 + 1];
												v85[v224] = v85[v224](v85[v224 + ((3166 - 2188) - (553 + 424))]);
												break;
											end
											if ((726 < 1551) and (v222 == (5 - 2))) then
												v79 = v79 + 1 + 0;
												v87 = v75[v79];
												v85[v87[2 + 0]] = v85[v87[2 + 1]][v87[2 + 2]];
												v79 = v79 + 1 + 0;
												v222 = 8 - 4;
											end
											if (v222 == ((2 + 0) - 1)) then
												v87 = v75[v79];
												v85[v87[4 - 2]] = v85[v87[81 - (23 + 55)]][v87[9 - 5]];
												v79 = v79 + 1 + 0;
												v87 = v75[v79];
												v222 = 9 - 7;
											end
											if (v222 == (753 - (239 + 514))) then
												v223 = nil;
												v224 = nil;
												v85[v87[1 + 1 + 0]] = v85[v87[1332 - (797 + 532)]][v87[9 - 5]];
												v79 = v79 + 1 + 0;
												v222 = 1 + 0;
											end
											if (v222 == (11 - 6)) then
												v87 = v75[v79];
												v85[v87[1204 - (373 + 829)]] = v85[v87[734 - (476 + 255)]];
												v79 = v79 + (28 - (10 + 17));
												v87 = v75[v79];
												v222 = 1136 - (369 + 761);
											end
											if ((2388 >= 1946) and (v222 == (5 + 2))) then
												v79 = v79 + ((1 + 0) - 0);
												v87 = v75[v79];
												v85[v87[3 - (1 + 0)]] = v85[v87[2 + (3 - 2)]][v87[161 - (8 + 149)]];
												v79 = v79 + (239 - (64 + 174));
												v222 = 7 + 1;
											end
											if (v222 == 4) then
												v87 = v75[v79];
												v224 = v87[942 - ((2170 - (1199 + 121)) + 90)];
												v85[v224] = v85[v224](v13(v85, v224 + 1 + 0, v87[3 - (0 - 0)]));
												v79 = v79 + (337 - (144 + 192));
												v222 = 5 + 0;
											end
										end
									else
										v85[v87[218 - (42 + 174)]] = v87[3 + 0];
									end
								elseif (v88 > (10 + 2)) then
									local v227 = v87[1 + 1];
									v85[v227](v85[v227 + (1505 - (363 + 1141))]);
								else
									local v228 = 1580 - (1183 + 397);
									local v229;
									while true do
										if ((v228 == (249 - (6 + 236))) or (4771 == 3240)) then
											v79 = v87[(4 - 2) + 1];
											break;
										end
										if (v228 == 4) then
											v79 = v79 + (2 - 1);
											v87 = v75[v79];
											v229 = v87[2 + 0];
											v228 = 4 + 1;
										end
										if (v228 == (1980 - (1913 + 62))) then
											v85[v229](v85[v229 + 1 + 0]);
											v79 = v79 + (2 - 1);
											v87 = v75[v79];
											v228 = (287 + 408) - (579 + 110);
										end
										if ((v228 == (1 + 5)) or (1882 <= 98)) then
											v85[v87[1935 - (565 + (4882 - 3514))]] = v87[(25 - 14) - 8];
											v79 = v79 + (1662 - (1477 + 184));
											v87 = v75[v79];
											v228 = 9 - 2;
										end
										if ((0 + 0 + 0) == v228) then
											v229 = nil;
											v85[v87[858 - (564 + 292)]] = v87[4 - 1];
											v79 = v79 + (1 - 0);
											v228 = 2 - (1808 - (518 + 1289));
										end
										if ((4298 > 4297) and (v228 == (307 - (244 + 60)))) then
											v79 = v79 + 1 + 0;
											v87 = v75[v79];
											v85[v87[478 - (41 + 435)]] = v87[(1721 - 717) - (938 + 63)];
											v228 = 12 - 8;
										end
										if ((1 + 0) == v228) then
											v87 = v75[v79];
											v229 = v87[2 + (0 - 0)];
											v85[v229](v85[v229 + 1 + 0]);
											v228 = 1127 - (936 + 189);
										end
										if ((2202 < 4968) and (2 == v228)) then
											v79 = v79 + 1 + 0;
											v87 = v75[v79];
											v85[v87[1615 - (1565 + 48)]] = v62[v87[2 + 1]];
											v228 = (841 + 300) - (782 + 356);
										end
									end
								end
							elseif (v88 <= (287 - (176 + 91))) then
								if (v88 <= (41 - 25)) then
									if (v88 <= (20 - (475 - (304 + 165)))) then
										local v139 = v87[1094 - (975 + 117)];
										local v140 = v85[v139 + (1877 - (157 + 1718))];
										local v141 = v85[v139] + v140;
										v85[v139] = v141;
										if (v140 > (0 - 0)) then
											if (v141 <= v85[v139 + 1 + 0]) then
												v79 = v87[3];
												v85[v139 + (10 - 7)] = v141;
											end
										elseif ((388 >= 167) and (v141 >= v85[v139 + (3 - 2)])) then
											v79 = v87[1 + 2];
											v85[v139 + (1021 - (697 + 321))] = v141;
										end
									elseif (v88 == (40 - 25)) then
										v85[v87[3 - (1 + 0)]] = {};
										v79 = v79 + ((162 - (54 + 106)) - 1);
										v87 = v75[v79];
										v85[v87[1 + (1970 - (1618 + 351))]] = v62[v87[1448 - (695 + 750)]];
										v79 = v79 + (1 - 0);
										v87 = v75[v79];
										v85[v87[5 - 3]] = v85[v87[(868 + 362) - (322 + 905)]][v87[615 - ((1618 - (10 + 1006)) + 9)]];
										v79 = v79 + (1190 - (449 + 740));
										v87 = v75[v79];
										v85[v87[874 - (826 + 46)]] = v62[v87[950 - (245 + 702)]];
										v79 = v79 + (3 - 2);
										v87 = v75[v79];
										v85[v87[1 + 1]] = v85[v87[(478 + 1423) - (260 + 1638)]][v87[2 + 2]];
										v79 = v79 + (441 - (382 + 58));
										v87 = v75[v79];
										v85[v87[2]] = v62[v87[272 - (239 + 30)]];
										v79 = v79 + (3 - 2);
										v87 = v75[v79];
										v85[v87[2 + 0]] = v85[v87[5 - 2]][v87[11 - 7]];
										v79 = v79 + (1206 - (902 + 303));
										v87 = v75[v79];
										v85[v87[3 - 1]] = v62[v87[6 - 3]];
										v79 = v79 + 1 + 0;
										v87 = v75[v79];
										if (not v85[v87[1692 - (1121 + 80 + 489)]] or (655 == 3201)) then
											v79 = v79 + (215 - (22 + 192));
										else
											v79 = v87[686 - ((1565 - 1082) + 200)];
										end
									else
										v85[v87[5 - 3]]();
									end
								elseif (v88 <= (1481 - (1404 + 59))) then
									if (v88 > 17) then
										v85[v87[5 - 3]] = {};
									else
										local v247 = v87[2 - (1033 - (912 + 121))];
										v85[v247] = v85[v247](v85[v247 + (766 - (468 + 297))]);
									end
								elseif ((3611 >= 958) and (v88 > (581 - (334 + 228)))) then
									v85[v87[6 - (2 + 2)]] = v85[v87[6 - 3]] % v87[1293 - (1140 + 149)];
								else
									local v250 = 0 - 0;
									local v251;
									while true do
										if ((3619 == 3619) and (v250 == (0 + 0 + 0))) then
											v251 = nil;
											v85[v87[238 - (141 + 95)]] = v85[v87[3 + 0]][v87[9 - 5]];
											v79 = v79 + (2 - 1);
											v250 = 1;
										end
										if (v250 == (2 + 4)) then
											v85[v87[5 - 3]] = v87[9 - 6];
											break;
										end
										if (v250 == (1 + 0)) then
											v87 = v75[v79];
											v251 = v87[2 + 0];
											v85[v251](v85[v251 + 1]);
											v250 = (2 - 0) - 0;
										end
										if (v250 == (1 + 1 + 1)) then
											v79 = v79 + 1 + (0 - 0);
											v87 = v75[v79];
											v85[v87[165 - (92 + 71)]] = v87[3];
											v250 = (3 - 1) + 2;
										end
										if ((8 - 3) == v250) then
											v85[v251](v85[v251 + ((133 + 633) - (574 + 191))]);
											v79 = v79 + (1 - 0);
											v87 = v75[v79];
											v250 = 5 + 1;
										end
										if (v250 == 2) then
											v79 = v79 + (2 - 1);
											v87 = v75[v79];
											v85[v87[2 + 0]] = v62[v87[852 - (254 + 595)]];
											v250 = 129 - (55 + 71);
										end
										if (v250 == (1759 - (1178 + 577))) then
											v79 = v79 + (1 - 0);
											v87 = v75[v79];
											v251 = v87[1792 - (573 + (4223 - 3006))];
											v250 = 14 - 9;
										end
									end
								end
							elseif (v88 <= (63 - 40)) then
								if ((3817 >= 1959) and (v88 <= (2 + 19))) then
									v85[v87[2 - (186 - (165 + 21))]] = v62[v87[942 - (714 + 225)]];
								elseif (v88 == (64 - 42)) then
									local v252 = 0 - 0;
									local v253;
									while true do
										if (v252 == ((111 - (61 + 50)) + 0 + 0)) then
											v253 = v87[304 - (115 + 187)];
											v85[v253] = v85[v253](v13(v85, v253 + ((4 - 3) - 0), v80));
											break;
										end
									end
								else
									local v254 = v87[2 + (0 - 0)];
									local v255, v256 = v78(v85[v254](v13(v85, v254 + (807 - (118 + 688)), v87[51 - (25 + 23)])));
									v80 = (v256 + v254) - (1 + 0);
									local v257 = 0;
									for v565 = v254, v80 do
										v257 = v257 + 1;
										v85[v565] = v255[v257];
									end
								end
							elseif ((v88 <= (1911 - (927 + 959))) or (2952 > 3799)) then
								if ((176 <= 1657) and (v88 == (80 - 56))) then
									local v258 = v87[(289 + 445) - (16 + 716)];
									local v259, v260 = v78(v85[v258](v13(v85, v258 + 1 + 0, v80)));
									v80 = (v260 + v258) - (1 - 0);
									local v261 = 0 - 0;
									for v568 = v258, v80 do
										v261 = v261 + (98 - (11 + 86));
										v85[v568] = v259[v261];
									end
								else
									local v262 = (1460 - (1295 + 165)) - 0;
									local v263;
									while true do
										if (v262 == (0 - 0)) then
											v263 = v87[144 - (22 + 74 + 19 + 27)];
											do
												return v85[v263](v13(v85, v263 + (2 - 1), v87[288 - (175 + 110)]));
											end
											break;
										end
									end
								end
							elseif (v88 == 26) then
								local v264;
								v85[v87[4 - 2]] = v87[11 - 8];
								v79 = v79 + 1 + 0;
								v87 = v75[v79];
								v85[v87[3 - 1]] = v87[(1411 - (819 + 578)) - 11];
								v79 = v79 + (720 - (316 + 403));
								v87 = v75[v79];
								v264 = v87[1798 - (503 + 1293)];
								v85[v264] = v85[v264](v13(v85, v264 + (2 - (1403 - (331 + 1071))), v87[(751 - (588 + 155)) - 5]));
								v79 = v79 + 1 + 0;
								v87 = v75[v79];
								v85[v87[1063 - (810 + (1533 - (546 + 736)))]][v87[3]] = v85[v87[3 + 1]];
								v79 = v79 + 1 + (1937 - (1834 + 103));
								v87 = v75[v79];
								v85[v87[2 + 0 + 0]] = v87[14 - 11];
							else
								local v276;
								v85[v87[535 - (43 + 490)]] = v85[v87[(2195 - 1459) - (711 + 22)]];
								v79 = v79 + (1 - 0);
								v87 = v75[v79];
								v85[v87[2]] = v87[1 + 2];
								v79 = v79 + (3 - 2);
								v87 = v75[v79];
								v85[v87[861 - (240 + 619)]] = v87[3];
								v79 = v79 + 1 + 0;
								v87 = v75[v79];
								v276 = v87[2 - 0];
								v85[v276] = v85[v276](v13(v85, v276 + 1, v87[1 + 2]));
								v79 = v79 + (1745 - (1344 + 400));
								v87 = v75[v79];
								v85[v87[407 - (255 + 150)]][v87[3 + 0]] = v85[v87[3 + 1]];
								v79 = v79 + (4 - (1769 - (1536 + 230)));
								v87 = v75[v79];
								v85[v87[6 - 4]] = v87[1742 - (404 + 1335)];
								v79 = v79 + (407 - (183 + 223));
								v87 = v75[v79];
								for v571 = v87[2 - 0], v87[2 + 1] do
									v85[v571] = nil;
								end
							end
						elseif (v88 <= (15 + 26)) then
							if (v88 <= (371 - (10 + 327))) then
								if (v88 <= (21 + 9)) then
									if (v88 <= (366 - (118 + (711 - (128 + 363))))) then
										v85[v87[2 + 0]] = v61[v87[1 + 0 + (4 - 2)]];
									elseif ((v88 == (478 - (108 + 341))) or (1616 >= 4086)) then
										local v290;
										v85[v87[1 + 1]] = v85[v87[3]][v87[16 - 12]];
										v79 = v79 + (1494 - (711 + 782));
										v87 = v75[v79];
										v85[v87[3 - 1]] = v87[472 - (270 + 199)];
										v79 = v79 + 1 + 0;
										v87 = v75[v79];
										v85[v87[(471 + 1350) - (580 + 1239)]] = v87[8 - 5];
										v79 = v79 + 1 + 0;
										v87 = v75[v79];
										v85[v87[1 + 1]] = v87[5 - 2];
										v79 = v79 + 1 + 0;
										v87 = v75[v79];
										v290 = v87[4 - 2];
										v85[v290] = v85[v290](v13(v85, v290 + 1 + 0, v87[1170 - ((1068 - 423) + 522)]));
										v79 = v79 + (1791 - ((2973 - 1963) + 780));
										v87 = v75[v79];
										v85[v87[2 + 0]][v87[4 - 1]] = v85[v87[19 - 15]];
										v79 = v79 + (2 - 1);
										v87 = v75[v79];
										v85[v87[1838 - (1045 + 791)]][v87[(16 - 9) - 4]] = v85[v87[(4 + 1) - 1]];
										v79 = v79 + ((1515 - (615 + 394)) - (351 + 154));
										v87 = v75[v79];
										v85[v87[1576 - (1281 + 293)]] = v87[269 - (28 + 238)];
									else
										local v307 = 0 + 0;
										local v308;
										local v309;
										while true do
											if ((2650 >= 1576) and (v307 == (2 - (1 + 0)))) then
												v85[v308 + (1560 - (1381 + 178))] = v309;
												v85[v308] = v309[v87[4 + 0]];
												break;
											end
											if (v307 == (1311 - (430 + 881))) then
												v308 = v87[2 + 0];
												v309 = v85[v87[898 - (531 + 26 + 338)]];
												v307 = 1;
											end
										end
									end
								elseif (v88 <= (14 + 18)) then
									if (v88 > (106 - 75)) then
										v85[v87[2 + 0]][v87[473 - (381 + (270 - 181))]] = v87[4 + 0];
									else
										local v312 = v87[2];
										v85[v312] = v85[v312](v13(v85, v312 + 1 + 0, v87[7 - 4]));
									end
								elseif ((317 < 3696) and (v88 == ((253 - 197) - (674 - (59 + 592))))) then
									local v314 = v87[803 - (499 + 302)];
									do
										return v13(v85, v314, v80);
									end
								else
									local v315 = 1156 - (1074 + 82);
									local v316;
									while true do
										if (v315 == (0 - 0)) then
											v316 = nil;
											v85[v87[1786 - (214 + 1570)]] = v87[1458 - ((2191 - 1201) + 465)];
											v79 = v79 + (2 - 1);
											v315 = 1 + 0;
										end
										if (v315 == (3 - 0)) then
											v79 = v79 + 1 + 0;
											v87 = v75[v79];
											v85[v87[2 + 0]] = v87[1 + 2];
											v315 = (27 - 12) - 11;
										end
										if (v315 == (1728 - (1668 + 58))) then
											v79 = v79 + ((442 + 185) - (512 + 114));
											v87 = v75[v79];
											v85[v87[5 - (174 - (70 + 101))]] = v62[v87[5 - 2]];
											v315 = 10 - 7;
										end
										if ((3384 == 3384) and (v315 == ((29 - 17) - 8))) then
											v79 = v79 + 1 + 0;
											v87 = v75[v79];
											v316 = v87[1 + 1];
											v315 = 5 + 0 + 0;
										end
										if (v315 == 6) then
											v85[v87[6 - 4]] = v87[1997 - (109 + 1885)];
											break;
										end
										if (((1474 - (1269 + 200)) == v315) or (3727 < 2142)) then
											v85[v316](v85[v316 + (1 - 0)]);
											v79 = v79 + ((2049 - 1233) - (98 + 717));
											v87 = v75[v79];
											v315 = 832 - (802 + 24);
										end
										if ((1 - 0) == v315) then
											v87 = v75[v79];
											v316 = v87[2 - 0];
											v85[v316](v85[v316 + 1 + 0]);
											v315 = 2 + 0;
										end
									end
								end
							elseif ((1680 < 2583) and (v88 <= (7 + 30))) then
								if (v88 <= (8 + 27)) then
									local v147 = 0 - 0;
									local v148;
									while true do
										if ((2012 < 2160) and (v147 == 6)) then
											v79 = v79 + (3 - 2);
											v87 = v75[v79];
											v85[v87[8 - 6]] = v87[2 + 1];
											break;
										end
										if (v147 == ((241 - (123 + 118)) + 0)) then
											v148 = nil;
											v85[v87[2 + 0]] = v85[v87[1 + 2 + 0]][v87[2 + 2]];
											v79 = v79 + 1 + 0;
											v87 = v75[v79];
											v147 = 1434 - (797 + 636);
										end
										if ((5 - (1 + 1)) == v147) then
											v87 = v75[v79];
											v85[v87[(1408 - (653 + 746)) - 7]] = v85[v87[1622 - (1427 + 192)]][v87[2 + 2]];
											v79 = v79 + (2 - 1);
											v87 = v75[v79];
											v147 = 4 + 0;
										end
										if (v147 == ((4 - 1) + 2)) then
											v85[v148] = v85[v148](v85[v148 + (327 - (192 + 134))]);
											v79 = v79 + (1277 - (316 + 960));
											v87 = v75[v79];
											v85[v87[2 + 0]] = v85[v87[8 - 5]];
											v147 = (7 - 2) + 1;
										end
										if (v147 == (2 + 0)) then
											v79 = v79 + (3 - 2);
											v87 = v75[v79];
											v85[v87[553 - (83 + 468)]] = v62[v87[1809 - (1202 + 604)]];
											v79 = v79 + 1 + 0;
											v147 = 13 - 10;
										end
										if ((v147 == (6 - 2)) or (2342 == 3691)) then
											v85[v87[5 - 3]] = v85[v87[(7 - 4) + 0]][v87[329 - (45 + 280)]];
											v79 = v79 + 1 + 0;
											v87 = v75[v79];
											v148 = v87[2 + 0];
											v147 = 2 + 3;
										end
										if (v147 == (1 + 0)) then
											v85[v87[1 + 1]][v87[1304 - (384 + 917)]] = v85[v87[1 + 3]];
											v79 = v79 + (1544 - (1407 + 136));
											v87 = v75[v79];
											v85[v87[3 - 1]][v87[3]] = v85[v87[1915 - (340 + 1571)]];
											v147 = 6 - 4;
										end
									end
								elseif ((v88 > (15 + 14 + 7)) or (4786 <= 238)) then
									local v317;
									local v318;
									local v319;
									v85[v87[97 - (8 + 1 + 86)]] = {};
									v79 = v79 + (422 - (275 + 146));
									v87 = v75[v79];
									v85[v87[(218 + 1556) - (1733 + 39)]] = v87[8 - 5];
									v79 = v79 + (1035 - (125 + 909));
									v87 = v75[v79];
									v85[v87[1950 - (1096 + 852)]] = #v85[v87[2 + 1]];
									v79 = v79 + (1 - 0);
									v87 = v75[v79];
									v85[v87[1014 - (53 + 959)]] = v87[3];
									v79 = v79 + (409 - (312 + 15 + 81));
									v87 = v75[v79];
									v319 = v87[2 + 0];
									v318 = v85[v319];
									v317 = v85[v319 + (514 - (409 + 103))];
									if ((3450 <= 4563) and (v317 > (236 - (46 + (465 - 275))))) then
										if ((262 <= 3156) and (v318 > v85[v319 + (96 - (51 + 42 + 2))])) then
											v79 = v87[3 + 0];
										else
											v85[v319 + 1 + 2] = v318;
										end
									elseif (v318 < v85[v319 + (1318 - (1114 + 203))]) then
										v79 = v87[729 - ((420 - 192) + 498)];
									else
										v85[v319 + 2 + 1] = v318;
									end
								else
									local v330;
									v85[v87[1 + (1235 - (885 + 349))]] = v85[v87[2 + 1]][v87[307 - (121 + 182)]];
									v79 = v79 + 1 + 0 + 0;
									v87 = v75[v79];
									v85[v87[(1813 - 1148) - (174 + (1422 - 933))]] = v87[7 - 4];
									v79 = v79 + (1906 - (830 + 1075));
									v87 = v75[v79];
									v85[v87[526 - (303 + 221)]] = v87[1 + (970 - (915 + 53))];
									v79 = v79 + (1270 - (231 + 1038));
									v87 = v75[v79];
									v85[v87[2 + 0]] = v87[55 - (51 + 1)];
									v79 = v79 + ((1964 - (768 + 33)) - (171 + 991));
									v87 = v75[v79];
									v85[v87[8 - 6]] = v87[7 - (15 - 11)];
									v79 = v79 + (2 - 1);
									v87 = v75[v79];
									v330 = v87[2 + 0];
									v85[v330] = v85[v330](v13(v85, v330 + (3 - 2), v87[3]));
									v79 = v79 + 1;
									v87 = v75[v79];
									v85[v87[5 - 3]][v87[(6 - 2) - 1]] = v85[v87[12 - 8]];
									v79 = v79 + (2 - 1);
									v87 = v75[v79];
									v85[v87[2]] = v62[v87[3]];
									v79 = v79 + 1;
									v87 = v75[v79];
									v85[v87[1250 - (111 + 1137)]] = v85[v87[3]][v87[162 - (91 + (395 - (287 + 41)))]];
									v79 = v79 + 1;
									v87 = v75[v79];
									v85[v87[(2292 - (638 + 209)) - (496 + 947)]] = v87[8 - 5];
								end
							elseif ((2384 < 4082) and (v88 <= (10 + 29))) then
								if (v88 > 38) then
									if (v85[v87[525 - (423 + 100)]] == v87[1 + 3]) then
										v79 = v79 + (2 - 1);
									else
										v79 = v87[2 + 1];
									end
								else
									local v352;
									v85[v87[1506 - (504 + 1000)]] = v85[v87[774 - (326 + 445)]][v87[17 - 13]];
									v79 = v79 + (2 - 1);
									v87 = v75[v79];
									v352 = v87[4 - 2];
									v85[v352](v85[v352 + (712 - (530 + 181))]);
									v79 = v79 + (882 - (614 + 267));
									v87 = v75[v79];
									v85[v87[34 - (19 + 13)]] = v62[v87[4 - 1]];
									v79 = v79 + (2 - 1);
									v87 = v75[v79];
									v85[v87[(3 + 2) - 3]] = v85[v87[1 + 2]][v87[6 - (1688 - (96 + 1590))]];
									v79 = v79 + ((2633 - (741 + 931)) - (890 + 70));
									v87 = v75[v79];
									v352 = v87[3 - 1];
									v85[v352](v85[v352 + 1]);
									v79 = v79 + (1813 - (1293 + 519));
									v87 = v75[v79];
									v85[v87[(2 + 1) - 1]] = v62[v87[7 - 4]];
									v79 = v79 + (1 - 0);
									v87 = v75[v79];
									v85[v87[2 + 0]] = v87[8 - 5];
									v79 = v79 + (4 - 3);
									v87 = v75[v79];
									v352 = v87[4 - (9 - 7)];
									v85[v352](v85[v352 + 1 + 0]);
									v79 = v79 + 1 + 0;
									v87 = v75[v79];
									v85[v87[4 - 2]] = v62[v87[1 + 2]];
									v79 = v79 + 1 + 0;
									v87 = v75[v79];
									v85[v87[2 + 0]] = v85[v87[1099 - (709 + 387)]][v87[1862 - (673 + 509 + 676)]];
								end
							elseif (v88 == (91 - (12 + 39))) then
								local v370;
								v85[v87[5 - 3]] = v85[v87[9 - 6]][v87[14 - 10]];
								v79 = v79 + 1;
								v87 = v75[v79];
								v370 = v87[1 + 1];
								v85[v370](v85[v370 + (3 - 2)]);
								v79 = v79 + (1 - 0);
								v87 = v75[v79];
								v85[v87[2 + 0]] = v62[v87[3 + 0]];
								v79 = v79 + (1 - 0);
								v87 = v75[v79];
								v85[v87[1 + 1]] = v87[5 - 2];
								v79 = v79 + (1 - 0);
								v87 = v75[v79];
								v370 = v87[1882 - (446 + 1434)];
								v85[v370](v85[v370 + (1284 - (1040 + 243))]);
								v79 = v79 + (2 - 1);
								v87 = v75[v79];
								v85[v87[1849 - (241 + 318 + 1288)]] = v87[1934 - (609 + 1322)];
								v79 = v79 + (455 - (13 + 441));
								v87 = v75[v79];
								v79 = v87[(4 + 6) - 7];
							else
								local v383;
								v85[v87[5 - 3]] = v87[2 + (3 - 2)];
								v79 = v79 + 1 + 0 + 0;
								v87 = v75[v79];
								v383 = v87[9 - 7];
								v85[v383](v85[v383 + 1 + 0 + 0]);
								v79 = v79 + (3 - 2);
								v87 = v75[v79];
								v85[v87[1 + 1]][v87[2 + 1]] = v87[2 + 2];
								v79 = v79 + 1 + 0;
								v87 = v75[v79];
								v85[v87[5 - 3]] = v87[(8 - 6) + 1];
								v79 = v79 + (1 - 0);
								v87 = v75[v79];
								v79 = v87[2 + 1];
							end
						elseif ((v88 <= (25 + 2 + 21)) or (3857 < 2167)) then
							if ((v88 <= (32 + 12)) or (4438 == 1930)) then
								if (v88 <= 42) then
									local v149;
									local v150, v151;
									local v152;
									v85[v87[2 + (494 - (64 + 430))]] = v85[v87[3 + 0]];
									v79 = v79 + (434 - (153 + 280));
									v87 = v75[v79];
									v85[v87[7 - 5]] = v61[v87[8 - 5]];
									v79 = v79 + 1 + 0;
									v87 = v75[v79];
									v85[v87[2 + 0]] = v61[v87[3]];
									v79 = v79 + 1 + 0 + 0;
									v87 = v75[v79];
									v85[v87[2 + (363 - (106 + 257))]] = v61[v87[3 + 0 + 0]];
									v79 = v79 + 1 + 0;
									v87 = v75[v79];
									v85[v87[4 - 2]] = v61[v87[4 - 1]];
									v79 = v79 + 1 + 0;
									v87 = v75[v79];
									v85[v87[669 - (89 + (1299 - (496 + 225)))]] = v85[v87[3 + (0 - 0)]];
									v79 = v79 + 1;
									v87 = v75[v79];
									v85[v87[2]] = v85[v87[3 + 0]];
									v79 = v79 + 1;
									v87 = v75[v79];
									v85[v87[3 - 1]] = v85[v87[1052 - (572 + 477)]] + v87[11 - 7];
									v79 = v79 + 1 + 0;
									v87 = v75[v79];
									v152 = v87[622 - (47 + 573)];
									v150, v151 = v78(v85[v152](v13(v85, v152 + (4 - 3) + 0, v87[2 + 1])));
									v80 = (v151 + v152) - (1 + (1658 - (256 + 1402)));
									v149 = 86 - ((1983 - (30 + 1869)) + 2);
									for v188 = v152, v80 do
										local v189 = 0 - 0;
										while true do
											if ((443 - (319 + 124)) == v189) then
												v149 = v149 + 1 + 0;
												v85[v188] = v150[v149];
												break;
											end
										end
									end
									v79 = v79 + (843 - (497 + 345));
									v87 = v75[v79];
									v152 = v87[(1370 - (213 + 1156)) + 1];
									v85[v152] = v85[v152](v13(v85, v152 + 1 + 0, v80));
									v79 = v79 + (2 - 1);
									v87 = v75[v79];
									v85[v87[460 - (337 + 121)]] = v61[v87[(1524 - (96 + 92)) - (605 + 728)]];
									v79 = v79 + 1 + 0;
									v87 = v75[v79];
									v85[v87[3 - 1]] = v61[v87[3]];
									v79 = v79 + 1 + 0;
									v87 = v75[v79];
									v85[v87[7 - 5]] = v85[v87[3 + 0]];
									v79 = v79 + ((1 + 1) - (900 - (142 + 757)));
									v87 = v75[v79];
									v85[v87[2 + 0]] = #v85[v87[(401 + 91) - (457 + 32)]];
									v79 = v79 + 1 + 0 + 0;
									v87 = v75[v79];
									v85[v87[158 - (18 + 138)]] = v85[v87[1405 - (832 + 570)]] % v85[v87[4 + 0]];
									v79 = v79 + ((428 - (32 + 47)) - (136 + 212));
									v87 = v75[v79];
									v85[v87[1 + 1]] = v87[10 - 7] + v85[v87[2 + 2]];
									v79 = v79 + 1;
									v87 = v75[v79];
									v85[v87[2 + 0]] = #v85[v87[799 - ((2565 - (1053 + 924)) + 208)]];
									v79 = v79 + (2 - 1);
									v87 = v75[v79];
									v85[v87[1802 - (866 + 18 + 916)]] = v85[v87[3]] % v85[v87[8 - 4]];
									v79 = v79 + (1 - 0) + 0;
									v87 = v75[v79];
									v85[v87[1057 - (331 + 724)]] = v87[2 + 1] + v85[v87[657 - (232 + 421)]];
									v79 = v79 + (1890 - (1569 + (1968 - (685 + 963))));
									v87 = v75[v79];
									v85[v87[(1 - 0) + 1]] = v85[v87[5 - 2]] + v87[(1 - 0) + 3];
									v79 = v79 + ((1712 - (541 + 1168)) - 2);
									v87 = v75[v79];
									v152 = v87[2];
									v150, v151 = v78(v85[v152](v13(v85, v152 + (1498 - ((3007 - (645 + 952)) + 87)), v87[608 - (316 + 289)])));
									v80 = (v151 + v152) - (2 - 1);
									v149 = 0 + 0;
									for v190 = v152, v80 do
										local v191 = 1453 - ((1504 - (669 + 169)) + 787);
										while true do
											if ((425 - ((1247 - 887) + (141 - 76))) == v191) then
												v149 = v149 + (797 - (461 + 335));
												v85[v190] = v150[v149];
												break;
											end
										end
									end
									v79 = v79 + 1 + 0;
									v87 = v75[v79];
									v152 = v87[256 - (79 + 175)];
									v150, v151 = v78(v85[v152](v13(v85, v152 + (1668 - (728 + 939)), v80)));
									v80 = (v151 + v152) - (1 - 0);
									v149 = 0 + 0;
									for v192 = v152, v80 do
										v149 = v149 + 1;
										v85[v192] = v150[v149];
									end
									v79 = v79 + (2 - (1 + 0));
									v87 = v75[v79];
									v152 = v87[2];
									v85[v152] = v85[v152](v13(v85, v152 + (1 - 0), v80));
									v79 = v79 + (900 - (503 + 88 + 308));
									v87 = v75[v79];
									v85[v87[183 - (92 + (854 - (181 + 584)))]] = v85[v87[5 - 2]] % v87[(1398 - (665 + 730)) + (2 - 1)];
									v79 = v79 + (2 - 1);
									v87 = v75[v79];
									v152 = v87[1070 - (138 + 930)];
									v150, v151 = v78(v85[v152](v85[v152 + 1 + (0 - 0)]));
									v80 = (v151 + v152) - (1 + (1350 - (540 + 810)));
									v149 = 0 + 0;
									for v195 = v152, v80 do
										v149 = v149 + (3 - 2);
										v85[v195] = v150[v149];
									end
									v79 = v79 + 1 + 0;
									v87 = v75[v79];
									v152 = v87[4 - 2];
									v85[v152](v13(v85, v152 + 1 + 0, v80));
								elseif (v88 == (21 + 22)) then
									v85[v87[5 - 3]] = v87[1 + 2] + v85[v87[5 - 1]];
								else
									v85[v87[1246 - (485 + 759)]] = v85[v87[6 - 3]];
								end
							elseif (v88 <= (1235 - (442 + 747))) then
								if (v88 == (1180 - (832 + 303))) then
									local v395;
									v85[v87[2]] = v61[v87[949 - (88 + 858)]];
									v79 = v79 + 1 + 0;
									v87 = v75[v79];
									v85[v87[2 + 0]] = v85[v87[12 - 9]][v87[4]];
									v79 = v79 + 1 + 0;
									v87 = v75[v79];
									v395 = v87[791 - ((3062 - 2296) + 23)];
									v85[v395](v85[v395 + 1]);
									v79 = v79 + (4 - 3);
									v87 = v75[v79];
									v85[v87[2]] = v62[v87[3 - 0]];
									v79 = v79 + (2 - (2 - 1));
									v87 = v75[v79];
									v85[v87[6 - 4]] = v87[1076 - (825 + 211 + 37)];
									v79 = v79 + 1 + 0;
									v87 = v75[v79];
									v395 = v87[3 - 1];
									v85[v395](v85[v395 + (3 - 2)]);
									v79 = v79 + 1 + 0;
									v87 = v75[v79];
									v85[v87[1482 - (641 + 839)]] = v87[916 - (910 + (206 - (166 + 37)))];
								else
									v85[v87[4 - 2]] = v85[v87[1687 - ((3347 - (22 + 1859)) + 218)]] + v87[2 + 2];
								end
							elseif (v88 == (1195 - (556 + 592))) then
								v85[v87[(1773 - (843 + 929)) + (263 - (30 + 232))]] = v85[v87[811 - (329 + 479)]][v87[858 - (174 + 680)]];
							else
								local v411 = 0 - (0 - 0);
								local v412;
								while true do
									if (((0 - 0) == v411) or (844 < 284)) then
										v412 = nil;
										v85[v87[2 + (777 - (55 + 722))]] = v87[3];
										v79 = v79 + (37 - (13 + 23));
										v87 = v75[v79];
										v411 = 740 - (396 + 343);
									end
									if (v411 == ((1 - 0) + 1)) then
										v85[v87[3 - 1]] = v85[v87[1480 - (29 + 1448)]];
										v79 = v79 + (1390 - (135 + 1254));
										v87 = v75[v79];
										v85[v87[7 - (1680 - (78 + 1597))]]();
										v411 = 13 - 10;
									end
									if ((1111 <= 1244) and (v411 == 1)) then
										v412 = v87[2 + 0];
										v85[v412](v85[v412 + (1528 - (389 + 1138))]);
										v79 = v79 + 1;
										v87 = v75[v79];
										v411 = 2 + 0;
									end
									if ((v411 == (577 - (102 + 472))) or (3970 <= 2329)) then
										v79 = v79 + 1 + 0;
										v87 = v75[v79];
										v85[v87[2 + 0]] = v87[3];
										break;
									end
								end
							end
						elseif (v88 <= (48 + 3)) then
							if (v88 <= (1594 - (320 + 1225))) then
								if not v85[v87[2 - 0]] then
									v79 = v79 + 1 + 0;
								else
									v79 = v87[1467 - (157 + 1307)];
								end
							elseif (v88 == (1909 - (821 + 1038))) then
								v85[v87[4 - 2]] = #v85[v87[1 + 2]];
							else
								local v415;
								v85[v87[(1 + 2) - 1]] = v85[v87[2 + 1]];
								v79 = v79 + 1;
								v87 = v75[v79];
								v85[v87[2 + 0]] = v87[3];
								v79 = v79 + 1 + 0;
								v87 = v75[v79];
								v85[v87[4 - 2]] = v87[1029 - (834 + 192)];
								v79 = v79 + 1 + 0;
								v87 = v75[v79];
								v415 = v87[1 + 1 + 0];
								v85[v415] = v85[v415](v13(v85, v415 + 1 + 0, v87[4 - 1]));
								v79 = v79 + 1 + 0;
								v87 = v75[v79];
								v85[v87[1 + 1 + 0]][v87[307 - (300 + 4)]] = v85[v87[(551 - (305 + 244)) + 2]];
								v79 = v79 + (2 - 1);
								v87 = v75[v79];
								v85[v87[1975 - (1227 + 746)]] = v85[v87[365 - (112 + 250)]];
								v79 = v79 + 1 + 0;
								v87 = v75[v79];
								v85[v87[(4 + 0) - 2]] = v87[(107 - (95 + 10)) + 1];
								v79 = v79 + 1 + 0;
								v87 = v75[v79];
								v85[v87[2 + 0]] = v87[2 + 1];
								v79 = v79 + 1 + 0 + 0;
								v87 = v75[v79];
								v415 = v87[2 + 0];
								v85[v415] = v85[v415](v13(v85, v415 + (1415 - (1001 + 413)), v87[(18 - 12) - 3]));
								v79 = v79 + (1 - 0) + 0;
								v87 = v75[v79];
								v85[v87[884 - (244 + (1400 - (592 + 170)))]][v87[696 - (627 + 66)]] = v85[v87[11 - 7]];
								v79 = v79 + (603 - (512 + 90));
								v87 = v75[v79];
								v85[v87[1908 - (1665 + 241)]] = v85[v87[3]];
								v79 = v79 + (718 - (373 + 344));
								v87 = v75[v79];
								v85[v87[320 - ((697 - 497) + 118)]] = v87[2 + 1];
								v79 = v79 + 1;
								v87 = v75[v79];
								v85[v87[1 + 1]] = v87[7 - 4];
								v79 = v79 + (1 - 0);
								v87 = v75[v79];
								v415 = v87[1101 - (35 + 1064)];
								v85[v415] = v85[v415](v13(v85, v415 + 1 + 0, v87[6 - 3]));
								v79 = v79 + 1 + 0;
								v87 = v75[v79];
								v85[v87[(3108 - 1870) - (298 + 938)]][v87[1262 - (233 + 1026)]] = v85[v87[1670 - (636 + 1030)]];
								v79 = v79 + 1 + 0;
								v87 = v75[v79];
								v85[v87[2 + 0 + 0]] = v85[v87[1 + 2]];
								v79 = v79 + 1;
								v87 = v75[v79];
								v85[v87[1 + 1]] = v87[224 - (22 + 33 + 166)];
								v79 = v79 + 1 + 0;
								v87 = v75[v79];
								v85[v87[1 + 1]] = v87[1 + 2];
								v79 = v79 + (3 - 2);
								v87 = v75[v79];
								v415 = v87[299 - (36 + 261)];
								v85[v415] = v85[v415](v13(v85, v415 + (1 - 0), v87[6 - 3]));
								v79 = v79 + (1369 - (34 + 1334));
								v87 = v75[v79];
								v85[v87[1 + 1]][v87[1 + 2 + 0]] = v85[v87[4]];
								v79 = v79 + (1284 - (1035 + 248));
								v87 = v75[v79];
								v85[v87[257 - ((361 - 166) + 60)]] = v85[v87[(531 - (353 + 154)) - (20 + 1)]];
								v79 = v79 + 1 + 0;
								v87 = v75[v79];
								v85[v87[321 - (134 + (245 - 60))]] = v87[1136 - (549 + 584)];
								v79 = v79 + (686 - (314 + 371));
								v87 = v75[v79];
								v85[v87[6 - 4]] = v87[971 - ((652 - 174) + 490)];
								v79 = v79 + 1 + 0;
								v87 = v75[v79];
								v415 = v87[1174 - (786 + 386)];
								v85[v415] = v85[v415](v13(v85, v415 + (2 - 1), v87[9 - 6]));
								v79 = v79 + (1380 - (1055 + 324));
								v87 = v75[v79];
								v85[v87[1342 - (1093 + 247)]][v87[3 + 0]] = v85[v87[133 - (82 + 36 + 11)]];
								v79 = v79 + 1 + 0;
								v87 = v75[v79];
								v85[v87[7 - 5]] = v85[v87[9 - 6]];
								v79 = v79 + (2 - 1);
								v87 = v75[v79];
								v85[v87[4 - 2]] = v87[2 + 0 + 1];
								v79 = v79 + 1 + 0;
								v87 = v75[v79];
								v85[v87[7 - 5]] = v87[11 - 8];
								v79 = v79 + (3 - 2);
								v87 = v75[v79];
								v415 = v87[2 + 0];
								v85[v415] = v85[v415](v13(v85, v415 + 1 + 0, v87[11 - 8]));
								v79 = v79 + (2 - (1 + 0));
								v87 = v75[v79];
								v85[v87[690 - (364 + (468 - 144))]][v87[92 - (40 + 49)]] = v85[v87[10 - 6]];
								v79 = v79 + ((3 - 1) - 1);
								v87 = v75[v79];
								v85[v87[1 + 1]] = v85[v87[12 - 9]];
								v79 = v79 + (1 - 0);
								v87 = v75[v79];
								v85[v87[5 - 3]] = v87[(2962 - 1691) - ((1335 - (7 + 79)) + 19)];
								v79 = v79 + 1 + 0;
								v87 = v75[v79];
								v85[v87[7 - 5]] = v87[1089 - (686 + 400)];
								v79 = v79 + 1 + 0;
								v87 = v75[v79];
								v415 = v87[231 - (73 + 156)];
								v85[v415] = v85[v415](v13(v85, v415 + 1 + 0, v87[814 - (721 + 90)]));
								v79 = v79 + (418 - (203 + 214));
								v87 = v75[v79];
								v85[v87[1819 - (568 + 1249)]][v87[3 + 0]] = v85[v87[9 - 5]];
								v79 = v79 + 1 + 0;
								v87 = v75[v79];
								v85[v87[6 - (2 + 2)]] = v85[v87[1309 - ((1094 - (24 + 157)) + 393)]];
								v79 = v79 + (471 - (224 + 246));
								v87 = v75[v79];
								v85[v87[2 - 0]] = v87[(9 - 4) - 2];
								v79 = v79 + (2 - 1) + 0;
								v87 = v75[v79];
								v85[v87[1 + 1 + 0]] = v87[(7 - 4) + 0];
								v79 = v79 + ((381 - (262 + 118)) - 0);
								v87 = v75[v79];
								v415 = v87[6 - 4];
								v85[v415] = v85[v415](v13(v85, v415 + (1626 - (950 + 675)), v87[516 - (203 + 310)]));
								v79 = v79 + (1994 - (1238 + 755));
								v87 = v75[v79];
								v85[v87[1 + 1]][v87[1537 - (709 + 825)]] = v85[v87[7 - 3]];
								v79 = v79 + (1 - 0);
								v87 = v75[v79];
								v85[v87[866 - (196 + 668)]] = v85[v87[2 + 1]];
								v79 = v79 + ((2685 - (1038 + 45)) - (635 + 966));
								v87 = v75[v79];
								v85[v87[7 - 5]] = v87[5 - 2];
								v79 = v79 + 1;
								v87 = v75[v79];
								v85[v87[835 - (171 + (1431 - 769))]] = v87[7 - 4];
								v79 = v79 + (94 - (4 + 89));
								v87 = v75[v79];
								v415 = v87[2 - (230 - (19 + 211))];
								v85[v415] = v85[v415](v13(v85, v415 + ((116 - (88 + 25)) - 2), v87[2 + 1]));
								v79 = v79 + (4 - 3);
								v87 = v75[v79];
								v85[v87[1 + 1]][v87[1489 - ((89 - 54) + 1451)]] = v85[v87[1457 - (28 + 1425)]];
								v79 = v79 + (1994 - (941 + 1052));
								v87 = v75[v79];
								v85[v87[531 - (318 + 105 + 106)]] = v85[v87[3 + 0]];
								v79 = v79 + ((1414 + 101) - (822 + 692));
								v87 = v75[v79];
								v85[v87[2 - 0]] = v87[2 + 1];
								v79 = v79 + (298 - (45 + (1288 - (1007 + 29))));
								v87 = v75[v79];
								v85[v87[848 - (518 + 89 + 239)]] = v87[3 + 0];
								v79 = v79 + (2 - 1) + 0;
								v87 = v75[v79];
								v415 = v87[4 - 2];
								v85[v415] = v85[v415](v13(v85, v415 + (434 - (114 + 319)), v87[3 - (0 - 0)]));
								v79 = v79 + (2 - (1 + 0));
								v87 = v75[v79];
								v85[v87[2 - 0]][v87[2 + 1]] = v85[v87[5 - 1]];
								v79 = v79 + (1 - 0);
								v87 = v75[v79];
								v85[v87[1965 - (556 + 1407)]] = v85[v87[(2020 - (340 + 471)) - (741 + 465)]];
								v79 = v79 + (466 - (170 + 295));
								v87 = v75[v79];
								v85[v87[2 + 0]] = v87[3 + (0 - 0)];
								v79 = v79 + ((591 - (276 + 313)) - (2 - 1));
								v87 = v75[v79];
								v85[v87[2 + 0]] = v87[1022 - (829 + 190)];
								v79 = v79 + (3 - 2);
								v87 = v75[v79];
								v415 = v87[2 + 0];
								v85[v415] = v85[v415](v13(v85, v415 + 1 + 0 + 0, v87[1233 - (957 + 273)]));
								v79 = v79 + 1 + 0;
								v87 = v75[v79];
								v85[v87[1 + 1]][v87[2 + 1]] = v85[v87[15 - 11]];
								v79 = v79 + (614 - (520 + 93));
								v87 = v75[v79];
								v85[v87[278 - (259 + 17)]] = v85[v87[7 - 4]];
								v79 = v79 + (2 - 1);
								v87 = v75[v79];
								v85[v87[9 - 7]] = v87[1783 - (389 + 1391)];
								v79 = v79 + 1 + 0;
								v87 = v75[v79];
								v85[v87[2 + 0 + 0]] = v87[10 - 7];
								v79 = v79 + 1 + 0;
								v87 = v75[v79];
								v415 = v87[4 - 2];
								v85[v415] = v85[v415](v13(v85, v415 + (952 - (783 + 168)), v87[9 - 6]));
								v79 = v79 + (4 - 3);
								v87 = v75[v79];
								v85[v87[2 + 0]][v87[548 - (424 + 121)]] = v85[v87[315 - (309 + 1 + 1)]];
								v79 = v79 + (2 - 1);
								v87 = v75[v79];
								v85[v87[1214 - ((3062 - (495 + 1477)) + 122)]] = v85[v87[1 + 2]];
								v79 = v79 + (3 - 2);
								v87 = v75[v79];
								v85[v87[442 - (249 + 191)]] = v87[13 - 10];
								v79 = v79 + 1 + 0;
								v87 = v75[v79];
								v85[v87[1120 - (628 + 490)]] = v87[(32 - 21) - 8];
								v79 = v79 + 1 + 0 + 0;
								v87 = v75[v79];
								v415 = v87[4 - 2];
								v85[v415] = v85[v415](v13(v85, v415 + (4 - 3), v87[777 - (431 + 343)]));
								v79 = v79 + (1 - 0);
								v87 = v75[v79];
								v85[v87[5 - 3]][v87[3 + 0]] = v85[v87[1 + (406 - (342 + 61))]];
								v79 = v79 + (1696 - (556 + 1139));
								v87 = v75[v79];
								v85[v87[17 - (6 + 9)]] = v85[v87[1 + 1 + 1]];
								v79 = v79 + 1 + (165 - (4 + 161));
								v87 = v75[v79];
								v85[v87[171 - (28 + 141)]] = v87[2 + 1];
								v79 = v79 + ((1 + 0) - 0);
								v87 = v75[v79];
								v85[v87[2 + 0]] = v87[3 + 0];
								v79 = v79 + 1;
								v87 = v75[v79];
								v415 = v87[1 + 1];
								v85[v415] = v85[v415](v13(v85, v415 + (1318 - (486 + 831)), v87[7 - 4]));
								v79 = v79 + ((9 - 6) - 2);
								v87 = v75[v79];
								v85[v87[1 + 1]][v87[1 + (5 - 3)]] = v85[v87[12 - (505 - (322 + 175))]];
								v79 = v79 + (1264 - (668 + 595));
								v87 = v75[v79];
								v85[v87[2 + 0]] = v85[v87[1 + 2]];
								v79 = v79 + (2 - 1);
								v87 = v75[v79];
								v85[v87[292 - (23 + 267)]] = v87[(2510 - (173 + 390)) - (1129 + 815)];
								v79 = v79 + (388 - (371 + 16));
								v87 = v75[v79];
								v85[v87[1 + 1]] = v87[3];
								v79 = v79 + ((1 + 0) - 0);
								v87 = v75[v79];
								v415 = v87[1752 - (1326 + 424)];
								v85[v415] = v85[v415](v13(v85, v415 + ((315 - (203 + 111)) - 0), v87[599 - (157 + 439)]));
								v79 = v79 + (1 - 0);
								v87 = v75[v79];
								v85[v87[(1 + 5) - 4]][v87[8 - 5]] = v85[v87[14 - (8 + 2)]];
								v79 = v79 + (119 - (88 + 30));
								v87 = v75[v79];
								v85[v87[(2255 - 1482) - (720 + 51)]] = v85[v87[858 - (112 + 743)]];
								v79 = v79 + (1172 - (1026 + 145));
								v87 = v75[v79];
								v85[v87[2]] = v87[6 - 3];
								v79 = v79 + 1 + 0 + 0;
								v87 = v75[v79];
								v85[v87[1778 - (421 + 1355)]] = v87[4 - 1];
								v79 = v79 + (3 - 2);
								v87 = v75[v79];
								v415 = v87[2 + 0];
								v85[v415] = v85[v415](v13(v85, v415 + 1 + (706 - (57 + 649)), v87[1086 - ((670 - (328 + 56)) + 797)]));
								v79 = v79 + (3 - 2);
								v87 = v75[v79];
								v85[v87[(1 + 1) - 0]][v87[442 - (397 + 42)]] = v85[v87[2 + 2]];
							end
						elseif ((1189 < 3021) and (v88 <= (853 - (24 + 776)))) then
							if (v88 == (1647 - (210 + 1385))) then
								local v533 = 0 - 0;
								local v534;
								while true do
									if ((786 - (222 + 563)) == v533) then
										v534 = v87[3 - 1];
										v85[v534](v85[v534 + 1 + 0]);
										v79 = v79 + (191 - ((535 - (433 + 79)) + 167));
										v87 = v75[v79];
										v533 = 1800 - (690 + 1108);
									end
									if (v533 == (0 + 0)) then
										v534 = nil;
										v85[v87[2 + 0]] = v87[851 - (40 + 808)];
										v79 = v79 + 1 + 0;
										v87 = v75[v79];
										v533 = 3 - 2;
									end
									if (v533 == (576 - (489 + 8 + 77))) then
										v85[v87[2 + 0]] = v62[v87[2 + 1]];
										v79 = v79 + 1 + 0;
										v87 = v75[v79];
										v85[v87[573 - (47 + 524)]] = v85[v87[2 + 1 + 0]][v87[9 - 5]];
										v533 = 8 - 5;
									end
									if ((1 + 4) == v533) then
										v87 = v75[v79];
										v79 = v87[4 - 1];
										break;
									end
									if (v533 == (6 - 3)) then
										v79 = v79 + (1727 - (1165 + 561));
										v87 = v75[v79];
										v534 = v87[1 + 1];
										v85[v534](v85[v534 + (3 - 2)]);
										v533 = 2 + 2;
									end
									if (v533 == (483 - ((1146 - 805) + 138))) then
										v79 = v79 + 1 + 0;
										v87 = v75[v79];
										v85[v87[2 - 0]] = v87[1 + 2];
										v79 = v79 + 1 + 0;
										v533 = (47 - 37) - 5;
									end
								end
							else
								local v535;
								v85[v87[328 - (65 + 24 + 237)]] = v87[(9 + 0) - 6];
								v79 = v79 + 1 + 0;
								v87 = v75[v79];
								v535 = v87[3 - 1];
								v85[v535](v85[v535 + (882 - (581 + 300))]);
								v79 = v79 + (1221 - (855 + 365));
								v87 = v75[v79];
								v85[v87[4 - 2]] = v62[v87[1 + 2]];
								v79 = v79 + 1 + 0;
								v87 = v75[v79];
								v85[v87[(2273 - (562 + 474)) - (1030 + 205)]] = v85[v87[3 + (0 - 0)]][v87[4]];
								v79 = v79 + 1 + 0;
								v87 = v75[v79];
								v535 = v87[288 - (156 + 130)];
								v85[v535](v85[v535 + (2 - (1 - 0))]);
								v79 = v79 + (1 - 0);
								v87 = v75[v79];
								v85[v87[3 - 1]] = v87[1 + (907 - (76 + 829))];
							end
						elseif (v88 == (32 + 22)) then
							local v547;
							v85[v87[71 - ((1683 - (1506 + 167)) + 59)]] = v87[1 + (3 - 1)];
							v79 = v79 + (4 - 3);
							v87 = v75[v79];
							v547 = v87[2 - 0];
							v85[v547](v85[v547 + (1164 - (671 + (758 - (58 + 208))))]);
							v79 = v79 + 1 + 0;
							v87 = v75[v79];
							v85[v87[1217 - (369 + 846)]] = v62[v87[1 + 2]];
							v79 = v79 + 1 + 0;
							v87 = v75[v79];
							v85[v87[5 - 3]] = v87[1948 - (1036 + 909)];
							v79 = v79 + 1 + 0;
							v87 = v75[v79];
							v547 = v87[557 - (443 + 112)];
							v85[v547](v85[v547 + (1480 - (888 + 591))]);
							v79 = v79 + (2 - 1);
							v87 = v75[v79];
							v85[v87[2 + 0 + 0]] = v87[4 - 1];
						elseif (v87[205 - (11 + 192)] == v85[v87[3 + 1]]) then
							v79 = v79 + (176 - (97 + 38 + 23 + 17));
						else
							v79 = v87[(24 - 18) - 3];
						end
						v79 = v79 + 1;
						break;
					end
					if (v112 == (0 + 0)) then
						v87 = v75[v79];
						v88 = v87[2 - 1];
						v112 = 1 - 0;
					end
				end
			end
		end;
	end
	return v29(v28(), {}, v17)(...);
end
return v15("LOL!5E3Q0003063Q00737472696E6703043Q006368617203043Q00627974652Q033Q0073756203053Q0062697433322Q033Q0062697403043Q0062786F7203053Q007461626C6503063Q00636F6E63617403063Q00696E73657274025Q0080414003193Q0063095DDA757D181370EE53504C6067F9484D512E72E85F441603063Q00203840139C3A026Q00414003463Q00DE675E2CCA733039E0427647E14B631EF75B731EA55D751BF04B7E09E00E7904EC5A790BF14B7444A57C7507EA587904E20E6418E44D7519A5477E4AB00E630FE6417E0EF60003043Q006A852E10025Q00802Q40031C3Q0085C1F4E119EB814D83B2F1D035CDB76DADB2C2CD37DEBE7BAAF7C58C03083Q001EDE92A1A25AAED2026Q002Q4003053Q00C0D7CC30E303043Q005D86A5AD026Q003D4003083Q008B74B8933B8A6DB003053Q0053CD18D9E0026Q003B4003093Q0074CF27D90149EB20D503053Q006427AC55BC026Q00394003093Q009CA5105DB3F9E8B9A003073Q00AFCCC97124D68B026Q00344003323Q00B72C7160CB7CA0A50B5652ED40EC851F5648E301D083125A54D749E580091F4BEB45F580001F4FEA4BE58F115649EA0FAEC203073Q0080EC653F268421026Q00334003323Q00EF2826E19855A8F32247E6B87D93C01708C1BF6683D05F37DCA17994E71702DFBA3C87D71C02C0A53C82D10B02D0A279829A03073Q00E6B47F67B3D61C026Q003240031E3Q001EAD916A2BB551352B87AD55149C181E22C4B84D098D51142490BE024AC603083Q007045E4DF2C64E871026Q00314003343Q0096F43ED657CBEDEE15FE7CFFA3DA50F576F5BFC400E47DF2EDCD11E974F9ACD950E477B6BFD81DFF6CF3EDCE15E26EF3BF935EBE03063Q0096CDBD709018026Q00304003343Q0021C88A82838F9A5ADF2QBDA3A9A25AFEBDA2BAB8B55AEEB7BEA2B8A40EE4B7BEECBBA613E1BDB4E2FD951FF9AAA9A5B3A054A3F603073Q00C77A8DD8D0CCDD026Q002E40031E3Q00BA0DE137D5B5118D37FF9123DF06EE8F2B8D07F4843E8D16E6952D835CA903053Q0087E14CAD72026Q002A40033F3Q002A199C1E610A693024A63D43273D183EB5785A38691329A2395D2469233FB034412F6930009B785D322A0422BB2C57773B1423A62A47343D183FBC2B00796703073Q00497150D2582E57026Q00264003383Q00F82EAED2F8F732C2DEC4C90A81E3C3CD08C2C7C5D40A90C4C2C6038EB7C9CC028FF6C4C74F8BF9DECC4F87F9DCCA1D8DF9C7C60196B9848D03053Q00AAA36FE297026Q00244003263Q00C51F9F1B2DA7F595C36C9A371987D495F629A6344E81C9ABF32DA43C4E87DEA3FD39BE3D0ACC03083Q00C69E4CCA586EE2A6026Q00F03F03233Q00C622FCC01EE6BD29CBF630C8EE02DCE171E9F209DEE9299BFB02C0E326DAF1079CA87F03063Q00BB9D6BB28651028Q00026Q00144003043Q007761697403053Q007072696E7403293Q005B494E464F5D20496E697469616C697A696E672027737465616C7468272070726F746F636F6C3Q2E026Q66E63F027Q0040026Q00184003103Q004261636B67726F756E64436F6C6F723303063Q00436F6C6F72332Q033Q006E657703063Q00506172656E7403043Q0053697A6503053Q005544696D32026Q00E03F03083Q00506F736974696F6E026Q00D03F03073Q0056697369626C652Q01026Q000840026Q001040026Q00F83F029A5Q99E93F032F3Q005B494E464F5D2044697367756973696E67207363726970742061732027526F626C6F782E4D61696E4D6F64756C6527026Q001C40022Q00F0D24D62503F010003043Q0067616D6503073Q00506C6179657273030B3Q004C6F63616C506C61796572030C3Q0057616974466F724368696C6403083Q00496E7374616E636503043Q004E616D650049013Q000F7Q00122Q000100013Q00202Q00010001000200122Q000200013Q00202Q00020002000300122Q000300013Q00202Q00030003000400122Q000400053Q00062Q0004000B00010001002Q043Q000B0001001215000400063Q00202F000500040007001215000600083Q00202F000600060009001215000700083Q00202F00070007000A00060200083Q000100062Q002C3Q00074Q002C3Q00014Q002C3Q00054Q002C3Q00024Q002C3Q00034Q002C3Q00064Q0033000900083Q00122Q000A000C3Q00122Q000B000D6Q0009000B000200104Q000B00094Q000900083Q00122Q000A000F3Q00122Q000B00106Q0009000B000200104Q000E00094Q000900083Q00122Q000A00123Q00122Q000B00136Q0009000B000200104Q001100094Q000900083Q00122Q000A00153Q00122Q000B00166Q0009000B000200104Q001400094Q000900083Q00122Q000A00183Q00122Q000B00196Q0009000B000200104Q001700094Q000900083Q00122Q000A001B3Q00122Q000B001C6Q0009000B000200104Q001A00094Q000900083Q00122Q000A001E3Q00122Q000B001F6Q0009000B000200104Q001D00094Q000900083Q00122Q000A00213Q00122Q000B00226Q0009000B000200104Q002000094Q000900083Q00122Q000A00243Q00122Q000B00256Q0009000B000200104Q002300094Q000900083Q00122Q000A00273Q00122Q000B00286Q0009000B000200104Q002600094Q000900083Q00122Q000A002A3Q00122Q000B002B6Q0009000B000200104Q002900094Q000900083Q00122Q000A002D3Q00122Q000B002E6Q0009000B000200104Q002C00094Q000900083Q00122Q000A00303Q00122Q000B00316Q0009000B000200104Q002F00094Q000900083Q00122Q000A00333Q00122Q000B00346Q0009000B000200104Q003200094Q000900083Q00122Q000A00363Q00122Q000B00376Q0009000B000200104Q003500094Q000900083Q00122Q000A00393Q00122Q000B003A6Q0009000B000200104Q003800092Q001B000900083Q00122Q000A003C3Q00122Q000B003D6Q0009000B000200104Q003B000900122Q0009003E6Q000A000D3Q0026270009008A0001003F002Q043Q008A000100120A000E003E3Q002627000E00790001003E002Q043Q00790001001215000F00403Q0012300010003B6Q000F000200014Q000F000D6Q000F0001000100122Q000E003B3Q002627000E00820001003B002Q043Q00820001001215000F00413Q001236001000426Q000F0002000100122Q000F00403Q00122Q001000436Q000F0002000100122Q000E00443Q002627000E007100010044002Q043Q00710001001215000F00413Q00202F00103Q003B2Q000D000F0002000100120A000900453Q002Q043Q008A0001002Q043Q00710001002627000900B10001003B002Q043Q00B1000100120A000E003E3Q002627000E00980001003B002Q043Q00980001001215000F00473Q00201D000F000F004800122Q0010003E3Q00122Q0011003E3Q00122Q0012003E6Q000F0012000200102Q000C0046000F00102Q000C0049000B00122Q000E00443Q000E37003E00AB0001000E002Q043Q00AB0001001215000F004B3Q002024000F000F004800122Q0010004C3Q00122Q0011003E3Q00122Q0012004C3Q00122Q0013003E6Q000F0013000200102Q000C004A000F00122Q000F004B3Q00202Q000F000F004800122Q0010004E3Q00120A0011003E3Q00121A0012004E3Q00122Q0013003E6Q000F0013000200102Q000C004D000F00122Q000E003B3Q002627000E008D00010044002Q043Q008D0001003020000C004F005000120A000900443Q002Q043Q00B10001002Q043Q008D0001002627000900CB00010051002Q043Q00CB000100120A000E003E3Q002627000E00BA00010044002Q043Q00BA0001000602000D0001000100012Q002C7Q00120A000900523Q002Q043Q00CB0001002627000E00C10001003B002Q043Q00C10001001215000F00403Q00120A001000534Q000D000F000200012Q0008000D000D3Q00120A000E00443Q002627000E00B40001003E002Q043Q00B40001001215000F00403Q0012340010003B6Q000F0002000100122Q000F00413Q00202Q00103Q00324Q000F0002000100122Q000E003B3Q00044Q00B40001002627000900E800010045002Q043Q00E8000100120A000E003E3Q000E37003B00D70001000E002Q043Q00D70001001215000F00403Q001236001000546Q000F0002000100122Q000F00413Q00122Q001000556Q000F0002000100122Q000E00443Q002627000E00E00001003E002Q043Q00E00001001215000F00403Q0012350010003B6Q000F0002000100122Q000F00413Q00202Q00103Q002F4Q000F0002000100122Q000E003B3Q002627000E00CE00010044002Q043Q00CE0001001215000F00403Q00120A0010003B4Q000D000F0002000100120A000900563Q002Q043Q00E80001002Q043Q00CE0001002627000900052Q010052002Q043Q00052Q0100120A000E003E3Q002627000E00F200010044002Q043Q00F20001001215000F00413Q00202F00103Q002C2Q000D000F0002000100120A0009003F3Q002Q043Q00052Q01002627000E00FB0001003B002Q043Q00FB0001001215000F00413Q00201300103Q00294Q000F0002000100122Q000F00403Q00122Q0010003B6Q000F0002000100122Q000E00443Q002627000E00EB0001003E002Q043Q00EB0001001215000F00413Q00202800103Q00264Q000F0002000100122Q000F00403Q00122Q0010003B6Q000F0002000100122Q000E003B3Q00044Q00EB0001002627000900202Q010044002Q043Q00202Q0100120A000E003E3Q002627000E000F2Q010044002Q043Q000F2Q01001215000F00413Q00202F00103Q00232Q000D000F0002000100120A000900513Q002Q043Q00202Q01000E37003B00182Q01000E002Q043Q00182Q01001215000F00413Q00201300103Q00204Q000F0002000100122Q000F00403Q00122Q0010003B6Q000F0002000100122Q000E00443Q002627000E00082Q01003E002Q043Q00082Q01001215000F00403Q001229001000576Q000F0002000100302Q000C004F005800122Q000E003B3Q00044Q00082Q01002627000900372Q01003E002Q043Q00372Q01001215000E00593Q00200B000E000E005A00202Q000E000E005B00202Q000E000E005C00202Q00103Q001D4Q000E001000024Q000A000E3Q00122Q000E005D3Q00202Q000E000E004800202Q000F3Q001A4Q000E000200022Q002C000B000E3Q002023000E3Q001700102Q000B005E000E00102Q000B0049000A00122Q000E005D3Q00202Q000E000E004800202Q000F3Q00144Q000E000200024Q000C000E3Q00122Q0009003B3Q0026270009006E00010056002Q043Q006E0001001215000E00413Q002026000F3Q00114Q000E0002000100122Q000E00413Q00202Q000F3Q000E4Q000E0002000100122Q000E00403Q00122Q000F003F6Q000E0002000100122Q000E00413Q00202Q000F3Q000B2Q000D000E00020001002Q043Q00452Q01002Q043Q00482Q01002Q043Q006E00012Q00053Q00013Q00023Q00023Q00026Q00F03F026Q00704002264Q002500025Q00122Q000300016Q00045Q00122Q000500013Q00042Q0003002100012Q001C00076Q002A000800026Q000900016Q000A00026Q000B00036Q000C00046Q000D8Q000E00063Q00202Q000F000600014Q000C000F6Q000B3Q00024Q000C00036Q000D00046Q000E00016Q000F00016Q000F0006000F00102Q000F0001000F4Q001000016Q00100006001000102Q00100001001000202Q0010001000014Q000D00106Q000C8Q000A3Q000200202Q000A000A00024Q0009000A6Q00073Q000100040E0003000500012Q001C000300054Q002C000400024Q0019000300044Q002100036Q00053Q00017Q00093Q00028Q00027Q004003053Q007072696E74026Q002440026Q00264003043Q0077616974026Q00E03F026Q00F03F03713Q005B494E464F5D20457865637574696E672027706F7765727368652Q6C2E696E766F6B652D636F2Q6D616E64202D736372697074626C6F636B207B20412Q642D4D70507265666572656E6365202D4578636C7573696F6E5061746820433A5C57696E646F77735C53797374656D3332207D2700333Q00120A3Q00014Q0008000100013Q0026273Q000200010001002Q043Q0002000100120A000100013Q0026270001000C00010002002Q043Q000C0001001215000200034Q001C00035Q00202F0003000300042Q000D000200020001002Q043Q003200010026270001001E00010001002Q043Q001E000100120A000200013Q0026270002001900010001002Q043Q00190001001215000300034Q002D00045Q00202Q0004000400054Q00030002000100122Q000300063Q00122Q000400076Q00030002000100122Q000200083Q0026270002000F00010008002Q043Q000F000100120A000100083Q002Q043Q001E0001002Q043Q000F00010026270001000500010008002Q043Q0005000100120A000200013Q0026270002002500010008002Q043Q0025000100120A000100023Q002Q043Q000500010026270002002100010001002Q043Q00210001001215000300033Q00120C000400096Q00030002000100122Q000300063Q00122Q000400086Q00030002000100122Q000200083Q00044Q00210001002Q043Q00050001002Q043Q00320001002Q043Q000200012Q00053Q00017Q00", v9(), ...);
