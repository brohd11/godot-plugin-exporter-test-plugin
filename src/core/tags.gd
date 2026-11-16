#! namespace PETFixture.Tags
extends RefCounted
## The line-level rewrites: the namespace directive above is stripped on export, and both spellings
## of cast stripping are exercised below.

## Named in export_ignore/strip_cast.txt, which is the only way the file-based strip list runs.
const PETStripped = preload("res://addons/plugin_exporter_test/src/globals/fixture_global.gd")

## The self const every singleton module declares. Its tag sits at the end of the file: a
## gdp-strip-cast tag covers the whole file, lines above it included.
const PE_STRIP_CAST_SCRIPT = preload("res://addons/plugin_exporter_test/src/core/tags.gd")


static func self_typed() -> PE_STRIP_CAST_SCRIPT:
	return null


static func from_config_list() -> PETStripped:
	## PETStripped comes off strip_cast.txt, so this return type goes away on export.
	return null


#! gdp-strip-cast PETLocalOnly
static func inline_tagged(value) -> void:
	## The tag above adds PETLocalOnly for this file only, so the cast below is stripped even
	## though nothing in the config mentions it.
	var typed = value as PETLocalOnly
	if typed != null:
		pass


static func dict_value() -> Dictionary:
	## Reads like an annotation, but a type is never called, so this has to survive the strip.
	return {0:PETLocalOnly.make()}


static func one_line_branch(value) -> void:
	if value: PETLocalOnly.make()


static func dotted(value) -> PETLocalOnly.Inner:
	var inner:PETLocalOnly.Inner = value
	return inner


class PETLocalOnly extends RefCounted:
	var flag := true

	static func make() -> int:
		return 1

	class Inner:
		pass


#! gdp-strip-cast PE_STRIP_CAST_SCRIPT
