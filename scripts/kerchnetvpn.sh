#!/bin/sh
echo "=============================================  "
echo "  => starting profile wlp2s0-TP-LINK_8CA086"
netctl start wlp2s0-TP-LINK_8CA086 && sleep 5
echo "  => restarting profile"
netctl restart wlp2s0-TP-LINK_8CA086 
echo "  => enabling vpn"
pon mcckerchnet && sleep 8 
echo "  => changing default routes "
ip route change default dev ppp0
echo "  => done!, watch ping ya.ru:"
ping -c3 ya.ru
echo "=============================================  "
