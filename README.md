# SecureScreen

[StackOverFlow に投稿されていた回答](https://stackoverflow.com/a/67054892)を元に作成したプロジェクトです。

スクリーンショット、画面録画時にコンテンツを隠す方法になります。

![movie](https://github.com/mittsu333/SecureScreen/blob/main/img/take_screen.gif)

## 環境

- Xcode 13.1(13A1030d)

手元で検証できる実機が iOS15 以上だけだったので以下は Simulator で検証

スクショの撮影はメニューの`Device` -> `Trigger Screenshot`で撮影したときに実機と同じようになります。

元の回答では iOS13 以降で動作するということでしたが iOS13 でも動作するバージョンとそうでないバージョンはありそうなのでサポートするなら確認が必要

| OS   | 結果 |
| ---- | ---- |
| 15.0 | ○    |
| 14.0 | ○    |
| 13.4 | ○    |
| 13.0 | ×    |
| 12.4 | ×    |

あと Simulator で検証していると AVPlayer で[エラーが出ていて動かない問題](https://developer.apple.com/forums/thread/667921)がありましたが
iOS13.4 は AVPlayer のエラーが出ていても機能していたので、その辺りは関係ないと判断しています。
