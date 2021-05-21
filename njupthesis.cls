\ProvidesClass{njupthesis}

\LoadClass[12pt, openany, twoside]{book}

\RequirePackage{ifxetex}
\RequireXeTeX

\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}
\RequirePackage{graphicx}
\RequirePackage[font={doublespacing, small}, labelsep=space, skip=6pt]{caption}

\RequirePackage{array}
\RequirePackage{setspace}
\RequirePackage{multirow}
\RequirePackage[tbtags]{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{lmodern}
\RequirePackage{mathspec}
\RequirePackage{fontspec}
\RequirePackage{bm}

\RequirePackage{xeCJK}
\RequirePackage{ifplatform}

\ifwindows
  \setallmainfonts{Times New Roman}
  \setCJKmainfont[AutoFakeBold=true]{SimSun}
  \newCJKfontfamily{\heiti}{SimHei}
  \newCJKfontfamily{\kaiti}{SimKai}
\else
\ifmacosx
  \setallmainfonts{Times New Roman}
  \setCJKmainfont[AutoFakeBold=true]{Songti SC}
  \newCJKfontfamily{\heiti}{Heiti SC}
  \newCJKfontfamily{\kaiti}{Kaiti SC}
\else
  \setCJKmainfont[AutoFakeBold=true]{simsun.ttc}
  \newCJKfontfamily{\heiti}{simhei.ttf}
  \newCJKfontfamily{\kaiti}{simkai.ttf}
  \setallmainfonts[
    BoldFont=timesbd.ttf,
    ItalicFont=timesi.ttf,
    BoldItalicFont=timesbi.ttf,
  ]{times.ttf}
\fi
\fi

\RequirePackage{zhnumber}
\RequirePackage{pifont}

\RequirePackage[hyphens]{url}
\RequirePackage[hyperfootnotes=false,
    bookmarksnumbered,
    bookmarksdepth=4
]{hyperref}
\hypersetup{
  colorlinks=true,
  citecolor=black,
  linkcolor=black,
  urlcolor=black
}



%\RequirePackage{standalone}
\RequirePackage{indentfirst}
\RequirePackage{calc}
\RequirePackage{float}
\RequirePackage{fancyvrb}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{setspace}
\RequirePackage{cite}
\RequirePackage[normalem]{ulem}
\RequirePackage{enumitem}
\RequirePackage{algorithm2e}
\RequirePackage{etoolbox}
\RequirePackage{newfloat}
\RequirePackage[resetlabels]{multibib}
\RequirePackage[nottoc]{tocbibind}
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage{everypage}
\RequirePackage{ifoddpage}
\RequirePackage{booktabs}

\newcommand{\tabincell}[2]{\begin{tabular}{@{}#1@{}}#2\end{tabular}}

\let\algorithm\relax
\let\endalgorithm\relax
\expandafter\let\csname algorithm*\endcsname\relax
\expandafter\let\csname endalgorithm*\endcsname\relax
\let\listofalgorithms\relax

% Define the new algorithm environment
\DeclareFloatingEnvironment{algorithm}

\makeatletter
\renewcommand{\@endalgoln}{\@endalgocfline\hfill\strut\par}
\renewcommand{\;}{\ifmmode
  \@mathsemicolon
\else
  \@endalgoln
\fi
}
% Definition for the style ruled
% First add the rules enclosing the captiom
\DeclareCaptionFormat{algrule}{%
  {\@hangfrom{#1#2}%
     \doublespacing
     \small
     \advance\caption@parindent\hangindent
     \advance\caption@hangindent\hangindent
     \caption@@par#3\par}%
}

% Apply the new format to the algorithm environment
\captionsetup[algorithm]{format=algrule}

\makeatletter

\renewcommand{\algorithmname}{算法}
\renewcommand{\thealgorithm}{\arabic{chapter}-\arabic{algorithm}}
\captionsetup[algorithm]{aboveskip=6pt}
\AtBeginEnvironment{algorithm}{\vspace{6pt}}

\graphicspath{{./pic/}}

\RequirePackage[titles, subfigure]{tocloft}
\RequirePackage{subfigure}


\urlstyle{rm}
\raggedbottom

\renewcommand{\contentsname}{目\chinesespace\chinesespace 录}
\renewcommand{\bibname}{参考文献}
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}


\RequirePackage[a4paper,
  inner=3cm, outer=3cm, top=2cm, bottom=3.75cm,
  bindingoffset=0cm]{geometry}

\setlength{\headheight}{1.5cm}
\setlength{\footskip}{20pt}

\pagestyle{fancy}
\linespread{1.391}
\setlength\parindent{24pt}
\titlespacing{\chapter}{0pt}{-18pt}{15pt}
\titlespacing{\section}{0pt}{18pt}{6pt}
\titlespacing{\subsection}{0pt}{12pt}{6pt}
\titlespacing{\subsubsection}{0pt}{12pt}{6pt}

\renewcommand\thechapter{第\zhnumber{\arabic{chapter}}章}
\renewcommand\thesection{\arabic{chapter}.\arabic{section}}

\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}
\renewcommand{\thetable}{\arabic{chapter}.\arabic{table}}
\renewcommand{\thefigure}{\arabic{chapter}.\arabic{figure}}

\captionsetup{format=hang}
\captionsetup{width=\textwidth - 42pt}
\captionsetup[figure]{aboveskip=6pt,belowskip=0pt}
\captionsetup[table]{belowskip=6pt}
\setlength{\extrarowheight}{5pt}
\setlength{\subfigcapskip}{0pt}
\setlength{\intextsep}{9pt}

\makeatletter
\AtBeginEnvironment{figure}{
  \def\@floatboxreset{\centering}
}
\makeatother

\makeatletter
\AtBeginEnvironment{table}{
  \def\@floatboxreset{\centering}
}
\makeatother
\AtBeginEnvironment{tabular}{\small}

\makeatletter
\renewcommand{\p@subfigure}{\arabic{chapter}-\arabic{figure}}
\makeatother

\newcommand{\chinesecolon}{\char"FF1A}
\newcommand{\chinesespace}{\char"3000}
\newcommand{\chineseperiod}{\char"3002}
\newcommand{\chinesequestion}{\char"FF1F}
\newcommand{\chineseexclamation}{\char"FF01}
\newcommand{\chinesecomma}{\char"FF0C}
\newcommand{\chinesesemicolon}{\char"FF1B}
\newcommand{\chineseleftparenthesis}{\char"FF08}
\newcommand{\chineserightparenthesis}{\char"FF09}

\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}

\titleformat{\chapter}[block]
  {\centering\fontsize{15pt}{15pt}\selectfont\heiti\thispagestyle{fancy}}{\thechapter}{2pc}{}

\titleformat{\section}[block]
  {\fontsize{14pt}{14pt}\selectfont\heiti}
  {\thesection}{7pt}{}

\titleformat{\subsection}[block]
  {\fontsize{14pt}{14pt}\selectfont\heiti}
  {\thesubsection}{7pt}{}

\titleformat{\subsubsection}[block]
  {\fontsize{12pt}{12pt}\selectfont\heiti}
  {\thesubsubsection}{6pt}{}

\RequirePackage[hang, perpage]{footmisc}
\addtolength{\footnotesep}{0pt}
\setlength{\footnotemargin}{1.5pt}

\renewcommand{\footnotesize}{\fontsize{9pt}{10.8pt}\selectfont}
\renewcommand{\small}{\fontsize{10.5pt}{12.6pt}\selectfont}
\renewcommand\footnotelayout{\fontsize{9}{11.7}\selectfont}

\renewcommand{\thefootnote}{\ifcase\value{footnote}\or\ding{172}\or
\ding{173}\or\ding{174}\or\ding{175}\or\ding{176}\or\ding{177}\or
\ding{178}\or\ding{179}\or\ding{180\or\ding{181}}\fi}

\renewcommand{\footnoterule}{\vfill\noindent\vspace{0.9mm}\hspace{27pt}\rule{5.05cm}{0.02cm}\vspace*{2.6pt}}

\makeatletter
\def\@makefntext #1{
  \ifFN@hangfoot
      \bgroup \setbox \@tempboxa \hbox {
          \ifdim
        \footnotemargin >0pt \hb@xt@
                \footnotemargin {\hbox { \normalfont \@thefnmark}\hss }
            \else
              \hbox { \normalfont \@thefnmark}
      \fi
    }
        \leftmargin \wd \@tempboxa
        \rightmargin \z@ \linewidth \columnwidth
          \advance \linewidth -\leftmargin\parshape \@ne
    \leftmargin \linewidth \footnotesize \@setpar {{\@@par }}
    \leavevmode \llap {\box \@tempboxa }\parskip
        \hangfootparskip \relax \parindent
    \hangfootparindent \relax
        \else
          \parindent 1em \noindent
            \ifdim
                \footnotemargin >\z@ \hb@xt@
                \footnotemargin {\hss \hbox { \normalfont \@thefnmark} }
            \else
        \ifdim \footnotemargin =\z@
                    \llap {\hbox { \normalfont \@thefnmark} }
                \else
          \llap {\hb@xt@ -\footnotemargin {\hbox { \normalfont \@thefnmark} \hss }}
        \fi
            \fi
    \fi
        \footnotelayout #1\ifFN@hangfoot \par \egroup
  \fi
}
\makeatother

\newcounter{pseudopage}
\setcounter{pseudopage}{0}
\AddEverypageHook{\stepcounter{pseudopage}}

\newcommand\blankpage{%
  \newpage
  \null
  \thispagestyle{empty}%
  \addtocounter{pseudopage}{-1}%
  \newpage
}

\newenvironment{chineseabstract}{
    \pdfbookmark{中文摘要}{chineseabstract}
    \chapter*{摘\chinesespace\chinesespace 要}
    \thispagestyle{empty}
}

\newcommand{\chinesekeyword}[1]{
  \vspace{\baselineskip}
  \noindent
    \begin{minipage}[t]{48pt}
      \noindent\textbf{关键词\chinesecolon}
    \end{minipage}
    \begin{minipage}[t]{\linewidth - 48pt}
      #1
    \end{minipage}
}

\newenvironment{englishabstract}{
  \pdfbookmark{英文摘要}{englishabstract}
  \chapter*{\bfseries ABSTRACT}
    \thispagestyle{empty}
}

\newcommand{\englishkeyword}[1]{
  \vspace{\baselineskip}
  \noindent\begin{minipage}[t]{2.1cm}
      \noindent\textbf{Keywords:}
    \end{minipage}
    \begin{minipage}[t]{
      \linewidth - 2.1cm}
        #1
    \end{minipage}
}

\AddEverypageHook{\addtocontents{toc}{
  \protect\cftsetpnumwidth{\widthof{\thepage}-1pt}
  \protect\thispagestyle{empty}
}}

\AddEverypageHook{\addtocontents{lof}{
  \protect\cftsetpnumwidth{\widthof{\thepage}-1pt}
}}

\AddEverypageHook{\addtocontents{lot}{
  \protect\cftsetpnumwidth{\widthof{\thepage}-1pt}
}}

\tocloftpagestyle{fancy}
\renewcommand{\cftchappagefont}{\normalfont}
\renewcommand\cftchapleader{\cftdotfill{\cftdotsep}}

\renewcommand{\cftdotsep}{0.4}

\setlength{\cftbeforetoctitleskip}{0pt}
\setlength{\cftaftertoctitleskip}{18pt}
\setlength{\cftbeforechapskip}{5pt}

\addtolength{\cftchapnumwidth}{25pt}

\cftsetindents{chapter}{0pt}{60pt}
\cftsetindents{section}{21pt}{22pt}
\cftsetindents{subsection}{44pt}{31pt}
\cftsetindents{subsubsection}{76pt}{41pt}

\renewcommand{\cfttoctitlefont}{\fontsize{16pt}{16pt}\selectfont\heiti}
\renewcommand{\cftchapfont}{\fontsize{14pt}{14pt}}

\newcommand{\chinesedegreename}{本科}
\newcommand{\chinesebooktitle}{本科生毕业设计（论文）}
\newcommand{\englishbooktitle}{Bachelor Thesis}
\newcommand{\thetitle}{}
\newcommand{\theauthor}{}
\newcommand{\theschool}{}
\newcommand{\themajor}{}
\newcommand{\theadvisor}{}
\newcommand{\thestudentclass}{}
\newcommand{\thestudentid}{}
\newcommand{\thegraduateyear}{}
\newcommand{\thebegindate}{}
\newcommand{\thefinishdate}{}

\renewcommand{\title}[1]{
  \renewcommand{\thetitle}{#1}
}

\renewcommand{\author}[1]{
  \renewcommand{\theauthor}{#1}
}

\newcommand{\major}[1]{
  \renewcommand{\themajor}{#1}
}

\newcommand{\school}[1]{
  \renewcommand{\theschool}{#1}
}

\newcommand{\advisor}[1]{
  \renewcommand{\theadvisor}{#1}
}

\newcommand{\studentclass}[1]{
  \renewcommand{\thestudentclass}{#1}
}

\newcommand{\studentid}[1]{
  \renewcommand{\thestudentid}{#1}
}

\newcommand{\graduateyear}[1]{
  \renewcommand{\thegraduateyear}{#1}
}

\newcommand{\begindate}[1]{
  \renewcommand{\thebegindate}{#1}
}

\newcommand{\finishdate}[1]{
  \renewcommand{\thefinishdate}{#1}
}


\DeclareOption{bachelor}{
  \renewcommand{\chinesedegreename}{本科}
  \renewcommand{\chinesebooktitle}{本科生毕业设计（论文）}
  \renewcommand{\englishbooktitle}{Bachelor Thesis}
}


\newcommand{\makecover}{
\thispagestyle{empty}
\setlength{\extrarowheight}{36pt}
\begin{center}
  \fontsize{36pt}{36pt}\selectfont{\heiti 南京邮电大学 \\ 毕{}业{}设{}计（论{}文）\\}
  \vspace{2cm}
  
  \begin{tabular}{>{\fontsize{16pt}{16pt}\kaiti}l
      >{\centering\arraybackslash\fontsize{15pt}{15pt} \kaiti}
      p{11.53cm}}
    题\chinesespace\chinesespace 目{}{} & \thetitle \\
    \cline{2-2}
    专\chinesespace\chinesespace 业{}{} & \themajor \\
    \cline{2-2}
    学生姓名{}{} & \theauthor   \\
    \cline{2-2}
    班级学号{}{} & {\large \thestudentid} \\
    \cline{2-2}
    指导老师{}{} & \theadvisor \\
    \cline{2-2}
    指导单位{}{} & \theschool \\
    \cline{2-2}
  \end{tabular}
  
\vspace{5cm}

\fontsize{16pt}{16pt}\selectfont{\kaiti 日期：\quad \thebegindate {} 至\hspace{.5pc} \thefinishdate \\}
\end{center}

\newpage
\thispagestyle{empty}

\noindent

\begin{center}
  \fontsize{16pt}{16pt}\selectfont{\heiti
    毕业设计（论文）原创性声明
  } \\[48bp]
\end{center}

\begin{spacing}{2.0}
郑重声明：所提交的毕业设计（论文），是本人在导师指导下，独立进行研究工作所取得的成果。除文中已注明引用的内容外，本毕业设计（论文）不包含任何其他个人或集体已经发表或撰写过的作品成果。对本研究做出过重要贡献的个人和集体，均已在文中以明确方式标明并表示了谢意。\\ \\ 

\hspace*{7cm} 论文作者签名：

\hspace*{7cm} 日期：\quad\quad 年\quad\quad 月\quad\quad 日
\end{spacing}


\newpage
\setcounter{page}{0}
\setcounter{pseudopage}{0}
\setlength{\extrarowheight}{5pt}
}

\ProcessOptions\relax

\newcommand{\standardhead}{
  \fancyhf{}
  \fancyhead[CE, CO]{\fontsize{10.5pt}{12.6pt}\selectfont 南京邮电大学\thegraduateyear 届本科生毕业设计（论文）\\}
  \fancyfoot[CE, CO]{\fontsize{10.5pt}{12.6pt}\selectfont\thepage}
}

% TODO: 更改目录样式

\newcommand{\thesistableofcontents}{
  \pdfbookmark{目录}{toc}
  \tableofcontents
  \thispagestyle{empty}
}

\renewcommand{\chaptermark}[1]{\markboth{第\zhnumber{\arabic{chapter}}章 \hspace{2}#1}{}}

\newcommand{\thesisacknowledgement}{
  \renewcommand\thesection{\arabic{section}}
  \addtocontents{toc}{\protect\setcounter{tocdepth}{0}}
  \setcounter{section}{0}
  \chapter*{致\chinesespace\chinesespace 谢}
  \addcontentsline{toc}{chapter}{致谢}
  \markboth{致谢}{致谢}
  \thispagestyle{fancy}
}

\newcommand{\thesischapterexordium}{
  \newpage
  \addtocontents{toc}{\protect\setcounter{tocdepth}{2}}
  \standardhead
  \pagenumbering{arabic}
  \setcounter{page}{1}
}

\newcommand{\thesisappendix}{
  \chapter*{附\chinesespace\chinesespace 录}
    \setcounter{section}{0}
    \addcontentsline{toc}{chapter}{附录}
    \markboth{附录}{附录}
    \thispagestyle{fancy}
    \renewcommand{\theequation}{a-\arabic{equation}}
    \renewcommand{\thetable}{a-\arabic{table}}
    \renewcommand{\thefigure}{a-\arabic{figure}}
}

\makeatletter
\renewcommand{\@biblabel}[1]{[#1]\hfill}
\makeatother

\patchcmd\thebibliography
    {\labelsep}
    {\labelsep\itemsep=0pt\parsep=0pt\relax}
    {}
    {\typeout{Couldn't patch the command}}

\newenvironment{thesisbibliography}{
  \begin{thebibliography}{lo}
    \interlinepenalty=10000
    \begin{spacing}{1.667}
    \thispagestyle{fancy}
    \small
}{
    \end{spacing}
  \end{thebibliography}
}

\pretocmd{\bibliography}{
  \thispagestyle{fancy}
  \interlinepenalty=10000
  \begin{spacing}{1.667}
}{}{}

\apptocmd{\bibliography}{
  \end{spacing}
}{}{}

\newcommand{\thesisloadbibliography}[2][]{
  \ifthenelse{
      \equal{#1}{nocite}
    }{
      \nocite{*}
    }{}
  \bibliographystyle{njupthesis}
  \bibliography{#2}
}


\newtheoremstyle{dotless}{0pt}{0pt}{\normalfont}{24pt}{\heiti}{}{ }{}
\theoremstyle{dotless}
\newtheorem{theorem}{定理}[chapter]
\newtheorem{axiom}[theorem]{公理}
\newtheorem{corollary}[theorem]{推论}
\newtheorem{lemma}[theorem]{引理}
\newtheorem{definition}[theorem]{定义}
\newtheorem{example}[theorem]{例子}
\newtheorem{proposition}[theorem]{命题}


\renewcommand{\thetheorem}{\arabic{chapter}.\arabic{theorem}}
\renewcommand{\theaxiom}{\arabic{chapter}.\arabic{axiom}}
\renewcommand{\thecorollary}{\arabic{chapter}.\arabic{corollary}}
\renewcommand{\thelemma}{\arabic{chapter}.\arabic{lemma}}
\renewcommand{\thedefinition}{\arabic{chapter}.\arabic{definition}}
\renewcommand{\theexample}{\arabic{chapter}.\arabic{example}}
\renewcommand{\qedsymbol}{$\blacksquare$}
\renewcommand{\proofname}{证明}

\makeatletter
\renewenvironment{proof}[1][\proofname]{\par
  \pushQED{\qed}
  \normalfont
  \topsep0pt \partopsep0pt
  \trivlist
  \item[\hskip5\labelsep
        \heiti
    #1\@addpunct{:}]\ignorespaces
}{
  \popQED\endtrivlist\@endpefalse
}
\makeatother

\newcommand{\citing}[1]{\textsuperscript{\cite{#1}}}
\setlist{noitemsep}
\setlist{nolistsep}

\AtBeginDocument{
  \setlength{\abovedisplayskip}{8pt}
  \setlength{\belowdisplayskip}{8pt}
  \setlength{\belowdisplayshortskip}{8pt}
  \setlength{\abovedisplayshortskip}{8pt}
}


\endinput
