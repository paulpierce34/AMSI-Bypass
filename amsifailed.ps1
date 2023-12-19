$a = [Ref].Assembly.GetTypes()

Foreach ($Type in $a){
if ($type.name -like "*iutils*"){
$ams = $type
$amstypes = $ams.GetFields('NonPublic,Static')
}
}


## now that we have each of the different ams fields, lets set a certain 'failed' boolean to true
Foreach ($DifferentType in $amstypes){
if ($DifferentType -like "*failed*"){
$amsfailed = $DifferentType
$Finalstage = $amsfailed.SetValue($null,$true)
}
}
