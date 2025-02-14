class_name Player
extends CharacterBody2D

@export var direction: Vector2 # on the tutorial is named 'player_direction'
@export var speed = 70
@export var current_weapon: UserItem.Weapon = UserItem.Weapon.BigSword
@export var has_weapon: bool
@export var is_weapon_equipped: bool

@onready var interaction_zone: Marker2D = $InteractionZone


var direction_string
