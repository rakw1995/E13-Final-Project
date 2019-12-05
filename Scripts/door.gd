extends KinematicBody

func _physics_process(delta):
	if transform.origin.distance_to(G.player.transform.origin) < 2 and transform.origin.distance_to(G.player.transform.origin) > 0:
		get_tree().change_scene("res://Scenes/Dungeon.tscn")