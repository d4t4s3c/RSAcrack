# RSAcrack

**Brute Force Password (Passphrase) Private Key (id_rsa)**

![](/screenshot.png)

- <kbd>Download / Install</kbd>

```cmd
root@kali:~# wget -q "https://raw.githubusercontent.com/d4t4s3c/RSAcrack/main/RSAcrack.sh" -O /usr/bin/RSAcrack
root@kali:~# chmod +x /usr/bin/RSAcrack
```

- <kbd>Use</kbd>

```cmd
root@kali:~# RSAcrack -w <WORDLIST> -k <KEY>
```

**NOTE:** The cracking speed can vary depending on which tool the key is generated with.

| Key Generated | Cracking Speed     |
|---------------|--------------------|
| OpenSSL       | :heavy_check_mark: |
| ssh-keygen    | :x:                |
| 8gwifi        | :heavy_check_mark: |

---
