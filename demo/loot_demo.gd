extends Node

const ItemScript := preload("res://addons/loot_lite/item_resource.gd")
const LootTableLiteScript := preload("res://addons/loot_lite/loot_table.gd")

var _table: LootTableLite
var _log: VBoxContainer
var _stats: Label
var _drop_counts: Dictionary = {}


func _ready() -> void:
	var bg := ColorRect.new()
	bg.color = Color(0.10, 0.12, 0.16)
	bg.anchor_right = 1; bg.anchor_bottom = 1
	add_child(bg)

	# Items + table.
	var apple = _item("apple", "Apple")
	var gold  = _item("gold", "Gold Coin")
	var ring  = _item("ring", "Magic Ring")
	var gem   = _item("gem", "Rare Gem")
	_table = LootTableLiteScript.new()
	_table.id = "bandit_drop"
	_table.entries = [
		LootTableLiteScript.entry(apple, 50, 1, 3),
		LootTableLiteScript.entry(gold,  30, 5, 25),
		LootTableLiteScript.entry(ring,  15, 1, 1),
		LootTableLiteScript.entry(gem,    5, 1, 1),
	]
	_table.rolls = 1

	var layer := CanvasLayer.new()
	add_child(layer)
	var title := Label.new()
	title.text = "Loot (Lite) · Demo"
	title.position = Vector2(16, 12)
	title.add_theme_font_size_override("font_size", 16)
	layer.add_child(title)

	var roll_btn := Button.new()
	roll_btn.text = "Roll bandit drop ×1"
	roll_btn.position = Vector2(16, 48)
	roll_btn.pressed.connect(_roll_one)
	layer.add_child(roll_btn)

	var roll_btn_10 := Button.new()
	roll_btn_10.text = "Roll ×10"
	roll_btn_10.position = Vector2(180, 48)
	roll_btn_10.pressed.connect(_roll_ten)
	layer.add_child(roll_btn_10)

	var clear_btn := Button.new()
	clear_btn.text = "Reset"
	clear_btn.position = Vector2(260, 48)
	clear_btn.pressed.connect(_reset)
	layer.add_child(clear_btn)

	_stats = Label.new()
	_stats.position = Vector2(16, 88)
	_stats.add_theme_font_size_override("font_size", 13)
	layer.add_child(_stats)

	var scroll := ScrollContainer.new()
	scroll.position = Vector2(16, 160)
	scroll.custom_minimum_size = Vector2(860, 340)
	layer.add_child(scroll)
	_log = VBoxContainer.new()
	_log.add_theme_constant_override("separation", 2)
	scroll.add_child(_log)


func _item(id_: String, name_: String) -> Resource:
	var it = ItemScript.new()
	it.id = id_; it.name = name_
	return it


func _roll_one() -> void:
	_roll_n(1)


func _roll_ten() -> void:
	_roll_n(10)


func _roll_n(n: int) -> void:
	for _i in range(n):
		var drops := _table.roll()
		for d in drops:
			var key := String(d.item.id)
			_drop_counts[key] = int(_drop_counts.get(key, 0)) + int(d.count)
			var row := Label.new()
			row.text = "  • %s ×%d" % [String(d.item.name), int(d.count)]
			row.add_theme_font_size_override("font_size", 13)
			_log.add_child(row)
	_refresh_stats()


func _reset() -> void:
	_drop_counts.clear()
	for c in _log.get_children():
		c.queue_free()
	_refresh_stats()


func _refresh_stats() -> void:
	var total := 0
	for v in _drop_counts.values():
		total += int(v)
	var parts: Array = []
	for k in _drop_counts.keys():
		parts.append("%s: %d" % [String(k), int(_drop_counts[k])])
	_stats.text = "Drops to date: %s (total items: %d)" % [", ".join(parts) if not parts.is_empty() else "none", total]
