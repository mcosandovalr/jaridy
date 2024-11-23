extends CharacterBody2D

@export var speed = 20
@export var limit = 0.5
@export var end_point: Marker2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

var start_position
var end_position

func _ready():
	start_position = position
	end_position = end_point.global_position


func change_direction():
	var temp = end_position
	end_position = start_position
	start_position = temp
	

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


func update_velocity():
	var move_direction = end_position - position
	velocity = move_direction.normalized() * speed
	if move_direction.length() < limit:
		change_direction()


func _physics_process(delta: float) -> void:
	update_velocity()
	move_and_slide()
	update_animation()
