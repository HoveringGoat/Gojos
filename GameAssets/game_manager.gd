extends Node

func _ready():
	var ui_node = get_node("/root/Node/UI")  # Correct path to UI

	if ui_node != null:
		print("UI node found: ", ui_node)
		
		var panel_node = ui_node.get_node("Panel")
		if panel_node != null:
			print("Panel node found: ", panel_node)
			
			var points_label = panel_node.get_node("PointsLabel")
			if points_label != null:
				print("PointsLabel found!")
				
				# Update the label's text directly without needing 'update()'
				points_label.text = "Points: " + str(GlobalVariables.score)
			else:
				print("Error: PointsLabel not found!")
		else:
			print("Error: Panel node not found!")
	else:
		print("Error: UI node not found!")
