#! namespace PETFixture.Tags
extends RefCounted
## The line-level rewrites: the namespace directive above is stripped on export, and both spellings
## of cast stripping are exercised below.

## Named in export_ignore/strip_cast.txt, which is the only way the file-based strip list runs.
const PETStripped = preload("res://addons/plugin_exporter_test/src/globals/fixture_global.gd")

## The built-in name every singleton module uses; a ": PE_STRIP_CAST_SCRIPT" annotation is removed
## wherever it appears.
const PE_STRIP_CAST_SCRIPT = preload("res://addons/plugin_exporter_test/src/core/tags.gd")


static func self_typed() -> PE_STRIP_CAST_SCRIPT:
	return null


static func from_config_list() -> PETStripped:
	## PETStripped comes off strip_cast.txt, so this return type goes away on export.
	return null


#! strip-cast PETLocalOnly
static func inline_tagged(value) -> void:
	## The tag above adds PETLocalOnly for this file only, so the cast below is stripped even
	## though nothing in the config mentions it.
	var typed = value as PETLocalOnly
	if typed != null:
		pass


class PETLocalOnly extends RefCounted:
	var flag := true
