extends RefCounted
## Lives under a directory named in the export config's "exclude.directories". If this file turns
## up in an export, directory exclusion is broken.

const MARKER = "PET_EXCLUDED_DIRECTORY"
