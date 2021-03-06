$AdminKey = �HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A7-37EF-4b3f-8CFC-4F3A74704073}�
$UserKey = �HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\{A509B1A8-37EF-4b3f-8CFC-4F3A74704073}�

Get-Disk |
Where partitionstyle -eq �raw� |
Initialize-Disk -PartitionStyle MBR -PassThru |
New-Partition -AssignDriveLetter -UseMaximumSize 
Format-Volume -FileSystem NTFS -NewFileSystemLabel �disk2� -Confirm:$true  -DriveLetter:D



Set-ItemProperty -Path $AdminKey -Name �IsInstalled� -Value 0
Set-ItemProperty -Path $UserKey -Name �IsInstalled� -Value 0
Stop-Process -Name Explorer
Write-Host �IE Enhanced Security Configuration (ESC) has been disabled.� -ForegroundColor Green