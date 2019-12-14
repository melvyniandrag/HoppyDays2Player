extends CanvasLayer


func update_GUI(coin_count, lives_left):
	$Control/TextureRect/HBoxContainer/CoinCount.text = str(coin_count)	
	$Control/TextureRect/HBoxContainer/LifeCount.text = str(lives_left)	