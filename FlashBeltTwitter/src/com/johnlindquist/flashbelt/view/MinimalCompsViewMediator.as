package com.johnlindquist.flashbelt.view 
{
	import com.bit101.components.ListItem;
	import com.swfjunkie.tweetr.data.objects.SearchResultData;
	import com.swfjunkie.tweetr.data.objects.StatusData;
	import com.johnlindquist.flashbelt.model.TwitterModel;

	import org.robotlegs.mvcs.Mediator;

	import mx.events.CollectionEvent;
	import mx.events.CollectionEventKind;

	import flash.events.Event;

	/**
	 * @author John
	 */
	public class MinimalCompsViewMediator extends Mediator 
	{

		[Inject]
		public var minimalCompsView:MinimalCompsView;

		[Inject]
		public var twitterModel:TwitterModel;
		
		private var userNameToStatusMap:Object = {};

		override public function onRegister():void 
		{
			twitterModel.statuses.addEventListener(CollectionEvent.COLLECTION_CHANGE, onStatusesCollectionChange);
			
			for each (var status : SearchResultData in twitterModel.statuses) 
			{
				var listObject:Object = {};
				listObject.data = status;
				listObject.label = status.user;				
				minimalCompsView.addToList(listObject);
			}
			
			minimalCompsView.list.addEventListener(Event.SELECT, onListSelect);
		}

		private function onListSelect(event:Event):void 
		{
			minimalCompsView.textArea.text = SearchResultData(minimalCompsView.list.selectedItem.data).text;
		}

		private function onStatusesCollectionChange(event:CollectionEvent):void 
		{
			switch(event.kind)
			{
				case CollectionEventKind.ADD:
					minimalCompsView.addToList(twitterModel.statuses.getItemAt(event.location));
					break;
			}	
		}
	}
}
