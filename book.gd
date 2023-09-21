extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal bookCollected

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_book_body_entered(body):
	queue_free()
	if body.name == "Player":
		get_node("/root/Level1/Player").recipes_collected += 1
	emit_signal("bookCollected")
