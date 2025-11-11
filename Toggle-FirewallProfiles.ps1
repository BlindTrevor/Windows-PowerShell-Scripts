function Toggle-FirewallProfiles {
    [CmdletBinding()]
    param(
        [ValidateSet("On","Off")]
        [string]$Action = "On"
    )

    # Convert action to GpoBoolean-compatible string
    $enable = if ($Action -eq "On") { "True" } else { "False" }

    # Profiles to toggle
    $profiles = @("Domain","Private","Public")

    foreach ($profile in $profiles) {
        Set-NetFirewallProfile -Profile $profile -Enabled $enable
        Write-Host "$profile firewall turned $Action"
    }

    # Show current status
    Get-NetFirewallProfile | Format-Table Name, Enabled
}

# Toggle-FirewallProfiles Off
# Toggle-FirewallProfiles On
