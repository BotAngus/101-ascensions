class_name Epic

# Name
# Type
# Main Characters
	# ID of Characters
# Rules
	# Array of rules
# Possible Events
# Possible Endings

const path: String = "user://epics.json";



enum Type {
	Isekai,
	War,
	Alliance,
	Love
};

var id: int;
var name: String;
var type: Type;
var main_characters: Array[String];
var rules: Array[Dictionary];
var events: Array[Dictionary];
var endings: Array[Dictionary];




# Loading/Creating/Saving
func create(with_id: int) -> void:
	id = with_id
	
func load_from(with_id: int) -> void:
	var epics: Dictionary = Json.read_json_from_path(path);
	if epics.has(with_id):
		var from = epics[with_id];
		name = from["name"];	
		type = from["type"];
		main_characters = from["main_characters"];
		rules = from["rules"];
		events = from["events"];
		endings = from["endings"];
	else:
		printerr("Epic does not exist");
	
	
	
func to_dict() -> Dictionary:
	return {
		"name": name,
		"type": type,
		"main_characters": main_characters,
		"rules": rules,
		"events": events,
		"endings": endings
	};
func save() -> void:
	var epics: Dictionary = Json.read_json_from_path(path);
	epics[id] = self.to_dict();
	Json.write_json_to_path(path, epics);
	



	
