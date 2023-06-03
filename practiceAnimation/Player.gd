extends CharacterBody2D

@onready var animT = $AnimationTree
@onready var animP = get_node("AnimationPlayer")

var input_dir = Vector2.ZERO
const  acceleration = 300
const  max_speed = 100
const  friction = 500

func _physics_process(delta):
	input_dir = Vector2(Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"), 
						Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up"))

	if input_dir != Vector2.ZERO:
		velocity = velocity.move_toward(max_speed * input_dir, acceleration * delta)
	else: 
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
		animP.play("idle")
	
	if input_dir.x > 0:
		animP.play("walk")
		get_node("AnimatedSprite2D").flip_h = false
	else:
		animP.play("walk")
		get_node("AnimatedSprite2D").flip_h = true

	move_and_slide()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
