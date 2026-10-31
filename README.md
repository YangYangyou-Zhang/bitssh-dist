# bitssh 安装包 / Installers

版本 / Version: **0.1.0**

## 下载 / Download

- **GitHub Releases**：`https://github.com/YangYangyou-Zhang/bitssh-dist/releases`
- **百度网盘 / Baidu Netdisk**：链接 `<待补充>`　提取码 `<待补充>`

> GitHub Releases 已发布；百度网盘链接/提取码仍待补充。

## 文件 / Files

| 平台 | 文件 |
| --- | --- |
| Windows x64 | `win/bitssh-win-x64.zip` |
| Linux x86_64 | `linux/x86_64/bitssh_0.1.0_amd64.deb`（另有 `bitssh-linux-x86_64.tar.gz` 免安装包） |
| Linux arm64 | `linux/aarch64/bitssh_0.1.0_arm64.deb`（另有 `bitssh-linux-aarch64.tar.gz` 免安装包） |

每个架构目录下的 `sha256sums.txt` 是压缩包校验值；发布时也会在 Release 中附一份汇总的 `sha256sums.txt`。

## 发布 / Publishing

安装包**不进入 Git 历史**：GitHub 普通仓库单文件上限 100 MB，而这些包为 146–240 MB。请使用 **GitHub Releases** 附件发布。

Windows / Windows PowerShell:

```powershell
# 需要先安装并登录 GitHub CLI: winget install GitHub.cli; gh auth login
.\publish_release.ps1 -Repo YangYangyou-Zhang/bitssh-dist -Tag v0.1.0
```

或手动在 GitHub 网页创建 Release，上传上述 zip/deb（以及可选的 tar.gz）和生成的 `sha256sums.txt`。

## 源码 / Source

- GitHub: `https://github.com/YangYangyou-Zhang/bitssh`
- Gitee: `https://gitee.com/zhangyangyangyou/bitssh`
