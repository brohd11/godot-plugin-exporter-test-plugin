using Godot;

namespace PluginExporterTest.Fixture;

// The only C# in any exportable plugin, so parse_cs is otherwise never invoked. The namespace
// above is rewritten by the "namespace_rename" setting, and the flag below is flipped the same
// way the GDScript one is - note the C# spelling includes the type.
public partial class FixtureCs : RefCounted
{
	public const bool PLUGIN_EXPORTED = false;

	public static string Describe()
	{
		return PLUGIN_EXPORTED ? "exported" : "in-development";
	}
}
