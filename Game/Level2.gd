extends Node2D

var game_end = false
var moves = 0


func _process(_delta):
	$UI/Moveslbl.text = 'Moves: ' + str(moves)
	$UI/Label.text =   str(get_tree().current_scene.name)
	
func check_end():
	if game_end == false:
		var spots = $Spots.get_child_count()
		for i in $Spots.get_children():
			if i.occupied:
				spots-=1
		
		if spots == 0:
			$UI/AcceptDialog.popup()
			get_tree().change_scene("res://Level"+str (int (get_tree().current_scene.name) +1 )+".tscn")


func _on_AcceptDialog_confirmed():
	get_tree().reload_current_scene()
