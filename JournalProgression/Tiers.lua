-- The steps of each mod-individual-progression stage, for the Journal's Progression tab.
--
-- Generated from AzerothCore's world tables (quest chains: PrevQuestID, NextQuestID, exclusive groups and
-- quest conditions) with mod-individual-progression's own quests and changes added by hand. Edit freely:
--
--   tiers[stage] = { stage, next (the stage it leads to), name, era (0 Classic, 1 Burning Crusade, 2 Wrath),
--                    goal, sections }
--   a section:  { title, note, steps = { ... } }, or a raid: { title, raid = map id, milestone = the boss
--               whose kill moves you on, players (40: the 40 player tab), expansion (the tabs of that
--               expansion), requires = { step keys }, gate = a boss's name: it and the bosses after it
--               also need gateRequires = { step keys } }
--   a step:     kind = "quest" (quest, also = other ids that count, name, level, faction, rep, standing, alt),
--               "item" (item, items = any of these, name), "level" (level), "rep" (rep = faction id, standing),
--               "gear" (ilvl: a suggested average item level; recommended, never holds anything up)
--               after = step keys that come first (all of them), afterAny = (one of them)
--               advances = the stage doing it moves you to; optional = not needed to move on;
--               recommended = advice, not needed to move on; note
--   step keys:  q<quest>, i<item>, lvl<level>, rep<faction>, gear<ilvl>

JournalProgression = JournalProgression or {}

JournalProgression.FACTIONS = {
	[529] = "Argent Dawn",
	[609] = "Cenarion Circle",
	[749] = "Hydraxian Waterlords",
	[910] = "Brood of Nozdormu",
	[932] = "The Aldor",
	[934] = "The Scryers",
	[935] = "The Sha'tar",
	[942] = "Cenarion Expedition",
	[946] = "Honor Hold",
	[947] = "Thrallmar",
	[967] = "The Violet Eye",
	[1011] = "Lower City",
}

JournalProgression.tiers = {
	[0] = {
		stage = 0, name = "Molten Core", era = 0, goal = "Defeat Ragnaros in Molten Core.", next = 1,
		sections = {
			{
				title = "Get ready",
				steps = {
					{ kind = "level", level = 60, name = "Reach level 60", note = "The level cap is 60 until you reach progression stage 8." },
					{ kind = "gear", name = "Gear check: item level 55", ilvl = 55, recommended = true, note = "Blue gear from the level 60 dungeons (Blackrock Depths, Stratholme, Scholomance, Blackrock Spire) gets you there." },
					{ kind = "quest", quest = 7848, level = 55, faction = "Alliance", name = "Attunement to the Core", optional = true, note = "Optional. Lets Lothos Riftwaker in Blackrock Mountain teleport you to Molten Core. Needs a Core Fragment from the Molten Core portal in Blackrock Depths." },
				},
			},
			{
				title = "The Firelord runes", note = "Duke Hydraxis on an island off the east coast of Azshara. This realm makes you douse the runes by hand (IndividualProgression.MoltenCore.ManualRuneHandling, on by default).",
				steps = {
					{ kind = "quest", quest = 6022, level = 54, name = "To Kill With Purpose" },
					{ kind = "quest", quest = 6021, level = 50, name = "Zaeldarr the Outcast" },
					{ kind = "quest", quest = 6805, level = 55, name = "Stormers and Rumblers" },
					{ kind = "quest", quest = 6821, level = 55, name = "Eye of the Emberseer", after = { "q6805" } },
					{ kind = "quest", quest = 6822, level = 55, name = "The Molten Core", after = { "q6021", "q6821" } },
					{ kind = "quest", quest = 6823, level = 55, name = "Agent of Hydraxis", after = { "q6022", "q6822" } },
					{ kind = "quest", quest = 6824, level = 55, name = "Hands of the Enemy", after = { "q6823" }, note = "Opens Duke Hydraxis's Aqual Quintessence once you're Honored with the Hydraxian Waterlords." },
					{ kind = "rep", rep = 749, standing = 6, name = "Hydraxian Waterlords: Honored", note = "Killing Molten Core's fire elementals and giants raises it, as do Duke Hydraxis's quests." },
					{ kind = "item", item = 17333, items = { 17333, 22754 }, name = "Aqual Quintessence", after = { "q6824", "rep749" }, note = "Ask Duke Hydraxis for it. Douse each Firelord's rune with it once that boss is dead: Majordomo Executus only comes when all seven runes are out. At Revered he gives the Eternal Quintessence instead." },
				},
			},
			{ title = "Molten Core", raid = 409, milestone = "Ragnaros", gate = "Majordomo Executus", gateRequires = { "i17333" } },
		},
	},
	[1] = {
		stage = 1, name = "Onyxia's Lair", era = 0, goal = "Defeat Onyxia in her 40 player lair.", next = 2,
		sections = {
			{
				title = "The Drakefire Amulet", note = "Onyxia's Lair only lets you in with the Drakefire Amulet, the reward of a long chain that starts in the Burning Steppes (Alliance) or Blackrock Spire (Horde).",
				steps = {
					{ kind = "quest", quest = 4182, level = 48, faction = "Alliance", name = "Dragonkin Menace" },
					{ kind = "quest", quest = 4183, level = 48, faction = "Alliance", name = "The True Masters", after = { "q4182" } },
					{ kind = "quest", quest = 4184, level = 48, faction = "Alliance", name = "The True Masters", after = { "q4183" } },
					{ kind = "quest", quest = 4185, level = 48, faction = "Alliance", name = "The True Masters", after = { "q4184" } },
					{ kind = "quest", quest = 4186, level = 48, faction = "Alliance", name = "The True Masters", after = { "q4185" } },
					{ kind = "quest", quest = 4223, level = 48, faction = "Alliance", name = "The True Masters", after = { "q4186" } },
					{ kind = "quest", quest = 4224, level = 48, faction = "Alliance", name = "The True Masters", after = { "q4223" } },
					{ kind = "quest", quest = 4241, level = 48, faction = "Alliance", name = "Marshal Windsor", after = { "q4224" } },
					{ kind = "quest", quest = 4242, level = 48, faction = "Alliance", name = "Abandoned Hope", after = { "q4241" } },
					{ kind = "quest", quest = 4264, level = 50, faction = "Alliance", name = "A Crumpled Up Note", after = { "q4242" } },
					{ kind = "quest", quest = 4282, level = 50, faction = "Alliance", name = "A Shred of Hope", after = { "q4264" } },
					{ kind = "quest", quest = 4322, level = 50, faction = "Alliance", name = "Jail Break!", after = { "q4282" } },
					{ kind = "quest", quest = 6402, level = 50, faction = "Alliance", name = "Stormwind Rendezvous", after = { "q4322" } },
					{ kind = "quest", quest = 6403, level = 50, faction = "Alliance", name = "The Great Masquerade", after = { "q6402" } },
					{ kind = "quest", quest = 6501, level = 50, faction = "Alliance", name = "The Dragon's Eye", after = { "q6403" } },
					{ kind = "quest", quest = 6502, level = 50, faction = "Alliance", name = "Drakefire Amulet", after = { "q6501" } },
					{ kind = "quest", quest = 4903, level = 55, faction = "Horde", name = "Warlord's Command" },
					{ kind = "quest", quest = 4941, level = 55, faction = "Horde", name = "Eitrigg's Wisdom", after = { "q4903" } },
					{ kind = "quest", quest = 4974, level = 55, faction = "Horde", name = "For The Horde!", after = { "q4941" } },
					{ kind = "quest", quest = 6566, level = 55, faction = "Horde", name = "What the Wind Carries", after = { "q4974" } },
					{ kind = "quest", quest = 6567, level = 55, faction = "Horde", name = "The Champion of the Horde", after = { "q6566" } },
					{ kind = "quest", quest = 6568, level = 55, faction = "Horde", name = "Mistress of Deception", after = { "q6567" } },
					{ kind = "quest", quest = 6569, level = 55, faction = "Horde", name = "Oculus Illusions", after = { "q6568" } },
					{ kind = "quest", quest = 6570, level = 55, faction = "Horde", name = "Emberstrife", after = { "q6569" } },
					{ kind = "quest", quest = 6582, level = 55, faction = "Horde", name = "The Test of Skulls, Scryer", after = { "q6570" } },
					{ kind = "quest", quest = 6583, level = 55, faction = "Horde", name = "The Test of Skulls, Somnus", after = { "q6570" } },
					{ kind = "quest", quest = 6584, level = 55, faction = "Horde", name = "The Test of Skulls, Chronalis", after = { "q6570" } },
					{ kind = "quest", quest = 6585, level = 55, faction = "Horde", name = "The Test of Skulls, Axtroz", after = { "q6582", "q6583", "q6584" } },
					{ kind = "quest", quest = 6601, level = 55, faction = "Horde", name = "Ascension...", after = { "q6585" } },
					{ kind = "quest", quest = 6602, level = 55, faction = "Horde", name = "Blood of the Black Dragon Champion", after = { "q6601" } },
					{ kind = "item", item = 16309, name = "Drakefire Amulet", afterAny = { "q6502", "q6602" }, note = "Keep it in your bags: the realm looks in your bags, not your bank, when you enter Onyxia's Lair." },
				},
			},
			{ title = "Onyxia's Lair", raid = 249, players = 40, milestone = "Onyxia", requires = { "i16309" } },
		},
	},
	[2] = {
		stage = 2, name = "Blackwing Lair", era = 0, goal = "Defeat Nefarian in Blackwing Lair.", next = 3,
		sections = {
			{
				title = "Get ready",
				steps = {
					{ kind = "quest", quest = 7761, level = 55, name = "Blackhand's Command", optional = true, note = "Optional. Lets you touch the Orb of Command in Blackrock Mountain to enter Blackwing Lair. Starts from Blackhand's Command, a letter the Scarshield Quartermaster in Blackrock Mountain carries." },
				},
			},
			{ title = "Blackwing Lair", raid = 469, milestone = "Nefarian" },
		},
	},
	[3] = {
		stage = 3, name = "The Gates of Ahn'Qiraj", era = 0, goal = "Ring the Scarab Gong in Silithus to open the gates of Ahn'Qiraj.", next = 4,
		sections = {
			{
				title = "The war effort", note = "Your faction's collectors in Ironforge (Alliance) or Orgrimmar (Horde) want supplies. Deliver every kind, then report to the officer in charge.",
				steps = {
					{ kind = "quest", quest = 8492, level = 1, faction = "Alliance", name = "The Alliance Needs Copper Bars!" },
					{ kind = "quest", quest = 8494, level = 1, faction = "Alliance", name = "The Alliance Needs Iron Bars!" },
					{ kind = "quest", quest = 8499, level = 1, faction = "Alliance", name = "The Alliance Needs Thorium Bars!" },
					{ kind = "quest", quest = 8503, level = 1, faction = "Alliance", name = "The Alliance Needs Stranglekelp!" },
					{ kind = "quest", quest = 8505, level = 1, faction = "Alliance", name = "The Alliance Needs Purple Lotus!" },
					{ kind = "quest", quest = 8509, level = 1, faction = "Alliance", name = "The Alliance Needs Arthas' Tears!" },
					{ kind = "quest", quest = 8511, level = 1, faction = "Alliance", name = "The Alliance Needs Light Leather!" },
					{ kind = "quest", quest = 8513, level = 1, faction = "Alliance", name = "The Alliance Needs Medium Leather!" },
					{ kind = "quest", quest = 8515, level = 1, faction = "Alliance", name = "The Alliance Needs Thick Leather!" },
					{ kind = "quest", quest = 8517, level = 1, faction = "Alliance", name = "The Alliance Needs Linen Bandages!" },
					{ kind = "quest", quest = 8520, level = 1, faction = "Alliance", name = "The Alliance Needs Silk Bandages!" },
					{ kind = "quest", quest = 8522, level = 1, faction = "Alliance", name = "The Alliance Needs Runecloth Bandages!" },
					{ kind = "quest", quest = 8524, level = 1, faction = "Alliance", name = "The Alliance Needs Rainbow Fin Albacore!" },
					{ kind = "quest", quest = 8526, level = 1, faction = "Alliance", name = "The Alliance Needs Roast Raptor!" },
					{ kind = "quest", quest = 8528, level = 1, faction = "Alliance", name = "The Alliance Needs Spotted Yellowtail!" },
					{ kind = "quest", quest = 108850, level = 50, faction = "Alliance", name = "Complete the War Effort", after = { "q8492", "q8494", "q8499", "q8503", "q8505", "q8509", "q8511", "q8513", "q8515", "q8517", "q8520", "q8522", "q8524", "q8526", "q8528" }, note = "Field Marshal Snowfall in Ironforge. Bring him the commendation signets your deliveries earn; he tells you how many are still needed." },
					{ kind = "quest", quest = 8532, level = 1, faction = "Horde", name = "The Horde Needs Copper Bars!" },
					{ kind = "quest", quest = 8542, level = 1, faction = "Horde", name = "The Horde Needs Tin Bars!" },
					{ kind = "quest", quest = 8545, level = 1, faction = "Horde", name = "The Horde Needs Mithril Bars!" },
					{ kind = "quest", quest = 8549, level = 1, faction = "Horde", name = "The Horde Needs Peacebloom!" },
					{ kind = "quest", quest = 8580, level = 1, faction = "Horde", name = "The Horde Needs Firebloom!" },
					{ kind = "quest", quest = 8582, level = 1, faction = "Horde", name = "The Horde Needs Purple Lotus!" },
					{ kind = "quest", quest = 8588, level = 1, faction = "Horde", name = "The Horde Needs Heavy Leather!" },
					{ kind = "quest", quest = 8590, level = 1, faction = "Horde", name = "The Horde Needs Thick Leather!" },
					{ kind = "quest", quest = 8600, level = 1, faction = "Horde", name = "The Horde Needs Rugged Leather!" },
					{ kind = "quest", quest = 8604, level = 1, faction = "Horde", name = "The Horde Needs Wool Bandages!" },
					{ kind = "quest", quest = 8607, level = 1, faction = "Horde", name = "The Horde Needs Mageweave Bandages!" },
					{ kind = "quest", quest = 8609, level = 1, faction = "Horde", name = "The Horde Needs Runecloth Bandages!" },
					{ kind = "quest", quest = 8611, level = 1, faction = "Horde", name = "The Horde Needs Lean Wolf Steaks!" },
					{ kind = "quest", quest = 8613, level = 1, faction = "Horde", name = "The Horde Needs Spotted Yellowtail!" },
					{ kind = "quest", quest = 8615, level = 1, faction = "Horde", name = "The Horde Needs Baked Salmon!" },
					{ kind = "quest", quest = 108855, level = 50, faction = "Horde", name = "Complete the War Effort", after = { "q8532", "q8542", "q8545", "q8549", "q8580", "q8582", "q8588", "q8590", "q8600", "q8604", "q8607", "q8609", "q8611", "q8613", "q8615" }, note = "Warlord Gorchuk in Orgrimmar. Bring him the commendation signets your deliveries earn; he tells you how many are still needed." },
				},
			},
			{
				title = "The Scarab Gong",
				steps = {
					{ kind = "item", item = 9240, name = "Mallet of Zul'Farrak", note = "Take the Sacred Mallet from Qiaga the Keeper in Jintha'Alor (The Hinterlands) and use it at the Altar of Zul there." },
					{ kind = "quest", quest = 108743, level = 60, name = "Simply Bang a Gong!", after = { "i9240" }, afterAny = { "q108850", "q108855" }, advances = 4, note = "Ring the Scarab Gong in Silithus with the Mallet of Zul'Farrak in your bags. If you did the Scepter of the Shifting Sands chain, Bang a Gong! does the same." },
				},
			},
		},
	},
	[4] = {
		stage = 4, name = "The War in Silithus", era = 0, goal = "Win the war outside Ahn'Qiraj: kill Lieutenant General Nokhor.", next = 5,
		sections = {
			{
				title = "Jonathan the Revelator", note = "Jonathan the Revelator stands at the Scarab Gong in Silithus.",
				steps = {
					{ kind = "quest", quest = 108745, level = 60, name = "Colossus of Zora", afterAny = { "q108743", "q8743" }, note = "Kill the Colossus of Zora. A raid quest: it counts while you're in a raid group." },
					{ kind = "quest", quest = 108746, level = 60, name = "Colossus of Regal", afterAny = { "q108743", "q8743" }, note = "Kill the Colossus of Regal. A raid quest: it counts while you're in a raid group." },
					{ kind = "quest", quest = 108747, level = 60, name = "Colossus of Ashi", afterAny = { "q108743", "q8743" }, note = "Kill the Colossus of Ashi. A raid quest: it counts while you're in a raid group." },
					{ kind = "quest", quest = 108744, level = 60, name = "Chaos and Destruction", after = { "q108745", "q108746", "q108747" }, advances = 5, note = "Kill Lieutenant General Nokhor near the hives, then return to Jonathan the Revelator at the Scarab Gong." },
				},
			},
		},
	},
	[5] = {
		stage = 5, name = "Temple of Ahn'Qiraj", era = 0, goal = "Defeat C'Thun in the Temple of Ahn'Qiraj.", next = 6,
		sections = {
			{ title = "Temple of Ahn'Qiraj", raid = 531, milestone = "C'Thun" },
		},
	},
	[6] = {
		stage = 6, name = "Naxxramas", era = 0, goal = "Defeat Kel'Thuzad in the 40 player Naxxramas.", next = 7,
		sections = {
			{
				title = "Attunement",
				steps = {
					{ kind = "rep", rep = 529, standing = 6, name = "Argent Dawn: Honored", note = "Argent Dawn turn-ins and Scourge kills in the Plaguelands raise it." },
					{ kind = "quest", quest = 9121, also = { 9122, 9123 }, level = 60, rep = 529, standing = 6, name = "The Dread Citadel - Naxxramas", after = { "rep529" }, note = "Archmage Angela Dosantos at Light's Hope Chapel. At Honored it costs 5 Arcane Crystals, 2 Nexus Crystals, a Righteous Orb and 60 gold; it costs less at Revered and Exalted." },
				},
			},
			{ title = "Naxxramas", note = "Enter with the Teleport to Naxxramas runestone under the floating citadel in Plaguewood, Eastern Plaguelands.", raid = 533, players = 40, milestone = "Kel'Thuzad", requires = { "q9121" } },
		},
	},
	[7] = {
		stage = 7, name = "Into the Breach", era = 0, goal = "Help hold the Dark Portal in the Blasted Lands.", next = 8,
		sections = {
			{
				title = "The Dark Portal",
				steps = {
					{ kind = "quest", quest = 10259, level = 55, name = "Into the Breach", advances = 8, note = "Kill the invading Felguards at the Dark Portal. Outland opens for you once it's done." },
				},
			},
		},
	},
	[8] = {
		stage = 8, name = "Karazhan", era = 1, goal = "Defeat Prince Malchezaar in Karazhan.", next = 9,
		sections = {
			{
				title = "Get ready",
				steps = {
					{ kind = "level", level = 70, name = "Reach level 70", note = "Outland is open, and the level cap is 70 until you reach progression stage 13." },
					{ kind = "gear", name = "Gear check: item level 110", ilvl = 110, recommended = true, note = "Blue gear from Outland's level 70 dungeons and quest rewards gets you there." },
				},
			},
			{ title = "Karazhan", raid = 532, milestone = "Prince Malchezaar" },
		},
	},
	[9] = {
		stage = 9, name = "Tempest Keep", era = 1, goal = "Defeat Kael'thas Sunstrider in The Eye.", next = 10,
		sections = {
			{
				title = "The Tempest Key", note = "Starts in Shadowmoon Valley: the Hand of Gul'dan, then Oronok Torn-heart and his sons.",
				steps = {
					{ kind = "quest", quest = 10680, level = 68, faction = "Alliance", name = "The Hand of Gul'dan" },
					{ kind = "quest", quest = 10681, level = 68, faction = "Horde", name = "The Hand of Gul'dan" },
					{ kind = "quest", quest = 10458, level = 68, name = "Enraged Spirits of Fire and Earth", afterAny = { "q10680", "q10681" } },
					{ kind = "quest", quest = 10480, level = 68, name = "Enraged Spirits of Water", after = { "q10458" } },
					{ kind = "quest", quest = 10481, level = 68, name = "Enraged Spirits of Air", after = { "q10480" } },
					{ kind = "quest", quest = 10513, level = 68, name = "Oronok Torn-heart", after = { "q10481" } },
					{ kind = "quest", quest = 10514, level = 68, name = "I Was A Lot Of Things...", after = { "q10513" } },
					{ kind = "quest", quest = 10515, level = 68, name = "A Lesson Learned", after = { "q10514" } },
					{ kind = "quest", quest = 10519, level = 68, name = "The Cipher of Damnation - Truth and History", after = { "q10515" } },
					{ kind = "quest", quest = 10521, level = 68, name = "Grom'tor, Son of Oronok", after = { "q10519" } },
					{ kind = "quest", quest = 10522, level = 68, name = "The Cipher of Damnation - Grom'tor's Charge", after = { "q10521" } },
					{ kind = "quest", quest = 10523, level = 68, name = "The Cipher of Damnation - The First Fragment Recovered", after = { "q10522" } },
					{ kind = "quest", quest = 10527, level = 68, name = "Ar'tor, Son of Oronok", after = { "q10519" } },
					{ kind = "quest", quest = 10528, level = 68, name = "Demonic Crystal Prisons", after = { "q10527" } },
					{ kind = "quest", quest = 10537, level = 68, name = "Lohn'goron, Bow of the Torn-heart", after = { "q10528" } },
					{ kind = "quest", quest = 10540, level = 68, name = "The Cipher of Damnation - Ar'tor's Charge", after = { "q10537" } },
					{ kind = "quest", quest = 10541, level = 68, name = "The Cipher of Damnation - The Second Fragment Recovered", after = { "q10540" } },
					{ kind = "quest", quest = 10546, level = 68, name = "Borak, Son of Oronok", after = { "q10519" } },
					{ kind = "quest", quest = 10547, level = 68, name = "Of Thistleheads and Eggs...", after = { "q10546" } },
					{ kind = "quest", quest = 10550, level = 68, name = "The Bundle of Bloodthistle", after = { "q10547" } },
					{ kind = "quest", quest = 10570, level = 68, name = "To Catch A Thistlehead", after = { "q10550" } },
					{ kind = "quest", quest = 10576, level = 68, name = "The Shadowmoon Shuffle", after = { "q10570" } },
					{ kind = "quest", quest = 10577, level = 68, name = "What Illidan Wants, Illidan Gets...", after = { "q10576" } },
					{ kind = "quest", quest = 10578, level = 68, name = "The Cipher of Damnation - Borak's Charge", after = { "q10577" } },
					{ kind = "quest", quest = 10579, level = 68, name = "The Cipher of Damnation - The Third Fragment Recovered", after = { "q10578" } },
					{ kind = "quest", quest = 10588, level = 68, name = "The Cipher of Damnation", after = { "q10523", "q10541", "q10579" } },
					{ kind = "quest", quest = 10883, level = 70, name = "The Tempest Key", after = { "q10588" } },
				},
			},
			{
				title = "Heroic keys",
				steps = {
					{ kind = "item", item = 30622, faction = "Alliance", name = "Flamewrought Key", note = "Honored with Honor Hold. Opens the heroic Hellfire Citadel dungeons." },
					{ kind = "item", item = 30637, faction = "Horde", name = "Flamewrought Key", note = "Honored with Thrallmar. Opens the heroic Hellfire Citadel dungeons." },
					{ kind = "item", item = 30623, name = "Reservoir Key", note = "Honored with the Cenarion Expedition. Opens the heroic Coilfang Reservoir dungeons." },
					{ kind = "item", item = 30633, name = "Auchenai Key", note = "Honored with Lower City. Opens the heroic Auchindoun dungeons." },
					{ kind = "item", item = 30634, name = "Warpforged Key", note = "Honored with The Sha'tar. Opens the heroic Tempest Keep dungeons." },
				},
			},
			{
				title = "Trials of the Naaru", note = "A'dal in Shattrath City. All three trials must be done in heroic dungeons.",
				steps = {
					{ kind = "quest", quest = 10884, level = 70, name = "Trial of the Naaru: Mercy", after = { "q10883", "i30622", "i30637" }, note = "Heroic Shattered Halls: the Unused Axe of the Executioner." },
					{ kind = "quest", quest = 10885, level = 70, name = "Trial of the Naaru: Strength", after = { "q10883", "i30623", "i30633" }, note = "Kalithresh's Trident from heroic Steamvault and Murmur's Essence from heroic Shadow Labyrinth." },
					{ kind = "quest", quest = 10886, level = 70, name = "Trial of the Naaru: Tenacity", after = { "q10883", "i30634" }, note = "Rescue Millhouse Manastorm in the heroic Arcatraz." },
					{ kind = "quest", quest = 10888, level = 70, name = "Trial of the Naaru: Magtheridon", after = { "q10884", "q10885", "q10886" }, note = "Kill Magtheridon in Magtheridon's Lair. On this realm it gives the Tempest Key." },
					{ kind = "item", item = 31704, name = "The Tempest Key", after = { "q10888" }, note = "Keep it in your bags: The Eye checks your bags for it, and for Trial of the Naaru: Magtheridon." },
				},
			},
			{ title = "The Eye", note = "Kael'thas's doors open once the other bosses are dead (the realm's default).", raid = 550, milestone = "Kael'thas Sunstrider", requires = { "q10888", "i31704" } },
		},
	},
	[10] = {
		stage = 10, name = "Black Temple", era = 1, goal = "Defeat Illidan Stormrage in the Black Temple.", next = 12,
		sections = {
			{
				title = "Serpentshrine Cavern", note = "Serpentshrine Cavern only lets you in once you have done The Cudgel of Kar'desh.",
				steps = {
					{ kind = "item", item = 30623, name = "Reservoir Key", note = "Honored with the Cenarion Expedition. The Cudgel is handed in inside the heroic Slave Pens." },
					{ kind = "rep", rep = 967, standing = 6, name = "The Violet Eye: Honored", note = "Karazhan's trash and bosses raise it. The Nightbane chain needs it." },
					{ kind = "quest", quest = 9630, level = 70, rep = 967, standing = 6, name = "Medivh's Journal", after = { "rep967" } },
					{ kind = "quest", quest = 9638, level = 70, rep = 967, standing = 6, name = "In Good Hands", after = { "q9630" } },
					{ kind = "quest", quest = 9639, level = 70, rep = 967, standing = 6, name = "Kamsis", after = { "q9638" } },
					{ kind = "quest", quest = 9640, level = 70, rep = 967, standing = 6, name = "The Shade of Aran", after = { "q9639" } },
					{ kind = "quest", quest = 9645, level = 70, rep = 967, standing = 6, name = "The Master's Terrace", after = { "q9640" } },
					{ kind = "quest", quest = 9680, level = 70, rep = 967, standing = 6, name = "Digging Up the Past", after = { "q9645" } },
					{ kind = "quest", quest = 9631, level = 70, rep = 967, standing = 6, name = "A Colleague's Aid", after = { "q9680" } },
					{ kind = "quest", quest = 9637, level = 70, rep = 967, standing = 6, name = "Kalynna's Request", after = { "q9631" } },
					{ kind = "quest", quest = 9644, level = 70, rep = 967, standing = 6, name = "Nightbane", after = { "q9637" }, note = "Gives the Blackened Urn: use it on the Master's Terrace in Karazhan to summon Nightbane." },
					{ kind = "quest", quest = 10900, level = 70, name = "The Mark of Vashj", note = "Skar'this the Heretic, inside the heroic Slave Pens." },
					{ kind = "quest", quest = 10901, level = 70, name = "The Cudgel of Kar'desh", after = { "q10900", "i30623", "q9644" }, note = "Bring Skar'this the Earthen Signet (Gruul, Gruul's Lair) and the Blazing Signet (Nightbane, Karazhan)." },
				},
			},
			{ title = "Serpentshrine Cavern", note = "Lady Vashj drops Vashj's Vial Remnant for The Vials of Eternity. Her console only works once the other bosses are dead (the realm's default).", raid = 548, milestone = "Lady Vashj", requires = { "q10901" } },
			{
				title = "Mount Hyjal",
				steps = {
					{ kind = "quest", quest = 10445, level = 70, name = "The Vials of Eternity", after = { "q10901" }, note = "Soridormi in the Caverns of Time wants Vashj's Vial Remnant (Lady Vashj) and Kael's Vial Remnant (Kael'thas, The Eye). It opens the Battle for Mount Hyjal." },
				},
			},
			{
				title = "The Medallion of Karabor", note = "Starts with Tablets of Baa'ri in Shadowmoon Valley, for the Aldor or for the Scryers.",
				steps = {
					{ kind = "quest", quest = 10568, level = 68, rep = 932, standing = 5, name = "Tablets of Baa'ri", alt = "Aldor" },
					{ kind = "quest", quest = 10571, level = 68, rep = 932, standing = 5, name = "Oronu the Elder", alt = "Aldor", after = { "q10568" } },
					{ kind = "quest", quest = 10574, level = 68, rep = 932, standing = 5, name = "The Ashtongue Corruptors", alt = "Aldor", after = { "q10571" } },
					{ kind = "quest", quest = 10575, level = 68, rep = 932, standing = 5, name = "The Warden's Cage", alt = "Aldor", after = { "q10574" } },
					{ kind = "quest", quest = 10683, level = 68, rep = 934, standing = 5, name = "Tablets of Baa'ri", alt = "Scryers" },
					{ kind = "quest", quest = 10684, level = 68, rep = 934, standing = 5, name = "Oronu the Elder", alt = "Scryers", after = { "q10683" } },
					{ kind = "quest", quest = 10685, level = 68, rep = 934, standing = 5, name = "The Ashtongue Corruptors", alt = "Scryers", after = { "q10684" } },
					{ kind = "quest", quest = 10686, level = 68, rep = 934, standing = 5, name = "The Warden's Cage", alt = "Scryers", after = { "q10685" } },
					{ kind = "quest", quest = 10622, level = 68, name = "Proof of Allegiance", afterAny = { "q10575", "q10686" } },
					{ kind = "quest", quest = 10628, level = 68, name = "Akama", after = { "q10622" } },
					{ kind = "quest", quest = 10705, level = 68, name = "Seer Udalo", after = { "q10628" } },
					{ kind = "quest", quest = 10706, level = 68, name = "A Mysterious Portent", after = { "q10705" } },
					{ kind = "quest", quest = 10707, level = 68, name = "The Ata'mal Terrace", after = { "q10706" } },
					{ kind = "quest", quest = 10708, level = 68, name = "Akama's Promise", after = { "q10707" } },
					{ kind = "quest", quest = 10944, level = 70, name = "The Secret Compromised", after = { "q10708" } },
					{ kind = "quest", quest = 10946, level = 70, name = "Ruse of the Ashtongue", after = { "q10944" }, note = "Kill Al'ar in The Eye while wearing the Ashtongue Cowl." },
					{ kind = "quest", quest = 10947, level = 70, name = "An Artifact From the Past", after = { "q10946", "q10445" }, note = "Kill Rage Winterchill in the Battle for Mount Hyjal for the Time-Phased Phylactery." },
					{ kind = "quest", quest = 10948, level = 70, name = "The Hostage Soul", after = { "q10947" } },
					{ kind = "quest", quest = 10949, level = 70, name = "Entry Into the Black Temple", after = { "q10948" } },
					{ kind = "quest", quest = 10985, level = 70, name = "A Distraction for Akama", after = { "q10949" }, note = "Gives the Medallion of Karabor." },
					{ kind = "item", item = 32649, items = { 32649, 32757 }, name = "Medallion of Karabor", after = { "q10985" }, note = "Keep it in your bags: the Black Temple checks your bags for it." },
				},
			},
			{ title = "Black Temple", raid = 564, milestone = "Illidan Stormrage", requires = { "i32649" } },
		},
	},
	[12] = {
		stage = 12, name = "Sunwell Plateau", era = 1, goal = "Defeat Kil'jaeden in the Sunwell Plateau.", next = 13,
		sections = {
			{ title = "Sunwell Plateau", note = "The Isle of Quel'Danas is open to you now.", raid = 580, milestone = "Kil'jaeden" },
		},
	},
	[13] = {
		stage = 13, name = "Naxxramas", era = 2, goal = "Defeat Kel'Thuzad in Naxxramas.", next = 14,
		sections = {
			{
				title = "Get ready",
				steps = {
					{ kind = "level", level = 80, name = "Reach level 80", note = "Northrend is open, and the level cap is 80." },
					{ kind = "gear", name = "Gear check: item level 180", ilvl = 180, recommended = true, note = "Blue gear from Northrend's level 80 dungeons and crafted gear gets you there." },
				},
			},
			{ title = "Naxxramas", raid = 533, expansion = 2, milestone = "Kel'Thuzad", requires = { "lvl80" } },
		},
	},
	[14] = {
		stage = 14, name = "Ulduar", era = 2, goal = "Defeat Yogg-Saron in Ulduar.", next = 15,
		sections = {
			{ title = "Ulduar", raid = 603, milestone = "Yogg-Saron" },
		},
	},
	[15] = {
		stage = 15, name = "Trial of the Crusader", era = 2, goal = "Defeat Anub'arak in the Trial of the Crusader.", next = 16,
		sections = {
			{ title = "Trial of the Crusader", raid = 649, milestone = "Anub'arak" },
		},
	},
	[16] = {
		stage = 16, name = "Icecrown Citadel", era = 2, goal = "Defeat the Lich King in Icecrown Citadel.", next = 17,
		sections = {
			{ title = "Icecrown Citadel", raid = 631, milestone = "The Lich King" },
		},
	},
	[17] = {
		stage = 17, name = "The Ruby Sanctum", era = 2, goal = "Defeat Halion in the Ruby Sanctum.", next = 18,
		sections = {
			{ title = "The Ruby Sanctum", raid = 724, milestone = "Halion" },
		},
	},
}
