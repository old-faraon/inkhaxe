package ink.runtime;

class Tag extends RObject {
	public var text(default, null): String;

	public function new( text: String ) {
		super();
		this.text = text;
	}
}
