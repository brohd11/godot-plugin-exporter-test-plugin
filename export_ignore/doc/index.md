# Fixture Docs

The exporter copies this folder into the exported plugin as `.doc`, structure intact, without a
dependency crawl. Asserted by `tests/plugin_exporter/export_fixture_test.gd`.

Written to exercise the doc viewer's renderer as well: a **fence**, an image and a
[link to the nested page](guide/nested.md) all appear below.

```gdscript
func _ready() -> void:
	print("hello from a fenced block")
```

![a screenshot](images/shot.png)

---

## Notes

 - the image beside this file must arrive with no `.import` sidecar
 - `.doc` is dot-prefixed, so Godot never imports what is in it
