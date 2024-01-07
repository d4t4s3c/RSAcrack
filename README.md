# RSAcrack

**Brute Force Password (Passphrase) Private Key (id_rsa)**

![](/1.png)

---

- <kbd>Download **RSAcrack**</kbd>

```sh
wget --no-check-certificate -q "https://raw.githubusercontent.com/d4t4s3c/RSAcrack/main/RSAcrack" && chmod +x RSAcrack
```

- <kbd>Download **RSAcrack** & Add **RSAcrack** to PATH</kbd>

```cmd
wget --no-check-certificate -q "https://raw.githubusercontent.com/d4t4s3c/RSAcrack/main/RSAcrack" -O /usr/bin/RSAcrack && chmod +x /usr/bin/RSAcrack
```

- <kbd>Download **Wordlist** (Optional Recommended)</kbd>

```cmd
wget --no-check-certificate -q "https://raw.githubusercontent.com/d4t4s3c/RSAcrack/main/techyou.txt"
```

- <kbd>Usage</kbd>

```cmd
RSAcrack -k <KEY> -w <WORDLIST>
```

---

> [!WARNING]
> The cracking speed can vary depending on which tool the key is generated with.

| Key Generated | Cracking Speed     |
|---------------|--------------------|
| OpenSSL       | :heavy_check_mark: |
| ssh-keygen    | :x:                |
| 8gwifi        | :heavy_check_mark: |

> [!CAUTION]
> Do not upload large dictionaries with many lines, it is recommended to use `techyou.txt` included in this repository.

---

