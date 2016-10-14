package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.group.FlxSpriteGroup.FlxTypedSpriteGroup;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.FlxObject;
import sprites.Enemigo;
import sprites.Hunter;
import sprites.Options;
import sprites.Nave;
import sprites.Disparo;
import sprites.Shield;
import sprites.Piranha;
import sprites.Falcon;
import sprites.Upgrade;

class PlayState extends FlxState
{
	private var cameraRail:FlxSprite;
	private var player:Nave;
	private var option1:Options;
	private var option2:Options;
	private var tilemap0:FlxTilemap;
	private var tilemap1:FlxTilemap;
	private var tilemap2:FlxTilemap;
	private var tilemap3:FlxTilemap;
	private var upgradeBar:FlxSprite;
	private var upg:UInt = 0;
	private var count:UInt = 0;
	private var dispEnable:Bool = true;
	private var shield:Shield;
	private var collision:Bool = true;
	private var collisionCount:Int = -1;
	private var hunters:FlxTypedSpriteGroup<Hunter>;
	private var hunter:Hunter;
	private var piranhas:FlxTypedSpriteGroup<Piranha>;
	private var piranha:Piranha;
	private var falcons:FlxTypedSpriteGroup<Falcon>;
	private var falcon:Falcon;
	private	var loader:FlxOgmoLoader ;
	private var liveText:FlxText;
	private var lives:UInt;
	private var upgrades:FlxTypedSpriteGroup<Upgrade>;
	private var upgrade:Upgrade;
	
	override public function create():Void
	{
		super.create();
		
		FlxG.mouse.visible = false;
		
		
		prepareMap();
		
		hunters = new FlxTypedSpriteGroup<Hunter>();
		piranhas = new FlxTypedSpriteGroup<Piranha>();
		falcons = new FlxTypedSpriteGroup<Falcon>();
		upgrades = new FlxTypedSpriteGroup<Upgrade>();
		
		player = new Nave();
		loader.loadEntities(placeEntities, "entities");
		
		cameraRail = new FlxSprite(player.x, player.y);
		cameraRail.velocity.x = 64;
		cameraRail.visible = false;
		
		FlxG.camera.setScrollBounds(0, tilemap0.width, 0, tilemap0.height);
		FlxG.camera.follow(cameraRail);
		
		
		add(cameraRail);
		add(tilemap0);
		add(tilemap1);
		add(tilemap2);
		add(tilemap3);
		
		add(player);
		add(hunters);
		add(piranhas);
		add(falcons);
		add(upgrades);
		
		option1 = new Options ();
		option2 = new Options ();
		option1.kill();
		option2.kill();
		
		shield = new Shield();
		shield.kill();
		
		liveText = new FlxText(2, 2);
		liveText.scrollFactor.x = 0;
		add(liveText);
		
		createUpgradeBar();
		
		if (FlxG.sound.music == null) // don't restart the music if it's alredy playing
		{
			FlxG.sound.playMusic(AssetPaths.gradius__wav, 1, true);
		}	
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		checkCollision();
		
		if ( collision == true)
		{
			if(FlxG.collide(tilemap0, player)|| FlxG.collide(tilemap1, player)||
				FlxG.collide(tilemap2, player) || FlxG.collide(tilemap3, player))
			{
				looseLife();
			}
			
			if (FlxG.collide(tilemap0, player.getBomb()) || FlxG.collide(tilemap1, player.getBomb()) || 
				FlxG.collide(tilemap3,player.getBomb()) || FlxG.collide(tilemap2,player.getBomb()) )
			{
				player.getBomb().explode();
			}
			if (FlxG.collide(tilemap0, option1.getBomb()) || FlxG.collide(tilemap1, option1.getBomb()) || 
				FlxG.collide(tilemap3,option1.getBomb()) || FlxG.collide(tilemap2,option1.getBomb()) )
			{
				option1.getBomb().explode();
			}
			if (FlxG.collide(tilemap0, option2.getBomb()) || FlxG.collide(tilemap1, option2.getBomb()) || 
				FlxG.collide(tilemap3,option2.getBomb()) || FlxG.collide(tilemap2,option2.getBomb()) )
			{
				option2.getBomb().explode();
			}
			
			for (i in 0...hunters.length)
			{
				hunter = hunters.members[i];
				if (FlxG.overlap(player, hunter.getShot()))
				{
					gotShot();
					hunter.getShot().destroy();
				}
				if (FlxG.overlap(player.getBomb(), hunter))
				{
					hunter.explode();
					checkUpgrade(hunter);
					player.getBomb().explode();
				}
				if (FlxG.overlap(option1.getBomb(), hunter))
				{
					hunter.explode();
					checkUpgrade(hunter);
					option1.getBomb().explode();
				}
				if (FlxG.overlap(option2.getBomb(), hunter))
				{
					hunter.explode();
					checkUpgrade(hunter);
					option2.getBomb().explode();
				}
				
			}
			
			
			for (i in 0...piranhas.length)
			{
				piranha = piranhas.members[i];
				if (FlxG.overlap(player, piranha))
				{
					gotShot();
					piranha.explode();
				}
				if (FlxG.overlap(player.getBomb(), piranha))
				{
					piranha.explode();
					checkUpgrade(piranha);
					player.getBomb().explode();
				}
				if (FlxG.overlap(option1.getBomb(), piranha))
				{
					piranha.explode();
					checkUpgrade(piranha);
					option1.getBomb().explode();
				}
				if (FlxG.overlap(option2.getBomb(), piranha))
				{
					piranha.explode();
					checkUpgrade(piranha);
					option2.getBomb().explode();
				}
				
				if (FlxG.overlap(player.getShot(), piranha))
				{
					piranha.explode();
					checkUpgrade(piranha);
					player.getShot().destroy();
				}
				if (FlxG.overlap(option1.getShot(), piranha))
				{
					piranha.explode();
					checkUpgrade(piranha);
					option1.getShot().destroy();
				}
				if (FlxG.overlap(option2.getShot(), piranha))
				{
					piranha.explode();
					checkUpgrade(piranha);
					option2.getShot().destroy();
				}
				if (FlxG.overlap(player.getShot2(), piranha))
				{
					piranha.explode();
					checkUpgrade(piranha);
					player.getShot2().destroy();
				}
				if (FlxG.overlap(option1.getShot2(), piranha))
				{
					piranha.explode();
					checkUpgrade(piranha);
					option1.getShot2().destroy();
				}
				if (FlxG.overlap(option2.getShot2(), piranha))
				{
					piranha.explode();
					checkUpgrade(piranha);
					option2.getShot2().destroy();
				}
			}
			for (i in 0...falcons.length)
			{
				falcon = falcons.members[i];
				if (FlxG.overlap(player, falcon))
				{
					gotShot();
					falcon.crashed();
				}
				if (FlxG.overlap(player.getBomb(), falcon))
				{
					falcon.crashed();
					checkUpgrade(falcon);
					player.getBomb().explode();
				}
				if (FlxG.overlap(option1.getBomb(), falcon))
				{
					falcon.crashed();
					checkUpgrade(falcon);
					option1.getBomb().explode();
				}
				if (FlxG.overlap(option2.getBomb(), falcon))
				{
					falcon.crashed();
					checkUpgrade(falcon);
					option2.getBomb().explode();
				}
				
				if (FlxG.overlap(player.getShot(), falcon))
				{
					falcon.crashed();
					checkUpgrade(falcon);
					player.getShot().destroy();
				}
				if (FlxG.overlap(option1.getShot(), falcon))
				{
					falcon.explode();
					checkUpgrade(falcon);
					option1.getShot().destroy();
				}
				if (FlxG.overlap(option2.getShot(), falcon))
				{
					falcon.crashed();
					checkUpgrade(falcon);
					option2.getShot().destroy();
				}
				if (FlxG.overlap(player.getShot2(), falcon))
				{
					falcon.crashed();
					checkUpgrade(falcon);
					player.getShot2().destroy();
				}
				if (FlxG.overlap(option1.getShot2(), falcon))
				{
					falcon.crashed();
					checkUpgrade(falcon);
					option1.getShot2().destroy();
				}
				if (FlxG.overlap(option2.getShot2(), falcon))
				{
					falcon.crashed();
					checkUpgrade(falcon);
					option2.getShot2().destroy();
				}
			}
		}
		
		
		for (i in 0...upgrades.length)
		{
			upgrade = upgrades.members[i];
			if (FlxG.overlap(player, upgrade )&& upg<6)
			{
				upg++;
			}
		}
		
		
		
		
		if (cameraRail.x >= (tilemap0.width - (FlxG.width - 50)))
		{
			player.velocity.x = 0;
			if (option1.exists)
			{
				option1.velocity.x = 0;
				option2.velocity.x = 0;	
			}
		}
		
		option1.setPosition(player.x-player.width/3,player.y+player.height);
		option2.setPosition(player.x - player.width / 3, player.y - player.height / 2);
		
		if (FlxG.keys.justPressed.A)
		{
			upg++;
			upg %= 6;
			
		}
		
		refreshUpg();
		
		
		if (count == 0)
		{
			dispEnable = true;
		}
		
		if (FlxG.keys.justPressed.SPACE)
		{
			if (upg == 5 && !shield.exists)
			{
				shield = new Shield(player.x, player.y);
				add(shield);
			}
			if (upg >= 4)
			{
				if (!option1.exists)
				{
					option1 = new Options (player.x, player.y + player.height);
					option2 = new Options (player.x, player.y - player.height/2);
					add(option1);
					add(option2);
				}
			}
			if (upg >= 1)
			{
				cameraRail.velocity.x = 96;
			}
			if (dispEnable == true)
			{
				if (option1.exists)
				{
					option1.shoot(upg);
					option2.shoot(upg);
				}
				player.shoot(upg);
				dispEnable = false;
			}
		}
		
		if (shield.exists)
		{
			shield.setPosition(player.x, player.y);
		}
		
		
		lives = player.getLives();
		
		if (lives == 0)
		{
			FlxG.switchState(new EndState());
		}
		
		liveText.text = 'Lives: $lives';
		
		count++;
		count %= 50;
		
	}
		
	
	private function placeEntities(entityName:String, entityData:Xml):Void
	{
		if (entityName == "player")
		{
			player.x = Std.parseInt(entityData.get("x"));
			player.y = Std.parseInt(entityData.get("y"));
		}
		if (entityName == "hunter" )
		{
			hunter = new Hunter (Std.parseInt(entityData.get("x")), Std.parseInt(entityData.get("y")));
			hunters.add(hunter);
		}
		if (entityName == "piranha" )
		{
			piranha = new Piranha (Std.parseInt(entityData.get("x")), Std.parseInt(entityData.get("y")));
			piranhas.add(piranha);
		}
		if (entityName == "falcon" )
		{
			falcon = new Falcon (Std.parseInt(entityData.get("x")), Std.parseInt(entityData.get("y")));
			falcons.add(falcon);
		}
	}

	private function createUpgradeBar():Void
	{
		
		upgradeBar = new FlxSprite(8, FlxG.height - 16);
		upgradeBar.loadGraphic(AssetPaths.upgrades__png, true, 240, 14);
		upgradeBar.animation.add("upgrade0", [0], 0, false);
		upgradeBar.animation.add("upgrade1", [1], 0, false);
		upgradeBar.animation.add("upgrade2", [2], 0, false);
		upgradeBar.animation.add("upgrade3", [3], 0, false);
		upgradeBar.animation.add("upgrade4", [4], 0, false);
		upgradeBar.animation.add("upgrade5", [5], 0, false);
		upgradeBar.animation.play("upgrade0");
		
		upgradeBar.scrollFactor.x=0;
		upgradeBar.scrollFactor.y = 0;
		
		upgradeBar.alpha = 0.4;
		
		add(upgradeBar);
		
	}
	
	private function refreshUpg():Void
	{
		upgradeBar.animation.play('upgrade$upg');
	}
	
	private function checkCollision():Void
	{
		if (collisionCount > 0)
		{
			collisionCount--;
		}
		if (collisionCount == 0)
		{
			collisionCount=-1;
			collision=true;
		}
	}
	
	private function looseLife():Void
	{
		player.removeLive();
		upg = 0;
		option1.kill();
		option2.kill();
		shield.kill();
		
		cameraRail.velocity.x = 64;
		collisionCount = 300;
		collision = false;
	}
	
	private function gotShot():Void
	{
		if (shield.exists)
		{
			shield.kill();
		}
		else
		{
			looseLife();
		}
	}
	private function prepareMap():Void
	{
		
		loader = new FlxOgmoLoader(AssetPaths.level__oel);
	 
		tilemap0 = loader.loadTilemap(AssetPaths.tiles___png, 16, 16, "Layer0");
		tilemap1 = loader.loadTilemap(AssetPaths.tiles___png, 16, 16, "Layer1");
		tilemap2 = loader.loadTilemap(AssetPaths.tiles___png, 16, 16, "Layer2");
		tilemap3 = loader.loadTilemap(AssetPaths.tiles___png, 16, 16, "Layer3");
		FlxG.worldBounds.set(0, 0, tilemap0.width, tilemap0.height);
		
		tilemap0.setTileProperties(0, FlxObject.NONE);
		tilemap0.setTileProperties(1, FlxObject.NONE);
		tilemap0.setTileProperties(2, FlxObject.NONE);
		tilemap0.setTileProperties(3, FlxObject.ANY);
		tilemap0.setTileProperties(4, FlxObject.ANY);
		tilemap0.setTileProperties(5, FlxObject.ANY);
		tilemap0.setTileProperties(6, FlxObject.NONE);
		tilemap0.setTileProperties(7, FlxObject.ANY);
		tilemap0.setTileProperties(8, FlxObject.ANY);
		tilemap0.setTileProperties(9, FlxObject.ANY);
		tilemap0.setTileProperties(10, FlxObject.ANY);
		tilemap0.setTileProperties(11, FlxObject.ANY);
		tilemap0.setTileProperties(12, FlxObject.ANY);
			
		tilemap1.setTileProperties(0, FlxObject.NONE);
		tilemap1.setTileProperties(1, FlxObject.NONE);
		tilemap1.setTileProperties(2, FlxObject.NONE);
		tilemap1.setTileProperties(3, FlxObject.NONE);
		tilemap1.setTileProperties(4, FlxObject.ANY);
		tilemap1.setTileProperties(5, FlxObject.ANY);
		tilemap1.setTileProperties(6, FlxObject.NONE);
		tilemap1.setTileProperties(7, FlxObject.ANY);
		tilemap1.setTileProperties(8, FlxObject.ANY);
		tilemap1.setTileProperties(9, FlxObject.NONE);
		tilemap1.setTileProperties(10, FlxObject.ANY);
		tilemap1.setTileProperties(11, FlxObject.ANY);
		tilemap1.setTileProperties(12, FlxObject.ANY);
			
		tilemap2.setTileProperties(0, FlxObject.NONE);
		tilemap2.setTileProperties(1, FlxObject.NONE);
		tilemap2.setTileProperties(2, FlxObject.NONE);
		tilemap2.setTileProperties(3, FlxObject.ANY);
		tilemap2.setTileProperties(4, FlxObject.ANY);
		tilemap2.setTileProperties(5, FlxObject.ANY);
		tilemap2.setTileProperties(6, FlxObject.NONE);
		tilemap2.setTileProperties(7, FlxObject.ANY);
		tilemap2.setTileProperties(8, FlxObject.ANY);
		tilemap2.setTileProperties(9, FlxObject.ANY);
		tilemap2.setTileProperties(10, FlxObject.ANY);
		tilemap2.setTileProperties(11, FlxObject.ANY);
		tilemap2.setTileProperties(12, FlxObject.ANY);
			
		tilemap3.setTileProperties(0, FlxObject.NONE);
		tilemap3.setTileProperties(1, FlxObject.NONE);
		tilemap3.setTileProperties(2, FlxObject.NONE);
		tilemap3.setTileProperties(3, FlxObject.ANY);
		tilemap3.setTileProperties(4, FlxObject.ANY);
		tilemap3.setTileProperties(5, FlxObject.ANY);
		tilemap3.setTileProperties(6, FlxObject.NONE);
		tilemap3.setTileProperties(7, FlxObject.ANY);
		tilemap3.setTileProperties(8, FlxObject.ANY);
		tilemap3.setTileProperties(9, FlxObject.ANY);
		tilemap3.setTileProperties(10, FlxObject.ANY);
		tilemap3.setTileProperties(11, FlxObject.ANY);
		tilemap3.setTileProperties(12, FlxObject.ANY);
	
	}
	
	private function checkUpgrade(enem:Enemigo):Void
	{
		if (enem.getProb() == 0)
		{
			upgrade = new Upgrade(enem.x, enem.y);
			upgrades.add(upgrade);
		}
	}
}
