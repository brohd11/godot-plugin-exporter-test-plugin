class_name PETFixtureGlobal
## An in-plugin global class. On export the "class_name" line is stripped and every file that
## used the name gets a "const PETFixtureGlobal_<hash> = preload(...)" injected instead, so the
## released plugin cannot collide with another copy of itself.

const LABEL = "fixture-global"

static func describe() -> String:
	return LABEL
