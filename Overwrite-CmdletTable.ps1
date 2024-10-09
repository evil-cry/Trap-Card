$ssInternal = [System.Management.Automation.SessionState].GetProperty('Internal', @('nonpublic','instance')).GetValue($ExecutionContext.SessionState)
$currScope = $ssInternal.GetType().GetProperty('CurrentScope',@('nonpublic','instance')).GetValue($ssInternal)
$cmdletTable = $currScope.gettype().GetProperty('CmdletTable', @('nonpublic','instance')).GetValue($currScope)

$cmd = Get-Command Write-Host

$cmdletTable['Get-ChildItem'] = $cmd
Get-ChildItem 'example string'