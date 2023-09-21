extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var numOfBook = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$number.text = String(numOfBook)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_bookCollected():
	numOfBook = numOfBook + 1
	_ready()
