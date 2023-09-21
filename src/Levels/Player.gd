extends KinematicBody2D

const SPEED = 100
var GRAVITY = 30
export var JUMP_SPEED = 500
var ladder_on = false
var motion = Vector2(0,0)
const UP = Vector2(0,-1)
var current_ammo = 3
var recipes_collected = 0
var player_health = 100
var facing_right = true
var died = false



func _physics_process(delta):
	
	if facing_right:
		$Sprite.scale.x = 1
	else:
		$Sprite.scale.x = -1
	
	if not Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		$AnimationPlayer.play("Idle")
		motion.x = 0
	elif Input.is_action_pressed("right") and Input.is_action_pressed("left"):
		motion.x = 0
	elif Input.is_action_pressed("left"):
		motion.x = -SPEED
		facing_right = false
		$AnimationPlayer.play("Run")
	elif Input.is_action_pressed("right"):
		motion.x = SPEED
		facing_right = true
		$AnimationPlayer.play("Run")
	if Input.is_action_pressed("ui_accept") and is_on_floor():
		motion.y = -JUMP_SPEED
		$AnimationPlayer.play("Jump")
	elif is_on_floor():
		motion.y = 0
	else:
		motion.y += GRAVITY
		
	if ladder_on == true:
		GRAVITY = 0
		if Input.is_action_just_pressed("ui_up"):
			motion.y = -SPEED
		elif Input.is_action_just_pressed("ui_down"):
			motion.y = SPEED
	elif ladder_on == false:
		GRAVITY = 30
	if position.y > 70:
		player_health = 0
		if not died:
			died = true
			die()
	move_and_slide(motion, UP)

func die():
	var animation = get_node("/root/Level1/ColorRect/AnimationPlayer")
	animation.play("die")


#<<<<<<< HEAD
func _on_healthpack_body_entered(body):
	print("health should increase")

#=======
func _on_ammo_body_entered(body):
	current_ammo += 3
	print(current_ammo)
#<<<<<<< HEAD
#>>>>>>> 5d745a6ad04db7040e4a945954125ee409ba8c55
#=======


func _on_Finnish_Flag_body_entered(body):
	if recipes_collected == 4:
		print("you won")


#>>>>>>> 694798d3221a9f871de704e33aa7fe7156198fb9


func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().change_scene("res://die_screen/Control.tscn")
