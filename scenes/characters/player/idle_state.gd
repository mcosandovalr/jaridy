extends NodeState

@export var player: Player
@export var animated_sprite_2d: AnimatedSprite2D
@onready var weapon: Node2D = $"../../Weapon"
@onready var actionable_finder: Area2D = $"../../InteractionZone/ActionableFinder"

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	# player.direction = GameInputEvents.movement_input()
	weapon.visible = false
	
	if player.direction == Vector2.UP:
		player.interaction_zone.position.x = 0
		player.interaction_zone.position.y = -17
		animated_sprite_2d.play("idle_back")
	elif player.direction == Vector2.RIGHT:
		player.interaction_zone.position.x = 10
		player.interaction_zone.position.y = -6
		animated_sprite_2d.play("idle_right")
	elif player.direction == Vector2.DOWN:		
		player.interaction_zone.position.x = 0
		player.interaction_zone.position.y = 3
		animated_sprite_2d.play("idle_front")
	elif player.direction == Vector2.LEFT:
		player.interaction_zone.position.x = -10
		player.interaction_zone.position.y = -6
		animated_sprite_2d.play("idle_left")
		
	print(" > player.position.x: ",player.position.x)
	print(" > player.position.y: ",player.position.y)
	print(" > player.interaction_zone.position.x: ", player.interaction_zone.position.x)
	print(" > player.interaction_zone.position.: ", player.interaction_zone.position.y)
	return


func _on_next_transitions() -> void:
	GameInputEvents.movement_input()
	
	if GameInputEvents.is_movement_input():
		transition.emit("Walk")
	# if is not movement, what is it?	
	# is it an interaction
	elif GameInputEvents.is_interaction():
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
			return
	
	# is it an attack	
	if player.current_weapon != UserItem.Weapon.None:
		if GameInputEvents.use_attack():
			transition.emit("Attack")
		elif GameInputEvents.use_swing():
			transition.emit("Swing")
	else:
		if GameInputEvents.use_attack():
			transition.emit("Unarmed")


func _on_enter() -> void:
	pass


func _on_exit() -> void:
	animated_sprite_2d.stop()
