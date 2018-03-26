package com.monstrofil.views 
{
	import com.monstrofil.components.HealthBar;
	import com.monstrofil.components.HealthText;
	import com.monstrofil.components.TeamFragsText;
	import flash.display.MovieClip;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Monstrofil
	 */
	public class TeamHealthView extends MovieClip
	{
		public var healthBar: HealthBar = new HealthBar();
		public var healthText: HealthText = new HealthText();
		
		public function TeamHealthView() 
		{
			this.addChild(this.healthBar);
			this.addChild(this.healthText);
			
			this.updateLayout();
		}
		
		public function updateLayout(): void {
			this.healthText.y = -5;
		}
		
		public function set health(value: Number): void {
			this.healthBar.health = value;
			
			this.healthText.text = Math.ceil(value / 1000).toString() + 'K';

			this.updateLayout();
		}
		
		public function set maxHealth(value: Number): void {
			this.healthBar.maxHealth = value;
		}
		
	}

}