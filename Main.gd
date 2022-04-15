extends Node


func _ready() -> void:
	for i in 8:
		var epic = Epic.new();
		epic.create(i);
		epic.save();
