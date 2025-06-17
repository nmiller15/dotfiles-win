function discoFunc {
    while ($true) {
        $f = get-random ([enum]::GetNames('System.ConsoleColor'))
        $b = get-random ([enum]::GetNames('System.ConsoleColor'))
        Write-Host "#" -nonewline -f $f -b $b
    }
}
Set-Alias disco discoFunc

function glitterFunc {
    $colors = [enum]::GetNames('System.ConsoleColor')

      $width = [Console]::WindowWidth
      $height = [Console]::WindowHeight

      $positions = 
        foreach($y in 0..($height-1)){
            foreach($x in 0..($width-1)){
                ,($x,$y)
            }
        }

      $indexes = 0..($positions.Length-1)
      $indexes = $indexes | Get-Random -Count $indexes.Length

      while ($true) {

        foreach($index in $indexes){
          $f = get-random $colors
          $b = get-random $colors
          [Console]::CursorLeft = $positions[$index][0]
          [Console]::CursorTop = $positions[$index][1]
          Write-Host "#" -NoNewLine -f $f -b $b
        }

      }
}
Set-Alias glitter glitterFunc

function waveFunc {
    $i = 0
    $e = [char]27

    function Calc($Offset, $Speed)
    {
        $base = ($i / $Speed) + (2 * [Math]::Pi * ($Offset / 3))
        return (([Math]::Sin($base)) + 1) / 2
    }

    while ($true)
    {
        $i++
        $r = [int]((Calc 1 50) * 255)
        $g = [int]((Calc 2 50) * 255)
        $b = [int]((Calc 3 50) * 255)
        $dotSize = 10
        $dot = ([string][char]0x2588) * $dotSize
        $offset = " " * [int]((Calc 1 20) * ([Console]::BufferWidth - $dotSize))
        $colorDot = "$e[38;2;$r;$g;$($b)m$dot$e[0m"
        Write-Host ($offset + $colorDot)
        sleep -Milliseconds 5
    }
}
Set-Alias wave waveFunc

