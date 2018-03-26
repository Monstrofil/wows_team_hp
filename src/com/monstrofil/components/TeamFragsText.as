package com.monstrofil.components 
{
	import flash.filters.DropShadowFilter;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	/**
	 * ...
	 * @author Monstrofil
	 */
	public class TeamFragsText extends TextField 
	{
		private var defaultShadow: DropShadowFilter = new DropShadowFilter(0, 45, 0x000000);
		private var myTextFormat: TextFormat = new TextFormat();
		
		public function TeamFragsText(align: String) 
		{
			super();
			
			this.myTextFormat.font = "WarHeliosCondCBold";
			this.myTextFormat.size = 20;
			this.myTextFormat.color = 0xFFFFFF;
			this.myTextFormat.align = align;
			this.defaultTextFormat = this.myTextFormat;
			this.setTextFormat(this.myTextFormat);
			
			this.filters = [this.defaultShadow]; 
		}
		
	}

}