# lime_english

# Object Storage System Design
## folder structure
`/programs/{program_uuid}/{episode_uuid}/{file}`
- video
  - {episode_uuid}.mp4
- audio
  - {episode_uuid}.mp3
- subtitles
  - {episode_uuid}.en.srt
  - {episode_uuid}.cn_ZH.srt
  - {episode_uuid}.cn_TW.srt
- icon
  - {episode_uuid}.png

# Database
### program
```js
{
  "programName":"",
  "programId":1,
  "programDesc":"",
  "programCover":"a.jpg",
  "episodes":100
}
```

### episode
```js
{
  "id":1,
  "episodeName":"",
  "episodeId":1,
  "episodeTitle":"",
  "duration":100,
  "video":"a.mp4",
  "audio":"a.mp3",
  "subtitles":{
    "en":"a.en.srt",
    "cn_ZH":"a.cn_ZH.srt",
    "cn_TW":"a.cn_TW.srt"
  }
}
```

### vocabook
```js
{
  
}
```

