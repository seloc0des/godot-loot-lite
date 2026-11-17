# Upgrade to the full Loot

## What the full version adds
- **The rest of the no-code layer.** Lite's Setup tab wires drops on touch and on death, and its table tab edits each entry as a row (item, weight, count). The full version's dock also authors guaranteed, conditional and nested entries, adds a treasure chest that spawns loot on the ground, and ships the shared `EventTrigger` node to fire other gameplay (quest progress, saves, XP) without a script.

- **Nested tables.** An entry can be another `LootTable`. Bandit → "common drops" sub-table → "weapons" sub-table.
- **Conditional entries.** Drop only if a flag is set, the biome matches, the player is above a level, etc.
- **Guaranteed entries.** Drops independent of the weight roll. Bosses always drop their key item.
- **Magic find.** A multiplier on rare-tagged entries' weights, sourced from a stat or a passed-in value.
- **Pity counter.** Track unsuccessful drops, force a guaranteed roll after N. Persists across save/load.
- **`LootDropSource` Node.** Lite's `LootDrop` plus magic find, pity counters, a set inventory to fill, and `WorldDrop` scenes it can spawn instead.
- **`WorldDrop` Area2D scene.** Auto-collects through the duck-typed inventory contract.
- **Save contract.** Pity counters and one-shot `has_dropped` flags persist.
- **Inventory addon bridge.** `loot_collected` events fire on the shared bus.

## Migration from Lite

The full table is a different resource. A Lite table is a `LootTableLite` whose entries are dictionaries (`item`, `weight`, `min`, `max`). The full `LootTable` holds `LootEntry` resources (`item`, `weight`, `min_count`, `max_count`), so a Lite `.tres` doesn't load as a full table. Rebuild each table in the full dock. In code, `roll` takes the `rng` as a required argument in the full version.

Your `LootDrop` nodes keep working while Loot (Lite) stays installed next to the full version. To move a chest or an enemy to the full version, delete its `LootDrop` and apply the full version's Setup tab to the same node, so it doesn't drop twice. The full version reuses the `LootArea` that's already there.

## Where to buy

The full version is on itch.io: **https://selodev.itch.io/godot-loot-system**.

## License

MIT.
