class_name GameOver extends CanvasLayer

@onready var score: Label = %ScoreLabel
@onready var high_score: Label = %HighScoreLabel
@onready var restart: Button = %RestartButton
@onready var quit: Button = %QuitButton

func _ready() -> void:
	
	# if we're running in a web browser, hide the quit button because it doesn't apply to web
	# and clicking it can cause the game to hang. It's generally better and safer to just
	# not show things that don't apply to the player anyway.
	if OS.has_feature("web"):
		quit.visible = false

# allows us to hand the final score into the GameOver class
func set_score(n:int):
	score.text = "Final Score: " + str(n)
	if n > Global.save_data.high_score:
		high_score.visible = true
		Global.save_data.high_score = n
		Global.save_data.save()
	else:
		high_score.visible = false

func _on_restart_button_pressed() -> void:
	get_tree().reload_current_scene()

func _on_quit_button_pressed() -> void:
	get_tree().quit()
	
func _notification(what):
	match what:
		NOTIFICATION_ENTER_TREE:
			get_tree().paused = true
		NOTIFICATION_EXIT_TREE:
			get_tree().paused = false
			

