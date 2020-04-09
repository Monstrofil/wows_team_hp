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
		private var teamFragsTextFormat: TextFormat = new TextFormat();
		
		public function TeamFragsText(align: String) 
		{
			super();
			
			this.teamFragsTextFormat.font = "$ZurichCondensedBold";
			this.teamFragsTextFormat.size = 20;
			this.teamFragsTextFormat.color = 0xFFFFFF;
			this.teamFragsTextFormat.align = align;
			this.defaultTextFormat = this.teamFragsTextFormat;
			this.setTextFormat(this.teamFragsTextFormat);
			
			this.filters = [this.defaultShadow]; 
		}
		
	}

}