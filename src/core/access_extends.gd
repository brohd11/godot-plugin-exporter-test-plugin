extends UtilR.Objects.UObject
## `extends` through a namespace hub. It has to become a quoted path in every export, and it must
## not stop the reduced export from dropping the UtilR hub.


static func marker() -> int:
	return 1
