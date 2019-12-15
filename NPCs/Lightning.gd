extends Node2D

const SPEED = 200

func _ready():
	set_as_toplevel(true)
	global_position = get_parent().global_position

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _process(delta):
	position.y += SPEED * delta
	manage_collision()

func manage_collision():
	var collider = $Area2D.get_overlapping_bodies()
	for object in collider:
		if object.name == "Player":
			# only do this if we are colliding with a player.
			# do not do this stuff if we are colliding with terrain.
			print("ouchie")
			get_tree().call_group("Gamestate", "hurt")
		queue_free() # whether or not we are colliding with a player or terrain, queue_free()