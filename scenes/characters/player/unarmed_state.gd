extends NodeState

@export var player: Player
@export var animated_sprite_2d: AnimatedSprite2D

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	pass


func _on_next_transitions() -> void:
	if !animated_sprite_2d.is_playing():
		transition.emit("Idle")


func _on_enter() -> void:
	if player.direction_string == null:
		player.direction_string = "front"
	print("attack_", player.direction_string)
	animated_sprite_2d.play("attack_" + player.direction_string)


func _on_exit() -> void:
	animated_sprite_2d.stop()
