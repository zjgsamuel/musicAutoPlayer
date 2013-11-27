功能:  
Cubieboard 在午休时间 11:30 ~ 12:30 自动播放音乐

 
参考:  
http://liangzhdp.blogspot.com/2009/07/mplayer.html  
http://cb.e-fly.org/archives/debian-system-crontab.html  
http://www.2cto.com/os/201305/215253.html  
http://www.cnblogs.com/24la/archive/2013/01/28/2880768.html     
http://forum.ubuntu.org.cn/viewtopic.php?p=1956262  
http://forum.cubietech.com/forum.php?mod=viewthread&tid=493  
http://forum.cubietech.com/forum.php?mod=viewthread&tid=493&extra=page%3D2  
http://forum.cubietech.com/forum.php?mod=viewthread&tid=1215&extra=page%3D1 


步骤如下：

1. Cubieboard 刷好 A20-cubieboard Lubuntu-Desktop-12.10-v1.06
2. 设定时区及更新时间服务器  
http://blog.csdn.net/jyoryo/article/details/9044103
 
3. 更新中文文件名支持  
locale  
locale -a   

	安装zh_CN.utf8  
cd /usr/share/locales  
ls  
sudo ./install-language-pack zh_CN  
sudo vi /var/lib/locales/supported.d/local  
sudo locale-gen --purge  

  sudo vi /etc/default/locale  
LANG="zh_CN.UTF-8"  
LANGUAGE="zh_CN:zh"  
LC_ALL="zh_CN.UTF-8"  

4. 安装声卡驱动及音量控制及设置  
sudo apt-get install alsa-base alsa-utils alsa-lib-devel  
sudo apt-get install aumix  
sudo alsamixer  
sudo vi /etc/asound.conf

5. 安装音乐播放软件及设置  
sudo apt-get install mplayer

6. 设置samba 文件共享  
http://wiki.ubuntu.org.cn/Samba

7. 挂载TF扩展卡  
sudo mount -t vfat /dev/mmcblk0p1  /home/linaro/Music  
sudo vi /etc/fstab  
/dev/mmcblk0p1   /home/linaro/Music   vfat   user,rw,utf8,umask=000   1 2

8. 编辑播放脚本及文件名空格处理  
sudo vi /usr/local/bin/playMusic.sh  
sudo vi /usr/local/bin/playRing.sh  
sudo chmod u+x  /usr/local/bin/playMusic.sh  
sudo chmod u+x  /usr/local/bin/playRing.sh  

9. 设定定时刷新网络时间及定时播放  
sudo vi  /etc/crontab  
sudo /etc/init.d/cron restart
  


Done  
Enjoy it...