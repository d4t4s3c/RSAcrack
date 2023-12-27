# RSAcrack

**Brute Force Password (Passphrase) Private Key (id_rsa)**

![](/1.png)

- <kbd>Download / Install</kbd>

```cmd
wget --no-check-certificate -q "https://raw.githubusercontent.com/d4t4s3c/RSAcrack/main/RSAcrack" -O /usr/bin/RSAcrack
chmod +x /usr/bin/RSAcrack
```

- <kbd>Use</kbd>

```cmd
RSAcrack -k <KEY> -w <WORDLIST>
```

**WARNING:** The cracking speed can vary depending on which tool the key is generated with.

| Key Generated | Cracking Speed     |
|---------------|--------------------|
| OpenSSL       | :heavy_check_mark: |
| ssh-keygen    | :x:                |
| 8gwifi        | :heavy_check_mark: |

---
