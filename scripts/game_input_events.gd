class_name GameInputEvents
static var direction: Vector2

static func movement_input() -> Vector2:
	if Input.is_action_pressed("walk_left"):
		direction = Vector2.LEFT
	elif Input.is_action_pressed("walk_right"):
		direction = Vector2.RIGHT
	elif Input.is_action_pressed("walk_up"):
		direction = Vector2.UP
	elif Input.is_action_pressed("walk_down"):
		direction = Vector2.DOWN
	else:
		direction = Vector2.ZERO		
		
	print("direction: ", direction)
	return direction
	
	
static func is_movement_input() -> bool:
	if direction == Vector2.ZERO:
		return false
	return true


static func use_attack() -> bool:
	var use_attack_value: bool = Input.is_action_just_pressed("attack")
	return use_attack_value


static func use_swing() -> bool:
	var use_swing_value: bool = Input.is_action_just_pressed("swing_weapon")
	return use_swing_value
	
