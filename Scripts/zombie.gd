extends KinematicBody

var vel = Vector3()
var timer = 0
var time_wait

func _ready():
	randomize()
	time_wait = 5 #5 + randi() % 20
	
func _physics_process(delta):
	var state = $AnimationPlayer.current_animation
	timer += delta
	
	if state == 'idle':
		if timer > time_wait:
			set_state('walk')
			
func set_state(s):
	if $AnimationPlayer.current_animation == s:
		return
	$AnimationPlayer.play(s, 0.3)
	timer = 0