extends KinematicBody

onready var camera = $Pivot/Camera
var jump_speed = 12
var gravity = -30
var max_speed = 8
var mouse_sensitivity = 0.002
var jump = false

var velocity = Vector3()

var Bullet = preload("res://Scenes/Bullet.tscn")

func get_input():
    var input_dir = Vector3()
    if Input.is_action_pressed("move_forward"):
        input_dir += -camera.global_transform.basis.z
    if Input.is_action_pressed("move_back"):
        input_dir += camera.global_transform.basis.z
    if Input.is_action_pressed("strafe_left"):
        input_dir += -camera.global_transform.basis.x
    if Input.is_action_pressed("strafe_right"):
        input_dir += camera.global_transform.basis.x
    input_dir = input_dir.normalized()
    return input_dir
	

func _unhandled_input(event):
    if event is InputEventMouseMotion:
        rotate_y(-event.relative.x * mouse_sensitivity)
        $Pivot.rotate_x(-event.relative.y * mouse_sensitivity)
        $Pivot.rotation.x = clamp($Pivot.rotation.x, -1.2, 1.2)

    if event.is_action_pressed("attack"):
        var b = Bullet.instance()
        b.start($FB.global_transform)
        get_parent().add_child(b)
        

func _physics_process(delta):
	velocity.y += gravity * delta
	var desired_velocity = get_input() * max_speed

	velocity.x = desired_velocity.x
	velocity.z = desired_velocity.z
	velocity = move_and_slide(velocity, Vector3.UP, true)
	if jump and is_on_floor():
		velocity.y = jump_speed
	