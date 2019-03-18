package ink.runtime;

import haxe.ds.EnumValueMap;

abstract HashSetEnum<K: EnumValue>(EnumValueMap<K, Bool>) {
	public inline function new()
		this = new EnumValueMap<K, Bool>();

	public inline function add( key: K )
		this.set(key, true);

	public inline function contains( key: K )
		return this.get(key);
}
