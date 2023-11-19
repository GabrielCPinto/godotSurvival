extends CharacterBody2D

const SPEED = 100.0

@onready var anim = $anim


func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
		).normalized()
	
	velocity = direction * SPEED
	move_and_slide()
