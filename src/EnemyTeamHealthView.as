package 
{
	import com.monstrofil.components.HealthItem;
	import com.monstrofil.views.TeamHealthView;
	/**
	 * ...
	 * @author Monstrofil
	 */
	public class EnemyTeamHealthView extends TeamHealthView 
	{
		
		public function EnemyTeamHealthView() 
		{
			super();
			this.healthBar.type = HealthItem.ENEMY;
		}
		
		public override function updateLayout(): void {
			this.healthText.x = this.healthBar.width + 7 + 50;
			this.healthBar.x = 50;
			
			super.updateLayout();
		}
	}

}