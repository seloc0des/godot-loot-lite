# Changelog

## 1.3.3 (2026-10-12)

The tabs show their names on Godot 4.5.

- **The Loot · Setup and Loot Tables (Lite) tabs were blank on Godot 4.5.** Their tabs beside the
  Inspector had no title, so "open the Loot · Setup tab" pointed at nothing. They are named when the
  pack switches on now. Godot 4.7 was not affected.

## 1.3.2 (2026-09-28)

Lists that stay readable, and an honest Setup message.

- **The Loot Tables (Lite) list always shows about five rows**, at any editor scale. At 125% it came
  out a few rows tall. The divider under it still drags.
- **The Setup message only promises the player's bag when there is one.** Without a bag it says a
  message shows what dropped.
- **A file the tab makes is registered with Godot as soon as it's written**, so pressing Play
  straight away can't warn "invalid UID".

## 1.3.1 (2026-09-27)

Both tabs fit a default dock.

- **The Setup and authoring tabs fit a default dock.** A tab taller than the dock scrolls, and lists
  show what you just made the next time they open.

## 1.3.0 (2026-09-26)

Loot you can use without writing code.

- **Drops with no code.** "Drops when the player touches this" and "Drops when this dies" roll the
  table and give what drops to the player's bag, with a short message on screen ("Found: Gold x5,
  Gem"). A full bag says what didn't fit.
- **Table entries are edited as rows** in the Loot Tables (Lite) tab: pick the item from a list and
  set its weight, min and max. New item makes one for you. Nobody types dictionary keys in the
  Inspector any more.
- **The Loot Tables (Lite) tab shows its fields in the editor.** It was empty there.
- **New in the tab names the table** and opens it in the Inspector, and Inspector edits survive the
  tab's Save.
- An example table and four example items in the demo. The old "Rolls per drop" field is gone,
  rolls live on the table. LootSource markers from 1.2 do nothing now and can be deleted.
- **Pressing Play right after Apply includes what it added.** The Setup tab never marked the scene
  as changed, so Play ran the saved version without it.
- **Saving in the Loot Tables (Lite) tab keeps your scenes linked to the file** instead of leaving
  them an orphaned copy.
- **Nodes the Setup tab adds get readable names.** A second one under the same parent is
  called something like `UILayer2`, instead of a generated name full of `@` signs.
- **Long status messages in the authoring tab wrap** instead of running off the edge of the dock.

## 1.2.0 — 2026-07-24

One-click no-code setup.

- New **Loot · Setup** panel (the first dock tab): pick the outcome you want → **Apply** → the Lite component is added to your scene, baked in and re-editable.
- Pro unlocks the full no-code wiring — gameplay triggers, bound UI, and cross-system hooks.

## 1.1.0 — 2026-07-24

No-code authoring dock.

- New editor dock: author `LootTableLite` loot tables through a UI panel — create, edit, duplicate, delete, no `.tres` hand-editing. (The Pro tier adds every field, one-click scene wiring, and the `EventTrigger` node.)

## 1.0.0 — 2026-06-01

Initial release.

- `LootTableLite` Resource: weighted entries (`{item, weight, min, max}`), `rolls` per call, `roll(rng)` returns `Array[{item, count}]`.
- Static helper `LootTableLite.entry(item, weight, min, max)` for factory scripts.
- Optional injected `RandomNumberGenerator` for repeatable rolls in tests.
- Demo: 4-entry bandit table, roll ×1 and ×10 buttons, live drop log + frequency stats.
