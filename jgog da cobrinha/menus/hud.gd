class_name HUD extends CanvasLayer

@onready var score: Label = %Score
@onready var high_score: Label = %HighScore

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	high_score.text = "High Score: " + str(Global.save_data.high_score)

func update_score(n:int):
	score.text = "Score: " + str(n)
