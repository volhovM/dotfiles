cryptsetup luksOpen $1 $2
mount /dev/mapper/$2 /mnt/$2
