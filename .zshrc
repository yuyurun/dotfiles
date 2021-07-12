# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Vi ライクな操作を有効にする
bindkey -v

# 自動補完を有効にする
# コマンドの引数やパス名を途中まで入力して <Tab> を押すといい感じに補完してくれる
autoload -U compinit; compinit

# 入力したコマンドが存在せず、かつディレクトリ名と一致するなら、ディレクトリに cd する
# 例： /usr/bin と入力すると /usr/bin ディレクトリに移動
setopt auto_cd

# ↑を設定すると、 .. とだけ入力したら1つ上のディレクトリに移動できるので……
# 2つ上、3つ上にも移動できるようにする
alias ...='cd ../..'
alias ....='cd ../../..'

# "~hoge" が特定のパス名に展開されるようにする（ブックマークのようなもの）
# 例： cd ~hoge と入力すると /long/path/to/hogehoge ディレクトリに移動
hash -d hoge=/long/path/to/hogehoge

# cd した先のディレクトリをディレクトリスタックに追加する
# ディレクトリスタックとは今までに行ったディレクトリの履歴のこと
# `cd +<Tab>` でディレクトリの履歴が表示され、そこに移動できる
setopt auto_pushd

# pushd したとき、ディレクトリがすでにスタックに含まれていればスタックに追加しない
setopt pushd_ignore_dups

# 拡張 glob を有効にする
# glob とはパス名にマッチするワイルドカードパターンのこと
# （たとえば `mv hoge.* ~/dir` における "*"）
# 拡張 glob を有効にすると # ~ ^ もパターンとして扱われる
# どういう意味を持つかは `man zshexpn` の FILENAME GENERATION を参照
setopt extended_glob

# 入力したコマンドがすでにコマンド履歴に含まれる場合、履歴から古いほうのコマンドを削除する
# コマンド履歴とは今まで入力したコマンドの一覧のことで、上下キーでたどれる
setopt hist_ignore_all_dups

# コマンドがスペースで始まる場合、コマンド履歴に追加しない
# 履歴に残したくないコマンドを入力するとき使う
# 例： <Space>echo hello と入力
setopt hist_ignore_space

# <Tab> でパス名の補完候補を表示したあと、
# 続けて <Tab> を押すと候補からパス名を選択できるようになる
# 候補を選ぶには <Tab> か Ctrl-N,B,F,P
zstyle ':completion:*:default' menu select=1

# 単語の一部として扱われる文字のセットを指定する
# ここではデフォルトのセットから / を抜いたものとする
# こうすると、 Ctrl-W でカーソル前の1単語を削除したとき、 / までで削除が止まる
# パス名を入力中にファイル名を一気に消すとき便利
# 例： cd /home/me/somewhere<Ctrl-W> → cd /home/me/
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

ource ~/.zplug/zplug

# 「ユーザ名/リポジトリ名」で記述し、ダブルクォートで見やすく括る（括らなくてもいい）
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"

# junegunn/dotfiles にある bin の中の vimcat をコマンドとして管理する
zplug "junegunn/dotfiles", as:command, of:bin/vimcat

# tcnksm/docker-alias にある zshrc をプラグインとして管理する
# as: のデフォルトは plugin なので省力もできる
zplug "tcnksm/docker-alias", of:zshrc, as:plugin

# frozen: を指定すると全体アップデートのときアップデートしなくなる（デフォルトは0）
zplug "k4rthik/git-cal", as:command, frozen:1

# from: で特殊ケースを扱える
# gh-r を指定すると GitHub Releases から取ってくる
# of: で amd64 とかするとそれを持ってくる（指定しないかぎりOSにあったものを自動で選ぶ）
# コマンド化するときに file: でリネームできる（この例では fzf-bin を fzf にしてる）
zplug "junegunn/fzf-bin", \
    as:command, \
    from:gh-r, \
    file:fzf

# from: では gh-r の他に oh-my-zsh と gist が使える
# oh-my-zsh を指定すると oh-my-zsh のリポジトリにある plugin/ 以下を
# コマンド／プラグインとして管理することができる
zplug "plugins/git", from:oh-my-zsh

# ビルド用 hook になっていて、この例ではクローン成功時に make install する
# シェルコマンドなら何でも受け付けるので "echo OK" などでも可
zplug "tj/n", do:"make install"

# ブランチロック・リビジョンロック
# at: はブランチとタグをサポートしている
zplug "b4b4r07/enhancd", at:v1
zplug "mollifier/anyframe", commit:4c23cb60

# if: を指定すると真のときのみロードを行う（クローンはする）
zplug "hchbaw/opp.zsh", if:"(( ${ZSH_VERSION%%.*} < 5 ))"

# from: では gist を指定することができる
# gist のときもリポジトリと同様にタグを使うことができる
zplug "b4b4r07/79ee61f7c140c63d2786", \
    from:gist, \
    as:command, \
    of:get_last_pane_path.sh

# パイプで依存関係を表現できる
# 依存関係はパイプの流れのまま
# この例では emoji-cli は jq に依存する
zplug "stedolan/jq", \
    as:command, \
    file:jq, \
    from:gh-r \
    | zplug "b4b4r07/emoji-cli"

# check コマンドで未インストール項目があるかどうか verbose にチェックし
# false のとき（つまり未インストール項目がある）y/N プロンプトで
# インストールする
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# プラグインを読み込み、コマンドにパスを通す
zplug load --verbose

export ZPLUG_HOME=/usr/local/opt/zplug
rt ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "sorin-ionescu/prezto"
source $ZPLUG_HOME/init.zsh

zplug "sorin-ionescu/prezto"
source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme
# zplug
source ~/.zplug/init.zsh
# theme
#zplug romkatv/powerlevel10k, as:theme, depth:1
zplug "romkatv/powerlevel10k", use:powerlevel10k.zsh-theme, from:github, as:theme

# コマンドをリンクして、PATH に追加し、プラグインは読み込む
zplug load --verbose

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# theme
zplug romkatv/powerlevel10k, as:theme, depth:1

# 補完の強化
zplug "zsh-users/zsh-completions"
# 履歴補完の強化
zplug "zsh-users/zsh-autosuggestions"

# ここまでに書いたプラグインのロード
zplug load --verbose

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
