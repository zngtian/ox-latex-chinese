;;; ox-latex-chinese.el --- An example org latex exporter configure for Chinese users

;; * Header
;; Copyright (c) 2015, Feng Shu

;; Author: Feng Shu <tumashu@163.com>
;; URL: https://github.com/tumashu/ox-latex-chinese
;; Version: 0.0.1
;; Package-Requires: ((emacs "24.4") (ebib "1.0") (chinese-pyim "0.1"))

;;; License:

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Commentary:

;; * README                                                             :README:
;; ** 下载并安装 Texlive
;; *** 下载 Tex Live ISO 镜像
;; TeX Live 支持 Linux，Windows 以及 MacOX 多种操作系统，安装方式多种多样，
;; 由于我这里网络不太稳定，所以我选择通过 Tex Live ISO 来安装 Tex Live （文件大小大约3G），

;; Tex Live 主站访问速度很慢，建议同学们使用国内镜像，许多 Linux 镜像站点都同时包含 CTAN。
;; 大家可以在 http://www.cnbeta.com/articles/194758.htm
;; 列出的镜像站点中寻找 “CTAN” 子目录，两个比较好用的 CTAN 镜像：

;; 1. 中国科学技术大学镜像：http://mirrors.ustc.edu.cn/CTAN/systems/texlive/Images/
;; 2. 清华大学镜像：http://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/texlive/Images/

;; *** 挂载已经下载的 ISO 镜像
;; 1. 下载安装 winmount 或者 DAEMON Tools，这两个工具可以将 ISO 文件挂载到一个盘符，比直接解压缩快速方便。
;; 2. 将 ISO 镜像挂载到 “Z:\”

;; *** 运行安装程序
;; 1. 打开 “Z” 盘。
;; 2. *完全安装* 请运行 “install-tl.bat”，这种方式比较省心，但很占空间。
;; 3. *定制安装* 请运行 “install-tl-advanced.bat” ，这种方式相对麻烦，但节省安装时间和硬盘空间。

;; 注：安装的时候建议关闭杀毒软件。

;; *** 设置安装参数
;; 运行安装程序后，会弹出一个窗口（比较丑陋）用于设置安装选项，在 “选择安装方案” 选项中选择 “scheme-small”，
;; 其它选项不变，然后开始安装（安装大概需要 5 分钟左右）。

;; [[./snapshots/advanced-install.gif]]

;; *** 安装所需要的 Latex 宏包

;; **** 第一种方式：使用 Tex Live 管理器图形界面安装

;; [[./snapshots/install-latex-package-with-gui.gif]]

;; 1. 运行 Tex Live 管理器： 开始 > 程序 > Tex Live 2015 > Tex Live Manager
;; 2. 载入本地宏包仓库：tlmgr > 载入其它仓库，在弹出的对话框中选择 “choose local directory”，载入本地仓库 “Z:”。
;; 3. 安装所需宏包： collection-langcjk, collection-langchinese, ctex, ctex-faq, bibtex8, environ, trimspaces, zhnumber, wrapfig, capt-of, latexmk


;; **** 第二种方式：使用 tlmge 命令安装

;; 1. 运行 window CMD
;; 2. 设置 Latex 宏包仓库
;;    #+BEGIN_EXAMPLE
;;    tlmgr option repository Z:
;;    #+END_EXAMPLE
;; 3. 更新设置
;;    #+BEGIN_EXAMPLE
;;    tlmgr update -all
;;    #+END_EXAMPLE
;; 4. 安装所需宏包
;;    #+BEGIN_EXAMPLE
;;    tlmgr install collection-langcjk collection-langchinese ctex ctex-faq bibtex8 environ trimspaces zhnumber wrapfig capt-of latexmk
;;    #+END_EXAMPLE

;; *** 安装所需要的字体
;; 将所需要的字体文件（ttf或者ttc文件）拷贝到 window 字体目录中就可以了。

;; 1. 文泉驿微米黑：http://wenq.org/wqy2/index.cgi?MicroHei

;; ** 安装并配置 ox-latex-chinese
;; *** 安装
;; 1. 配置 melpa: http://melpa.org/#/getting-started
;; 2. M-x package-install RET ox-latex-chinese RET

;; *** 配置
;; #+BEGIN_EXAMPLE
;; (require 'ox-latex-chinese)
;; (oxlc/toggle-ox-latex-chinese t)
;; #+END_EXAMPLE

;; ** 常见错误排查和解决
;; *** 缺少必要的 Latex 宏包
;; **** 表现形式
;;  1. message buffer中有类似输出
;;     #+BEGIN_EXAMPLE
;;     Processing LaTeX file ./export-org-file-to-pdf-with-ctex.tex...
;;     PDF file ./export-org-file-to-pdf-with-ctex.pdf wasn't produced
;;     #+END_EXAMPLE
;;  2. *Org PDF LaTeX Output* buffer 中有类似输出
;;     #+BEGIN_EXAMPLE
;;     ...

;;     (c:/texlive/2015/texmf-dist/tex/generic/oberdiek/ltxcmds.sty)
;;     (c:/texlive/2015/texmf-dist/tex/generic/oberdiek/kvsetkeys.sty
;;     (c:/texlive/2015/texmf-dist/tex/generic/oberdiek/infwarerr.sty)
;;     (c:/texlive/2015/texmf-dist/tex/generic/oberdiek/etexcmds.sty
;;     (c:/texlive/2015/texmf-dist/tex/generic/oberdiek/ifluatex.sty))))
;;     (c:/texlive/2015/texmf-dist/tex/generic/oberdiek/pdftexcmds.sty))
;;     (c:/texlive/2015/texmf-dist/tex/latex/tools/longtable.sty)

;;     ! LaTeX Error: File `wrapfig.sty' not found.

;;     Type X to quit or <RETURN> to proceed,
;;     or enter new name. (Default extension: sty)

;;     Enter file name:
;;     ! Emergency stop.
;;     <read *>

;;     l.8 \usepackage
;;                    {rotating}^^M
;;     No pages of output.

;;     ...
;;     #+END_EXAMPLE

;; **** 解决方式
;;  #+BEGIN_EXAMPLE
;;     ! LaTeX Error: File `wrapfig.sty' not found.
;;  #+END_EXAMPLE
;;  这个错误提示说明，你安装的 Tex Live 中没有包含 wrapfig.sty 这个文件，需要你安装，解决方式：

;;  1. 直接试着安装 “wrapfig” 宏包
;;     #+BEGIN_EXAMPLE
;;     tlmgr option repository Z:
;;     tlmgr update -all
;;     tlmgr install wrapfig
;;     #+END_EXAMPLE
;;  2. 如果没有找到 “wrapfig” 宏包，你需要找到哪个宏包包含 wrapfig.sty，一个简单的方式就是用 google 搜索 wrapfig.sty，一般会有相关的信息。



;;; Code:
;; * 代码                                                          :code:
;; #+BEGIN_SRC emacs-lisp
;; require
(require 'org)
(require 'ox)
(require 'ox-latex)

(defgroup org-export-latex-chinese nil
  "Options for exporting Org mode files to LaTeX."
  :group 'org-export-latex)

(defcustom oxlc/org-latex-coding-system 'utf-8
  "Please see the info of `org-latex-coding-system', when `oxlc/org-latex-chinese-enable'
set to t, its value will override the value of `org-latex-coding-system' before exporting
to latex."
  :group 'org-export-latex-chinese)

(defcustom oxlc/org-latex-commands
  '(("xelatex -interaction nonstopmode -output-directory %o %f"
     "bibtex %b"
     "xelatex -interaction nonstopmode -output-directory %o %f"
     "xelatex -interaction nonstopmode -output-directory %o %f")
    ("xelatex -interaction nonstopmode -output-directory %o %f"))
  "Please see the info of `org-latex-commands', when `oxlc/org-latex-chinese-enable'
set to t, its value will override the value of `org-latex-commands' before exporting
to latex."
  :group 'org-export-latex-chinese)

(defcustom oxlc/org-latex-default-class "ctexart"
  "Please see the info of `org-latex-default-class', when `oxlc/org-latex-chinese-enable'
set to t, its value will override the value of `org-latex-default-class' before exporting
to latex."
  :group 'org-export-latex-chinese)

(defcustom oxlc/org-latex-classes
  '(("ctexart"
     "\\documentclass[fontset=none,UTF8,a4paper,zihao=-4]{ctexart}"
     ("\\section{%s}" . "\\section*{%s}")
     ("\\subsection{%s}" . "\\subsection*{%s}")
     ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
     ("\\paragraph{%s}" . "\\paragraph*{%s}")
     ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
    ("ctexrep"
     "\\documentclass[fontset=none,UTF8,a4paper,zihao=-4]{ctexrep}"
     ("\\part{%s}" . "\\part*{%s}")
     ("\\chapter{%s}" . "\\chapter*{%s}")
     ("\\section{%s}" . "\\section*{%s}")
     ("\\subsection{%s}" . "\\subsection*{%s}")
     ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
    ("ctexbook"
     "\\documentclass[fontset=none,UTF8,a4paper,zihao=-4]{ctexbook}"
     ("\\part{%s}" . "\\part*{%s}")
     ("\\chapter{%s}" . "\\chapter*{%s}")
     ("\\section{%s}" . "\\section*{%s}")
     ("\\subsection{%s}" . "\\subsection*{%s}")
     ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
    ("beamer"
     "\\documentclass{beamer}
               \\usepackage[fontset=none,UTF8,a4paper,zihao=-4]{ctex}"
     org-beamer-sectioning))
  "Please see the info of `org-latex-classes', when `oxlc/org-latex-chinese-enable'
set to t, its value will override the value of `oxlc/org-latex-classes' before exporting
to latex."
  :group 'org-export-latex-chinese)

(defcustom oxlc/org-latex-default-packages-alist
  (remove '("normalem" "ulem" t)
          (remove '("T1" "fontenc" t)
                  (remove '("AUTO" "inputenc" t)
                          org-latex-default-packages-alist)))
  "Please see the info of `org-latex-default-packages-alist', when `oxlc/org-latex-chinese-enable'
set to t, its value will override the value of `org-latex-default-packages-alist' before exporting
to latex.

org 不建议自定义 org-latex-default-package-alist 变量，但 'inputenc' and 'fontenc'
两个宏包似乎和 xelatex 有冲突，调整！"
  :group 'org-export-latex-chinese)

(defcustom  oxlc/org-latex-packages-alist
  '("
%%% 默认使用的latex宏包 %%%
\\usepackage{tikz}
\\usepackage{CJKulem}
\\usepackage{graphicx}

%%% 设置中文字体 %%%
\\setCJKmainfont[ItalicFont={KaiTi_GB2312}]{SimSun}% 文鼎宋体和楷书
\\setCJKsansfont{WenQuanYi Micro Hei}% 文泉驿的黑体
\\setCJKmonofont{WenQuanYi Micro Hei}

%%% 设置页面边距 %%%
\\usepackage[top=2.54cm, bottom=2.54cm, left=3.17cm, right=3.17cm]{geometry} %")
  "Please see the info of `org-latex-packages-alist', when `oxlc/org-latex-chinese-enable'
set to t, its value will override the value of `org-latex-packages-alist' before exporting
to latex."
  :group 'org-export-latex-chinese)

;; latex公式预览, 调整latex预览时使用的header,默认使用ctexart类
(defcustom oxlc/org-format-latex-header
  (replace-regexp-in-string
   "\\\\documentclass{.*}"
   "\\\\documentclass[nofonts,UTF8]{ctexart}"
   org-format-latex-header)
  "Please see the info of `org-format-latex-header', when `oxlc/org-latex-chinese-enable'
set to t, its value will override the value of `org-format-latex-header' before exporting
to latex."
  :group 'org-export-latex-chinese)

(defvar oxlc/ox-latex-chinese-enable nil
  "判断是否开启 ox-latex-chinese.")

(defvar oxlc/overrided-variables nil
  "记录所有被 ox-latex-chinese 包强制覆盖得变量。")

(defun oxlc/toggle-ox-latex-chinese (&optional force-enable)
  "启用/禁用 ox-latex-chinese 包。"
  (interactive)
  (setq oxlc/ox-latex-chinese-enable
        (or force-enable (not oxlc/ox-latex-chinese-enable)))
  (if oxlc/ox-latex-chinese-enable
      (progn (message "已经启用 ox-latex-chinese！")
             (advice-add 'org-export-as :around #'oxlc/org-export-as)
             (advice-add 'org-latex-compile :around #'oxlc/org-latex-compile))
    (message "已经禁用 ox-latex-chinese！")
    (advice-remove 'org-export-as #'oxlc/org-export-as)
    (advice-remove 'org-latex-compile #'oxlc/org-latex-compile)))

(defun oxlc/get-override-value (variable)
  "返回 `variable' 对应的 ox-latex-chinese 变量的取值。"
  (push variable oxlc/overrided-variables)
  (symbol-value (intern (concat "oxlc/" (symbol-name variable)))))

(defun oxlc/org-export-as (orig-fun backend &optional subtreep
                                    visible-only body-only ext-plist)
  (if oxlc/ox-latex-chinese-enable
      (let ((org-latex-coding-system (oxlc/get-override-value 'org-latex-coding-system))
            (org-latex-commands (oxlc/get-override-value 'org-latex-commands))
            (org-latex-default-class (oxlc/get-override-value 'org-latex-default-class))
            (org-latex-classes (oxlc/get-override-value 'org-latex-classes))
            (org-latex-default-packages-alist (oxlc/get-override-value 'org-latex-default-packages-alist))
            (org-format-latex-header (oxlc/get-override-value 'org-format-latex-header))
            (org-latex-packages-alist (oxlc/get-override-value 'org-latex-packages-alist)))
        (message (concat "注意：被 ox-latex-chinese 包 *强制* 覆盖得变量有："
                         (mapconcat #'symbol-name (delete-dups oxlc/overrided-variables) ", ")
                         "."))
        (funcall orig-fun backend subtreep visible-only body-only ext-plist))
    (funcall orig-fun backend subtreep visible-only body-only ext-plist)))

(defun oxlc/org-latex-compile (orig-fun texfile &optional snippet)
  (if oxlc/ox-latex-chinese-enable
      (let ((org-latex-pdf-process
             (if snippet (car (cdr org-latex-commands))
               (car org-latex-commands))))
        (funcall orig-fun texfile snippet))
    (funcall orig-fun texfile snippet)))
;; #+END_SRC

;; * Footer
;; #+BEGIN_SRC emacs-lisp
(provide 'ox-latex-chinese)

;; Local Variables:
;; coding: utf-8-unix
;; End:

;;; ox-latex-chinese.el ends here
;; #+END_SRC
