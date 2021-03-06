<#

.SYNOPSIS

Remotely retrieves a listing of configuration settings for Windows Snare Agents.



.DESCRIPTION

Uses [Microsoft.Win32.RegistryKey] to retreive Snare configuration settings from the registry.



.PARAMETER ComputerName

a single computer name or an array of computer names. You may also provide IP addresses.


.EXAMPLE

Retreives a list of Snare configuration settings from Computer1 and Computer2

.\Get-SnareAgentConfig.ps1 -ComputerName Computer1,Computer2


#>
param([string[]]$ComputerName=$env:Computername)
foreach ($strMachineName in $ComputerName)
{    
    $objReg = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey('LocalMachine', $strMachineName)
    $objRegKey = $objReg.OpenSubKey("Software\\InterSect Alliance\\AuditService" )
    $SubKeys = $objRegKey.GetSubKeyNames()
    $object = New-Object –TypeName PSObject
    $object | Add-Member –MemberType NoteProperty –Name Machine –Value $strMachineName
    $SnarePath = $($([Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey('LocalMachine', $strMachineName)).OpenSubKey("System\\CurrentControlSet\\Services\Snare")).getvalue("ImagePath")
    $snareversion = $(dir $($('\\' + $strMachineName + '\' + $($Snarepath -replace ":","$")) -replace '"','')).versioninfo.productversion
    $object | Add-Member –MemberType NoteProperty –Name SnareVersion –Value $snareversion
    
    foreach ($Key in $SubKeys)
    {
       $RegKey = "Software\\InterSect Alliance\\AuditService\\" + $Key
       $objRegSubKey = $objReg.OpenSubKey($RegKey)
       $Values = $objRegSubkey.GetValueNames()

       foreach ($value in $values)
       {

                $object | Add-Member -MemberType NoteProperty -Name "$Key($value)" -Value $($objRegSubkey.GetValue("$value"))
                       
       }
      
    }
   $object  
}