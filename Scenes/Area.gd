extends Area

func _physics_process(delta):
	if transform.origin.distance_to(G.player.transform.origin) < 5 and transform.origin.distance_to(G.player.transform.origin) > 2:
		get_tree().change_scene("res://Scenes/Dungeon.tscn")

func _on_Area_body_entered(body):
	get_tree().change_scene("res://Scenes/Dungeon.tscn")