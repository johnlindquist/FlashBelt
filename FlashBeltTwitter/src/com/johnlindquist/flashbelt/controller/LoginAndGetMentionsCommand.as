package com.johnlindquist.flashbelt.controller{	import flight.domain.AsyncCommand;	import flight.list.Collection;	import com.johnlindquist.flashbelt.model.TwitterModel;	import com.johnlindquist.flashbelt.model.vo.LoginVO;	import com.johnlindquist.flashbelt.service.LoginService;	import com.johnlindquist.flashbelt.state.MainViewState;	import com.swfjunkie.tweetr.data.DataParser;	import com.swfjunkie.tweetr.data.objects.StatusData;	public class LoginAndGetMentionsCommand extends AsyncCommand 	{		public var loginVO:LoginVO;		[Inject]		public var loginService:LoginService;		[Inject]		public var mainViewState:MainViewState;		[Inject]		public var twitterModel:TwitterModel;		public function LoginAndGetMentionsCommand(loginVO:LoginVO) 		{			this.loginVO = loginVO;
		}
		override public function execute():void		{			trace("logging in");			response = loginService.login(loginVO.username, loginVO.password);			response.addResultHandler(onResult);			response.addFaultHandler(onFault);		}		private function onResult(data:*):void		{			if(data is String)			{				twitterModel.mentions = new Collection(DataParser.parseStatuses(XML(data)));				twitterModel.imageURLs.removeAll();				for each (var statusData : StatusData in twitterModel.mentions) 				{					twitterModel.imageURLs.addItem(statusData.user.profileImageUrl);					trace(statusData.user.profileImageUrl);				}								if(twitterModel.mentions.length == 1)				{					twitterModel.imageURLs.addItem("http://s.twimg.com/images/whale_error.gif");						twitterModel.imageURLs.addItem("http://s.twimg.com/images/whale_error.gif");						twitterModel.imageURLs.addItem("http://s.twimg.com/images/whale_error.gif");						twitterModel.imageURLs.addItem("http://s.twimg.com/images/whale_error.gif");						twitterModel.imageURLs.addItem("http://s.twimg.com/images/whale_error.gif");						twitterModel.imageURLs.addItem("http://s.twimg.com/images/whale_error.gif");					}								mainViewState.currentState = MainViewState.BOX2D_FLASH_VIEW;			}		}		private function onFault():void		{			mainViewState.currentState = MainViewState.ERROR_VIEW;		}	}}