moment = require 'moment'

Template.home.helpers {
	watchAgain: ->
	return [] if not Session.get 'watchAgainLoaded'
	(WatchAgain.find {}, {limit: 25}).fetch!
		newVideos: ->
	(Videos.find {
		source: 'chainByCreated'
		'json.hide': {$ne: 1}
	}, {limit: 25}).fetch!
		hotVideos: ->
	(Videos.find {
		source: 'chainByHot'
		'json.hide': {$ne: 1}
	}, {limit: 25}).fetch!
		trendingVideos: ->
	(Videos.find {
		source: 'chainByTrending'
		'json.hide': {$ne: 1}
	}, {limit: 25}).fetch!
		feedVideos: ->
	(Videos.find {
		source: 'chainByFeed-' + Session.get 'activeUsername'
		'json.hide': {$ne: 1}
	}, {limit: 25}).fetch!
}

Template.home.events {
	'click .addwatchlater': ->
	WatchLater.upsert {@_id}, this
	event.preventDefault!
	return
	'click .watchlater': ->
	WatchLater.remove @_id
	event.preventDefault!
	return
	'click #remove': (event) ->
		removeId = @_id
	WatchAgain.remove {_id: removeId.substring 0, removeId.length - 1}
	event.preventDefault!
	return
}

Template.home.rendered = ->
Videos.refreshBlockchain (->)
Template.settingsdropdown.nightMode!
if //Mobi//.test navigator.userAgent then Template.sidebar.empty! else Template.sidebar.half!
	return 