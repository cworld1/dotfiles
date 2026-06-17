@echo off
set "old=%~2"
set "new=%~5"
set "target=%~1"
set "old=%old:\=/%"
set "new=%new:\=/%"

git --no-pager diff --no-index --no-ext-diff "%old%" "%new%" | ^
perl -pe "s|\Q%old%\E|%target%|g;s|\Q%new%\E|%target%|g" | ^
delta --paging=never --width=%LAZYGIT_COLUMNS% --line-numbers
