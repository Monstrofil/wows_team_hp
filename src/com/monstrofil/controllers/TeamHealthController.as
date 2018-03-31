package com.monstrofil.controllers 
{
	import com.monstrofil.views.TeamFragsView;
	import com.monstrofil.views.TeamHealthView;
	import flash.display.DisplayObject;
	import flash.display.Stage;
	import flash.events.TimerEvent;
	import flash.utils.Dictionary;
	import flash.utils.Timer;
	import lesta.components.Avatar;
	import lesta.components.Health;
	import lesta.components.Ship;
	import lesta.components.Vehicle;
	import lesta.components.Visibility;
	import lesta.constants.PlayerRelation;
	import lesta.datahub.Collection;
	import lesta.constants.ComponentClass;
	import lesta.datahub.Entity;
	import lesta.dialogs.battle_window_new.HudElementController;
	import lesta.structs.Player;
	import lesta.structs.ShipInfo;
	import lesta.unbound.core.UbCentral;
	import lesta.unbound.core.UbController;
	import lesta.unbound.core.UbScope;
	import lesta.unbound.expression.IUbExpression;
	import lesta.utils.GameInfoHolder;
	import scaleform.clik.data.DataProvider;
	
	/**
	 * ...
	 * @author Monstrofil
	 */
	public class TeamHealthController extends HudElementController 
	{	
		private var updateTimer:Timer = new Timer(2000);
		private var healthCache: Dictionary = new Dictionary();
		
		public var allyTeamHealthView: TeamHealthView;
		public var enemyTeamHealthView: TeamHealthView;
		public var teamFrags: TeamFragsView;
		
		public var stageComponent: lesta.components.Stage;
		
		public function TeamHealthController() 
		{
			super();
			this.updateTimer.addEventListener(TimerEvent.TIMER, this.onTick);
		}
		
		override protected function init(): void
		{	
			this.updateTimer.start();
			
			this.stageComponent = dataHub.getSingleComponent(ComponentClass.stage) as lesta.components.Stage;
			this.onUpdateStageSize(this.stageComponent);
			this.stageComponent.evStageSizeChanged.addCallback(this.updateStageSize);
			
			super.init();
		}
		
		public function onUpdateStageSize (stage: lesta.components.Stage) : void {
			this.allyTeamHealthView.x = this.enemyTeamHealthView.x = this.teamFrags.x = stage.width / 2;
			this.allyTeamHealthView.y = this.enemyTeamHealthView.y = 10;
		}
		
		override protected function fini(): void {
			this.updateTimer.stop();
			this.stageComponent.evStageSizeChanged.removeCallback(this.onUpdateStageSize);
			super.fini();
		}
		
		private function getTeamInfo(array: Array): Object {
			trace("========================================");
			var teamHealth: Number = 0;
			var teamMaxHealth: Number = 0;
			var teamDeadPlayers: Number = 0;
			array.forEach(function(entity: Entity):void {
				var healthComponent: Health = entity.getComponent(ComponentClass.health) as Health;
				var visibilityComponent: Visibility = entity.getComponent(ComponentClass.visibility) as Visibility;
				var avatarComponent: Avatar = entity.getComponent(ComponentClass.avatar) as Avatar;
				
				if (!healthComponent.isAlive){
					teamDeadPlayers += 1;
				}
							
				// we have problems with non-visible players
				if (!visibilityComponent.visible) {
					// non-itilialized player
					if (healthComponent.max == 0) {
						var shipComponent: Ship = avatarComponent.ship.ref.ship;
						teamMaxHealth += shipComponent.params.health;
						// let's think that ship is full
						if (healthComponent.isAlive){
							teamHealth += shipComponent.params.health;
						}
						
					}
					else {
						teamMaxHealth += healthComponent.max;
						if (healthComponent.isAlive){
							teamHealth += healthComponent.value;
						}
					}
				}
				else {
					if (healthComponent.isAlive){
						teamHealth += healthComponent.value;
					}
					teamMaxHealth += healthComponent.max;
				}
			});
			trace(teamHealth, teamMaxHealth);
			trace("========================================");
			
			return {health: teamHealth, maxHealth: teamMaxHealth, teamFrags: teamDeadPlayers};
		}
		
		public function onTick(e:TimerEvent):void {
			var teams:Collection = dataHub.getCollection(ComponentClass.avatar).child("team");
			var allyList:Collection = teams.child(PlayerRelation.STRINGS[PlayerRelation.FRIEND]).child("sortedAlive");
			var enemyList:Collection = teams.child(PlayerRelation.STRINGS[PlayerRelation.ENEMY]).child("sortedAlive");
			
			var allyTeam: Object = this.getTeamInfo(allyList.items);
			this.allyTeamHealthView.maxHealth = allyTeam.maxHealth;
			this.allyTeamHealthView.health = allyTeam.health;

			var enemyTeam: Object = this.getTeamInfo(enemyList.items);
			this.enemyTeamHealthView.maxHealth = enemyTeam.maxHealth;
			this.enemyTeamHealthView.health = enemyTeam.health;
			
			this.teamFrags.setTeamFrags(enemyTeam.teamFrags, allyTeam.teamFrags);
		}
		
	}

}