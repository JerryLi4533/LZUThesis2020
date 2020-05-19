\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{LZUThesis2007}[2020/05/19 V2.0.0 Thesis for LZUer By yuhldr Use 2007 standard]
\LoadClass[12pt, a4paper, UTF8, openany,oneside]{ctexbook}

% 部分内容参考了https://github.com/suchot/LZUThesis2017，适配了2020最新的毕业论文要求

%============================ 一些章节的配置文件 =========%
%%
%% the chapter title format
%%
%正文结构，分别以“第一章”、“1”、“1.1”、“1.1.1”….等树层次格式依次标出。
%章的编号居中，字体为黑体，三号，加粗，居中，单倍行距，段前24磅，段后18磅，如“第一章”；
%节的编号置顶格，按顺序分层，如“1”，“1.1”，“1.1.1”层次，以少为宜，编号与标题之间空1个字符间隙，如“1.1 本科生资料使用”、“1.1.1 本科生数据分析”，字体依次为二级标题黑体，四号，顶左，单倍行距，段前24磅，段后6磅；
%三级标题黑体，小四号，首行缩进2个汉字符，单倍行距，段前12磅，段后6磅。各层次标题用阿拉伯数字连续编号，数字之间用小圆点“.”相隔。
%正文另起一行。正文：宋体，小四（英文用Times New Roman字体，12磅），两端对齐，段落首行左缩进2个汉字符，行间距为固定值20磅，段前段后0磅。
%
%\CTEXsetup[format+={\sffamily\bfseries\small}]{chapter}
\def\CTEX@chapter@nameformat{\bfseries\heiti\zihao{3}} % 应该是加粗（黑体加粗）
\def\CTEX@chapter@titleformat{\bfseries\heiti\zihao{3}} % 应该是加粗（黑体加粗）
\def\CTEX@chapter@beforeskip{24pt}
\def\CTEX@chapter@afterskip{18pt}
%\def\CTEX@chapter@titleformat{\bfseries\heiti\fontspec{Times New Roman}\zihao{3}}
%
%%
%% the section title format
%% 二级标题黑体，四号，顶左，单倍行距，段前24磅，段后6磅
\def\CTEX@section@format{\heiti\zihao{4}}
\def\CTEX@section@beforeskip{24pt}
\def\CTEX@section@afterskip{6pt}
%\def\CTEX@section@beforeskip{-3ex \@plus -1ex \@minus -.2ex}
%\def\CTEX@section@afterskip{1.0ex \@plus .2ex}
%%
%% the subsection title format
%% 三级标题黑体，小四号，首行缩进2个汉字符，单倍行距，段前12磅，段后6磅。
\def\CTEX@subsection@format{\heiti\zihao{-4}}
\def\CTEX@subsection@indent{2\ccwd}
\def\CTEX@subsection@beforeskip{12pt}
\def\CTEX@subsection@afterskip{6pt}
%%
%% the subsubsection title format
%%
\def\CTEX@subsubsection@format{\heiti\zihao{-4}}
\def\CTEX@subsubsection@indent{2\ccwd}
\def\CTEX@subsubsection@beforeskip{2ex \@plus 1ex \@minus .2ex}
\def\CTEX@subsubsection@afterskip{1.0ex \@plus .2ex}

\@ifclasslater{ctexbook}{2011/03/13}
{%
    \ctexset{
        contentsname={目\quad 录}
    }
}
{%
    \def\CTEX@contentsname{目\quad 录}
}%

\RequirePackage{textcomp}
\RequirePackage{gensymb}

%============================ 一些章节的配置文件 =========%

% 目录设置，图片

\RequirePackage{subfig}
% 修复上面的冲突
\RequirePackage[titles,subfigure]{tocloft}


%============================ 我自己用的一些小命令 =========%
% 
% 针对那些使用mendeley这一类软件的，直接复制（导出）过来的参考文献，可以在参考文献处点击跳转到文献所在网址
\providecommand \doibase [0]{http://dx.doi.org/}%

% 正文中有些下角标等公式，我们并不想让它斜体，公式不斜体:如 \eqrm{MoS_2}
\newcommand{\eqrm}[1]{
    $\rm #1 $
}

% 表格文字居中，其实就是相当于表格合并
% 用法 \tabincell{c}{物理//量//单位}
\newcommand{\tabincell}[2]{ \begin{tabular}{ #1 } #2 \end{tabular}}


% 物理单位埃，已经加了 $ $， 不要再放在$$环境里面
\newcommand{\angstrom}{
    $\mathring{\text{A}}$
}


%============================ 我自己用的一些小命令 =========%

\RequirePackage{textcomp}%摄氏度



%=======footnote
%尾注
%=======footnote
\RequirePackage[perpage, bottom]{footmisc}

%%=======page
%页面边距
%论文页边距一般要求：上边距3cm、下边距2.54cm,左右边距3.17cm,页眉页脚2.0cm。
%%=======page
\RequirePackage[top=3cm, bottom=2.54cm,outer=3.17cm, inner=3.17cm, headheight=2.0cm, footskip=2.0cm, heightrounded]{geometry}


%=======package
%代码风格设置
%=======package
\RequirePackage{listings}

\lstset{
 breaklines=true, %对过长的代码自动换行
 columns=fixed,       
 numbers=left,                                        % 在左侧显示行号
 numberstyle=\tiny\color{gray},                       % 设定行号格式
 frame=none,                                          % 不显示背景边框
 backgroundcolor=\color[RGB]{245,245,244},            % 设定背景颜色
 keywordstyle=\color[RGB]{40,40,255},                 % 设定关键字颜色
 numberstyle=\footnotesize\color{darkgray},           
 commentstyle=\it\color[RGB]{0,96,96},                % 设置代码注释的格式
 stringstyle=\rmfamily\slshape\color[RGB]{128,0,0},   % 设置字符串格式
 showstringspaces=false,                              % 不显示字符串中的空格
 language=tex,   
 alsolanguage=[ANSI]C, %可以添加很多个alsolanguage,如alsolanguage=matlab,alsolanguage=VHDL等
 alsolanguage=python,
 alsolanguage=java,
 alsolanguage=XML,
 alsolanguage=c++,
 alsolanguage=matlab,
}


%=======package
%数学宏包
%图像宏包
%颜色宏包
%字体宏包
%=======package
\RequirePackage{amsmath,amsfonts,amssymb,mathrsfs}
\RequirePackage{graphicx}
\graphicspath{{figures/}{figure/}{pictures/}
      {picture/}{pic/}{pics/}{image/}{images/}}
\RequirePackage[svgnames]{xcolor}
% 下面这个会导致花体，mathcal和mathscr完全相同，正常mathcal会花的轻一些
% \RequirePackage{mathptmx}% %Times New Roman字体
\RequirePackage{float}%控制图片位置 参数H
\RequirePackage[T1]{fontenc}

\RequirePackage{booktabs}
\RequirePackage{harpoon}

\RequirePackage{tablefootnote}
% 可以换页的表格
\RequirePackage{longtable}
% 连续参考文献横杠连接
\RequirePackage{cite}


%=======head and foot
%页眉页脚
%1.页眉。“兰州大学本科生毕业论文（设计）”字居左排，毕业论文（设计）题目居右排，字体为宋体，小五号；页眉与正文之间用下划线分隔。
%2.页码。页脚居中排，字体为宋体，五号。封面、目录不编排页码，中英文摘要页用罗马数字单独连续编号，引言、正文用阿拉伯数字连续编号，附录可不编排页码。
%=======head and foot
\RequirePackage{fancyhdr}  % Needed to define custom headers/footers
\RequirePackage{lastpage}  % Number of pages in the document
\RequirePackage{etoolbox}
\pagestyle{fancy}          % Enables the custom headers/footers


\fancypagestyle{frontmatterstyle}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}

    \fancyfoot{} % clear all footer fields
    \cfoot[C]{\thepage} %
    \renewcommand{\thepage}{\Roman{page}}
}
\appto\frontmatter{\pagestyle{frontmatterstyle}}

\DeclareOption{doublelines}{
    \def\LZU@doublelines {}
}
\ProcessOptions\relax

\fancypagestyle{mainmatterstyle}{
    \fancyhf{}
    \lhead{\zihao{-5}兰州大学本科生毕业论文}%
    \rhead{\zihao{-5}\@title}
    % Footers
    \fancyfoot{} % clear all footer fields
    \cfoot[C]{\thepage}
    \renewcommand\headrule{\hrule width \hsize height 2pt \kern 2pt \hrule width \hsize height 0.4pt}
}

\appto\mainmatter{\pagestyle{mainmatterstyle}}
\appto\mainmatter{\linespread{1.3889}\selectfont}   %行距
\fancypagestyle{plain}{
    \thispagestyle{mainmatterstyle}
}
\AtBeginDocument{\addtocontents{toc}{\protect\thispagestyle{frontmatterstyle}}}


%=======format
%标题样式
%=======format


% “目录”两字间空1个汉字符间隙，三号字，黑体，加粗，居中，单倍行距，段前24磅，段后18磅。
% 目录下方为章、节、条、款及其起始页码，章、节、条、款层次代号可以用阿拉伯数字或汉字。目录中一般只出现三级标题，
% 一级标题为宋体，四号字, 行距20磅, 段前6磅，段后0磅，两端对齐,页码右对齐，
% 二级、三级标题为宋体，小四号字,行距20磅, 段前6磅，段后0磅，两端对齐,页码右对齐,左缩进2个汉字符，序号与标题名间空1个字符宽度。


\usepackage[font=small]{caption}

\RequirePackage[titles]{tocloft}
\renewcommand\cftchapdotsep{0.5}                %虚线间隔
\renewcommand\cftdotsep{0.5}                    %虚线间隔
\renewcommand{\cftchapafterpnum}{\vspace{6pt}} %章节间隔 ，节前6磅
\setlength{\cftbeforesecskip}{6pt}              %章节间隔 ，节前6磅
\renewcommand\cftchapfont{\zihao{4}\songti}  
\renewcommand\cftsecfont{\zihao{-4} \songti}
\renewcommand\cftsubsecfont{\zihao{-4} \songti}
\setlength\cftbeforetoctitleskip{24pt}
\setlength\cftaftertoctitleskip{18pt}


%%=======information
%（一）封面
% 1. 毕业论文（设计）题目。简明扼要，核心内容明确。中文题目一般不超过25个字，字体为宋体，三号；英文题目一般不超过150个字母，字体为Times New Roman，三号。根据论文内容，可以加副标题。
% 2.学生姓名、指导教师、学院、专业、年级字体为宋体，三号。
%
%%=======information
\newtoks\advisor
\newtoks\college
\newtoks\major
\newtoks\grade
\newtoks\titlextra %标题多余一行时添加
%=======english title
\newtoks\entitle
\newtoks\entitletra %标题多余一行时添加
%%=======statement
%标题页
%需要添加循环函数，判定多于一行的情况
%%=======statement

\RequirePackage{array}
\def\LZU@underline[#1]#2{%
    \underline{\hbox to #1{\hfill#2\hfill}}}
\def\LZUunderline{\@ifnextchar[\LZU@underline\underline}

\RequirePackage{makecell}
%\RequirePackage{pgffor}
\RequirePackage{forloop}
\RequirePackage{xstring}
\renewcommand\maketitle{%
    \cleardoublepage
    \thispagestyle{empty}
    \begin{center}
        \includegraphics[width=6.27cm]{lzu.png}\\
        \vspace{21.8pt}

        {\fontsize{28bp}{0pt}\ziju{1}\bfseries\heiti{毕业论文\\}}% 封面这几个字，应该是加粗（雅黑加粗）
        \vspace{21.8pt}
        {\zihao{4} \heiti（本\quad 科\quad 生）}

        \vspace{21.8pt}
        \par
        \zihao{4}
        \def\tabcolsep{6pt}
        \expandarg
        \newcounter{title_str_number}
        \vspace*{60pt}

        \begin{tabular}{ll}
            \bfseries\songti \zihao{4} 论文题目（中文）% “论文题目（中文）”这几个字，应该是加粗（宋体加粗）

            % 论文题目用三号字，宋体，加粗，其他信息用小三号字，宋体，加粗，居中。
            \forloop{title_str_number}{1}{\value{title_str_number}<6}{%
                \StrFindGroup{\@title}{\value{title_str_number}}[\mygroup]%
                \IfStrEq{\mygroup}{}{}{%
                    & {\StrFindGroup{\@title}{\value{title_str_number}}[\mygroup]\LZUunderline[320pt]{ \bfseries\songti \zihao{3}\mygroup}}\\[0.40cm]%
                }%
            }%
            \bfseries\songti  \zihao{4} 论文题目（英文）% “论文题目（英文）”这几个字，应该是加粗（宋体加粗）
            \forloop{title_str_number}{1}{\value{title_str_number}<6}{%
                \StrFindGroup{\the\entitle}{\value{title_str_number}}[\mygroup]%
                \IfStrEq{\mygroup}{}{}{%
                    & {\StrFindGroup{\the\entitle}{\value{title_str_number}}[\mygroup]\LZUunderline[320pt]{\zihao{3}\bfseries\mygroup}}\\[0.40cm]%
                }%
            }%
            % “学生姓名等、指导教师、……”这几个字，应该是加粗（宋体加粗）
            {\bfseries\songti \zihao{4}{学\hfill 生\hfill 姓\hfill 名}} &
            {\LZUunderline[320pt]{ \bfseries\songti \zihao{-3}\@author}}\\[0.40cm]
            {\bfseries\songti \zihao{4}{导\hfill 师\hfill 姓\hfill 名\hfill 、\hfill 职\hfill 称}} &
            {\LZUunderline[320pt]{ \bfseries\songti \zihao{-3}  \the\advisor}} \\[0.40cm]
            {\bfseries\songti \zihao{4}{学\hfill 生\hfill 所\hfill 属\hfill 学\hfill 院}} &
            {\LZUunderline[320pt]{ \bfseries\songti \zihao{-3}\the\college}} \\[0.40cm]
            {\bfseries\songti \zihao{4} {专\hfill 业}} &
            {\LZUunderline[320pt]{ \bfseries\songti \zihao{-3} \the\major}}\\[0.40cm]
            {\bfseries\songti \zihao{4}{年\hfill 级}} &
            {\LZUunderline[320pt]{ \bfseries\songti \zihao{-3}  \the\grade}}\\[0.40cm]
        \end{tabular}

        \par
        \vspace{120pt}
        {\ziju{0.3}\zihao{-4} \heiti{兰州大学教务处}}% “兰州大学教务处”这几个字，应该是雅黑
    \end{center}
    \clearpage
}



\newcommand\makestatement{
    \newcommand\fifth{0.2\textwidth}
    \newcommand\middlespace{0.08\textwidth}

    \thispagestyle{empty}
%\cleardoublepage
    \baselineskip 22.5pt
    \parskip 0pt

    \begin{center}
        {\bfseries\songti\zihao{3}{诚信责任书}} % “诚信责任书”这几个字，应该是加粗（宋体加粗）
    \end{center}

    本人郑重声明：本人所呈交的毕业论文（设计），是在导师的指导下独立进行研究所取得的成果。毕业论文（设计）中凡引用他人已经发表或未发表的成果、数据、观点等，均已明确注明出处。除文中已经注明引用的内容外，不包含任何其他个人或集体已经发表或在网上发表的论文。

    本声明的法律责任由本人承担。


    \vskip1.5cm

    \begin{center}
        \begin{tabular*}{\textwidth}{rm{\fifth}lm{\fifth} cm{\fifth}rp{\fifth}lm{\fifth}}
            论\hfill 文\hfill 作\hfill 者\hfill 签\hfill 名 ：&\LZUunderline[\fifth]{} & \hspace{\middlespace} & 日\hfill 期：&\LZUunderline[\fifth]{}
        \end{tabular*}
    \end{center}

    \vskip2.0cm

    \begin{center}
        {\bfseries\songti\zihao{3}{关于毕业论文（设计）使用授权的声明}}% “关于毕业论文（设计）使用授权的声明”这几个字，应该是加粗（宋体加粗）
    \end{center}

    本人在导师指导下所完成的论文及相关的职务作品，知识产权归属兰州大学。本人完全了解兰州大学有关保存、使用毕业论文（设计）的规定，同意学校保存或向国家有关部门或机构送交论文的纸质版和电子版，允许论文被查阅和借阅；本人授权兰州大学可以将本毕业论文（设计）的全部或部分内容编入有关数据库进行检索，可以采用任何复制手段保存和汇编本毕业论文（设计）。本人离校后发表、使用毕业论文（设计）或与该毕业论文（设计）直接相关的学术论文或成果时，第一署名单位仍然为兰州大学。

    本毕业论文（设计）研究内容：

    $\square$ 可以公开

    $\square$ 不宜公开，已在学位办公室办理保密申请，解密后适用本授权书。

    （请在以上选项内选择其中一项打“$\surd$”）

    \vskip2cm
    \begin{center}
        \begin{tabular*}{\textwidth}{rlcrl}
            论文作者签名 ：&\LZUunderline[\fifth]{} & \hspace{\middlespace} &  导师签名 ：&\LZUunderline[\fifth]{} \\
            \quad\\
            日\qquad \qquad 期：&\LZUunderline[\fifth]{} & \hspace{\middlespace} & 日\qquad 期：&\LZUunderline[\fifth]{}
        \end{tabular*}
    \end{center}
    \clearpage
}



%=======abstract
%摘要页
%
%=======abstract

% 2.中英文关键词。毕业论文（设计）中应列出3～8个关键词，关键词与摘要之间空1行，置于摘要之后。中文关键词字体为宋体，小四号，加粗置顶格；英文关键词所述含义与中文关键词须一致。“关键词”为“Key words”，字体为Times New Roman，小四号，加粗，置顶格。

% 中文摘要以300-400字为宜。毕业论文（设计）题目字体为宋体，二号，加粗，段前24磅，段后18磅；“中文摘要”居中，字体为黑体，三号；摘要正文字体为宋体，小四号。行间距为固定值20磅。
\newcommand{\ZhAbstract}[2]{%
    \clearpage
    \phantomsection
    \addcontentsline{toc}{chapter}{中文摘要}
    \thispagestyle{frontmatterstyle}
    \begin{center}%
        \setlength{\parskip}{24pt}
        \begin{minipage}{0.8\textwidth}
            \linespread{1.3889}
            \centering
            % 中文摘要标题，应该是加粗（黑体加粗）
            \zihao{3}\bfseries\heiti \noindent\@title\the\titlextra 
        \end{minipage}
    \end{center}%
    \begin{center}%
        \linespread{1}
        \setlength{\parskip}{18pt}
        \zihao{3}\bfseries\heiti   中文摘要
    \end{center}%
    %行距20磅 http://blog.sina.com.cn/s/blog_5e16f1770100ly96.html
    \setlength{\baselineskip}{20pt} 
    \selectfont
    \setlength{\parskip}{0pt}
    \vspace{10pt}
    \par #1\\%
    \vbox{}\\
    % 关键词这几个字，应该是加粗（宋体加粗）
    {\bfseries\songti 关键词：} #2
}

% 英文摘要实际单词在300个左右，应与中文摘要内容一致。毕业论文（设计）英文题目字体为Times New Roman，二号，段前24磅，段后18磅；“英文摘要”为“Abstract”，字体为Arial，三号，加粗居中；英文摘要正文每段开头空4个字符间隙，字体为Times New Roman，小四号。行间距为固定值20磅。

\newcommand{\EnAbstract}[2]{%
    \clearpage
    \phantomsection
    \addcontentsline{toc}{chapter}{英文摘要}
    \thispagestyle{frontmatterstyle}
    \begin{center}%
        \setlength{\parskip}{24pt}
        \begin{minipage}{0.8\textwidth}
            \linespread{1}
            \selectfont
            \centering
            \zihao{3} \bfseries \noindent \expandafter\MakeUppercase\expandafter{\the\entitle\ \the\entitletra}%
        \end{minipage}
    \end{center}%
    \begin{center}%
        \linespread{1}
        \selectfont
        \setlength{\parskip}{18pt}
        \zihao{3}\bfseries Abstract %Linux没有这个字体，需要自己安装，或者自定义命令
    \end{center}%
    \setlength{\parskip}{0pt}
    \setlength{\baselineskip}{20pt} %行距20磅
    \selectfont
    \vspace{11pt}
    \par #1\\%
    \vbox{}\\
    {\bfseries Key Words:} #2
}


%---------------------------
%超链接
%---------------------------
\RequirePackage[unicode,psdextra]{hyperref} % Required for hyperlinks
\hypersetup{hidelinks,breaklinks=true,bookmarksopen=false}
%自动写入pdf信息
\AtBeginDocument{
    \hypersetup{
        pdftitle = {\@title},
        pdfauthor = {\@author},
        pdfsubject = {兰州大学本科毕业论文}
    }
}


\RequirePackage[nameinlink]{cleveref}
\crefformat{equation}{#2式(#1)#3}
\crefformat{figure}{#2图#1#3}
\crefformat{table}{#2表#1#3}
\crefformat{chapter}{#2第\zhnumber{#1}章#3}
\crefformat{section}{#2#1节#3}
\crefformat{subsection}{#2#1小节#3}
\crefformat{subsubsection}{#2#1小节#3}



%\AtBeginDocument{\addtocontents{toc}{\protect\thispagestyle{frontmatterstyle}}}

%item style
\usepackage{enumitem}
\setenumerate[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt}
\setitemize[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=0pt}
\setdescription{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt}




%======%math theorem
% 英文名称改为汉字
%
%======%math theorem
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}
\theorembodyfont{\rmfamily\songti}
\theoremheaderfont{\rmfamily\heiti}
\theoremsymbol{\ensuremath{\square}}
\newtheorem*{proof}{证明}
\theoremstyle{plain}
\theoremsymbol{}
\qedsymbol{\ensuremath{\square}}
\newtheorem{assumption}{假设}[chapter]
\newtheorem{definition}{定义}[chapter]
\newtheorem{proposition}{命题}[chapter]
\newtheorem{lemma}{引理}[chapter]
\newtheorem{theorem}{定理}[chapter]
\newtheorem{axiom}{公理}[chapter]
\newtheorem{corollary}{推论}[chapter]
\newtheorem{example}{例}[chapter]
\newtheorem{conjecture}{猜想}[chapter]

\crefname{theorem}{定理}{定理}
\crefname{assumption}{假设}{假设}
\crefname{definition}{定义}{定义}
\crefname{proposition}{命题}{命题}
\crefname{lemma}{引理}{引理}
\crefname{theorem}{定理}{定理}
\crefname{axiom}{公理}{公理}
\crefname{corollary}{推论}{推论}
\crefname{example}{例}{例}
\crefname{remark}{注释}{注释}
\crefname{conjecture}{猜想}{猜想}



%---------------------------
%程序伪代码实现
%---------------------------
\RequirePackage{algorithm}
\RequirePackage{algorithmic}
\floatname{algorithm}{算法}  
\renewcommand{\algorithmicrequire}{\bfseries{输入:}}  
\renewcommand{\algorithmicensure}{\bfseries{输出:}}  
  
%改变图表的编号格式

% 图：图名置于图的下方，五号字，宋体，居中（英文用Times New Roman体10.5磅），单倍行距，段前6磅，段后12磅，图序与图名之间空1个汉字符。
% 表：表名置于表的上方，五号字，宋体，居中（英文用Times New Roman体10.5磅），单倍行距，段前6磅，段后6磅，表序与表名之间空1个汉字符。 
% 图和表下方的注释为五号字，宋体，居左（英文用Times New Roman体10.5磅），单倍行距。

\renewcommand{\thefigure}{\thechapter.\@arabic \c@figure}
\renewcommand{\thetable}{\thechapter.\@arabic \c@table} 
% 图序与图名之间空1个汉字符。  
\RequirePackage[labelsep = quad]{caption}
% 这应该图和表单独设置，但是我都设置了6，你可以自己在插入表格时单独设定图的要求
% 参考如下： https://www.latexstudio.net/archives/8652.html
\setlength{\abovecaptionskip}{6pt}
\setlength{\belowcaptionskip}{6pt}


%%=======%
%参考文献
%=======%
\newtoks\bibdatabase
\RequirePackage{ }
\newcommand{\printbib}{
    \zihao{5}
    \bibliographystyle{bib/lzubib}
    \cleardoublepage 
    \phantomsection
    \addcontentsline{toc}{chapter}{参考文献}
    \bibliography{\the \bibdatabase}
}



%=======appendix
%附录页和感谢页
%
%=======appendix

% 附录中的插图、表格、公式、参考文献等的序号需与正文区分，另行编制，如编为“图1”、“表1”、“式（1）”、“文献[1]”等。“附录”两字间空2个汉字间隙，三号字，黑体，加粗，居中，单倍行距，段前24磅，段后18磅。附录的内容为宋体，五号（英文用Times New Roman体，10.5磅），行间距为固定值20磅。
\newcommand{\Appendix}{%
    \cleardoublepage 
    \phantomsection
    \setcounter{section}{0}
    \setcounter{chapter}{1}
    \renewcommand{\thechapter}{A}%
    \addcontentsline{toc}{chapter}{\texorpdfstring{附 \qquad 录}{附录}}
    \chapter*{附 \qquad 录}
    \zihao{5}
}


% “致谢”两字间空2个字符间隙，字体为黑体，三号字，加粗居中。单倍行距，段前24磅，段后18磅。正文部分首行缩进两个汉字符，小四号字，仿宋，行距20磅。

\newcommand{\Thanks}{%
    \cleardoublepage 
    \phantomsection
    \setcounter{section}{0}
    \setcounter{chapter}{1}
    \renewcommand{\thechapter}{A}%
    \addcontentsline{toc}{chapter}{\texorpdfstring{致\qquad 谢}{致谢}}
    \chapter*{致\qquad 谢}
    \zihao{-4}\fangsong
}



%---------------------------
%论文成绩
%---------------------------
\RequirePackage{tabularx}
\newtoks \supervisorcomment
\newtoks \recommendedgrade
\newtoks \supervisorsignature
\newtoks \committeecomment
\newtoks \finalgrade
\newcommand{\Grade}{

\cleardoublepage 
\phantomsection
\setcounter{section}{0}
\setcounter{chapter}{1}
\addcontentsline{toc}{chapter}{论文（设计）成绩}

\begin{center}
    \zihao{-3}\bfseries\songti  % 成绩这一页整体设置，应该是加粗（宋体加粗）
    \begin{tabularx}{\textwidth}{|X|}
        \multicolumn{1}{c}{
            \zihao{3}\heiti\mdseries {论文（设计）成绩表}
        } \\
        \hline
        \centerline{%
            \songti 
            \begin{minipage}[t][10cm][t]{0.92\textwidth}
                \setlength\parindent{0pt}
                 \the \supervisorcomment   
            \end{minipage}
        }\\
        \zihao{4}{建议成绩}\LZUunderline[80pt]{\the \recommendedgrade}
        \hfill 
        指导教师（签字）\LZUunderline[80pt]{
            \the \supervisorsignature
        }\\
        \hline
        答辩小组意见\\
        \centerline{%
            \begin{minipage}[t][2cm][t]{0.92\textwidth}
                \setlength\parindent{\ccwd}
                \zihao{-4} \the\committeecomment
            \end{minipage}
        }
        \hfill 答辩委员会负责人（签字）\underline{\hspace{80pt}}\\
        \hline
        \\[2.3cm]
        成绩\LZUunderline[80pt]{\the \finalgrade}\hfill 学院（盖章）\underline{\hspace{80pt}}\\
        \hfill{\zihao{-4}年\hspace{20pt}月\hspace{20pt}日}\\
        \hline
    \end{tabularx}
\end{center}
}




\endinput
%%
%% End of file `LZUThesis.cls'.