---
layout: post
title:  "Bot Telegram Menggunakan Bahasa Lua"
date:   2021-10-21 10:09:15 +0700
categories: lua bot telegram
keywords: telegram,bot,lua,tutorial
comments: true
---

## Dependencies

```shell
luarocks install telegram-bot-lua
```

## Sample code

```lua
local BOT_TOKEN = "<your_bot_token>"
local bot = require("telegram-bot-lua").configure(BOT_TOKEN)

function bot.on_message(msg)
  if msg.text == "/start" then
    return bot.send_message(msg.chat.id, "bot already start")
  end
  
  -- =============================
  -- add your desired command here
  -- =============================
end
```