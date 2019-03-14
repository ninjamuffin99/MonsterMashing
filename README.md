# Monster Mashing

### SOMEWHAT NSFW
An infinite runner game made with HaxeFlixel. This code is a little commented, but some comments may be misleading/out of date so be careful. Also if you go back to the commits before around Feb 18th 2018, the game was originally a turn based RPG! Some of that code is leftover.

You can play the game in your browser on [Newgrounds](https://www.newgrounds.com/portal/view/707498), and it's available for purchase at a variety of storefronts for 3$. [Itch.io](https://ninja-muffin24.itch.io/monster-mashing) gets you a [Steam](https://store.steampowered.com/app/998770/Monster_Mashing_Deluxe/) key, as well as native builds for Windows, Mac, and Android. However if you purchase it on [Nutaku](https://www.nutaku.net/games/download/monster-mashing/), you get native builds for Windows, Mac, and Android with full uncensored nudity. Or you can buy the game on all three sites for just 9$ and give us money heheheh

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

#### Programming: 

ninja_muffin99 ([@ninja_muffin99](https://twitter.com/ninja_muffin99))

BrandyBuizel ([@BrandyBuizel](https://twitter.com/BrandyBuizel))

#### Art:

Digimin ([@deegeemin](https://twitter.com/deegeemin))

BrandyBuizel

FuShark ([@fushark](https://twitter.com/FuShark))


Made with [HaxeFlixel](https://haxeflixel.com/)

For Strawberry Jam 2 on Itch.io: https://itch.io/jam/strawberry-jam-2

[Newgrounds.hx](https://github.com/Geokureli/Newgrounds.hx) is the Haxe library for the [newgrounds.io](https://www.newgrounds.io/) Newgrounds API, which was implemented in Haxe by [Geokureli](https://geokureli.newgrounds.com/)

[SteamWrap](https://github.com/larsiusprime/SteamWrap) is the Haxe library for the Steam API, which was originally made by [Lucas Pope](https://twitter.com/dukope) for [Papers, Please](http://papersplea.se/), and then forked and updated and shit by [Lars Doucet](https://twitter.com/larsiusprime)
