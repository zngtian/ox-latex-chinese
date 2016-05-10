- [README](#readme)
  - [下载并安装 Texlive](#下载并安装-texlive)
    - [下载 Tex Live ISO 镜像](#下载-tex-live-iso-镜像)
    - [挂载已经下载的 ISO 镜像](#挂载已经下载的-iso-镜像)
    - [运行安装程序](#运行安装程序)
    - [设置安装参数](#设置安装参数)
    - [安装所需要的 Latex 宏包](#安装所需要的-latex-宏包)
    - [安装所需要的字体](#安装所需要的字体)
  - [安装并配置 ox-latex-chinese](#安装并配置-ox-latex-chinese)
    - [安装](#安装)
    - [配置](#配置)
  - [常见错误排查和解决](#常见错误排查和解决)
    - [缺少必要的 Latex 宏包](#缺少必要的-latex-宏包)

# README<a id="org59c722f"></a>

## 下载并安装 Texlive<a id="org0442fa9"></a>

### 下载 Tex Live ISO 镜像<a id="orgdec5d0a"></a>

TeX Live 支持 Linux，Windows 以及 MacOX 多种操作系统，安装方式多种多样，由于我这里网络不太稳定，所以我选择通过 Tex Live ISO 来安装 Tex Live （文件大小大约3G），

Tex Live 主站访问速度很慢，建议同学们使用国内镜像，许多 Linux 镜像站点都同时包含 CTAN。大家可以在<http://www.cnbeta.com/articles/194758.htm>
列出的镜像站点中寻找 “CTAN” 子目录，两个比较好用的 CTAN 镜像：

1.  中国科学技术大学镜像：<http://mirrors.ustc.edu.cn/CTAN/systems/texlive/Images/>
2.  清华大学镜像：<http://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/texlive/Images/>

### 挂载已经下载的 ISO 镜像<a id="orga10adea"></a>

1.  下载安装 winmount 或者 DAEMON Tools，这两个工具可以将 ISO 文件挂载到一个盘符，比直接解压缩快速方便。
2.  将 ISO 镜像挂载到 “Z:\\”

### 运行安装程序<a id="org336092f"></a>

1.  打开 “Z” 盘。
2.  **完全安装** 请运行 “install-tl.bat”，这种方式比较省心，但很占空间。
3.  **定制安装** 请运行 “install-tl-advanced.bat” ，这种方式相对麻烦，但节省安装时间和硬盘空间。

注：安装的时候建议关闭杀毒软件。

### 设置安装参数<a id="org95d70a4"></a>

运行安装程序后，会弹出一个窗口（比较丑陋）用于设置安装选项，在 “选择安装方案” 选项中选择 “scheme-small”，其它选项不变，然后开始安装（安装大概需要 5 分钟左右）。

![img](./snapshots/advanced-install.gif)

### 安装所需要的 Latex 宏包<a id="org771c89f"></a>

1.  第一种方式：使用 Tex Live 管理器图形界面安装

    ![img](./snapshots/install-latex-package-with-gui.gif)

    1.  运行 Tex Live 管理器： 开始 >程序 > Tex Live 2015 > Tex Live Manager
    2.  载入本地宏包仓库：tlmgr >载入其它仓库，在弹出的对话框中选择 “choose local directory”，载入本地仓库 “Z:”。
    3.  安装所需宏包： collection-langcjk, collection-langchinese, ctex, ctex-faq, bibtex8, environ, trimspaces, zhnumber, wrapfig, capt-of, latexmk

2.  第二种方式：使用 tlmge 命令安装

    1.  运行 window CMD
    2.  设置 Latex 宏包仓库

            tlmgr option repository Z:
    3.  更新设置

            tlmgr update -all
    4.  安装所需宏包

            tlmgr install collection-langcjk collection-langchinese ctex ctex-faq bibtex8 environ trimspaces zhnumber wrapfig capt-of latexmk

### 安装所需要的字体<a id="org434b294"></a>

将所需要的字体文件（ttf或者ttc文件）拷贝到 window 字体目录中就可以了。

1.  文泉驿微米黑：<http://wenq.org/wqy2/index.cgi?MicroHei>

## 安装并配置 ox-latex-chinese<a id="org0e95d60"></a>

### 安装<a id="org363a738"></a>

1.  配置 melpa: <http://melpa.org/#/getting-started>
2.  M-x package-install RET ox-latex-chinese RET

### 配置<a id="org40b74fd"></a>

    (require 'ox-latex-chinese)
    (oxlc/toggle-ox-latex-chinese t)

## 常见错误排查和解决<a id="orgf494a8d"></a>

### 缺少必要的 Latex 宏包<a id="orgc474863"></a>

1.  表现形式

    1.  message buffer中有类似输出

            Processing LaTeX file ./export-org-file-to-pdf-with-ctex.tex...
            PDF file ./export-org-file-to-pdf-with-ctex.pdf wasn't produced
    2.  **Org PDF LaTeX Output** buffer 中有类似输出

            ...

            (c:/texlive/2015/texmf-dist/tex/generic/oberdiek/ltxcmds.sty)
            (c:/texlive/2015/texmf-dist/tex/generic/oberdiek/kvsetkeys.sty
            (c:/texlive/2015/texmf-dist/tex/generic/oberdiek/infwarerr.sty)
            (c:/texlive/2015/texmf-dist/tex/generic/oberdiek/etexcmds.sty
            (c:/texlive/2015/texmf-dist/tex/generic/oberdiek/ifluatex.sty))))
            (c:/texlive/2015/texmf-dist/tex/generic/oberdiek/pdftexcmds.sty))
            (c:/texlive/2015/texmf-dist/tex/latex/tools/longtable.sty)

            ! LaTeX Error: File `wrapfig.sty' not found.

            Type X to quit or <RETURN> to proceed,
            or enter new name. (Default extension: sty)

            Enter file name:
            ! Emergency stop.
            <read *>

            l.8 \usepackage
                           {rotating}^^M
            No pages of output.

            ...

2.  解决方式

        ! LaTeX Error: File `wrapfig.sty' not found.

    这个错误提示说明，你安装的 Tex Live 中没有包含 wrapfig.sty 这个文件，需要你安装，解决方式：

    1.  直接试着安装 “wrapfig” 宏包

            tlmgr option repository Z:
            tlmgr update -all
            tlmgr install wrapfig
    2.  如果没有找到 “wrapfig” 宏包，你需要找到哪个宏包包含 wrapfig.sty，一个简单的方式就是用 google 搜索 wrapfig.sty，一般会有相关的信息。
