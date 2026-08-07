#! remote
## The preload-hub form: a single file collecting every out-of-plugin script the plugin uses, so
## the rest of the source only ever preloads this one path. On export each target is copied into
## remote_dir and these paths are rewritten to point at the copies.
##
## Targets are deliberately small leaf scripts - every export variant crawls this file, so
## anything with a wide preload tree gets copied five times over.

const UList = preload("res://addons/addon_lib/brohd/alib_runtime/utils/u_list.gd")
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
const LAYOUT_DEFAULTS = "res://addons/addon_lib/brohd/dock_manager/config/layout.json" #! dependency res://addons/plugin_exporter_test/src/deps
