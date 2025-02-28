# AudioManager
The scripts I use to manage Godot audio at a global level for my games. To use this You'll need to attach the AudioManager script to a Node2D, add that as a global autoload scene, add some enum values to the SoundEffectSetting, and finally setup the SoundEffectSetting custom resouces with the correct data/settign using the export variable on the AudioManager scene.

Learn more by watching this video: https://youtu.be/Egf2jgET3nQ?si=NY20JDNyq2op2Vpw


Common Issues:
1) Forgetting to add the Audio Manger scenec to the project globals/n
2) Addign the script (AudioManager.gd) instead of the scene (AudioManager.tscn) <img width="468" alt="image" src="https://github.com/user-attachments/assets/e94d0298-5e4a-4ddd-b694-cda9af2f7b31" />/n
3) Forgetting to setup your own SoundEffects in the AudioManagers export sound_effect_settings array <img width="273" alt="image" src="https://github.com/user-attachments/assets/80da7f67-4a5a-4477-be74-0b44d0ae992e" />

