- [README](#readme)
  - [简介](#简介)
  - [下载并安装 Texlive](#下载并安装-texlive)
    - [下载 Tex Live ISO 镜像](#下载-tex-live-iso-镜像)
    - [挂载已经下载的 ISO 镜像](#挂载已经下载的-iso-镜像)
    - [运行安装程序](#运行安装程序)
    - [设置安装参数](#设置安装参数)
    - [安装所需要的 Latex 宏包](#安装所需要的-latex-宏包)
  - [安装并配置 ox-latex-chinese](#安装并配置-ox-latex-chinese)
    - [安装](#安装)
    - [配置](#配置)
  - [设置 LaTeX 片断预览功能](#设置-latex-片断预览功能)
  - [常见错误排查和解决](#常见错误排查和解决)
    - [缺少必要的 Latex 宏包](#缺少必要的-latex-宏包)

# README<a id="org4bedf8f"></a>

## 简介<a id="org4868744"></a>

ox-latex-chinese 是一个 org-mode 工具，它可以帮助 org-mode 中文用户简单快速的配置 "org->latex->pdf" 工作环境。

注意：这个工具只是让 中文 pdf **基本正确** 的生成，如果你需要生成 **完美** 的中文 pdf，就需要花时间深入的了解下面工具：

1.  TeX 系统，比如：TexLive
2.  Ctex 宏包以及其相关工具（实现中文 LaTeX 的主要方式）
3.  ox-latex.el (org-mode 的 Latex 导出模块)

![img](./snapshots/ox-latex-chinese.gif)

## 下载并安装 Texlive<a id="org8eb69c7"></a>

### 下载 Tex Live ISO 镜像<a id="org3a24156"></a>

TeX Live 支持 Linux，Windows 以及 MacOX 多种操作系统，安装方式多种多样，由于我这里网络不太稳定，所以我选择通过 Tex Live ISO 来安装 Tex Live （文件大小大约3G），

Tex Live 主站访问速度很慢，建议同学们使用国内镜像，许多 Linux 镜像站点都同时包含 CTAN。大家可以在<http://www.cnbeta.com/articles/194758.htm>
列出的镜像站点中寻找 “CTAN” 子目录，两个比较好用的 CTAN 镜像：

1.  中国科学技术大学镜像：<http://mirrors.ustc.edu.cn/CTAN/systems/texlive/Images/>
2.  清华大学镜像：<http://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/texlive/Images/>

### 挂载已经下载的 ISO 镜像<a id="orged03db2"></a>

1.  下载安装 [wincdemu](http://wincdemu.sysprogs.org/), winmount 或者 DAEMON Tools，这类工具可以将 ISO 文件挂载到一个盘符，比直接解压缩快速方便。
2.  将 ISO 镜像挂载到 “Z:\\”

### 运行安装程序<a id="orgb59c614"></a>

1.  打开 “Z” 盘。
2.  **完全安装** 请运行 “install-tl.bat”，这种方式比较省心，但很占空间。
3.  **定制安装** 请运行 “install-tl-advanced.bat” ，这种方式相对麻烦，但节省安装时间和硬盘空间。

注：安装的时候建议关闭杀毒软件。

### 设置安装参数<a id="orgd9b1707"></a>

运行安装程序后，会弹出一个窗口（比较丑陋）用于设置安装选项，在 “选择安装方案” 选项中选择 “scheme-small”，其它选项不变，然后开始安装（安装大概需要 5 分钟左右）。

![img](./snapshots/advanced-install.gif)

### 安装所需要的 Latex 宏包<a id="orga15637a"></a>

1.  第一种方式：使用 Tex Live 管理器图形界面安装

    ![img](./snapshots/install-latex-package-with-gui.gif)

    1.  运行 Tex Live 管理器： 开始 >程序 > Tex Live 2015 > Tex Live Manager
    2.  载入本地宏包仓库：tlmgr >载入其它仓库，在弹出的对话框中选择 “choose local directory”，载入本地仓库 “Z:”。
    3.  安装所需宏包： collection-langcjk, collection-langchinese, ctex, ctex-faq, bibtex8, environ, trimspaces, zhnumber, wrapfig, capt-of, latexmk, dvipng

2.  第二种方式：使用 tlmge 命令安装

    1.  运行 window CMD
    2.  设置 Latex 宏包仓库

            tlmgr option repository Z:
    3.  更新设置

            tlmgr update -all
    4.  安装所需宏包

            tlmgr install collection-langcjk collection-langchinese ctex ctex-faq bibtex8 environ trimspaces zhnumber wrapfig capt-of latexmk dvipng

## 安装并配置 ox-latex-chinese<a id="org38fe27a"></a>

### 安装<a id="org00ee0ba"></a>

1.  配置 melpa: <http://melpa.org/#/getting-started>
2.  M-x package-install RET ox-latex-chinese RET

### 配置<a id="org76861ec"></a>

    (require 'ox-latex-chinese)
    (oxlc/toggle-ox-latex-chinese t)

## 设置 LaTeX 片断预览功能<a id="orgc3a3115"></a>

1.  确保 emacs 可以显示 png 文件，具体参考：<ftp://ftp.gnu.org/gnu/emacs/windows/README>
2.  安装 [imagemagick](http://www.imagemagick.org/) 和 [ghostscript](http://ghostscript.com/)
3.  设置 emacs

        ;; (setq org-latex-create-formula-image-program 'dvipng)   ;不支持中文
        (setq org-latex-create-formula-image-program 'imagemagick) ;支持中文

## 常见错误排查和解决<a id="org621734b"></a>

### 缺少必要的 Latex 宏包<a id="org3eaa3c3"></a>

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
