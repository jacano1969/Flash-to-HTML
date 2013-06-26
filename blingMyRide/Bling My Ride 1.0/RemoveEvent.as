package{
	import flash.events.*;
	
	public class RemoveEvent extends Event{
		
		//the contstant
		public static const REMOVE:String = "remove";
		
		/* constructor	*/
		public function RemoveEvent(type:String){
			//super(type, bubbles, cancellable);
			super(type, true, true);
		}
		
		 
		public override function clone():Event{
			return new TimelineEvent(type);
		}
	
	}
}