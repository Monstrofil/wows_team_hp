package com.monstrofil.views 
{
	import com.monstrofil.components.TeamFragsText;
	import flash.display.MovieClip;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	/**
	 * ...
	 * @author Monstrofil
	 */
	public class TeamFragsView extends MovieClip
	{
		internal var allyFragsText:TeamFragsText = new TeamFragsText(TextFormatAlign.RIGHT);
		internal var enemyFragsText:TeamFragsText = new TeamFragsText(TextFormatAlign.LEFT);
		
		internal var fragsRelationText:TeamFragsText = new TeamFragsText(TextFormatAlign.CENTER);
		
		public function TeamFragsView() 
		{
			this.fragsRelationText.text = ':';
			this.allyFragsText.text = '0';
			this.enemyFragsText.text = '0';
			
			this.addChild(enemyFragsText);
			this.addChild(allyFragsText);
			this.addChild(fragsRelationText);
			
			this.fragsRelationText.width = 10;
			
			this.enemyFragsText.width = this.allyFragsText.width = 30;
			
			this.fragsRelationText.x = -this.fragsRelationText.width / 2;
			this.allyFragsText.x = -this.allyFragsText.width - this.fragsRelationText.width / 2;
			this.enemyFragsText.x = this.fragsRelationText.width / 2;
		}
		
		public function setTeamFrags(allyFrags: Number, enemyFrags: Number): void {
			this.allyFragsText.text = allyFrags.toString();
			this.enemyFragsText.text = enemyFrags.toString();
		}
		
	}

}