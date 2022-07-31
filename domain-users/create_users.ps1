configuration CreateUsers
{
    
    New-ADOrganizationalUnit -Name "UserAccounts" -Path (Get-ADDomain).DistinguishedName
    $usersOu = Get-ADOrganizationalUnit -Filter 'Name -like "useraccounts"'

    # Store the data from adusers.csv in the $ADUsers variable

    $usersFile = Invoke-WebRequest -Uri https://raw.githubusercontent.com/adibnaya/AzureDevopsTest/main/domain-users/adusers.csv

    $ADUsers = ConvertFrom-Csv $usersFile.Content



    # Loop through each row containing user details in the CSV file
    foreach ($User in $ADUsers) {

        #Read user data from each field in each row and assign the data to a variable as below
        $username = $User.GivenName + $user.Surname
        $password = $User.Password
        $firstname = $User.GivenName
        $lastname = $User.Surname
        $OU = $usersOu
        $streetaddress = $User.StreetAddress
        $city = $User.City
        $zipcode = $User.Zipcode
        $state = $User.State
        $country = $User.Country
        $telephone = $User.TelephoneNumber

        # Check to see if the user already exists in AD
        if (Get-ADUser -F { SamAccountName -eq $username }) {
            
            # If user does exist, give a warning
            Write-Warning "A user account with username $username already exists in Active Directory."
        }
        else {

            # User does not exist then proceed to create the new user account
            # Account will be created in the OU provided by the $OU variable read from the CSV file
            New-ADUser `
                -SamAccountName $username `
                -Name "$firstname $lastname" `
                -GivenName $firstname `
                -Surname $lastname `
                -Enabled $True `
                -DisplayName "$lastname, $firstname" `
                -Path $OU `
                -City $city `
                -PostalCode $zipcode `
                -Country $country `
                -State $state `
                -StreetAddress $streetaddress `
                -OfficePhone $telephone `
                -AccountPassword (ConvertTo-secureString $password -AsPlainText -Force) -ChangePasswordAtLogon $True

            # If user is created, show message.
            Write-Host "The user account $username is created." -ForegroundColor Cyan
        }
    }
}
