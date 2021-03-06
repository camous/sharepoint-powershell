[CmdletBinding()]
Param(
	[Parameter(Mandatory=$True)]
	[string]$User,
	[string]$MysiteUrl = "https://mysite.domain.com",
	[string]$AccountFormat = "i:0e.t|claimsprovidername|$User@email.com",
	[Parameter(Mandatory=$True)]
	[string]$Property,
	[Parameter(Mandatory=$True)]
	[string]$Value
)

$site = Get-SPSite $MysiteUrl
$context = [Microsoft.SharePoint.SPServiceContext]::GetContext($site)
$mgr = New-Object Microsoft.Office.Server.UserProfiles.UserProfileManager($context)

$profile = $mgr.GetUserProfile($AccountFormat);

if($profile -ne $null)
{
		Write-Host "$Property $Value for $AccountFormat (previous value : $($profile[$Property].Value))"
		$profile[$Property].Value = $Value
		$profile.Commit();
}
