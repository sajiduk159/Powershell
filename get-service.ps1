#Script to check a list of servers for any given service and report back whether it is present 
#Create a servers.txt file with list of servers, and an empty results.txt file. Set the $service variable to your required service display name
#Todo: use Invoke-Command -Session for synchronous run of command on all servers

$servers = "C:\Temp\servers.txt"
$service = "My Service Display Name"
$results_file = "C:\Temp\results.txt"

Foreach ($server in (Get-Content $servers)) {
    if (Get-Service -computername $server -DisplayName $service){
        Add-Content $results_file "$server $service Installed"
        write-host $server
    }  
    else {
        Add-Content $results_file "$server $service Required"
        write-host $server
        }
     }
