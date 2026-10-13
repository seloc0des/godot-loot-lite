# Loot (Lite)

**FREE.** Weighted loot tables for Godot 4.5+, with chests and enemies that drop them, set up in the editor. Pure GDScript. MIT.

The working core of the [selodev Loot addon](docs/upgrade.md). One `LootTableLite` Resource per drop source. A chest or an enemy rolls it, and the loot goes into the player's bag.

> **New in v1.1: no-code dock.** Enable the plugin and an authoring panel appears: create, duplicate and delete your tables, set their rolls, and edit each entry as a row: pick the item, set its weight and how many drop. (The Pro tier adds guaranteed, conditional and nested entries.)

## One-click setup (no code)

Enable the plugin and a **Loot · Setup** tab appears in the editor.

1. Pick how it drops: **Drops when the player touches this** (a chest, a pile of coins) or **Drops when this dies** (an enemy).
2. Select the node in your scene and pick a table. Your tables in `res://loot` come first, then the demo's examples. If you have none yet, **New starter table…** makes one and picks it.
3. Press **Apply**, then Play.

Apply adds a `LootDrop` node (a `LootDropLite`) to the node you picked. When it fires, it rolls the table, puts the loot in the player's bag if the player has one, and shows a short message at the top of the screen, such as "Found: Gold x5, Gem". Inventory (Lite)'s bag works, and so does any node on the player with `add_item`, `remove_item` and `count_item`. With no bag, the message still shows.

- **Touch** only reacts to the node in the `player` group. If nothing in your scene is marked yet, Apply says so: select your player and press **Make the selected node the player**. A node that isn't an Area with a collision shape gets a `LootArea` around it to walk into.
- **Dies** listens for a `died` signal on the node or anything under it, such as the Combat pack's Health. If there's none, Apply tells you it needs one.

It drops once by default. In the Inspector, untick **Once** to drop every time, or **Show Messages** to drop quietly. Re-pick and Apply again to change it: it updates the same node.

## 5-minute install

1. Copy `addons/loot_lite/` into your project's `addons/` folder.
2. Project → Project Settings → Plugins → enable **Loot (Lite)**.
3. Use the **Loot · Setup** tab above. To change a table's items, weights and counts, open the **Loot Tables (Lite)** tab and select the table. Each entry is a row: pick its item, set **Weight**, **Min** and **Max**, or press **Add row**, **New item** or **Remove**. Then press **Save**.

### From code (optional)

`drop()` on a `LootDrop` node does what a touch or a death does: `$Chest/LootDrop.drop()`. A table can also be built and rolled by hand:

```gdscript
var table := LootTableLite.new()
table.entries = [
    LootTableLite.entry(apple, 50, 1, 3),
    LootTableLite.entry(gold,  30, 5, 25),
    LootTableLite.entry(ring,  15),
    LootTableLite.entry(gem,    5),
]
table.rolls = 2  # two picks per roll

var drops := table.roll()  # [{item: <Resource>, count: <int>}, ...]
```

## What's missing (and why)

| Feature | Tier |
|---|---|
| Nested `LootTable` entries (roll into another table) | Pro |
| Conditional entries (flags, biome, kill count) | Pro |
| Guaranteed entries (no weight roll) | Pro |
| Magic find boost on rare entries | Pro |
| Pity counter (guaranteed drop after N misses) | Pro |
| Deterministic RNG seed override | Pro |
| Loot you see on the ground and pick up (`WorldDrop`) | Pro |
| Remembering which chests already dropped, across save and load | Pro |
| `loot_rolled` / `loot_dropped` events on the shared bus for the other packs | Pro |

See [docs/upgrade.md](docs/upgrade.md).

## License

MIT.


## Part of a family

This is one free tier from the selodev catalog of no-code Godot 4 systems. They share an item contract and a save contract, so they plug into each other, and each one also works fully on its own.

Free systems:

- [Inventory Lite](https://github.com/seloc0des/godot-inventory-lite)
- [Equipment Lite](https://github.com/seloc0des/godot-equipment-lite)
- [Loot Lite](https://github.com/seloc0des/godot-loot-lite)
- [Crafting Lite](https://github.com/seloc0des/godot-crafting-lite)
- [Vendor Lite](https://github.com/seloc0des/godot-vendor-lite)
- [Quests Lite](https://github.com/seloc0des/godot-quests-lite)
- [Stats / Skills Lite](https://github.com/seloc0des/godot-stats-skills-lite)
- [Save / Load Lite](https://github.com/seloc0des/godot-save-load-lite)
- [Dialogue Lite](https://github.com/seloc0des/godot-dialogue-lite)
- [Combat Lite](https://github.com/seloc0des/godot-combat-lite)
- [Controller Lite](https://github.com/seloc0des/godot-controller-lite)
- [Enemy AI Lite](https://github.com/seloc0des/godot-enemy-ai-lite)
- [Scene Flow Lite](https://github.com/seloc0des/godot-scene-flow-lite)
- [Audio Lite](https://github.com/seloc0des/godot-audio-lite)
- [Level Builder Lite](https://github.com/seloc0des/godot-level-builder-lite)
- [Weather System Lite](https://github.com/seloc0des/godot-weather-lite)
- [Settings + Menus](https://github.com/seloc0des/godot-settings-menus) (complete and free, no paid tier)

Free VFX: [Magic Cast](https://github.com/seloc0des/godot-magic-cast-vfx-lite), [Elemental Impact](https://github.com/seloc0des/godot-elemental-impact-vfx-lite), [Explosion](https://github.com/seloc0des/godot-explosion-vfx-lite), [Pickup, Buff & Heal](https://github.com/seloc0des/godot-pickup-buff-vfx-lite).

Free starter projects: [Free Starter](https://github.com/seloc0des/free-starter-godot), [Dungeon](https://github.com/seloc0des/godot-dungeon-starter), [Survival](https://github.com/seloc0des/godot-survival-starter), [RPG](https://github.com/seloc0des/godot-rpg-starter).

The full versions add drop-in UI, editor docks and the cross-system wiring. They're on itch.io: **https://selodev.itch.io**
