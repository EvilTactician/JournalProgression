# Journal: Progression

A World of Warcraft 3.3.5a addon that adds a **Progression** tab to the
[Journal](https://github.com/buildthehomelab/wow-mod-forever-journal) (mod-forever-journal), for realms
running [mod-individual-progression](https://github.com/Grimfeather/mod-individual-progression).

It shows the progression stage your character is at and, in order, everything to do there to reach the
next one:

- **Levels**: reach 60, then 70 once Outland opens, then 80 once Northrend opens.
- **Attunements and keys**, with their full quest chains in the order you do them, including earlier
  quests: the Drakefire Amulet for Onyxia, the Tempest Key and the Trials of the Naaru for The Eye, the
  Cudgel of Kar'desh for Serpentshrine Cavern, the Vials of Eternity for Mount Hyjal, the Medallion of
  Karabor for the Black Temple, and the rest.
- **Reputation** a step needs, such as Hydraxian Waterlords for Molten Core's runes, Argent Dawn for
  Naxxramas, and The Violet Eye for the Nightbane chain.
- **Each raid's bosses** in order, down to the one whose kill moves you to the next stage.
- **A gear check** before the first raid of each expansion: a suggested average item level, your own,
  and the slots worth upgrading first.

Every quest shows who gives it and where. Click a step for its objectives and a button that flags the
quest giver or the raid entrance on your map. Shift-click a quest or item to link it in chat.

Open it with `/progression`, or from the Journal's tabs (between Raids and Quests). With DragonUI it
can also have its own micro menu button (see [DragonUI](#dragonui)).

## What each step shows

| Status | Meaning |
| --- | --- |
| **Next** | The first step still to do. It's highlighted, so you always know where to go. |
| Done | Turned in, in your bags, reached or killed. |
| Not needed now | A step you skipped because the realm gave you a later one (for example, with `AutoAttune`). |
| Ready to turn in / In your quest log | From your own quest log. |
| First: *quest* | An earlier step comes first. |
| Needs level *N* / Needs *faction*: *standing* | You don't meet the quest's requirements yet. |
| Opens at stage *N* | Your progression stage keeps it locked. |
| In your bank: carry it | You own the key or amulet, but the realm checks your bags when you enter. |
| Killed this lockout | A boss you've killed since the last raid reset. |
| Optional / Recommended | Not needed to move on: bosses after the milestone, shortcuts and the gear check. |

Steps for the other faction are hidden. The Aldor and Scryers routes both show until you start one;
after that only your side's steps show. **Hide steps I've done** removes finished steps from the list.

## Stages

The stage you're at opens by default, and the tab switches to the next stage as soon as you reach it.
The list on the left has every stage, grouped by expansion, so you can look back or plan ahead.

| Stage | What moves you on |
| --- | --- |
| 0 | Ragnaros, Molten Core |
| 1 | Onyxia, Onyxia's Lair (40 player) |
| 2 | Nefarian, Blackwing Lair |
| 3 | Ringing the Scarab Gong in Silithus |
| 4 | Lieutenant General Nokhor, the war in Silithus |
| 5 | C'Thun, Temple of Ahn'Qiraj |
| 6 | Kel'Thuzad, Naxxramas (40 player) |
| 7 | Into the Breach, at the Dark Portal |
| 8 | Prince Malchezaar, Karazhan |
| 9 | Kael'thas Sunstrider, The Eye |
| 10 | Illidan Stormrage, Black Temple |
| 12 | Kil'jaeden, Sunwell Plateau |
| 13 | Kel'Thuzad, Naxxramas |
| 14 | Yogg-Saron, Ulduar |
| 15 | Anub'arak, Trial of the Crusader |
| 16 | The Lich King, Icecrown Citadel |
| 17 | Halion, The Ruby Sanctum |

## Requirements

- **[mod-forever-journal](https://github.com/buildthehomelab/wow-mod-forever-journal)**: the Journal
  addon on your client and the module on the realm. The tab gets your stage, quest givers, quest states,
  objectives, map flags, and raid bosses and lockouts from it. It also works with
  [EvilTactician's fork](https://github.com/EvilTactician/wow-mod-forever-journal), which has extra
  bugfixes.
- **[mod-individual-progression](https://github.com/Grimfeather/mod-individual-progression)** on the
  realm. Without it, the tab says the realm doesn't track progression.
- **[DragonUI](https://github.com/EvilTactician/wow-addon-DragonUI)** (optional), this fork, for the
  item level used by the gear check, its GearScore, and the micro menu button.

Nothing needs installing on the server beyond those two modules.

## Installation

**[Download the latest version](https://github.com/EvilTactician/JournalProgression/archive/refs/heads/main.zip)**

1. Open the downloaded `JournalProgression-main.zip`. Inside is a folder called `JournalProgression-main`,
   and inside that is the `JournalProgression` folder: that's the one you need. The outer folders are
   just GitHub's packaging.
2. Copy that inner `JournalProgression` folder into `World of Warcraft\Interface\AddOns`. It must keep
   that exact name, so `Interface\AddOns\JournalProgression\JournalProgression.toc` is where the files
   end up, not inside a `JournalProgression-main` folder.
3. Make sure **Journal** is installed and enabled.
4. Restart the game. A `/reload` isn't enough the first time, because the game only finds new addons
   when it starts.

## DragonUI

When DragonUI is installed:

- **The gear check** uses DragonUI's average item level, so it matches the number in its character
  panel, and shows its GearScore beside it. Without DragonUI, the tab works out the average item level
  itself.
- **A Progression micro button** opens and closes the Journal on this tab. It sits after the Dungeon
  Finder button, uses DragonUI's look (including grayscale mode), and fades with the micro menu.

The micro button needs [this fork of DragonUI](https://github.com/EvilTactician/wow-addon-DragonUI),
which lets other addons add buttons to the micro menu (`DragonUI.RegisterMicroButton`). The fork also
adds a **Micro Menu Buttons** section to DragonUI's micro menu options, where you can show or hide any
button, Progression included. With another DragonUI there's simply no button; the gear check and
everything else still work.

## Customising the steps

The steps live in `Tiers.lua`. It's plain data with its format described at the top, so you can change
a note, a suggested item level, or a step for your realm without touching the code. The quest chains
were worked out from AzerothCore's quest tables (each quest's prerequisites and follow-ups), with
mod-individual-progression's own quests and changes added by hand.

The suggested item levels are rules of thumb:

| Before | Item level | Typically from |
| --- | --- | --- |
| Molten Core | 55 | Level 60 dungeon blues (Blackrock Depths, Stratholme, Scholomance, Blackrock Spire) |
| Karazhan | 110 | Outland level 70 dungeon blues and quest rewards |
| Naxxramas (level 80) | 180 | Northrend level 80 dungeon blues and crafted gear |

## Things to know

- **Reputation** is read by faction name, so on a non-English client the reputation steps rely on what
  the realm reports for each quest.
- **Raid bosses** before the final one show as killed only for the current lockout, since that's all
  the realm keeps.
- **Realm settings** aren't visible to an addon. The steps assume mod-individual-progression's
  defaults, such as dousing Molten Core's runes by hand (`MoltenCore.ManualRuneHandling`). If your
  realm changes them, edit `Tiers.lua` to match.
- **Journal updates:** the tab uses the Journal's widgets and data functions, so a large Journal
  update may need a matching update here.

## Credits

- [mod-forever-journal](https://github.com/buildthehomelab/wow-mod-forever-journal), the Journal this
  tab lives in.
- [mod-individual-progression](https://github.com/Grimfeather/mod-individual-progression), the
  progression stages, their attunements and the quests it adds.
- [AzerothCore](https://www.azerothcore.org/) for the quest data the chains were built from.
- [DragonUI](https://github.com/NeticSoul/DragonUI) by NeticSoul, for the item level, GearScore and
  micro menu.
