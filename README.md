# RSAcrack

**Tool to brute force on a password protected id_rsa key**

![](/1.png)

---

**Run**
```cmd
root@kali:~# RSAcrack /usr/share/wordlists/rockyou.txt id_rsa
```

**Download / Install**
```cmd
root@kali:~# cd /opt
root@kali:~# wget "https://raw.githubusercontent.com/d4t4s3c/RSAcrack/main/RSAcrack.sh"
root@kali:~# chmod +x RSAcrack.sh
```

**Add Alias**
- Bash --------> `root@kali:~# echo "alias RSAcrack='/opt/RSAcrack.sh'" >> /root/.bashrc`
- Zsh ---------> `root@kali:~# echo "alias RSAcrack='/opt/RSAcrack.sh'" >> /root/.zshrc`
- Powerlevel --> `root@kali:~# echo "alias RSAcrack='/opt/RSAcrack.sh'" >> /root/.p10k.zsh`

---
