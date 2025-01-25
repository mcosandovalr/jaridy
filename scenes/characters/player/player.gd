class_name Player
extends CharacterBody2D

@export var speed = 300
@export var current_weapon: UserItem.Weapon = UserItem.Weapon.BigSword;
@export var direction: Vector2 # on the tutorial is named 'player_direction'
var direction_string
