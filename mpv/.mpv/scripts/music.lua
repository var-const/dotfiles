-- Taken from:
-- https://github.com/bamos/dotfiles/blob/master/.mpv/scripts/music.lua

-- music.lua
--
-- Brandon Amos <http://bamos.io/>
-- 2014.05.15
require 'os'
require 'io'
require 'string'


-- Global variables for deleting/restoring the current track.
deleted_tmp = "/tmp/mpv-deleted/"
last_deleted_track = ""

-- Delete the current track by moving it to the `deleted_tmp` location.
function delete_current_track()
  last_deleted_track = mp.get_property("path")
  mkdir_cmd = "mkdir -p " .. deleted_tmp
  os.execute(mkdir_cmd)
  mv_cmd = "mv '" .. last_deleted_track .. "' '" .. deleted_tmp .. "'"
  os.execute(mv_cmd)
  mp.command("playlist_next")
  print("'" .. last_deleted_track .. "' deleted.")
end

-- Restore the last deleted track.
-- This can be done to restore an arbitrary number of tracks by
-- using a queue rather than a single file.
function restore_prev_track()
  if last_deleted_track ~= "" then
    os.execute("mv '" .. deleted_tmp .. last_deleted_track .. "' .")
    print("Successfully recovered '" .. last_deleted_track .. "'")
    last_deleted_track = ""
  else
    print("No track to recover.")
  end
end

-- Move the current track into a `good` directory.
function mark_good()
  os.execute("mkdir -p good")
  os.execute("mv '" .. mp.get_property("path") .. "' '" .. "good" .. "'")
  print("Marked '" .. mp.get_property("path") .. "' as good.")
end

-- Set key bindings.
mp.add_key_binding("D", "delete_current_track", delete_current_track)
mp.add_key_binding("u", "restore_prev_track", restore_prev_track)
mp.add_key_binding("!", "mark_good", mark_good)
