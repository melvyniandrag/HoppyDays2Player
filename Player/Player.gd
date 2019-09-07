extends KinematicBody2D

var motion = Vector2(0,0)
const SPEED = 1000
const GRAVITY = 100
const UP = Vector2(0,-1)
const JUMP_SPEED = GRAVITY * -40
const WORLD_LIMIT = 6000

signal animate

func _physics_process(delta):
	apply_gravity()
	jump()
	move()
	animate()
	move_and_slide(motion, UP)	

func animate():
	## Emit a signal here to be received by the
	## Animated Sprite class and move the sprite 
	## attached to the player node
	emit_signal("animate", motion)

func move():
	if Input.is_action_pressed("left") && Input.is_action_pressed("right"):
		motion.x = 0
	elif Input.is_action_pressed("left"):
		motion.x = -SPEED
	elif Input.is_action_pressed("right"):
		motion.x = SPEED
	else:
		motion.x = 0


func jump():
	if Input.is_action_pressed("jump") && is_on_floor():
		motion.y += JUMP_SPEED


func apply_gravity():
	if position.y >= WORLD_LIMIT:
		end_game()
	if is_on_floor():
		motion.y = 0
	elif is_on_ceiling():
		motion.y = 1
		print("on ceiling!")
	else:
		motion.y += GRAVITY


func end_game():
	get_tree().change_scene("res://Levels/GameOver.tscn")