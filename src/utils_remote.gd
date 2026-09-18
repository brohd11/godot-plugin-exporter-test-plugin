## An untagged preload hub: its targets must be gathered and rewritten in every export variant.
## Small targets keep the five-variant fixture export inexpensive.

## The doubled slash is intentional: exports must canonicalize it before remapping the preload.
const UList = preload("res://addons/addon_lib/brohd//alib_runtime/utils/u_list.gd")
const UObject = preload("res://addons/addon_lib/brohd/alib_runtime/utils/u_object.gd")
const USort = preload("res://addons/addon_lib/brohd/alib_runtime/utils/u_sort.gd")

## Not preloadable, so these only travel if they are tagged. Three different files rather than one
## tagged three ways: the tags are keyed by target path, so the same file tagged twice collapses
## to a single copy and only one placement would ever be observable.
##
## Plain "#! dependency" puts it in remote_dir alongside everything else.
const YAML_VERSION = "res://addons/addon_lib/yaml_parser/version.cfg" #! dependency

## "current" places the copy next to this file instead of in remote_dir.
const LIB_VERSION = "res://addons/addon_lib/brohd/version.cfg" #! dependency current

## An explicit destination, which must be inside the plugin.
const LAYOUT_DEFAULTS = "res://addons/addon_lib/dock_manager/config/layout.json" #! dependency res://addons/plugin_exporter_test/src/deps
