package com.monstrofil.components 
{
	import flash.filters.DropShadowFilter;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	/**
	 * ...
	 * @author Monstrofil
	 */
	public class HealthText extends TextField 
	{
		private var defaultShadow: DropShadowFilter = new DropShadowFilter(0, 45, 0x000000);
		private var healthTextFormat: TextFormat = new TextFormat();
		
		public function HealthText() 
		{
			super();
			
			this.healthTextFormat.font = "$ZurichCondensedBold";
			this.healthTextFormat.size = 16;
			this.healthTextFormat.color = 0xFFFFFF;
			this.defaultTextFormat = this.healthTextFormat;
			this.setTextFormat(this.healthTextFormat);
			
			this.filters = [this.defaultShadow]; 
		}
		
	}

}