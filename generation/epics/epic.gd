# Name
# Type
# Main Characters
	# ID of Characters
# Rules
	# Array of rules
# Possible Events
# Possible Endings

var path: String = "user://epics.json";

var f: File = File.new();

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
	var epics: Dictionary = read_all_epics();
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
	var epics: Dictionary = read_all_epics();
	epics[id] = self.to_dict();
	write_all_epics(epics);
	
static func read_all_epics() -> Dictionary:
	if f.open(path, File.READ) == OK:
		var data = f.get_var();
		if data == null:
			return {}
		f.close()
		return data;
	return {};
	
static func write_all_epics(data: Dictionary) -> bool:
	if f.open(path, File.WRITE) == OK:
		f.store_var(data)
		f.close()
		return true;
	printerr("Unable to open %s", path);
	return false;



	
