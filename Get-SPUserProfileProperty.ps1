[CmdletBinding()]
Param(
	[Parameter(Mandatory=$True)]
	[string]$User,
	[string]$MysiteUrl = "https://mysite.domain.com",
	[string]$AccountFormat = "i:0e.t|claimsprovidername|$User@email.com",
	[Parameter(Mandatory=$false)]
	[string]$Property
)

$site = Get-SPSite $MysiteUrl
$context = [Microsoft.SharePoint.SPServiceContext]::GetContext($site)
$mgr = New-Object Microsoft.Office.Server.UserProfiles.UserProfileManager($context)

$profile = $null
$profile = $mgr.GetUserProfile($AccountFormat);

if($profile -ne $null)
{
	if($Property -eq "")
	{
		foreach($prop in $profile.Properties)
		{
			$prop | select Name,@{Name="Value";Expression={$profile[$_.Name]}}
		}
	}
	else
	{
		$profile[$Property]
	}
}
else
{
	Write-Host "Can't find profile $AccountFormat" -ForegroundColor Red
}
