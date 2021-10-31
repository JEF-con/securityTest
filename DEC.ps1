funtion Encrypt($path) {
	$script = Get-Content $path | Out-String
	$script = ConvertTo-SecureString $script -asPlainText -force
	$script = $secure | ConvertFrom-SecureString
	Set-Content $path $export
}

funtion Decrypt($path) {
	$raw = Get-Content $path
	$secure = ConvertTo-SecureString $raw
	$helper = New-Object system.Management.Automation.PSCredential("test", $secure)
	$plain = $helper.GetNetworkCredential().Passwoed
	Set-Content $path $plain
}

Encrypt D:\secuityTest\a.txt
