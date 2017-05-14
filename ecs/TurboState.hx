package turbo.ecs;

import flixel.FlxState;
import flixel.FlxG;
import turbo.ecs.Entity;
import turbo.ecs.components.ColourComponent;
import turbo.ecs.components.ImageComponent;
import turbo.ecs.components.TextComponent;

// A sad but necessary class
class TurboState extends FlxState
{
    public var width(get, null):Int;
    public var height(get, null):Int;

    private var entities = new Array<Entity>();

    override public function create():Void
    {
        super.create();        

        ImageComponent.onAdd = function(i)
        {
            this.add(i.sprite);
        }

        ColourComponent.onAdd = function(c)
        {
            this.add(c.sprite);
        }

        ColourComponent.onRemove = function(c)
        {
            this.remove(c.sprite);
        }

        TextComponent.onAdd = function(t)
        {
            this.add(t.text);
        }
        
        TextComponent.onRemove = function(t)
        {
            this.remove(t.text);
        }
    }

    override public function update(elapsedSeconds:Float):Void
    {
        super.update(elapsedSeconds);
        for (e in this.entities)
        {
            e.update(elapsedSeconds);
        }
    }

    public function get_width():Int
    {
        return FlxG.stage.stageWidth;
    }

    public function get_height():Int
    {
        return FlxG.stage.stageHeight;
    }
}