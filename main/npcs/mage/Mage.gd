class_name Mage extends Node2D

var dialogBox: DialogBox = null
var characterName = 'Uncle Bob'
var dialogs = ["Press the X key and find out", "But if you are not going to give up, follow this [wave] path."]
var talkAboutTheKey = false

func _ready():
	dialogBox = get_tree().get_root().find_node("DialogBox", true, false) as DialogBox

func _on_Area2D_body_entered(body):
	if not body.get('type') == "player":
		return
		
	if self.talkAboutTheKey:
		dialogBox.start_dialog(self.characterName, [
			'Feeling lost ?'
		])
		return
		
	if GameState.keys > 0:
		dialogBox.start_dialog(self.characterName, [
			'Ha Ha. You found the damn Key!'
		])
		self.talkAboutTheKey = true
		return
		
	dialogBox.start_dialog(self.characterName, self.dialogs)

func _on_Area2D_body_exited(body):
	dialogBox.end_dialog()
