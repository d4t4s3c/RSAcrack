# RSAcrack

![GitHub stars](https://img.shields.io/github/stars/d4t4s3c/RSAcrack?logoColor=yellow) ![GitHub forks](https://img.shields.io/github/forks/d4t4s3c/RSAcrack?logoColor=purple) ![GitHub watchers](https://img.shields.io/github/watchers/d4t4s3c/RSAcrack?logoColor=green)</br>
![GitHub commit activity (branch)](https://img.shields.io/github/commit-activity/m/d4t4s3c/RSAcrack) ![GitHub contributors](https://img.shields.io/github/contributors/d4t4s3c/RSAcrack)

**Get private key passphrase (id_rsa).**

![](/img/img.png)

---

## Download

```sh
wget --no-check-certificate -q "https://raw.githubusercontent.com/d4t4s3c/RSAcrack/refs/heads/main/RSAcrack" && chmod +x RSAcrack
```

## Download & Install (PATH)

```cmd
wget --no-check-certificate -q "https://raw.githubusercontent.com/d4t4s3c/RSAcrack/refs/heads/main/RSAcrack" -O /usr/bin/RSAcrack && chmod +x /usr/bin/RSAcrack
```

## Usage

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
| PuTTYgen      | :heavy_check_mark: |
| 8gwifi        | :heavy_check_mark: |

---
