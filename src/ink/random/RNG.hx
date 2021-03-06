﻿/*
 *                            _/                                                    _/
 *       _/_/_/      _/_/    _/  _/    _/    _/_/_/    _/_/    _/_/_/      _/_/_/  _/
 *      _/    _/  _/    _/  _/  _/    _/  _/    _/  _/    _/  _/    _/  _/    _/  _/
 *     _/    _/  _/    _/  _/  _/    _/  _/    _/  _/    _/  _/    _/  _/    _/  _/
 *    _/_/_/      _/_/    _/    _/_/_/    _/_/_/    _/_/    _/    _/    _/_/_/  _/
 *   _/                            _/        _/
 *  _/                        _/_/      _/_/
 *
 * POLYGONAL - A HAXE LIBRARY FOR GAME DEVELOPERS
 * Copyright (c) 2009 Michael Baczynski, http://www.polygonal.de
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
package ink.random;



/**
 * <p>A random number generator.</p>
 */
class RNG
{
	var _seed:Int;
	
	public function new()
	{
		_seed = 0;
	}
	
	/**
	 * The sequence of numbers is dependent on an initial value, called the seed.<br/>
	 * This means that, if the seed isn't altered, the sequence of random numbers that is generated by the program will be exactly the same on each run of the program.
	 */
	public function getSeed():Int
	{
		return _seed;
	}
	
	/**
	 * Defines a new <code>seed</code>.<br/>
	 * This will produce a different series of numbers.
	 */
	public function setSeed(seed:Int):Void
	{
		_seed = seed;
	}
	
	/**
	 * Returns an integral number (see specific implementation for details).<br/>
	 * <warn>The number is returned as a double to prevent overflow since some targets don't support unsigned 32-bit integers.</warn>
	 */
	public function random():Float
	{
		return throw "override for implementation";
	}
	
	/**
	 * Returns a real number in the range <arg>&#091;0, 1)</arg>.
	 */
	public function randomFloat():Float
	{
		return throw "override for implementation";
	}
	
	/**
	 * Returns an integral number in the interval <arg>&#091;min, max&#093;</arg>.
	 */
	inline public function randomRange(min:Int, max:Int):Int
	{
		var l = min - .4999;
		var h = max + .4999;
		return Math.round(l + (h - l) * randomFloat());
	}
	
	/**
	 * Returns a real number in the interval <arg>&#091;min, max)</arg>.
	 */
	inline public function randomFloatRange(min:Float, max:Float):Float
	{
		return min + (max - min) * randomFloat();
	}
	
	/**
	 * Returns an integral number in the interval <arg>&#091;-range, range&#093;</arg>.
	 */
	inline public function randomSym(range:Int):Float
	{
		return randomRange(-range, range);
	}
	
	/**
	 * Returns a real number in the interval <arg>&#091;-range, range)</arg>.
	 */
	inline public function randomFloatSym(range:Float):Float
	{
		return randomFloatRange(-range, range);
	}
}


class Limits
{
	/**
	 * Min value, signed byte.
	 */
	inline public static var INT8_MIN =-0x80;
	
	/**
	 * Max value, signed byte.
	 */
	inline public static var INT8_MAX = 0x7F;
	
	/**
	 * Max value, unsigned byte.
	 */
	inline public static var UINT8_MAX = 0xFF;
	
	/**
	 * Min value, signed short.
	 */
	inline public static var INT16_MIN =-0x8000;
	
	/**
	 * Max value, signed short.
	 */
	inline public static var INT16_MAX = 0x7FFF;
	
	/**
	 * Max value, unsigned short.
	 */
	inline public static var UINT16_MAX = 0xFFFF;
	
	/**
	 * Min value, signed integer.
	 */
	inline public static var INT32_MIN =
	#if cpp
	//warning: this decimal constant is unsigned only in ISO C90
	-0x7fffffff;
	#else
	0x80000000;
	#end
	
	/**
	 * Max value, signed integer.
	 */
	inline public static var INT32_MAX = 0x7fffffff;
	
	/**
	 * Max value, unsigned integer.
	 */
	inline public static var UINT32_MAX = 0xffffffff;
	
	/**
	 * Number of bits using for representing integers.
	 */
	inline public static var INT_BITS =	32;
	
	/**
	 * The largest representable number (single-precision IEEE-754).
	 */
	inline public static var FLOAT_MAX = 3.4028234663852886e+38;
	
	/**
	 * The smallest representable number (single-precision IEEE-754).
	 */
	inline public static var FLOAT_MIN = -3.4028234663852886e+38;
	
	/**
	 * The largest representable number (double-precision IEEE-754).
	 */
	inline public static var DOUBLE_MAX = 1.7976931348623157e+308;
	
	/**
	 * The smallest representable number (double-precision IEEE-754).
	 */
	inline public static var DOUBLE_MIN = -1.7976931348623157e+308;
}