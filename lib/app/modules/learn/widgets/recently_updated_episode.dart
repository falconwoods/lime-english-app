import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lime_english/core/utils/extensions/color_extensions.dart';
import 'package:lime_english/core/utils/extensions/integer_extensions.dart';

class _UpdatedEpisodeData {
  late final String episodeName;
  late final String programName;
  late final String episodeType;
  late final String duration;
  late final int episodeId;
  late final String episodeIcon;

  _UpdatedEpisodeData(dynamic arg) {
    episodeName = arg['episodeName'];
    episodeId = arg['episodeId'];
    episodeType = arg['episodeType'];
    episodeIcon = arg['episodeIcon'];
    duration = (arg['duration'] as int).toMMSS();
    programName = arg['programName'];
  }

  factory _UpdatedEpisodeData.from(dynamic arg) {
    return _UpdatedEpisodeData(arg);
  }
}

class RecentlyUpdatedEpisode extends StatelessWidget {
  late final _UpdatedEpisodeData _data;

  RecentlyUpdatedEpisode(dynamic data, {super.key}) {
    _data = _UpdatedEpisodeData.from(data);
  }

  getIcon() => Container(
      width: 50,
      height: 50,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image(
                image: Image.network(_data.episodeIcon).image,
                fit: BoxFit.cover,
              ),
              // Positioned(
              //     right: 2, // Adjust the left position as needed
              //     bottom: 2, // Adjust the bottom position as needed
              //     child:
              //         Icon(Icons.play_circle, color: Colors.black87, size: 15)),
            ],
          )));

  getTitle() {
    return Container(
      width: 200,
      // color: Colors.red,
      child: Text(_data.episodeName,
          overflow: TextOverflow.ellipsis, softWrap: true),
    );
  }

  getProgram(context) => Container(
        width: 200,
        // color: Colors.yellow,
        child: Row(children: [
          Text(
            _data.programName,
            style: TextStyle(
                fontSize: 10,
                color:
                    Theme.of(context).textTheme.bodySmall?.color?.lighten(0.3)),
          ),
          const SizedBox(
            width: 5,
          ),
          const FaIcon(FontAwesomeIcons.solidCirclePlay,
              color: Color.fromARGB(67, 0, 0, 0), size: 10),
          const SizedBox(
            width: 5,
          ),
          Text(
            _data.duration,
            style: TextStyle(
                fontSize: 10,
                color:
                    Theme.of(context).textTheme.bodySmall?.color?.lighten(0.3)),
          )
        ]),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          getIcon(),
          const SizedBox(width: 10),
          Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [getTitle(), getProgram(context)])
        ],
      ),
    );
  }
}
