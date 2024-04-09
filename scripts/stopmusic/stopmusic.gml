// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function StopMusic(){
	if (global.settings.volumeMute) {
		audio_stop_sound(music);
		return;
	}
	
	if (audio_is_playing(music)) {
		audio_stop_sound(music);
		AudioManager.musicPlaying = noone;
	}
}