import 'dart:math';

class FakeData {
  static get hotPrograms {
    var random = Random();
    return [
      {
        'name': 'Ted Education',
        'icon':
            'https://picsum.photos/seed/${random.nextInt(1000000).toString()}/200/200',
        'id': 1
      },
      {
        'name': 'Ted Education',
        'icon':
            'https://picsum.photos/seed/${random.nextInt(1000000).toString()}/200/200',
        'id': 1
      },
      {
        'name': 'Ted Education',
        'icon':
            'https://picsum.photos/seed/${random.nextInt(1000000).toString()}/200/200',
        'id': 1
      },
      {
        'name': 'Ted Education',
        'icon':
            'https://picsum.photos/seed/${random.nextInt(1000000).toString()}/200/200',
        'id': 1
      },
      {
        'name': 'Ted Education',
        'icon':
            'https://picsum.photos/seed/${random.nextInt(1000000).toString()}/200/200',
        'id': 1
      },
      {
        'name': 'Ted Education',
        'icon':
            'https://picsum.photos/seed/${random.nextInt(1000000).toString()}/200/200',
        'id': 1
      },
      {
        'name': 'Ted Education',
        'icon':
            'https://picsum.photos/seed/${random.nextInt(1000000).toString()}/200/200',
        'id': 1
      },
      {
        'name': 'Ted Education',
        'icon':
            'https://picsum.photos/seed/${random.nextInt(1000000).toString()}/200/200',
        'id': 1
      },
    ];
  }

  static get recentUpdate {
    var random = Random();
    final arrData = [
      {
        'episodeName': '植物细胞与激素 Plant cells and aaaaaaaaaa',
        'episodeId': 1,
        "episodeIcon":
            'https://picsum.photos/seed/${random.nextInt(1000000).toString()}/100/100',
        'episodeType': 'video',
        'duration': 200,
        'programName': 'Ted',
      },
      {
        'episodeName': '植物细胞与激素 Plant cells and aaaaaaaaaa',
        'episodeId': 1,
        "episodeIcon":
            'https://picsum.photos/seed/${random.nextInt(1000000).toString()}/100/100',
        'episodeType': 'video',
        'duration': 200,
        'programName': 'Ted',
      },
      {
        'episodeName': '植物细胞与激素 Plant cells and aaaaaaaaaa',
        'episodeId': 1,
        "episodeIcon":
            'https://picsum.photos/seed/${random.nextInt(1000000).toString()}/100/100',
        'episodeType': 'video',
        'duration': 200,
        'programName': 'Ted',
      },
      {
        'episodeName': '植物细胞与激素 Plant cells and aaaaaaaaaa',
        'episodeId': 1,
        "episodeIcon":
            'https://picsum.photos/seed/${random.nextInt(1000000).toString()}/100/100',
        'episodeType': 'video',
        'duration': 200,
        'programName': 'Ted',
      },
      {
        'episodeName': '植物细胞与激素 Plant cells and aaaaaaaaaa',
        'episodeId': 1,
        "episodeIcon":
            'https://picsum.photos/seed/${random.nextInt(1000000).toString()}/100/100',
        'episodeType': 'video',
        'duration': 200,
        'programName': 'Ted',
      },
      {
        'episodeName': '植物细胞与激素 Plant cells and aaaaaaaaaa',
        'episodeId': 1,
        "episodeIcon":
            'https://picsum.photos/seed/${random.nextInt(1000000).toString()}/100/100',
        'episodeType': 'video',
        'duration': 200,
        'programName': 'Ted',
      },
      {
        'episodeName': '植物细胞与激素 Plant cells and aaaaaaaaaa',
        'episodeId': 1,
        "episodeIcon":
            'https://picsum.photos/seed/${random.nextInt(1000000).toString()}/100/100',
        'episodeType': 'video',
        'duration': 200,
        'programName': 'Ted',
      },
      {
        'episodeName': '植物细胞与激素 Plant cells and aaaaaaaaaa',
        'episodeId': 1,
        "episodeIcon":
            'https://picsum.photos/seed/${random.nextInt(1000000).toString()}/100/100',
        'episodeType': 'video',
        'duration': 200,
        'programName': 'Ted',
      },
    ];

    return arrData;
  }

  static getEpisode(int episodeId) {
    var random = Random(100);
    return {
      'episodeName': '植物细胞与激素 Plant cells and aaaaaaaaaa',
      'episodeId': 1,
      "episodeIcon":
          'https://picsum.photos/seed/${random.nextInt(1000000).toString()}/100/100',
      'episodeType': 'video',
      'duration': 200,
      'languages': ['']
    };
  }
}
