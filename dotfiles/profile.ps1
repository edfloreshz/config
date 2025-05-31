oh-my-posh init pwsh | Invoke-Expression
Import-Module posh-git
Enable-PoshTooltips

# Current theme
oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/dracula.omp.json' | Invoke-Expression
# oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/M365Princess.omp.json' | Invoke-Expression
# oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/spaceship.omp.json' | Invoke-Expression
# oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/zash.omp.json' | Invoke-Expression

# Alias
Set-Alias -Name c -Value cls
Set-Alias -Name c -Value clear
# PowerShell
Function Reload { . $PROFILE }
Set-Alias -Name r -Value Reload
# Cargo
Set-Alias -Name cg -Value cargo
Function CargoRun { cargo run }
Set-Alias -Name cr -Value CargoRun
Function CargoBuild { cargo build }
Set-Alias -Name cb -Value CargoBuild
Function CargoCheck { cargo check }
Set-Alias -Name ch -Value CargoCheck
# Git
Set-Alias -Name g -Value git
Function GitStatus { git status }
Set-Alias gs GitStatus -Scope Global
Function GitFetch { git fetch }
Set-Alias -Name gf -Value GitFetch
Function GitPull { git pull }
Set-Alias -Name gpl -Value GitPull
Function GitAdd { git add . }
Set-Alias -Name ga -Value GitAdd
Function GitSwitch { git switch }
Set-Alias -Name gsw -Value GitSwitch
Function GitCheckout { git checkout }
Set-Alias -Name gck -Value GitCheckout
Function GitLogOneline { git log --oneline }
Set-Alias -Name glo -Value GitLogOneline
Function GitRebase { git rebase }
Set-Alias -Name gr -Value GitRebase
Function GitRebaseInteractive { git rebase -i }
Set-Alias -Name gri -Value GitRebaseInteractive
Function GitRebaseContinue { git rebase --continue }
Set-Alias -Name grc -Value GitRebaseContinue
Function GitPush { git push }
Set-Alias -Name gpsh -Value GitPush
Function GitCommit { git commit }
Set-Alias -Name gcmt -Value GitCommit -Scope Global
