set -g fish_prompt_pwd_dir_length 2
set -q __fish_git_prompt_show_informative_status; or set -g __fish_git_prompt_show_informative_status 1
set -q __fish_git_prompt_hide_untrackedfiles; or set -g __fish_git_prompt_hide_untrackedfiles 1
set -q __fish_git_prompt_color_branch; or set -g __fish_git_prompt_color_branch e6b6fc
set -q __fish_git_prompt_showupstream; or set -g __fish_git_prompt_showupstream informative
set -q __fish_git_prompt_color_dirtystate; or set -g __fish_git_prompt_color_dirtystate 5cb2ff
set -q __fish_git_prompt_color_stagedstate; or set -g __fish_git_prompt_color_stagedstate yellow
set -q __fish_git_prompt_color_invalidstate; or set -g __fish_git_prompt_color_invalidstate red
set -q __fish_git_prompt_color_untrackedfiles; or set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
set -q __fish_git_prompt_color_cleanstate; or set -g __fish_git_prompt_color_cleanstate green

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
  set_color $color_cwd
  echo -n (prompt_pwd)
  set_color normal

  # [VSC prompt] like git, jj, etc.
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
