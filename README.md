# sharepoint-powershell
Few powershell scripts for day to day operations

### User Profile
* Get-SPUserProfileProperty.ps1

Quick helper for retrieving basic user profile information without the need to re-enter each time mysite url or account (claims ?) format

* Pre-requisites
  * Update $MysiteUrl param default value to your mysite host
  * Update *AccountFormat param default value to your farm setting $User is the value provided in the command line. eg : domain\$User or i:0e.t|myclaimsprovider|$User@myclaimisusingemail.com

* Usage

  * User (mandatory) : user to lookup
  * MySiteUrl : overriding default mysite host
  * AccountFormat : overriding default account format
  * Property : property to retrieve (eg PictureUrl), if not provided, return all properties

* Set-SPUserProfileProperty.ps1

Quick helper for setting basic user profile information without the need to re-enter each time mysite url or account (claims ?) format

* Pre-requisites
  * Update $MysiteUrl param default value to your mysite host
  * Update *AccountFormat param default value to your farm setting $User is the value provided in the command line. eg : domain\$User or i:0e.t|myclaimsprovider|$User@myclaimisusingemail.com
  
* Usage

  * User (mandatory) : user to lookup
  * MySiteUrl : overriding default mysite host
  * AccountFormat : overriding default account format
  * Property (mandatory) : property to set (eg PictureUrl)
  * Value (mandatory) : value to be set