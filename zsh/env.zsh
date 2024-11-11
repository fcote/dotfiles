# Golang
export GOROOT=/opt/homebrew/Cellar/go/1.23.3
export GOPATH=$HOME/go

# Paths
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$GOROOT/bin:$GOPATH/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/Library/Application Support/JetBrains/Toolbox/scripts:$PATH"

# Change starship config path
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"