# Quick Start

## Make something drop loot (no code)

Enable the plugin and open the **Loot · Setup** tab.

1. Pick **Drops when the player touches this** or **Drops when this dies**.
2. Select the node in your scene (the chest, the enemy) and pick a table. Your tables in `res://loot` are listed first, then the demo's examples. **New starter table…** makes a two-entry table (Coin and Gem) in `res://loot` and picks it.
3. Press **Apply**, then Play.

**Touch:** walk the player into the node. Touch only reacts to the node in the `player` group. If nothing is marked yet, Apply says so, and **Make the selected node the player** in the same tab marks the node you have selected. A node that isn't an Area with a collision shape gets a `LootArea` around it.

**Dies:** the loot drops when the node, or anything under it, sends `died`, such as the Combat pack's Health. Apply warns you when nothing there sends it.

Either way, the loot goes into the player's bag when the player has one, and a message such as "Found: Gold x5, Gem" shows at the top of the screen for about two seconds. With no bag, the message still shows.

The `LootDrop` node Apply adds has these in the Inspector:

| Field | Notes |
|---|---|
| **Table** | The table it rolls. |
| **Trigger** | When the player touches it, or when it dies. |
| **Once** | On: it drops the first time only. |
| **Show Messages** | Off: no message on screen. |
| **Bag Path** | Optional. Leave it empty and it finds the player's bag. |

## Author a table

Open the **Loot Tables (Lite)** tab. It lists the tables in `res://loot`.

- **New** makes `new_table.tres` (then `new_table_2.tres`, ...) with an id to start from, and opens it in the Inspector. **Dup** and **Del** copy and delete the selected table.
- **Rolls** is how many picks it makes per drop.
- **Entries** lists one row per entry. Pick the row's item, then set **Weight** (its chance against the other rows), **Min** and **Max** (how many drop when it's picked). **Add row** adds an empty row and **Remove** takes one out.
- The item picker lists your items in `res://items` first, then the demo's as examples. An item kept inside the table itself, like the starter table's Coin and Gem, shows as "(in this table)".
- **New item** makes `res://items/new_item.tres` (then `new_item_2.tres`, ...), gives it a row, and opens it in the Inspector so you can name it and pick an icon. With Inventory (Lite) installed, it's an Inventory item, so it stacks in that bag.
- Press **Save** to write the table. A rename you make in the Inspector while the table is open here is kept when you Save.

## From code (optional)

Build a table:

```gdscript
var table := LootTableLite.new()
table.entries = [
    LootTableLite.entry(apple, 50, 1, 3),   # 50/100 weight, drops 1–3
    LootTableLite.entry(gold,  30, 5, 25),
    LootTableLite.entry(ring,  15),         # weight 15, drops 1 (default min/max)
    LootTableLite.entry(gem,    5),
]
table.rolls = 1
```

Roll it:

```gdscript
var drops := table.roll()
# [{item: <Resource>, count: <int>}, ...]

for d in drops:
    inventory.add_item(d.item, d.count)  # if you have Inventory Lite installed
```

Or make a `LootDrop` node drop right now, the same as a touch or a death:

```gdscript
$Chest/LootDrop.drop()
```

### Deterministic rolls (for tests)

Pass your own `RandomNumberGenerator`:

```gdscript
var rng := RandomNumberGenerator.new()
rng.seed = 12345
var drops := table.roll(rng)  # same seed = same drops
```
