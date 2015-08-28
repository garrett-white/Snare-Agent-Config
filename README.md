## [About]

Remotely retrieves a listing of configuration settings for Windows Snare Agents.

Uses [Microsoft.Win32.RegistryKey] to retreive Snare configuration settings from the registry.

## [Examples]

#####Retreives a list of Snare configuration settings from Computer1 and Computer2

```Powershell
.\Get-SnareAgentConfig.ps1 -ComputerName Computer1

Machine                      : Computer1
SnareVersion                 : 4, 0, 2, 0
Config(Audit)                : 0
Config(Checksum)             : 0
Config(Clientname)           : 
Config(CritAudit)            : 0
Config(Delimiter)            :     
Config(EnableUSB)            : 0
Config(FileAudit)            : 0
Config(FileExport)           : 0
Config(HeartBeat)            : 0
Config(AgentLog)             : 0
Config(UseUTC)               : 0
Config(ClearTabs)            : 0
Config(LeaveRetention)       : 0
Config(OutputFilePath)       : 
Network(CacheSizeM)          : 5
Network(CacheSizeSet)        : 0
Network(EncryptMsg)          : 0
Network(SocketType)          : 0
Network(Destination)         : 127.0.0.1
Network(DestPort)            : 6161
Network(Syslog)              : 0
Network(SyslogAlt)           : 0
Network(SyslogDest)          : 13
Network(SyslogDynamicCritic) : 0
Objective(Objective0)        : 1    31    32    Logon_Logoff    ***    0    *    0    0    *    0
Objective(Objective1)        : 0    31    32    Process_Events    ***    0    *    0    0    *    0
Objective(Objective2)        : 2    31    32    User_Group_Management_Events    ***    0    *    0    0    *    0
Objective(Objective3)        : 1    24    32    Reboot_Events    ***    0    *    0    0    *    0
Objective(Objective4)        : 3    31    32    Security_Policy_Events    ***    0    *    0    0    *    0
Objective(Objective5)        : 1    31    95    *    ***    0    *    0    0    *    0
Remote(Allow)                : 0
Remote(WebPort)              : 6161
Remote(WebPortChange)        : 0
Remote(Restrict)             : 0
Remote(RestrictIP)           : 127.0.0.1
Remote(AccessKey)            : 0
Remote(AccessKeySet)         : 03f21b939e022176e87feb7704477bbc
Remote(AccessKeySetSnare1)   : 03f21b939e022176e87feb7704477bbc
Remote(AccessKeySetSnare2)   : 03f21b939e022176e87feb7704477bbc
Remote(AccessKeySetSnare3)   : 03f21b939e022176e87feb7704477bbc
Remote(AllowBasicAuth)       : 1
Remote(EnableCookies)        : 1
Status(LOG_TYPE_APPLICATION) : <BookmarkList>
                                 <Bookmark Channel='Application' RecordId='2848' IsCurrent='true'/>
                               </BookmarkList>

```