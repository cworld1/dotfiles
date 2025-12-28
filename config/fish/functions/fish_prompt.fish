function fish_prompt --description 'Write out the prompt'
  set -l color_cwd
  set -l suffix
  # Root indicate
  if functions -q fish_is_root_user; and fish_is_root_user
    if set -q fish_color_cwd_root
    set color_cwd $fish_color_cwd_root
    else
    set color_cwd $fish_color_cwd
    end
    set suffix '#'
  else
    set color_cwd $fish_color_cwd
    set suffix '$'
  end

  # [Prefix] Prefix icon
  set_color $fish_color_command
  printf "%s " $prompt_prefix

  # [Path]
  set fish_prompt_pwd_dir_length 2
  set_color $color_cwd
  echo -n (prompt_pwd)
  set_color normal

  # [VSC prompt] like git, jj, etc.
  if not set -q __fish_git_prompt_show_informative_status
    set -g __fish_git_prompt_show_informative_status 1
  end
  if not set -q __fish_git_prompt_hide_untrackedfiles
    set -g __fish_git_prompt_hide_untrackedfiles 1
  end
  if not set -q __fish_git_prompt_color_branch
    set -g __fish_git_prompt_color_branch e6b6fc
  end
  if not set -q __fish_git_prompt_showupstream
    set -g __fish_git_prompt_showupstream informative
  end
  if not set -q __fish_git_prompt_color_dirtystate
    set -g __fish_git_prompt_color_dirtystate 5cb2ff
  end
  if not set -q __fish_git_prompt_color_stagedstate
    set -g __fish_git_prompt_color_stagedstate yellow
  end
  if not set -q __fish_git_prompt_color_invalidstate
    set -g __fish_git_prompt_color_invalidstate red
  end
  if not set -q __fish_git_prompt_color_untrackedfiles
    set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
  end
  if not set -q __fish_git_prompt_color_cleanstate
    set -g __fish_git_prompt_color_cleanstate green
  end
  printf '%s ' (fish_vcs_prompt)
  
  # [Status prompt] last pipe status
  set -l last_pipestatus $pipestatus
  set -lx __fish_last_status $status # Export for __fish_print_pipestatus.
  set -l status_color (set_color $fish_color_status)
  set -l statusb_color (set_color --bold $fish_color_status)
  set -l status_prompt (__fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus)
  echo -n $status_prompt
  set_color normal

  # [Suffix] indicate if you are using root or not
  echo -n "$suffix "
end
