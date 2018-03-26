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
		private var myTextFormat: TextFormat = new TextFormat();
		
		public function HealthText() 
		{
			super();
			
			this.myTextFormat.font = "WarHeliosCondCBold";
			this.myTextFormat.size = 16;
			this.myTextFormat.color = 0xFFFFFF;
			this.defaultTextFormat = this.myTextFormat;
			this.setTextFormat(this.myTextFormat);
			
			this.filters = [this.defaultShadow]; 
		}
		
	}

}