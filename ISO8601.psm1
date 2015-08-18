Function Get-ISO8601Timestamp {
<#
.SYNOPSIS
Returns a timestamp following ISO 8601 standards. Optionally return it in a format suitable for filenames. 

.DESCRIPTION
For whatever reason I can't remember Get-Date -Format s, but can remember ISO 8601. So this creates a cmdlet to return timestamps formatted following ISO 8601. 

.PARAMETER dateonly
OPTIONAL: Returns only today's date. (YYYY-MM-DD)

.PARAMETER filename
OPTIONAL: Returns in a format that is a valid filename. (Replaces : with _)

.NOTES
Author: Andrew Zbikowski (andy@zibnet.us)
Author Website: http://andy.zibnet.us

Version History
* 2015-08-18: 1.0, First Release. 

.EXAMPLE
Just Run it.
Get-ISO8601Timestamp
2015-08-18T14:59:15

.EXAMPLE
Date Only
Get-ISO8601Timestamp -dateonly
2015-08-18

.EXAMPLE
Get-ISO8601Timestamp -filename
2015-08-18T14_59_15

.LINK
https://en.wikipedia.org/wiki/ISO_8601

#>


    Param (
        [Parameter()][switch]$filename = $false,
        [Parameter()][switch]$dateonly = $false
    )
    
    if ($filename -eq $true -and $dateonly -eq $false) {
        (Get-Date -Format s).Replace(":","_")
    }
    ElseIf ($dateonly -eq $true) {
        (Get-Date -Format s).Substring(0,10)
    }
    Else {
        Get-Date -Format s
    }
}

New-Alias -Name Get-ISODate -value Get-ISO8601Timestamp -Description "Alias of Get-ISO8601Timestamp"
New-Alias -Name ISODate -value Get-ISO8601Timestamp -Description "Alias of Get-ISO8601Timestamp"

#– Need to be included at the end of your *psm1 file.
Export-ModuleMember -Alias * -Function *