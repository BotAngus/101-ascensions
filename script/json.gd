class_name Json

static func dict_to_json(dict: Dictionary) -> String:
	var parser = JSON.new();
	return parser.stringify(dict);
	
static func json_to_dict(json: String) -> Dictionary:
	var parser = JSON.new();
	if parser.parse(json) == OK:
		return parser.get_data();
	else:
		return {};

static func read_json_from_path(path: String) -> Dictionary:
	var parser: JSON = JSON.new();
	var f: File = File.new();
	if f.open(path, File.READ) == OK:
		var data = f.get_as_text();
		if data == null:
			return {}
		f.close()
		return json_to_dict(data);
	return {};
	
static func write_json_to_path(path: String, data: Dictionary) -> void:
	var f: File = File.new();
	if f.open(path, File.WRITE) == OK:
		f.store_string(dict_to_json(data))
		f.close()
	printerr("Unable to open %s", path);

