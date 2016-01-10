#!/bin/zsh

decode_from_base64()
{
    base_header="=?UTF-8?B?"
    if echo "$1" | grep -q "$base_header"; then
        /usr/bin/perl -e "use MIME::WordDecoder(mime_to_perl_string); print mime_to_perl_string(\""$1"\");"
    else
        echo "$1"
    fi
}

check_new_mail()
{
    account="$1"

    cache="$HOME/en/mail/"$1"/.new_mail_cache"
    touch "$cache"
    new_dir="$HOME/en/mail/"$1"/INBOX/new"
    message=""
    let "count=0"

    for i in $new_dir/*(N); do
        if grep -q "$(basename "$i")" "$cache"; then
            continue
        fi

        let "count++"

        from=$(grep -m1 '^From: ' $i | sed 's/From: //' | sed 's/ <[^>]*>//')
        subject=$(grep -m1 '^Subject: ' $i | sed 's/Subject: //')

        next_part="<b>$(decode_from_base64 "$from")</b>"$'\n'"$(decode_from_base64 "$subject")"
        if [[ -z "$message" ]]; then
            message=$'\n'"$next_part"
        else
            message="$message"$'\n'$'\n'"$next_part"
        fi
    done

    if [[ -n "$message" ]]; then
        ls "$new_dir" >! "$cache"

        mpv --volume 70 $HOME/sounds/tomb-raider-secret-sound.mp3 &
        sudo -u vk DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/$(id -u vk)/bus" notify-send '('$count')'" Inbox" "$message" -i /usr/share/icons/Adwaita/32x32/status/mail-unread.png &

        notmuch new &
    fi
}

check_new_mail gmail
check_new_mail mailru

# Generate mailboxes for mutt
"$HOME/dotfiles/bin/mailboxes-offlineimap2mutt.bash" gmail
"$HOME/dotfiles/bin/mailboxes-offlineimap2mutt.bash" mailru
