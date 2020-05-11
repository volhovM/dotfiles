#!/bash/sh env

set -e
sudo cryptsetup luksOpen /dev/sda1 seagate0
sudo mount /dev/mapper/seagate0 /mnt/seagate0
~/reps/fullsync.sh
sudo umount /mnt/seagate0
sudo cryptsetup luksClose seagate0
