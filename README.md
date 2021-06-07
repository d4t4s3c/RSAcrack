# RSAcrack

**`Brute force` tool to crack password of protected `id_rsa` keys**

![](/001.png)

---

**Run**
```cmd
root@kali:~# RSAcrack /usr/share/wordlists/rockyou.txt id_rsa
```

**Download / Install**
```cmd
root@kali:~# wget "https://raw.githubusercontent.com/d4t4s3c/RSAcrack/main/RSAcrack.sh" -O /opt/RSAcrack.sh
root@kali:~# chmod +x /opt/RSAcrack.sh
```

**Add Alias**
- Bash --------> `root@kali:~# echo "alias RSAcrack='/opt/RSAcrack.sh'" >> /root/.bashrc`
- Zsh ---------> `root@kali:~# echo "alias RSAcrack='/opt/RSAcrack.sh'" >> /root/.zshrc`
- Powerlevel --> `root@kali:~# echo "alias RSAcrack='/opt/RSAcrack.sh'" >> /root/.p10k.zsh`

(Close terminal and reopen again)

---
