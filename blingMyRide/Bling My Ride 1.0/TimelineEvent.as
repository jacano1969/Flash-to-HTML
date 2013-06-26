package{
	import flash.events.*;
	
	public class TimelineEvent extends Event{
		
		//the contstants
		public static const ANIMATION_STOPPED:String = "animation_stopped";
		public static const ANIMATION_STARTED:String = "animation_started";
		
		/* constructor	*/ 
		public function TimelineEvent(type:String){
			//super(type, bubbles, cancellable);
			super(type, false, false);
		}
		 
		public override function clone():Event {
			return new TimelineEvent(type);
		}
	}
}