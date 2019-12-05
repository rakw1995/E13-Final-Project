extends Area

var speed = 15
var velocity = Vector3()
var hurt = false

func start(xform):
	transform = xform
	velocity = -transform.basis.z * speed
	
func _process(delta):
	transform.origin += velocity * delta
	
func _on_Timer_timeout():
	queue_free()

func _on_Bullet2_body_entered(body):
	if body.is_in_group("zombie"):
		G.zombie.HP -= 1
		G.zombie.set_state('hurt')
		queue_free()
