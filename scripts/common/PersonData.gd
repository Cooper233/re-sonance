class_name PersonData

var tagTried:Dictionary
var tagSuccess:Dictionary
var tagCommon:Dictionary
var tagDislike:Dictionary

var songRecommandDate:Dictionary
var songRecommandResult:Dictionary
var songLikeTime:int
var songDislikeTime:int

func addSong(song:MusicBase,flag:int,time:int):
	songRecommandDate[song.id]=time;
	songRecommandResult[song.id]=flag;
	var tar;
	if flag==1:
		tar=tagSuccess;
		songLikeTime+=1;
	elif flag==0:
		tar=tagCommon;
	else:
		tar=tagDislike;
		songDislikeTime+=1;
	for i in song.tag:
		if tar.has(i):
			tar[i]=tar[i]+1;
		else:
			tar[i]=1;
		tagTried[i]=tagTried.get(i,0)+1
	
func getTagSuccess(id:String):
	return tagSuccess.get(id,0);
