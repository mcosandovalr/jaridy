extends NodeState

@export var player: Player
@export var animation_player: AnimationPlayer
@onready var weapon: Node2D = $"../../Weapon"

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	pass


func _on_next_transitions() -> void:
	if !animation_player.is_playing():
		weapon.visible = false
		transition.emit("Idle")


func _on_enter() -> void:
	weapon.visible = true
	if player.direction_string == null:
		player.direction_string = "front"
	print("attack_", player.direction_string)
	animation_player.play("attack_" + player.direction_string)
	await animation_player.animation_finished
	weapon.visible = false


func _on_exit() -> void:
	animation_player.stop()
	weapon.visible = false
