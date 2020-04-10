find m1e11f20 -type f -exec curl -1 --disable-epsv --ftp-skip-pasv-ip  --ftp-ssl -u alexandergurvich2021@u.northwestern.edu --ftp-create-dirs -T {} ftp://ftp.box.com/ \;
