extends RefCounted
## The ordinary-usage fixture: global classes, the three preload spellings, the exported flag, and
## a path that must survive untouched.

## Flipped to true on export. Fixtures assert on this because it is the cheapest proof that
## post_export_edit_line ran over the file at all.
const PLUGIN_EXPORTED = false

const UtilsRemote = preload("res://addons/plugin_exporter_test/src/utils_remote.gd")
## A uid preload, which the exporter has to resolve to a path before it can rewrite it. The
## target is also a global class, so it doubles as the out-of-plugin global class case.
const TokenizerRemote = preload("uid://csd1u1n0of6mj")
## Relative rather than res://, which get_rel_or_absolute_path has to normalise either way.
const KeptGlobal = preload("../globals/fixture_kept.gd")

## "#! ignore-remote" opts a path out of both copying and rewriting - it must come through the
## export byte for byte, still pointing outside the plugin.
const UPSTREAM_README = "res://addons/_lib/brohd/README.md" #! ignore-remote


static func describe() -> String:
	## PETFixtureGlobal is renamed on export; PETKeptGlobal is not.
	var parts = [PETFixtureGlobal.describe(), PETKeptGlobal.describe()]
	return ", ".join(parts)


static func sorted_pair(a:int, b:int) -> Array:
	if UtilsRemote.UList.get_next_item(2, a) == b:
		return [a, b]
	return [b, a]


static func token_count(text:String) -> int:
	return TokenizerRemote.words_only(text).size()
