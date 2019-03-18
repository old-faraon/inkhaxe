package ink.runtime;

abstract HashSet<K: {}>(Map<K, Bool>) {
	public inline function new()
		this = new Map<K, Bool>();

	public inline function add( key: K )
		this.set(key, true);

	public inline function keys()
		return this.keys();

	public inline function contains( key: K )
		return this.exists(key);
}
