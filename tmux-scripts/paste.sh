#!/usr/bin/env bash

selected_buffer=$(tmux list-buffers -F "#{buffer_name} : #{buffer_sample} (#{buffer_size})" | fzf --reverse | cut -d' ' -f 1)
[[ "${#selected_buffer}" -ge 1 ]] && tmux paste-buffer -b $selected_buffer
