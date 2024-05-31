mv -f ~/pppwn_owt-main/offsets ~/
chmod +x /pppwn_owt-main/pppwn
mv -f ~/pppwn_owt-main/pppwn ~/usr/bin
mv -f ~/pppwn_owt-main/run.sh ~/
rm -r pppwn_owt-main main
chmod +x run.sh
echo "Installation completed!"
exit 1
