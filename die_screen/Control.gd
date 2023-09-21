extends Control

func _on_RestartButton_pressed():
	get_tree().change_scene("res://src/Levels/Level1.tscn")


func _on_BackButton_pressed():
	get_tree().change_scene("res://title_screen/TitleScreen.tscn")
