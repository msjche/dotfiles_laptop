#!/usr/bin/env python2
#------------------------------------------------#
#mpd notify-osd & cover linking for conky
#v1.2 sen
#------------------------------------------------#
#dependencies: python-mpd, (libnotify, notify-osd)
#------------------------------------------------#
import mpd,os,time
home = os.path.expanduser('~')

# settings
mpd_dir = '~/Music/'							#mpd music directory
notify_osd = False								#enable/disable notify-osd 
conky = True									#enable/disable conky cover linking
cover_default = '~/.icons/music.png'	#default cover for notify-osd
		
# notify-osd output
def notify(cover,artist,album,title):
	os.system('notify-send -i "%s" "%s" "%s\n%s"'%(cover,title,artist,album))

# look for cover
def coverPath():
	cover = cover_default
	
	# look in ~/.covers
	if os.path.exists('%s/.covers/%s-%s.jpg'%(home,artist,album)):
		cover = '%s/.covers/%s-%s.jpg'%(home,artist,album)
	
	# look in album dir
	else:
		for img in('cover.jpg', 'folder.jpg', 'front.jpg', 'album.jpg'):
			if os.path.exists('%s%s/%s'%(mpd_dir,os.path.dirname(last_song),img)):
				cover= '%s%s/%s'%(mpd_dir,os.path.dirname(last_song),img)
				break
	
	# link cover to /tmp for conky
	if conky == True:
		try:
			if os.path.exists('/tmp/cover'):
				os.system('rm /tmp/cover')
			if cover != cover_default:
				os.system('ln -s "%s" /tmp/cover'%cover)
		except:
			pass
			
	return cover

# mpd status message
def action(status):
	if status == 'play':
		bubble = 'notification-audio-play' + ' MPD Playing'
		notify(coverPath(),artist,album,title)
	elif status == 'pause':
		bubble = 'notification-audio-pause' + ' MPD Paused'
	else:
		bubble = 'notification-audio-stop' + ' MPD Stopped'
	os.popen('notify-send -u critical -h string:x-canonical-private-icon-only: -h string:x-canonical-private-synchronous: -i %s'%bubble)

# connect to MPD
success = False
while success == False:
	try:
		client = mpd.MPDClient()
		client.connect('localhost', 6600) 
		success = True
	except:
		print 'connection to MPD could not be established'
		time.sleep(5)
		success = False

try:
	last_song = client.currentsong()['file']
	last_status = client.status()['state']
	artist = client.currentsong()['artist']
	album = client.currentsong()['album']
	title = client.currentsong()['title']
	cover = coverPath()
	if notify_osd == True:
		notify(cover,artist,album,title)
	
except:
	last_song = ""
	last_status = ""

while True:
	try:
		currentsong = client.currentsong()['file']
		status = client.status()['state']
	except:
		currentsong = last_song
		status = last_status

	if last_status <> status:
		try:
			last_status = client.status()['state']
			if notify_osd == True:
				action(status)
		except:
			pass

	if last_song <> currentsong and status == 'play':
		try:
			last_song = client.currentsong()['file']
			try:
				artist = client.currentsong()['artist']
			except:
				artist = 'Unknown'
			try:
				album = client.currentsong()['album']
			except:
				album = 'Unknown'
			try:
				title = client.currentsong()['title']
			except:
				title = 'Unknown'
			cover = coverPath()
			if notify_osd == True:
				notify(cover,artist,album,title)
		except:
			pass
			
	time.sleep(1)
