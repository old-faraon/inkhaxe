package ink.runtime;

import haxe.ds.StringMap;

@:expose abstract HashSetString(StringMap<Bool>) {
	public inline function new()
		this = new StringMap<Bool>();

	public inline function add( key: String )
		this.set(key, true);

	public inline function keys()
		return this.keys();

	public inline function contains( key: String )
		return this.get(key);

	public function clone(): HashSetString {
		var set = new HashSetString();

		for (k in this.keys()) {
			set.add(k);
		}

		return set;
	}
}
