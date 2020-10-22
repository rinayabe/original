# README

# アプリケーション名
  寄付アプリ

# アプリケーション概要
  本アプリケーションではユーザーが寄付してほしい案件を投稿してその内容に共感したユーザーが寄付をするというアプリ

# URL
  https://original-29797.herokuapp.com/

# テスト用アカウント
  Basic認証
    ID    admin
    PASS  2222
  投稿アカウント
    email      abcde@abcde
    password   111aaa
  寄付アカウント
    email      qaz@qaz
    password   123qaz

# 利用方法
  新規登録をして登録したユーザーは案件の投稿、または寄付ができるようになる。
  案件投稿には写真、タイトル、目標金額、案件の内容について記載する事で投稿できる。
  寄付をしたいユーザーは詳細画面から内容を確認して寄付をしたいと思えば自分で金額を指定して募金できる。

# 目指した課題解決
  災害時の支援金や新規の事業、やりたい事はあるが銀行からお金の借入ができない等の理由の方が投稿する事で寄付という形で返済不要の資金調達を可能にする。

# 洗い出した要件
   ## 一覧画面
   ## 詳細画面
   ## 削除機能
   ## 募金機能
   ## ユーザー登録機能
   ## 案件登録機能

# 実装した機能についての説明
  今回の実装はTOPページに案件の一覧を表示。画像右上の詳細ボタンから案件詳細と寄付を行う事ができる。詳細ページに貼るレジットカード情報入力や案件の達成度、履歴等の確認ができるようになっている。

# テーブル設計
## usersテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| nickname | string     | null: false                    |
| email    | string     | null: false                    |
| password | string     | null: false                    |

- has_many :matters
- has_many :donations

##  matterテーブル

| Column       | Type      | Options                        |
| ------------ | --------- | ------------------------------ |
| name         | string    | null: false                    |
| explain      | text      | null: false                    |
| price        | integer   | null: false                    |
| user         | references| null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :donations

## donationテーブル

| Column   | Type      | Options                        |
| -------- | --------- | ------------------------------ |
| user     | references| null: false, foreign_key: true |
| matter   | references| null: false, foreign_key: true |
| price    | integer   | null: false                    |

### Association

- belongs_to :user
- belongs_to :matter


# ローカルでの動作方法
ruby '2.6.5'
'rails', '~> 6.0.0'
'mysql2', '0.5.3'

fatal: You must specify a repository to clone.

usage: git clone [<options>] [--] <repo> [<dir>]

    -v, --verbose         be more verbose
    -q, --quiet           be more quiet
    --progress            force progress reporting
    -n, --no-checkout     don't create a checkout
    --bare                create a bare repository
    --mirror              create a mirror repository (implies bare)
    -l, --local           to clone from a local repository
    --no-hardlinks        don't use local hardlinks, always copy
    -s, --shared          setup as shared repository
    --recursive ...       alias of --recurse-submodules
    --recurse-submodules[=<pathspec>]
                          initialize submodules in the clone
    -j, --jobs <n>        number of submodules cloned in parallel
    --template <template-directory>
                          directory from which templates will be used
    --reference <repo>    reference repository
    --reference-if-able <repo>
                          reference repository
    --dissociate          use --reference only while cloning
    -o, --origin <name>   use <name> instead of 'origin' to track upstream
    -b, --branch <branch>
                          checkout <branch> instead of the remote's HEAD
    -u, --upload-pack <path>
                          path to git-upload-pack on the remote
    --depth <depth>       create a shallow clone of that depth
    --shallow-since <time>
                          create a shallow clone since a specific time
    --shallow-exclude <revision>
                          deepen history of shallow clone, excluding rev
    --single-branch       clone only one branch, HEAD or --branch
    --no-tags             don't clone any tags, and make later fetches not to follow them
    --shallow-submodules  any cloned submodules will be shallow
    --separate-git-dir <gitdir>
                          separate git dir from working tree
    -c, --config <key=value>
                          set config inside the new repository
    --server-option <server-specific>
                          option to transmit
    -4, --ipv4            use IPv4 addresses only
    -6, --ipv6            use IPv6 addresses only
    --filter <args>       object filtering
    --remote-submodules   any cloned submodules will use their remote-tracking branch
