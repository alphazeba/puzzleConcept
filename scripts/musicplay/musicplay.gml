// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function MusicPlay(music, volume,loop) {
	if (!audio_is_playing(music)) {
		audio_stop_sound(AudioManager.musicPlaying);
		AudioManager.musicPlaying= music;
		AudioManager.musicVolume  = volume;
		audio_play_sound(music,0,loop);
		audio_sound_gain(music,global.settings.volumeMaster*global.settings.volumeMusic*volume,0);
	}
	
	if (global.settings.volumeMute) {
		AudioManager.musicPlaying = music;
		AudioManager.musicVolume = volume;
		audio_sound_gain(music,0,0);
		return;
	}
}

function MusicStop() {
	if (audio_is_playing(AudioManager.musicPlaying)) {
		audio_stop_sound(AudioManager.musicPlaying);
	} else {
		audio_stop_all();
	}
}