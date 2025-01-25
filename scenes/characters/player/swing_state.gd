extends NodeState

@export var player: Player
@export var animation_player: AnimationPlayer
@onready var weapon: Node2D = $"../../Weapon"

#@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	pass


func _on_next_transitions() -> void:
	if !animation_player.is_playing():
		weapon.visible = false
		transition.emit("Idle")


func _on_enter() -> void:
	#if player.direction_string == "" or player.direction_string == null:
		#pass
	#print("swing_", player.direction_string)
	weapon.visible = true
	if player.direction_string == null:
		player.direction_string = "front"
	print("swing_", player.direction_string)
	animation_player.play("swing_" + player.direction_string)
	await animation_player.animation_finished
	weapon.visible = false
	


func _on_exit() -> void:
	animation_player.stop()
	weapon.visible = false
