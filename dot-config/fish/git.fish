# Taken from
# https://github.com/jhillyerd/plugin-git
# Thanks!

function __git.current_branch -d "Output git's current branch name"
  begin
    git symbolic-ref HEAD; or \
    git rev-parse --short HEAD; or return
  end 2>/dev/null | sed -e 's|^refs/heads/||'
end

function __git.default_branch -d "Use init.defaultBranch if it's set and exists, otherwise use main if it exists. Falls back to master"
  command git rev-parse --git-dir &>/dev/null; or return
  if set -l default_branch (command git config --get init.defaultBranch)
    and command git show-ref -q --verify refs/heads/{$default_branch}
    echo $default_branch
  else if command git show-ref -q --verify refs/heads/main
    echo main
  else
    echo master
  end
end

# --fish

# git abbreviations
abbr -a g          git
abbr -a ga         git add
abbr -a gaa        git add --all
abbr -a gau        git add --update
abbr -a gapa       git add --patch
abbr -a gap        git apply
abbr -a gb         git branch -vv
abbr -a gba        git branch -a -v
abbr -a gban       git branch -a -v --no-merged
abbr -a gbd        git branch -d
abbr -a gbD        git branch -D
abbr -a ggsup      git branch --set-upstream-to=origin/\(__git.current_branch\)
abbr -a gbl        git blame -b -w
abbr -a gbs        git bisect
abbr -a gbsb       git bisect bad
abbr -a gbsg       git bisect good
abbr -a gbsr       git bisect reset
abbr -a gbss       git bisect start
abbr -a gc         git commit -v
abbr -a gc!        git commit -v --amend
abbr -a gcn!       git commit -v --no-edit --amend
abbr -a gca        git commit -v -a
abbr -a gca!       git commit -v -a --amend
abbr -a gcan!      git commit -v -a --no-edit --amend
abbr -a gcv        git commit -v --no-verify
abbr -a gcav       git commit -a -v --no-verify
abbr -a gcav!      git commit -a -v --no-verify --amend
abbr -a gcm        git commit -m
abbr -a gcam       git commit -a -m
abbr -a gcs        git commit -S
abbr -a gscam      git commit -S -a -m
abbr -a gcfx       git commit --fixup
abbr -a gcf        git config --list
abbr -a gcl        git clone
abbr -a gclean     git clean -di
abbr -a gclean!    git clean -dfx
abbr -a gclean!!   "git reset --hard; and git clean -dfx"
abbr -a gcount     git shortlog -sn
abbr -a gcp        git cherry-pick
abbr -a gcpa       git cherry-pick --abort
abbr -a gcpc       git cherry-pick --continue
abbr -a gd         git diff
abbr -a gdca       git diff --cached
abbr -a gds        git diff --stat
abbr -a gdsc       git diff --stat --cached
abbr -a gdt        git diff-tree --no-commit-id --name-only -r
abbr -a gdw        git diff --word-diff
abbr -a gdwc       git diff --word-diff --cached
abbr -a gdto       git difftool
abbr -a gdg        git diff --no-ext-diff
abbr -a gignore    git update-index --assume-unchanged
abbr -a gf         git fetch
abbr -a gfa        git fetch --all --prune
abbr -a gfm        "git fetch origin (__git.default_branch) --prune; and git merge FETCH_HEAD"
abbr -a gfo        git fetch origin
abbr -a gl         git pull
abbr -a ggl        git pull origin \(__git.current_branch\)
abbr -a gll        git pull origin
abbr -a glr        git pull --rebase
abbr -a glg        git log --stat
abbr -a glgg       git log --graph
abbr -a glgga      git log --graph --decorate --all
abbr -a glo        git log --oneline --decorate --color
abbr -a glog       git log --oneline --decorate --color --graph
abbr -a gloga      git log --oneline --decorate --color --graph --all
abbr -a glom       git log --oneline --decorate --color \(__git.default_branch\)..
abbr -a glod       git log --oneline --decorate --color develop..
abbr -a gloo       "git log --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s' --date=short"
abbr -a gm         git merge
abbr -a gmt        git mergetool --no-prompt
abbr -a gmom       git merge origin/\(__git.default_branch\)
abbr -a gp         git push
abbr -a gp!        git push --force-with-lease
abbr -a gpo        git push origin
abbr -a gpo!       git push --force-with-lease origin
abbr -a gpv        git push --no-verify
abbr -a gpv!       git push --no-verify --force-with-lease
abbr -a ggp        git push origin \(__git.current_branch\)
abbr -a ggp!       git push origin \(__git.current_branch\) --force-with-lease
abbr -a gpsup        git push origin \(__git.current_branch\) --set-upstream
abbr -a gpoat      "git push origin --all; and git push origin --tags"
abbr -a ggpnp      "git pull origin (__git.current_branch); and git push origin (__git.current_branch)"
abbr -a gr         git remote -vv
abbr -a gra        git remote add
abbr -a grb        git rebase
abbr -a grba       git rebase --abort
abbr -a grbc       git rebase --continue
abbr -a grbi       git rebase --interactive
abbr -a grbm       git rebase \(__git.default_branch\)
abbr -a grbmi      git rebase \(__git.default_branch\) --interactive
abbr -a grbmia     git rebase \(__git.default_branch\) --interactive --autosquash
abbr -a grbom      "git fetch origin (__git.default_branch); and git rebase FETCH_HEAD"
abbr -a grbomi     "git fetch origin (__git.default_branch); and git rebase FETCH_HEAD --interactive"
abbr -a grbomia    "git fetch origin (__git.default_branch); and git rebase FETCH_HEAD --interactive --autosquash"
abbr -a grbd       git rebase develop
abbr -a grbdi      git rebase develop --interactive
abbr -a grbdia     git rebase develop --interactive --autosquash
abbr -a grbs       git rebase --skip
abbr -a ggu        git pull --rebase origin \(__git.current_branch\)
abbr -a grev       git revert
abbr -a grh        git reset
abbr -a grhh       git reset --hard
abbr -a grhpa      git reset --patch
abbr -a grm        git rm
abbr -a grmc       git rm --cached
abbr -a grmv       git remote rename
abbr -a grpo       git remote prune origin
abbr -a grrm       git remote remove
abbr -a grs        git restore
abbr -a grset      git remote set-url
abbr -a grss       git restore --source
abbr -a grst       git restore --staged
abbr -a grup       git remote update
abbr -a grv        git remote -v
abbr -a gsh        git show
abbr -a gsd        git svn dcommit
abbr -a gsr        git svn rebase
abbr -a gsb        git status -sb
abbr -a gss        git status -s
abbr -a gst        git status
abbr -a gsta       git stash
abbr -a gstd       git stash drop
abbr -a gstl       git stash list
abbr -a gstp       git stash pop
abbr -a gsts       git stash show --text
abbr -a gsu        git submodule update
abbr -a gsur       git submodule update --recursive
abbr -a gsuri      git submodule update --recursive --init
abbr -a gts        git tag -s
abbr -a gtv        git tag | sort -V
abbr -a gsw        git switch
abbr -a gswc       git switch --create
abbr -a gunignore  git update-index --no-assume-unchanged
abbr -a gup        git pull --rebase
abbr -a gupv       git pull --rebase -v
abbr -a gupa       git pull --rebase --autostash
abbr -a gupav      git pull --rebase --autostash -v
abbr -a gwch       git whatchanged -p --abbrev-commit --pretty=medium

# git checkout abbreviations
abbr -a gco        git checkout
abbr -a gcb        git checkout -b
abbr -a gcod       git checkout develop
abbr -a gcom       git checkout \(__git.default_branch\)

# git flow abbreviations
abbr -a gfb        git flow bugfix
abbr -a gff        git flow feature
abbr -a gfr        git flow release
abbr -a gfh        git flow hotfix
abbr -a gfs        git flow support

abbr -a gfbs       git flow bugfix start
abbr -a gffs       git flow feature start
abbr -a gfrs       git flow release start
abbr -a gfhs       git flow hotfix start
abbr -a gfss       git flow support start

abbr -a gfbt       git flow bugfix track
abbr -a gfft       git flow feature track
abbr -a gfrt       git flow release track
abbr -a gfht       git flow hotfix track
abbr -a gfst       git flow support track

abbr -a gfp        git flow publish

# git worktree abbreviations
abbr -a gwt        git worktree
abbr -a gwta       git worktree add
abbr -a gwtls      git worktree list
abbr -a gwtlo      git worktree lock
abbr -a gwtmv      git worktree move
abbr -a gwtpr      git worktree prune
abbr -a gwtrm      git worktree remove
abbr -a gwtulo     git worktree unlock

# GitLab push options
abbr -a gmr        git push origin \(__git.current_branch\) --set-upstream -o merge_request.create
abbr -a gmwps      git push origin \(__git.current_branch\) --set-upstream -o merge_request.create -o merge_request.merge_when_pipeline_succeeds
