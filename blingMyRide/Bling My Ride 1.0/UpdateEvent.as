package{
	import flash.events.*;
	
	public class UpdateEvent extends Event{
		
		//the contstant
		public static const UPDATE:String = "update";
		
		/* constructor	*/
		public function UpdateEvent(type:String){
			//super(type, bubbles, cancellable);
			super(type, true, true);
		}
		
		 
		public override function clone():Event{
			return new TimelineEvent(type);
		}
	
	}
}