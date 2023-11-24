function prompt {
    $ESC = [char]27
    "$ESC[48;2;254;128;25m$ESC[30m" + 
    $(if (Test-Path variable:/PSDebugContext) { '[DBG]: ' }
      else { '' }) + ' PS ' + $(Get-Location) + " $ESC[38;2;254;128;25m$ESC[40m`u{e0b0}$ESC[0m" + 
        $(if ($NestedPromptLevel -ge 1) { '>>' }) + "`n> "
}
