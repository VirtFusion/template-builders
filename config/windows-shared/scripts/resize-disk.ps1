$size = (Get-PartitionSupportedSize -DiskNumber 0 -PartitionNumber 2)
$size = $size.SizeMin + 924288000
Resize-Partition -DiskNumber 0 -PartitionNumber 2 -Size $size