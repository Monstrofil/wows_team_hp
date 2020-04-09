package com.monstrofil 
{
	import com.monstrofil.components.TeamFragsText;
	import AllyTeamHealthView;
	import EnemyTeamHealthView;
	import com.monstrofil.views.TeamFragsView;
	import com.monstrofil.controllers.TeamHealthController;
	import flash.display.MovieClip;
	import flash.filters.DropShadowFilter;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import lesta.api.ModBase;
	import lesta.components.Health;
	
	/**
	 * ...
	 * @author Monstrofil
	 */
	public class TotalHealthMovie extends MovieClip 
	{	
		public var listInclude = [
			AllyTeamHealthView, 
			EnemyTeamHealthView, 
			TeamHealthController, 
			TeamFragsLabelView
		];
		public function TotalHealthMovie() 
		{
			super();
		}
		
	}

}
