#Powershell Final by Omar

function computerInfo{
   
    #parameters here
    param(
		[string] $survey
	
		)

     #variables
    $DeviceName=$env:computername | Out-File $survey -append
    $OsVersion = (Get-ItemProperty -Path c:\windows\system32\hal.dll).VersionInfo.FileVersion | Out-File $survey -Append
    $date_time = Get-Date | Out-File $survey -Append
    $ps1= Get-Process | sort-Object si | ft | Out-File $survey -Append
    $openPort= netstat -an | Out-File $survey -Append


}


function hashing{

    
    param ([parameter(Mandatory=$true)] [string]$hashdir,
           [parameter(Mandatory=$true)] [string]$hashedFile
    
    )

   # we are recursively going throw each directory and hashed thier output to a file
   Get-ChildItem -path $hashdir -Recurse | Get-FileHash >> $hashedFile
  

}



function coolstuff{
    
    param ( $custom
    
    )
    echo "=================================="
    echo "press [1] to see all running process"
    echo "press [2] to print your ip address"
    echo "press [3] to find what version of Windows PowerShell my computer is running"
    echo "press [4] to see all the aliases"
    echo "press [5] to exit"
    echo ""
    

    $count=0

    while($User -ne $count){

        $User = Read-Host -Prompt 'Enter number:'

        if ($User -eq 1){
            Get-Process
        }

        elseif ($User -eq 2){
            $pattern = ‘.*?((\d{1,3}\.){3}\d{1,3})’ #here where we difine how the ipdress look like
            $info = ipconfig
            $ip = $info -match “IPv4$pattern” | ForEach-Object { if ($_ -match $pattern) {$matches[1] }}
            echo $ip
        }

          elseif ($User -eq 3){
            echo $PSVersionTable | ft
        }

          elseif ($User -eq 4){
            alias
        }
        else{
            echo "bye bye"
            break 
        }

    }

}

