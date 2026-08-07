class_name PETKeptGlobal
## Listed in "class_rename_ignore", so this one keeps its class_name through the export. Being
## un-renamed also makes it the case that "move_global_files" relocates - it should land in
## "global/" rather than staying under src/.

const LABEL = "fixture-kept"

static func describe() -> String:
	return LABEL
