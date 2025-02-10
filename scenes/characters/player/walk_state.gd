extends  NodeState

@export var player: Player
@export var animated_sprite_2d: AnimatedSprite2D

func _on_process(_delta : float) -> void:
	var direction: Vector2 = GameInputEvents.movement_input()
	
	if direction == Vector2.UP:
		animated_sprite_2d.play("walk_back")
		player.direction_string = "back"
	elif direction == Vector2.RIGHT:
		animated_sprite_2d.play("walk_right")
		player.direction_string = "right"
	elif direction == Vector2.DOWN:
		animated_sprite_2d.play("walk_front")
		player.direction_string = "front"
	elif direction == Vector2.LEFT:
		animated_sprite_2d.play("walk_left")
		player.direction_string = "left"
		
	if direction != Vector2.ZERO:
		player.direction = direction
		
	player.velocity = player.direction * player.speed
	player.move_and_slide()


func _on_physics_process(_delta : float) -> void:
	pass


func _on_next_transitions() -> void:
	if !GameInputEvents.is_movement_input():
		transition.emit("Idle")


func _on_enter() -> void:
	pass


func _on_exit() -> void:
	animated_sprite_2d.stop()
