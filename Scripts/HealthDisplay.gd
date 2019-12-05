extends Node2D

var bar = preload("res://assets/grey_button15.png")


onready var healthbar = $HealthBar

func _ready():
	hide()
	if get_parent() and get_parent().get("max_health"):
		healthbar.max_value = get_parent().max_health
	
func _process(delta):
	global_rotation = 0
	
func update_healthbar(value):
	healthbar.texture_progress = bar
	if value < healthbar.max_value * 0.7:
		healthbar.texture_progress = bar
	if value < healthbar.max_value * 0.35:
		healthbar.texture_progress = bar
	if value < healthbar.max_value:
		show()
	healthbar.value = value