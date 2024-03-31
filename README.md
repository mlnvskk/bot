# Telegram Bot 
It is a simple application that can run two commands: 
* version - Prints out the current version of application
* start - Starts the bot

Bot answers to message _/start hello_

# How to build

```sh
go build -ldflags "-X="github.com/mlnvskk/bot/cmd.appVersion=v1.0.2
# insert your actual token
read -s TELE_TOKEN
./bot start
```
