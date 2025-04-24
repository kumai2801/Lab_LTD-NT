import 'story.dart';

class StoryBrain {
  int _storyNumber = 0;

  final List<Story> _storyData = [
    Story(
      storyTitle: 'Bạn thấy một chiếc xe bị hỏng bên đường. Người lái xe yêu cầu giúp đỡ.',
      choice1: 'Giúp đỡ người lạ.',
      choice2: 'Tiếp tục đi.',
    ),
    Story(
      storyTitle: 'Bạn quyết định giúp. Người lạ cảm ơn bạn rất nhiều.',
      choice1: 'Hỏi thêm thông tin.',
      choice2: 'Tạm biệt và tiếp tục hành trình.',
    ),
    Story(
      storyTitle: 'Bạn bỏ đi, người lạ trông có vẻ thất vọng.',
      choice1: 'Quay lại giúp.',
      choice2: 'Bỏ đi luôn.',
    ),
    Story(
      storyTitle: 'Người lạ tặng bạn một bản đồ bí mật. Bạn tiếp tục cuộc phiêu lưu!',
      choice1: 'Bắt đầu lại.',
      choice2: '',
    ),
    Story(
      storyTitle: 'Bạn tạm biệt người lạ và tiếp tục cuộc phiêu lưu!',
      choice1: 'Bắt đầu lại.',
      choice2: '',
    ),
    Story(
      storyTitle: 'Bạn bỏ đi và không bao giờ biết điều gì sẽ xảy ra.',
      choice1: 'Bắt đầu lại.',
      choice2: '',
    ),
  ];

  String getStory() => _storyData[_storyNumber].storyTitle;

  String getChoice1() => _storyData[_storyNumber].choice1;

  String getChoice2() => _storyData[_storyNumber].choice2;

  void nextStory(int choiceNumber) {
    if (_storyNumber == 0) {
      _storyNumber = (choiceNumber == 1) ? 1 : 2;
    } else if (_storyNumber == 1) {
      _storyNumber = (choiceNumber == 1) ? 3 : 4;
    } else if (_storyNumber == 2) {
      _storyNumber = (choiceNumber == 1) ? 1 : 5;
    } else {
      restart();
    }
  }

  void restart() => _storyNumber = 0;

  bool buttonShouldBeVisible() {
    return _storyNumber < 3;
  }
}
