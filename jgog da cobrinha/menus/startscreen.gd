class_name StartScreen extends CanvasLayer

const gameplay_scene:PackedScene = preload("res://gameplay/gameplay.tscn")

@onready var score: Label = %ScoreLabel
@onready var start: Button = %StartButton
@onready var quit: Button = %QuitButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var high_score:int = Global.save_data.high_score
	score.text = "High Score: " + str(high_score)
	
	# if we're running in a web browser, hide the quit button because it doesn't apply to web
	# and clicking it can cause the game to hang. It's generally better and safer to just
	# not show things that don't apply to the player anyway.
	if OS.has_feature("web"):
		quit.visible = false

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_packed(gameplay_scene)

func _on_quit_button_pressed() -> void:
	get_tree().quit()
