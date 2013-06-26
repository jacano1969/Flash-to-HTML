package{
	import flash.events.*;
	
	public class TimelineEvent extends Event{
		
		//the contstant
		public static const GO:String = "go";
		
	
		/* constructor	*/ 
		public function TimelineEvent(type:String){
			//super(type, bubbles, cancellable);
			super(type, true, true);
		}
		
		 
		public override function clone():Event{
			return new TimelineEvent(type);
		}
	
	}
}