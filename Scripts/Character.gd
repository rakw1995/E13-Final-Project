extends KinematicBody

onready var camera = $Pivot/Camera

var HP = 100
var gravity = -30
var max_speed = 8
var mouse_sensitivity = 0.002

var velocity = Vector3()

var Bullet = preload("res://Scenes/Bullet2.tscn")

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	G.player = self

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
        $Pivot.rotation.x = clamp($Pivot.rotation.x, 0, 0)

    if event.is_action_pressed("attack"):
        var b = Bullet.instance()
        b.start($Position3D.global_transform)
        get_parent().add_child(b)
        

func _physics_process(delta):
	velocity.y += gravity * delta
	var desired_velocity = get_input() * max_speed

	velocity.x = desired_velocity.x
	velocity.z = desired_velocity.z
	velocity = move_and_slide(velocity, Vector3.UP, true)
	if HP > 0 and HP < 0.5:
		get_tree().change_scene("res://Scenes/End.tscn")