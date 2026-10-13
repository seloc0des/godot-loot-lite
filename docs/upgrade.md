# Upgrade to Loot (Pro)

## What Pro adds
- **The rest of the no-code layer.** Lite's Setup tab wires drops on touch and on death, and its table tab edits each entry as a row (item, weight, count). Pro's dock also authors guaranteed, conditional and nested entries, adds a treasure chest that spawns loot on the ground, and ships the shared `EventTrigger` node to fire other gameplay (quest progress, saves, XP) without a script.

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

Same entry shape (`item`, `weight`, `min`, `max`), same `roll(rng)` signature. The Lite table is a Pro table missing only the conditional / nested fields. Drop your `.tres` files into the Pro project and they work as a fallback weighted-only table.

Your `LootDrop` nodes keep working while Loot (Lite) stays installed next to Pro. To move a chest or an enemy to Pro, delete its `LootDrop` and apply Pro's Setup tab to the same node, so it doesn't drop twice. Pro reuses the `LootArea` that's already there.

## Where to buy

The full version is on itch.io: **https://selodev.itch.io**. It keeps the same
field names and method signatures, so moving up from Lite is a drop-in swap.

## License

MIT.
