if [ "$(uname)" == 'Darwin' ]; then
    # brew存在確認してなかったらインストール
    if ! type brew > /dev/null 2>&1; then
        echo "brew is not installed"
        echo "installing brew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi

    # m1 macの場合はHomebrew向けにpathを通す
    if [ "$(uname -p)" == 'arm' ]; then
        echo "m1 mac"
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"

elif [ "$(expr sunbstr $(uname -s) 1 5)" == 'Linux' ]; then
    echo "Linux"
elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]; then
    echo "Cygwin"
fi