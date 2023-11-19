extends Sprite2D

@onready var animation_player = $"../AnimationPlayer"

const SPRITES_MAP := {
	Vector2.DOWN: "s_walking",
	Vector2.LEFT: "w_walking",
	Vector2.RIGHT: "e_walking",
	Vector2.UP: "n_walking",
	Vector2(1,1): "se_walking",
	Vector2(1,-1): "ne_walking",
	Vector2(-1,1): "nw_walking",
	Vector2(-1,-1): "sw_walking",
}

const ATTACKS_MAP := {
	Vector2.DOWN: "s_attack",
	Vector2.LEFT: "w_attack",
	Vector2.RIGHT: "e_attack",
	Vector2.UP: "n_attack",
	Vector2(1,1): "se_attack",
	Vector2(1,-1): "ne_attack",
	Vector2(-1,1): "nw_attack",
	Vector2(-1,-1): "sw_attack",
}

#var look_direction := Vector2.DOWN

@onready var sprite = $"."

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Vector2(
		float(Input.get_action_strength("right")) - float(Input.get_action_strength("left")),
		float(Input.get_action_strength("down")) - float(Input.get_action_strength("up"))
		)
	if direction.length() > 0.0:
		animation_player.play(SPRITES_MAP[direction])
	else:
		animation_player.play("idle")
