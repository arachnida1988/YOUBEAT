var audio;
var check = false;
var audioloading = false;
var body = document.body.clientWidth;
$("#footer").css("left",parseInt(body/5));
if(getCookie("playlist") != "") {// 플레이리스트 쿠키 유무확인 있을시 불러와서 저장된 재생시간에 맞게 셋팅
	$("#playlist").html(getCookie("playlist"));
	/* alert(getCookie("playlist")); */
	setAudio($("#playlist .active"));
	$("#play").hide();
	$("#pause").show();
} else {
	$("#pause").hide();
}

$("#playlist").hide();

//플레이리스트 보여주기 유무
$("#list").click(function() {
	if (!check) {
		$("#playlist").show();
		check = true;
	} else {
		$("#playlist").hide();
		check = false;
	}
});

// Initializer function
function initAudio(element) {
	var song = element.attr("song");
	var title = element.text();
	var cover = element.attr("cover");
	var artist = element.attr("artist");

	// create audio Object
	audio = new Audio("/beat/resources/upload/" + song);

	if (!audio.currentTime) {
		$("#duration").html("0.00");
	}
	$("#audio-player .title").text(title);
	$("#audio-player .artist").text(artist);

	// Insert Cover

	$("img.cover").attr("src", cover);
	$("#playlist li").removeClass("active");
	element.addClass("active");
}

// Initialize audio audio생성자
// initAudio($("#playlist li:first-child"));

// 음악클릭시 리스트추가후 재생
$("#tracks_wrap").on("click","._title",function() {
	if (audio != null) {
		audio.pause();
	}
	var create = document.createElement("li");
	var parent = $(this).parent();
	var title = document.createTextNode($(this).parent()
			.find("._title").text());
	create.setAttribute("song", $(this).attr("data-src"));
	create.setAttribute("cover", $(this).parent().find(".album img")
			.attr("src"));
	create.setAttribute("artist", $(this).parent().find("._artist")
			.text());
	create.setAttribute("class", "listClick");
	create.appendChild(title);
	$("#playlist").append(create);
	if ($("#playlist li") == 0) {
		setAudio($("#playlist li:first-child"));
		$("#play").hide();
		$("#pause").show();
		/* initAudio($("#playlist li:first-child")); */
	} else {
		setAudio($("#playlist li:last-child"));
		$("#play").hide();
		$("#pause").show();
		/* initAudio($("#playlist li:last-child")); */
	}
	setCookie("playlist", $("#playlist").html(), "1");
});
// 음악리스트 클릭시 해당음악재생
$("#playlist").on("click", ".listClick", function(e) {
	audio.pause();
	setAudio($(this));
	$("#play").hide();
	$("#pause").show();
});

// play button
$("#play").click(function() {
	audio.play();
	$("#play").hide();
	$("#pause").show();
	$("#duration").fadeIn(400);
	showDuration();
});
// pause button
$("#pause").click(function() {
	audio.pause();
	$("#pause").hide();
	$("#play").show();
});

// stop button
$("#stop").click(function() {
	audio.pause();
	audio.currentTime = 0;
	$("#pause").hide();
	$("#play").show();
	$("#duration").fadeOut(400);
});
// next button
$("#next").click(function() {
	/*
	 * audio.currentTime=0; audio.pause();
	 */
	$("#play").hide();
	$("#pause").show();
	if (audio.currentTime > 0) {
		audio.currentTime = 0;
		audio.pause();
	}
	var next = $("#playlist li.active").next();
	if (next.length == 0) {
		next = $("#playlist li:first-child");
	}
	setAudio(next);
	/*
	 * setTimeout(function() { initAudio(next); audio.play(); showDuration();
	 * },500);
	 */
});
// prev button
$("#prev").click(function() {
	/*
	 * audio.currentTime = 0; audio.pause();
	 */
	$("#play").hide();
	$("#pause").show();
	if (audio.currentTime > 0) {
		audio.currentTime = 0;
		audio.pause();
	}
	var prev = $("#playlist li.active").prev();
	if (prev.length == 0) {
		prev = $("#playlist li:last-child");
	}
	setAudio(prev);
	/*
	 * setTimeout(function() { initAudio(prev); audio.play(); showDuration(); },
	 * 500);
	 */
});

// volume control
$("#volume").change(function() {
	audio.volume = parseFloat(this.value / 10);
});

// time duration
function showDuration() {
	$(audio).bind("timeupdate", function() {
		if (audioloading == false) {
			audio.currentTime = getCookie("playtime");
			audioloading = true;
		}

		// getminute
		var s = parseInt(audio.currentTime % 60);
		var m = parseInt((audio.currentTime) / 60) % 60;
		// add 0 if less than 10
		if (s < 10) {
			s = '0' + s;
		}
		$("#duration").html(m + "." + s);
		var value = 0;
		if (audio.currentTime > 0) {
			value = Math.floor((100 / audio.duration) * audio.currentTime);
		}
		$("#progress").css("width", value + '%');

	});

}

// 오디오셋팅후플레이
function setAudio(data) {
	initAudio(data);
	showDuration();
	audio.play();
}

// auto next play
$(function() {
	if(audio!=null){
		$(audio).on("ended", function() { 
			audio.pause(); 
			var next = $("#playlist li.active").next(); 
			if (next.length == 0) { 
				next = $("#playlist li:first-child");
			}
			setAudio(next);
		});
	}
});
	


// 플레이리스트 우클릭시 리스트에서 해당곡삭제
$("#playlist").on("contextmenu", "li", function(e) {
	$(this).remove();
	// 재생중인 곡일때 그곡중지후 다음곡
	if ($(this).attr("class") == "listClick active") {
		audio.pause();
		if (getCookie != null) {
			deleteCookie("playtime");
		}

		if ($("#playlist li.active").next().length == 0) {
			setAudio($("#playlist li:first-child"));
		} else {
			setAudio($("#playlist li.active").next());
		}
		$("#play").hide();
		$("#pause").show();
	}
	if ($("#playlist").html() != null) {
		setCookie("playlist", $("#playlist").html(), "1");
	}
	return false;// 우클릭할때 브라우저의 우클릭기능을 정지 시킴
});

// 상단 헤더바클릭시 재생하던타임 저장
$("#test_wrap").click(function() {
	deleteCookie("playtime");
	deleteCookie("playlist");
	setCookie("playtime", audio.currentTime, "1");
	setCookie("playlist", $("#playlist").html(), "1");

});

// 쿠키셋exdays 몇일동안
function setCookie(cookieName, value, exdays) {
	var exdate = new Date();
	exdate.setDate(exdate.getDate() + exdays);
	var cookieValue = escape(value)
			+ ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
	document.cookie = cookieName + "=" + cookieValue;
}
// 쿠키겟
function getCookie(cookieName) {
	cookieName = cookieName + '=';
	var cookieData = document.cookie;
	var start = cookieData.indexOf(cookieName);
	var cookieValue = '';
	if (start != -1) {
		start += cookieName.length;
		var end = cookieData.indexOf(';', start);
		if (end == -1)
			end = cookieData.length;
		cookieValue = cookieData.substring(start, end);
	}
	return unescape(cookieValue);
}
// 쿠키삭제
function deleteCookie(cookieName) {
	var expireDate = new Date();
	expireDate.setDate(expireDate.getDate() - 1);
	document.cookie = cookieName + "= " + "; expires="
			+ expireDate.toGMTString();
}
