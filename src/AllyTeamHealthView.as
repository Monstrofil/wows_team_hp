package 
{
	import com.monstrofil.components.HealthItem;
	import com.monstrofil.views.TeamHealthView;
	/**
	 * ...
	 * @author Monstrofil
	 */
	public class AllyTeamHealthView extends TeamHealthView 
	{
		
		public function AllyTeamHealthView() 
		{
			super();
			this.healthBar.type = HealthItem.ALLY;
		}
		
		public override function updateLayout(): void {
			this.healthBar.x = -this.healthBar.width - 50;
			this.healthText.x = this.healthBar.x - this.healthText.textWidth - 10;
			
			super.updateLayout();
		}
		
	}

}