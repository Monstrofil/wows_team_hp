package 
{
	CONFIG::debug {
		import com.junkbyte.console.Cc;
	}
	import com.monstrofil.views.TeamFragsView;
	
	/**
	 * ...
	 * @author Monstrofil
	 */
	public class TeamFragsLabelView extends TeamFragsView 
	{
		
		public function TeamFragsLabelView() 
		{
			super();
			CONFIG::debug {
				Cc.startOnStage(this);
			}
		}
		
	}

}