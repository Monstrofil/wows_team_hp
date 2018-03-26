package com.monstrofil.components 
{
	import flash.display.MovieClip;
	import flash.text.TextField;
	
	import flash.filters.DropShadowFilter;
	
	/**
	 * ...
	 * @author Monstrofil
	 */
	public class HealthBar extends MovieClip 
	{
		private const ITEMS_COUNT:Number = 30;
		
		private var _type:Number = HealthItem.DISABLED;
		private var _items:Vector.<HealthItem> = new Vector.<HealthItem>();
		
		private var _maxHealth: Number = 1;
		private var _health: Number = 1;
		
		private var shadowFilter:DropShadowFilter = new DropShadowFilter(0, 1, 0x000000, 1, 5, 5, 1);
		
		public function HealthBar() 
		{
			super();
			this.init();
			
			this.height = HealthItem.HEIGHT;
			
			this.filters = [this.shadowFilter];
		}
		
		private function init(): void {
			for (var i = 0; i < ITEMS_COUNT; i++) {
				var hItem:HealthItem = new HealthItem();
				hItem.x = i * (HealthItem.WIDTH + 2);
				
				this.addChild(hItem);
				this._items.push(hItem);
			}
			this.update();
		}
		
		private function update(): void {
			for (var i = 0; i < ITEMS_COUNT; i++) {
				var index = i;
				if (this._type == HealthItem.ALLY) {
					index = ITEMS_COUNT - i - 1;
				}
				
				if (i < ITEMS_COUNT * (this._health / this._maxHealth)) {
					this._items[index].setType(this._type);
				}
				else {
					this._items[index].setType(HealthItem.DISABLED);
				}
			}
		}
		
		public function set health(value: Number):void {
			this._health = value;
			
			this.update();
		}
		
		public function set maxHealth(value: Number):void {
			this._maxHealth = value;
		}
		
		
		public function set type(value: Number):void {
			this._type = value;
		}
		
	}

}