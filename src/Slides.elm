module Slides exposing (slides)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Markdown exposing (toHtml)
import Messages exposing (Msg(..))
import EmbeddedGist exposing (unsafeEmbeddedGist)


-- Support


divide : List (Html msg) -> List (Html msg) -> Html msg
divide left right =
    div [ style [ ( "display", "flex" ) ] ]
        [ div [ style [ ( "width", "50%" ) ] ] left
        , div [ style [ ( "width", "50%" ) ] ] right
        ]


slides : Int -> List (Html Msg)
slides count =
    [ toHtml [] <| """
# elmのススメ
![ゾーマ](https://github.com/ababup1192/encouragement-elm-slide/blob/master/src/img/zoma.jpg?raw=true)

ABAB↑↓BA @ababupdownba
"""
    , divide
        [ div []
            [ h2 [] [ text "FuzzBuzz" ]
            , p [] [ text "elmのコードはこんな感じです！" ]
            ]
        ]
        [ unsafeEmbeddedGist "ababup1192/6d4665c3c55cc7caba07e11d67cfc86c"
        ]
    , toHtml [] <| """
## どんな印象持ちましたか？
- 関数型言語?
    - そうですが、それはelmの肝ではありません
- Haskellに似てる！
    - 文法(表面)的な部分だけです！ Haskellより遥かに機能が少なく、目指す場所が違います！
- フォーマットがキモい
    - すぐ慣れて気持ちよくなります
- イケてる！！
    - 大正解！ 今すぐはじめましょう！
"""
    , toHtml [] <| """
## elmてどんな言語？

- 信頼できるWebアプリケーションのための**めっちゃ**楽しい言語
- 優れたパフォーマンスと実行時例外のないJavaScriptを生成します

![elm トップページ](https://github.com/ababup1192/encouragement-elm-slide/blob/master/src/img/elm-top.png?raw=true)
"""
    , toHtml [] <| """
## どんな人にオススメ？

- 型安全にフロントエンドを書きたい方
    - **コンパイルエラーがわかりやすく**、基本的に**実行時例外が起きません**！

- フロントエンドの環境を整えるのが、ダルい方
    - **フレームワーク、テストフレームワークを言語が含んでいます**

- 実践的にやりたい方、Webアプリケーションのロジックに集中したい方

- 関数型プログラミング初心者の方
    - 決して肝ではありませんが、非常に機能が限定されていて、関数型プログラミングのエッセンスを取り入れるのにわかりやすい言語です
"""
    , toHtml [] <| """
## どんな人にオススメできない？

- 言語とフレームワークを分けたい人
    - 先ほどのスライドで述べた通り、言語自体がフレームワークを含んでいます
    - 高品質なWebアプリケーションを作りやすくするために、言語機能が非常に制限されています

- Haskellらしさを求めている人
    - CUI実行がそもそもできません(正確には難しいです) あくまでWebアプリケーション特化言語です
    - 型クラスがありません
    - メタプログラミングができません
    - 型レベルプログラミングができません
    - -> そんな、あなたにはPureScript
"""
    , toHtml [] <| """
## elmの良いところ お品書き

- 文法
    - 覚えるべき文法が少ない
- The Elm Architecture (TEA)
    - Webアプリケーションを綺麗に設計できる埋込み型フレームワーク
- テスト
    - 徹底したイミュータブル データ構造でテスタブル
- エラー
    - 丁寧で見やすいエラー
- 採用事例
    - どんなアプリケーションがelmに向いているか
- 日本のelmコミュニティ
    - 盛り上がってるの？
"""
    , div []
        [ h2 [] [ text "文法 (1)" ]
        , h3 [] [ text "List" ]
        , unsafeEmbeddedGist "ababup1192/e08c449160d2ef04aca7906f57374d80"
        , h3 [] [ text "If Expressions" ]
        , unsafeEmbeddedGist "ababup1192/eaf3df2b3ecd1d98217e8f594822ef0a"
        , h3 [] [ text "Case Expressions" ]
        , unsafeEmbeddedGist "ababup1192/8e020ff75403e8e02cba6c1e30360a60"
        ]
    , div []
        [ h2 [] [ text "文法 (2)" ]
        , h3 [] [ text "Union Types" ]
        , unsafeEmbeddedGist "ababup1192/be4f7b854632e116ce829ae77bdd1f76"
        , h3 [] [ text "Type alias" ]
        , unsafeEmbeddedGist "ababup1192/34ccba420063a16f49d810d6934c75c8"
        , h3 [] [ text "Record" ]
        , unsafeEmbeddedGist "ababup1192/092118a2d1269875e600dd7d60a68d7b"
        ]
    , div []
        [ h2 [] [ text "文法 (3)" ]
        , h3 [] [ text "Functions" ]
        , unsafeEmbeddedGist "ababup1192/e8fd8b3bd40c4490e31030c24d073294"
        , h3 [] [ text "Let Expressions" ]
        , unsafeEmbeddedGist "ababup1192/ded48f67ab540edec24eb6a078265eff"
        ]
    , toHtml [] <| """
## 文法 まとめ

なんと3ページで(細かいものを除いて) 文法紹介が終わってしまいました！ 普段お使いの言語の文法の数と比べて見てください。
elmはむしろ不要と思われる文法を削って、**ミニマルを保つ言語**です！
"""
    , toHtml [] <| """
## The Elm Architecture (TEA)

- elmにおけるWebアプリケーションのライフサイクルを表しており、アーキテクチャであり、フレームワークそのものです

![](https://camo.githubusercontent.com/e7f4c2681dfa392cb0ab7f8ee7ffcc201e525a50/68747470733a2f2f7261776769746875622e636f6d2f706c617864616e2f656c6d2d6c6966656379636c652f6d61737465722f656c6d2d6c6966656379636c652e737667)
"""
    , divide
        [ h2 [] [ text "TEAサンプル ~カウンタ~" ]
        , div []
            [ button [ onClick Decrement ] [ text "-" ]
            , div [] [ text (toString count) ]
            , button [ onClick Increment ] [ text "+" ]
            ]
        ]
        [ unsafeEmbeddedGist "ababup1192/1abee2ecb9591c847c958f65de1010ff" ]
    , toHtml [] <| """
## カウンタ on TEA

![TEA カウンタ](https://github.com/ababup1192/encouragement-elm-slide/blob/master/src/img/tea-counter.png?raw=true)
"""
    , div []
        [ h2 [] [ text "テスト" ]
        , ul []
            [ li [] [ text "あらゆるデータ構造がイミュータブルであり等価比較可能" ]
            , li [] [ text "関数も値を必ず返すことが保証され、パイプ演算子でチェーン可能" ]
            ]
        , unsafeEmbeddedGist "ababup1192/7914478b0a05e1f62d8a03a826697017"
        ]
    , toHtml [] <| """
## エラー
### 型間違え

![型間違え](https://github.com/ababup1192/encouragement-elm-slide/blob/master/src/img/type_mismatch.png?raw=true)

### パターン漏れ

![パターン漏れ](https://github.com/ababup1192/encouragement-elm-slide/blob/master/src/img/missing_pattern.png?raw=true)
"""
    , toHtml [] <| """
## 採用事例

### Concourse CI

![Concourse CI](https://qiita-image-store.s3.amazonaws.com/0/1852/4e14e419-5b1f-75f6-f623-6aac28c9788f.png)
"""
    , toHtml [] <| """
## 採用事例

### Unipos

![Unipos](https://unipos.me/ja/img/common/ogp_logo.png)
"""
    , toHtml [] <| """
## 採用事例

# このスライド！！！

- これがやりたかっただけ()
- https://ababup1192.github.io/encouragement-elm-slide/
"""
    , toHtml [] <| """
## 日本のelmコミュニティ

### Adventcalendar

- 12人(2016) -> 28人(2017)
- 25記事(1つ分) -> 50記事(2つ分)

#### プログラミング言語 いいね数ランキング 4位!

![いいねランキング](https://github.com/ababup1192/encouragement-elm-slide/blob/master/src/img/advent_calendar.png?raw=true)
"""
    , toHtml [] <| """
## 日本のelmコミュニティ
- [elm JP](https://elm-jp.connpass.com)
- [elmなんか作ろう会](https://scrapbox.io/ababup1192/Elm%E3%81%AA%E3%82%93%E3%81%8B%E4%BD%9C%E3%82%8D%E3%81%86%E4%BC%9A)
    - 不定期開催 全くの初心者も大歓迎 1hぐらいで、1アプリ完成させます！
    - TODOリスト
    - インクリメンタルサーチ
    - TRPGダイス
    - ガラケー入力
    - おみくじ
    - Qiitaユーザサーチ(Web API)
"""
    , toHtml [] <| """
## 最後に

- Webフロント初心者にこそオススメできる言語です！
- 非常に生産性高く、モノづくりが楽しくなります！
- とにかく触ってみましょう！
"""
    ]
