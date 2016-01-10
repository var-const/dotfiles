#!/bin/bash

# Whether OfflineIMAP can generate several messagebox names is a mystery to me.
# This suggests it can be done:
# http://docs.offlineimap.org/en/latest/FAQ.html?highlight=mbnames#mutt
# "The OfflineIMAP manual has a more detailed example for doing this for multiple accounts."
# However, there's no link, I couldn't find anything in the "manual", and then
# there's this:
# https://github.com/OfflineIMAP/offlineimap/issues/76
# "I think you're going ahead of a lot of complexity for a few benefit with multiple mbname sections.
# I guess a postsync hook might actually do the trick.
# Anyway, you are digressing the purpose of mbname and I think a very few people will ever use the requested feature."
# Okay, since OfflineIMAP is a textbook example of lightweight, minimalistic
# software, this feature obviously can never be added. Postsync hook it is,
# then.

account="$1"
path="/home/vk/en/mail/"
raw="$path"all-mailboxes-raw
cooked="$path""$1".muttrc

printf 'mailboxes ' > "$cooked"
cat "$raw" | grep "$account" | tr "\\n" " " >> "$cooked"
printf '\n' >> "$cooked"
