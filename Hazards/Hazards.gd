extends Area2D


func _on_SpikeTop_body_entered(body):
	print("hello bunny")
	#body.hurt()
	# this function only knows about body, but I need to be able
	# to call the GameState:hurt() function as well as the Player:hurt() function.
	# we could use a signal for this. Instead of a signal, we will use a group.
	# a group is like a broadcaster on android or a dbus message on Linux.
	get_tree().call_group("Gamestate", "hurt")
