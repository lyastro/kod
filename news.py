# -*- coding: utf-8 -*-
"""
Python replacement for newsbeuter, an RSS based news reader. 
"""
import feedparser, sys, codecs
import re, time, os

sys.stdout = codecs.getwriter('utf8')(sys.stdout)
sys.stderr = codecs.getwriter('utf8')(sys.stderr)

def show():

    feeds = [("The Guardian","http://www.theguardian.com/world/rss"),
             ("Diken","http://www.diken.com.tr/feed/"),
             ("Cumhuriyet","http://www.cumhuriyet.com.tr/rss/son_dakika.xml"),
             (u"Hürriyet", "http://www.hurriyet.com.tr/rss/gundem"),
             ("Al-Jazeera","http://aljazeera.com.tr/rss.xml"),
             (u"Açık Gazete","https://www.acikgazete.com/feed/"),
             ("T24","https://twitrss.me/twitter_user_to_rss/?user=t24comtr"),
             ("Reuters (Top News)",'http://feeds.reuters.com/reuters/topNews'),
             ("Reuters (World)",'http://feeds.reuters.com/reuters/worldNews'),
             ("Reuters (Business)", "http://feeds.reuters.com/reuters/businessNews"),
             ("Bloomberg","https://twitrss.me/twitter_user_to_rss/?user=business"),
             ('Huffington Post','http://www.huffingtonpost.com/feeds/verticals/world/index.xml'),
             ('BBC','http://newsrss.bbc.co.uk/rss/newsonline_world_edition/front_page/rss.xml'),
             ("Sputnik News","http://tr.sputniknews.com/export/rss2/archive/index.xml"),
             ("EB","https://twitrss.me/twitter_user_to_rss/?user=ebabahan"),
             ("Akyol","https://twitrss.me/twitter_user_to_rss/?user=akyolmustafa")             
    ]

    if len(sys.argv) == 2 and sys.argv[1] == "x":
        feeds = [("Fuat Avni","https://twitrss.me/twitter_user_to_rss/?user=fuatavni_f")]
    
    for feed in feeds:
        print("\n")
        print("## " + feed[0])
        print("\n")
        d = feedparser.parse(feed[1])
        for post in d.entries:
            link = post.link; title = post.title
            if len(re.findall(r"Erdo.an", title)) > 0: continue
            #print("[[%s][%s]]" % (link,title))
            print("[[%s][%s]]" % (link,unicode(title)))


show()            