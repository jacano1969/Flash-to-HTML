package {
    import flash.display.*;
    import flash.display.GradientType;
    import flash.geom.ColorTransform;
    import flash.events.MouseEvent;
	import caurina.transitions.*;
	import caurina.transitions.properties.ColorShortcuts;
	ColorShortcuts.init();

    public class ColorTransformExample extends Sprite {
        public function ColorTransformExample() {
            var target:Sprite = new Sprite();
            draw(target);
            addChild(target);
            target.useHandCursor = true;
            target.buttonMode = true;
            target.addEventListener(MouseEvent.CLICK, clickHandler)
        }
        public function draw(sprite:Sprite):void {
            var red:uint = 0xFF0000;
            var green:uint = 0x00FF00;
            var blue:uint = 0x0000FF;
            var size:Number = 100;
            sprite.graphics.beginGradientFill(GradientType.LINEAR, [red, blue, green], [1, 0.5, 1], [0, 200, 255]);
            sprite.graphics.drawRect(0, 0, 100, 100);
        }
        public function clickHandler(event:MouseEvent):void {
			//var mc:MovieClip = new MovieClip();
			var cTrans:ColorTransform = new ColorTransform();
			cTrans.color = 0xFF0000;
			//mc.transform.colorTransform = cTrans;
			Tweener.addTween(mc, { _color:0xffcc00, time:.5,transition:"easeOutCubic" } )
            var rOffset:Number = transform.colorTransform.redOffset + 25;
            var bOffset:Number = transform.colorTransform.redOffset - 25;
            this.transform.colorTransform = new ColorTransform(1, 1, 1, 1, rOffset, 0, bOffset, 0);
        }
    }
} 