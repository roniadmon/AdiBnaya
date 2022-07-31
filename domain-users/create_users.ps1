New-ADOrganizationalUnit -Name "UserAccounts" -Path (Get-ADDomain).DistinguishedName
$usersOu = Get-ADOrganizationalUnit -Filter 'Name -like "useraccounts"'

# Store the data from adusers.csv in the $ADUsers variable

$usersFile = Invoke-WebRequest -Uri https://raw.githubusercontent.com/adibnaya/AzureDevopsTest/main/domain-users/adusers.csv

$ADUsers = ConvertFrom-Csv @'
"GivenName","MiddleInitial","Surname","StreetAddress","Gender","City","State","ZipCode","Country","TelephoneNumber","Birthday","Password"
"Robert","S","Atwood","1443 Bloomfield Way","male","Gray","ME","04039","US","207-657-8355","11/9/1975","MiQu9soogae"
"Jimmy","S","Stivers","4936 Upton Avenue","male","Belfast","ME","04915","US","207-930-1125","12/22/1978","eiF9fah7ph"
"Thomas","S","Oliveira","1858 Fantages Way","male","South Portland","ME","04106","US","207-759-7957","12/2/1982","eeKae1Aey1o"
"Gertrudis","A","Leon","3433 Fantages Way","female","Portland","ME","04101","US","207-686-8598","6/13/1969","Lee8noWah"
"Debroah","E","Parnell","3282 Bloomfield Way","female","Standish","ME","04084","US","207-642-2676","7/28/1960","Oogei2aido"
"Marian","B","Barlow","103 Hedge Street","female","Red Bank","NJ","07701","US","908-650-7538","8/22/1965","Sohxolaek9"
"Dorothy","C","Dick","4449 Williams Mine Road","female","Bedminster","NJ","07921","US","908-306-8952","1/26/1965","LaizaiK5ae"
"Dominic","R","Lee","3446 Walnut Avenue","male","Newark","NJ","07102","US","201-542-0113","2/11/1997","dep4Ooroh"
"Jeffrey","C","Bulloch","2693 Dark Hollow Road","male","Pennsauken","NJ","08110","US","609-248-7594","3/18/1971","Aik2hev4gob8V"
"Michael","S","Gray","2281 Valley Street","male","Camden","NJ","08102","US","856-759-0288","10/4/1984","eith6Phi4"
"Orlando","K","Clarke","1342 Freshour Circle","male","Groveland","CA","95321","US","209-962-6698","5/11/1955","hi6hooYai"
"Wayne","M","Davis","3583 Woodland Terrace","male","Sacramento","CA","95814","US","916-996-7926","11/12/1990","Phaikeiloh7"
"Andrea","J","Spencer","3696 Brookview Drive","female","Santa Clara","CA","95054","US","408-981-6220","1/29/1966","fuiPh9ahth"
"Patrick","S","Clancy","94 Hamill Avenue","male","San Diego","CA","92111","US","858-434-0532","6/6/1961","UWei2riev"
"Juanita","D","Campbell","281 Half and Half Drive","female","Riverdale","CA","93656","US","559-867-5090","12/28/1977","ayoo1zuX"
"Belinda","T","Boman","1724 Burke Street","female","Norwood","MA","02062","US","781-255-6261","2/22/1963","ush7aiVai"
"Jennifer","D","Flores","98 Trouser Leg Road","female","Springfield","MA","01105","US","413-841-7038","9/2/1998","thohSh3Chie"
"Roxanne","J","Gilbert","834 Russell Street","female","Lowell","MA","01852","US","978-937-5503","2/5/1976","Oxi5rahru"
"Michelle","W","Hanlon","1573 Joanne Lane","female","Boston","MA","02110","US","978-513-2729","7/6/1985","shoop4ooYoh"
"Kevin","M","McCann","1150 Hilltop Street","male","Northadams","MA","01247","US","413-662-5165","1/14/1961","teidee2Qu"
"Ronald","T","Gray","1680 Fannie Street","male","San Angelo","TX","76903","US","979-210-3838","1/15/1973","tu4OopaeKo7"
"Chris","R","Kim","1284 Mulberry Street","male","Conroe","TX","77301","US","936-709-4610","3/10/1990","reiQuu5S"
"Earl","S","Regan","3627 Mulberry Street","male","Nacogdoches","TX","75964","US","936-635-9120","12/26/1988","ekaGei6oh"
"Luanne","G","Shelby","1567 Margaret Street","female","Houston","TX","77587","US","713-946-4995","1/26/1980","Zee7ek0ach"
"Mary","J","Vance","3683 Payne Street","female","Houston","TX","77002","US","281-203-0721","7/11/1989","Shaichoh9"
"Glen","R","Goodlow","2639 Orphan Road","male","Appleton","WI","54911","US","715-942-1378","3/16/1991","Kahp3ohhu"
"Gladys","A","Oakley","3834 Rockford Mountain Lane","female","Appleton","WI","54911","US","920-247-0585","12/25/1951","Aith2ieg"
"George","D","Martin","2187 Whaley Lane","male","Milwaukee","WI","53203","US","262-436-1083","12/28/1985","gai5vae3Oo"
"Teresa","R","Smith","1490 Lauren Drive","female","South Wayne","WI","53587","US","608-439-4501","12/9/1963","sha4Eit8m"
"David","K","Moore","892 Highland Drive","male","Milwaukee","WI","53202","US","920-645-4504","11/3/1974","fu4Bai5yai"
"Martha","M","Graham","2635 West Virginia Avenue","female","Colonie","NY","12205","US","518-881-8291","2/27/1977","thie8Eh7g"
"Suzette","D","Boyd","1729 Long Street","female","New York","NY","10013","US","347-967-6227","9/29/1981","Aekee7emoof"
"Lynne","R","McGuire","1467 Longview Avenue","female","Bellerose","NY","11426","US","718-600-0003","5/28/1957","Ujiphoh1shoh"
"Hazel","J","Whitaker","3293 Godfrey Road","female","New York","NY","10004","US","212-552-1057","3/22/1991","Yapuidad8Ax"
"Vernon","N","Blizzard","857 West Virginia Avenue","male","Delmar","NY","12054","US","518-969-5764","10/10/1954","cahd9raThe"
"Kelly","P","Davis","1055 Lang Avenue","female","West Valley City","UT","84119","US","435-921-4104","12/9/1990","ahc7cie3Qu"
"Elbert","K","Miller","4 Burnside Avenue","male","Brigham City","UT","83402","US","435-729-8774","8/24/1980","AeMohgohvi9"
"Michael","D","Pierson","2043 Kemper Lane","male","West Valley City","UT","84120","US","801-896-5314","2/8/1958","maep8Eeyoh3"
"Margaret","R","Lopez","2911 Kemper Lane","female","Salt Lake City","UT","84111","US","801-813-0940","6/1/1957","Eihoi1IeZ"
"Catherine","J","Turner","871 Philadelphia Avenue","female","Salt Lake City","UT","84104","US","801-330-6625","11/14/1958","xaeXahGho1o"
"Matthew","R","Haney","4297 Gladwell Street","male","Memphis","TN","38133","US","901-870-6757","2/4/1986","SohgooGh6ai"
"Rebecca","S","Stewart","2713 McDowell Street","female","Nashville","TN","37211","US","931-320-5866","11/18/1978","hee2toe7Gei"
"Gladys","J","Roberts","2174 Melville Street","female","Yorkville","TN","38389","US","731-333-7303","8/22/1970","oseeng8Ung"
"Cecilia","C","Nicholas","1487 Wilkinson Street","female","Nashville","TN","37201","US","615-467-3316","2/16/1979","woh4EiRau"
"Freddie","J","Armstrong","1437 Nixon Avenue","female","Middlesboro","TN","40965","US","423-249-2993","9/9/1971","cee5ooPaeg3"
"Priscilla","R","Barrett","3097 Chestnut Street","female","Tampa","FL","33634","US","727-481-3515","7/26/1995","Xaev9aiWohx"
"Francisco","J","Taylor","1446 Red Bud Lane","male","Polk City","FL","33868","US","863-206-0425","7/29/1961","ye4coo3OQu9"
"Holly","T","Lund","4344 Elkview Drive","female","Vero Beach","FL","32960","US","772-299-1488","12/25/1994","in8zoNg0oB"
"Kelly","B","Caldwell","221 Everette Alley","female","Ft Lauderdale","FL","33311","US","954-821-3160","2/2/1968","ieb3Shegh"
"James","B","Reeves","3614 Woodside Circle","male","Fort Walton Beach","FL","32547","US","850-862-1976","9/22/1967","Eopueph7gue3"
"Scott","V","Aponte","1763 University Street","male","Seattle","WA","98121","US","206-404-7233","9/29/1988","foo7Uipoh"
"Cathy","M","Padilla","3434 Elliot Avenue","female","Seattle","WA","98109","US","206-648-1387","1/14/1991","Mo6tahg8ahz"
"Seth","A","Moore","645 Hill Haven Drive","male","Seattle","WA","98161","US","253-987-5119","10/2/1956","Eequu6ahgai"
"Brandy","C","Johnson","1667 Hillcrest Drive","female","Seattle","WA","98109","US","253-298-4006","4/6/1975","jeobax8Meed"
"Jennifer","S","Beeler","3464 Calico Drive","female","St John","WA","99171","US","509-648-8010","11/24/1966","nooHoh2ae"
"Robert","I","Chase","1078 Kembery Drive","male","Schaumburg","IL","60173","US","630-542-4077","12/16/1962","ve6eeKie"
"Carol","M","Alvarado","4119 Eagle Street","female","Fairview Heights","IL","62208","US","618-361-7864","5/17/1998","Mies4sah"
"Adrianne","J","Lee","4985 Farland Street","female","Bensenville","IL","60106","US","773-967-4763","5/18/1990","Rash3joo6"
"Fred","L","Page","3760 Millbrook Road","male","Wheeling","IL","60090","US","630-793-2227","11/27/1974","aoquo9eiZi"
"Larry","V","Bass","860 Cherry Camp Road","male","Hickory Hills","IL","60457","US","773-497-7382","3/25/1968","sai4eep9Aal"
"Betty","M","Villalon","4706 Kuhl Avenue","female","Atlanta","GA","30312","US","678-628-0024","5/5/1985","ze8uaboiqui2Oh"
"Sheryl","J","Dodd","4610 Smith Road","female","Lilburn","GA","30247","US","770-925-3061","6/17/1985","ooZaeGh5ph"
"Beverly","R","McGuire","2771 Layman Court","female","Atlanta","GA","30328","US","678-328-7940","8/23/1957","Datur5Ieth"
"Robert","K","Throop","1844 Smith Road","male","Panola","GA","30058","US","770-981-8925","10/7/1962","kah5Rahbee"
"Steve","P","Harper","437 Hanifan Lane","male","Marietta","GA","30064","US","678-581-7108","12/24/1975","eelohqu3daGh"
"Mary","E","Ferguson","565 Bedford Street","female","Wallingford","CT","06492","US","203-949-0702","12/23/1994","eeC9ufoo9Ah"
"Gary","K","Atkin","2453 Lochmere Lane","male","Stamford","CT","06995","US","860-471-9453","7/5/1983","yePahsh6"
"Cory","S","Johnson","1735 Raoul Wallenberg Place","male","Danbury","CT","06810","US","203-825-8766","11/12/1993","sae2Ou8ah"
"Arthur","P","Bell","2233 Lochmere Lane","male","Hartford","CT","06103","US","860-392-2193","5/8/1981","UTh8eeSh"
"Antonio","K","Evans","3084 Copperhead Road","male","Windsor","CT","06095","US","860-670-4180","5/13/1990","Im3moh2ah"
"Charity","T","Fuller","1162 Michigan Avenue","female","Pittsburgh","PA","15222","US","724-623-5432","12/4/1952","taeN8Iem1sh"
"George","M","Martinez","1256 Harley Brook Lane","male","Altoona","PA","16601","US","814-555-7469","2/28/1954","boh8leiHah"
"Lea","B","Licata","4580 Carriage Lane","female","Marshalls Creek","PA","18335","US","570-223-4523","10/12/1977","Aihoh6Bu"
"Jackie","M","Vega","4863 Tree Top Lane","female","Northampton","PA","18067","US","610-262-7815","3/29/1966","yaish3Nahg"
"Mathew","J","Broussard","4328 Deercove Drive","male","Philadelphia","PA","19107","US","215-216-1100","10/26/1989","taDeis1Go"
"Linda","J","Sanders","215 Meadow Drive","female","Oklahoma City","OK","73107","US","405-946-1471","6/5/1997","mes1Ae4oo"
"Donald","E","Hurst","359 Hott Street","male","Chickasha","OK","73018","US","405-638-1105","3/31/1969","Aib9neikee6"
"Randy","W","Smith","1550 Philli Lane","male","Dewey","OK","74029","US","918-534-3485","12/8/1995","Vaht6Afah"
"Angela","J","Cutts","3542 Luke Lane","female","Fairview","OK","73737","US","580-227-1648","11/26/1950","uar2ug0aiGh"
"Eric","G","Mathis","504 Luke Lane","male","Enid","OK","73703","US","580-216-0978","2/19/1975","fav9pieth0B"
"Heather","G","Davis","2445 Dye Street","female","Tempe","AZ","85283","US","480-775-5887","4/23/1993","zee2Thie1"
"Candice","J","Barela","2266 East Avenue","female","Tempe","AZ","85282","US","480-329-2245","6/24/1978","ief1johJang"
"Sandra","W","Stach","3657 Crowfield Road","female","Phoenix","AZ","85012","US","602-851-3922","6/4/1958","eiv1Choh0"
"Armando","C","Gordon","1194 Clarksburg Park Road","male","Phoenix","AZ","85008","US","928-242-3817","9/19/1951","pho0yeiJai"
"Sharon","J","Scruggs","4419 Dogwood Lane","female","Tucson","AZ","85742","US","520-572-1947","1/8/1984","ohW4ajoh9qu"
"Keith","G","Isbell","360 Sugar Camp Road","male","New Richland","MN","56072","US","507-465-8538","10/25/1993","Quo0ais5"
"Roberta","C","Holder","3297 Hillcrest Circle","female","Plymouth","MN","55446","US","763-559-1534","8/26/1980","agheeV2k"
"Hazel","S","Yelton","1863 Ferrell Street","female","Wannaska","MN","56761","US","218-425-9380","12/3/1972","oofeDourei8u"
"Edna","E","Nichols","2826 Newton Street","female","St Cloud","MN","56301","US","320-291-7147","1/14/1974","EiCeeGh0"
"Christopher","S","Ellis","2312 Sugar Camp Road","male","Owatonna","MN","55060","US","507-568-7305","9/13/1985","naeGhe7m"
"Jim","E","Karlson","2551 Forest Drive","male","Arlington","VA","22206","US","703-933-2521","10/29/1953","ThohXii2oo"
"Madeline","R","Yu","809 Forest Drive","female","Herndon","VA","20170","US","703-904-4794","10/4/1964","sait8AhY2Ae"
"Linda","L","Brown","3229 Nelm Street","female","Beltsville","VA","20705","US","571-241-1673","8/16/1988","theQu3jae"
"Jesus","C","Lockhart","1217 Fleming Way","male","Petersburg","VA","23803","US","804-701-4172","5/27/1972","uoThoh7Die8"
"Maria","J","Sharp","3210 Eden Drive","female","Richmond","VA","23219","US","804-868-7893","3/21/1971","EiPh6aixoh"
"Betty","J","Murray","2244 Birch Street","female","Greenwood","IN","46142","US","317-888-8556","7/11/1962","cheep5Ahvuo6"
"Will","J","Meehan","4488 Winifred Way","male","Marion","IN","46953","US","765-674-6266","3/17/1963","ohyiu0Aeroo"
"Shari","D","Jefferies","132 Stewart Street","female","Indianapolis","IN","46204","US","317-756-2082","10/23/1974","eewooGhaed6"
"Deborah","D","Ford","206 Charack Road","female","Evansville","IN","47708","US","812-305-0677","8/28/1968","zooQu6oqu"
'@



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
