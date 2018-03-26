package com.monstrofil.components 
{
	import flash.display.MovieClip;
	import flash.filters.DropShadowFilter;
	/**
	 * ...
	 * @author Monstrofil
	 */
	public class HealthItem extends MovieClip 
	{
		private var shadowFilter:DropShadowFilter = new DropShadowFilter(0, 0, 0x000000, 1, 2, 2, 1);
		
		private const ENEMY_COLOR:Number = 0xe03119;
		private const ALLY_COLOR:Number = 0x3ec794;
		private const DISABLED_COLOR:Number = 0xF8F8F8;
		
		public static const WIDTH:Number = 5;
		public static const HEIGHT:Number = 15;
		
		public static const ALLY:Number = 0;
		public static const ENEMY:Number = 1;
		public static const DISABLED:Number = 2;
		public function HealthItem() 
		{
			this.filters = [this.shadowFilter];
			
			this.setType(DISABLED);
		}
		
		public function setType(type: Number): void {
			this.graphics.clear();
			if (type == ENEMY) {
				this.graphics.beginFill(this.ENEMY_COLOR);
				this.graphics.drawRect(0, 0, WIDTH, HEIGHT);
				this.graphics.endFill();
			}
			else if (type == ALLY) {
				this.graphics.beginFill(this.ALLY_COLOR);
				this.graphics.drawRect(0, 0, WIDTH, HEIGHT);
				this.graphics.endFill();
			}
			else if (type == DISABLED) {
				this.graphics.beginFill(this.DISABLED_COLOR, 0.3);
				this.graphics.drawRect(0, 0, WIDTH, HEIGHT);
				this.graphics.endFill();
			}
		}
		
	}

}