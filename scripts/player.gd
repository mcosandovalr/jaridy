extends CharacterBody2D


@export var speed: float = 150.0
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func handle_input():
	var direction = Input.get_vector("ui_left", "ui_right","ui_up","ui_down")
	velocity = direction * speed

func update_animation():
	if velocity.length() == 0:
		if animation_player.is_playing():
			animation_player.stop()
	else:
		var direction = "down"
		#print(velocity)
		if velocity.x < 0: direction = "left"
		elif velocity.x > 0: direction = "right"
		elif velocity.y < 0: direction = "up"
	
		var animation_to_play = "walk_" + direction
		#print("animation to play: ", animation_to_play)
		animation_player.play(animation_to_play)

func _physics_process(delta: float) -> void:
	handle_input()
	move_and_slide()
	update_animation()
