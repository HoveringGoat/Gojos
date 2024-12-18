extends Area2D

@onready var points_label: Label = get_node("/root/Node/UI/Panel/PointsLabel")

func _ready():
	# Make sure we update the label when the game starts
	points_label.text = "Points: " + str(GlobalVariables.score)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":
		queue_free()  # Remove the collectable from the scene
		GlobalVariables.score += 1  # Increment the global score
		print("Score incremented: ", GlobalVariables.score)  # Debugging line to confirm score increment
		
		# Update the label's text immediately after the score is updated
		points_label.text = "Points: " + str(GlobalVariables.score)
