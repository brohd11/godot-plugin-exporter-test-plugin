## An untagged preload hub: its targets must be gathered and rewritten in every export variant.
## Small targets keep the five-variant fixture export inexpensive.

const UWindow = preload("res://addons/_lib/util_r/src/node/u_window.gd")
## The doubled slash is intentional: exports must canonicalize it before remapping the preload.
const UControl = preload("res://addons/_lib/util_r/src//node/u_control.gd")
const UObject = preload("res://addons/_lib/util_r/src/object/u_object.gd")

## Not preloadable, so these only travel if they are tagged. Three different files rather than one
## tagged three ways: the tags are keyed by target path, so the same file tagged twice collapses
## to a single copy and only one placement would ever be observable.
##
## Plain "#! dependency" puts it in remote_dir alongside everything else.
const YAML_VERSION = "res://addons/_lib/yaml_parser/version.cfg" #! dependency

## "current" places the copy next to this file instead of in remote_dir.
const LIB_VERSION = "res://addons/_lib/util_r/version.cfg" #! dependency current

## An explicit destination, which must be inside the plugin.
const LAYOUT_DEFAULTS = "res://addons/package_exporter/export_ignore/test/fixtures/vendor/nested/layout.json" #! dependency res://addons/plugin_exporter_test/src/deps

## Claims fixtures/vendor/LICENSE while the tag above claims vendor/nested/LICENSE, giving
## gather_licenses a nested pair to resolve. They sit outside the plugin because a license inside
## the exported source ships at its own path, and check_ignore hard-blocks export_ignore/.
const VENDOR_DATA = "res://addons/package_exporter/export_ignore/test/fixtures/vendor/data.json" #! dependency
