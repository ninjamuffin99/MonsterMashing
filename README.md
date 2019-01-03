# Monster Mashing

### SOMEWHAT NSFW
An infinite runner game made with HaxeFlixel. This code is a little commented, but some comments may be misleading/out of date so be careful. Also if you go back to the commits before around Feb 18th 2018, the game was originally a turn based RPG! Some of that code is leftover.

### [Changelog](changelog.md)
### How to build
You need [Haxe](http://haxe.org), and [HaxeFlixel](http://haxeflixel.com/documentation/getting-started/) installed. The HaxeFlixel install guide should help you get things up and running http://haxeflixel.com/documentation/install-haxeflixel/

One more thing is the `APIStuff.hx` file, which has the API keys and is gitignored. Add a file called APIStuff.hx to source/ with all the other files, and it should look like this
```haxe
package;

class APIStuff
{

	public static inline var APIID:String = "";
	public static inline var EncKey:String = "";
	public static inline var Session:String = "";
}
```

For the vibration on Android, we used [Haxe-Hardware](https://github.com/ktravis/haxe-hardware)

Install using `haxelib install git https://github.com/ktravis/haxe-hardware.git` or something like that

### Credits

Full credits in-game, or in source/CredState.hx

Programming: 

ninja_muffin99 ([@ninja_muffin99](https://twitter.com/ninja_muffin99))

BrandyBuizel ([@BrandyBuizel](https://twitter.com/BrandyBuizel))

Art:

Digimin ([@deegeemin](https://twitter.com/deegeemin))

BrandyBuizel

FuShark ([@fushark](https://twitter.com/FuShark))


Made with [HaxeFlixel](https://haxeflixel.com/)

For Strawberry Jam 2 on Itch.io: https://itch.io/jam/strawberry-jam-2

[Newgrounds.hx](https://github.com/Geokureli/Newgrounds.hx) is the Haxe library for the [newgrounds.io](https://www.newgrounds.io/) Newgrounds API, which was implemented in Haxe by [Geokureli](https://geokureli.newgrounds.com/)
