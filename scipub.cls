\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{scipub}
[2017/11/01 v1.0 ziyuan scipub class]
\newif\ifisttf\isttffalse
\newif\ifisfz\isfzfalse
\newif\ifisotf\isotffalse
\DeclareOption{ttf}{\isttftrue}
\DeclareOption{fz}{\isfztrue}
\DeclareOption{otf}{\isotftrue}
\newif\ifistwoside\istwosidefalse
\DeclareOption{twoside}{\istwosidetrue}
\DeclareOption*{\PackageWarning{nudtpaper}{Unknown Option '\CurrentOption'}}
\ProcessOptions\relax
\RequirePackage{ifthen,calc}
\ifistwoside
  \LoadClass[b5paper,10.5pt,openright,twoside]{book}
\else
  \LoadClass[b5paper,10.5pt,openany]{book}
\fi
\RequirePackage[includeheadfoot]{geometry}
\RequirePackage[center,pagestyles]{titlesec}
\RequirePackage{titletoc}
\RequirePackage{graphicx}
\RequirePackage[config]{subfig}
\RequirePackage{float}
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage{tabularx}
\RequirePackage{slashbox}
\RequirePackage[neverdecrease]{paralist}
\RequirePackage{xcolor}
\RequirePackage{amsmath,amssymb}
%\RequirePackage{txfonts} %得到Times Newman的数学字体
\RequirePackage[Symbolsmallscale]{upgreek}
\interdisplaylinepenalty=2500
\RequirePackage{bm}
\RequirePackage[T1]{fontenc}
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}
\RequirePackage[CJKchecksingle,no-math]{xeCJK}
\usepackage{CJKnumb}
%\RequirePackage{CJKnumber}
\RequirePackage{indentfirst}
\usepackage[numbers, sort&compress]{natbib}
\usepackage[sectionbib]{chapterbib}
%% \RequirePackage{cite}
\RequirePackage{pifont,mathrsfs,tabularx,rotating,supertabular}

%% 字体
\RequirePackage[pdfborder=0 1 1]{hyperref}
\defaultfontfeatures{Mapping=tex-text}
\xeCJKsetcharclass{"0}{"2E7F}{0}
\xeCJKsetcharclass{"2E80}{"FFFF}{1}
\newcommand\installTTF{%
  \setmainfont{Times New Roman}
  \setsansfont{Arial}
  \setmonofont{Courier New}
  \ifisvista
    \setCJKmainfont[BoldFont={SimHei},ItalicFont={KaiTi}]{SimSun}
    \setCJKmonofont{KaiTi} % Pluto use LiSu Thu use Kaiti, orig is SimSun
    \setCJKfamilyfont{fs}{FangSong}
    \setCJKfamilyfont{kai}{KaiTi}
  \else
    \setCJKmainfont[BoldFont={SimHei},ItalicFont={KaiTi_GB2312}]{SimSun}
    \setCJKmonofont{KaiTi_GB2312} % Pluto use LiSu Thu use Kaiti, orig is SimSun
    \setCJKfamilyfont{fs}{FangSong_GB2312}
    \setCJKfamilyfont{kai}{KaiTi_GB2312}
  \fi
  \setCJKsansfont{SimHei}
  \setCJKfamilyfont{song}{SimSun}
  \setCJKfamilyfont{hei}{SimHei}
  \setCJKfamilyfont{li}{LiSu}
  \setCJKfamilyfont{you}{YouYuan}
  \setCJKfamilyfont{cusong}{STZhongsong}
}
\newcommand\installOTF{%
  \setmainfont{Times New Roman} % could be changed to "Times New Roman PS Std" !!
  \setsansfont{Arial}
  \setmonofont{Courier New}
  \setCJKmainfont[BoldFont={Adobe Heiti Std},ItalicFont={Adobe Kaiti Std}]{Adobe Song Std}
  \setCJKsansfont{Adobe Heiti Std}
  \setCJKmonofont{Adobe Kaiti Std}
  \setCJKfamilyfont{song}{Adobe Song Std}
  \setCJKfamilyfont{hei}{Adobe Heiti Std}
  \setCJKfamilyfont{fs}{Adobe Fangsong Std}
  \setCJKfamilyfont{kai}{Adobe Kaiti Std}
  \setCJKfamilyfont{li}{Adobe Kaiti Std}
  \setCJKfamilyfont{you}{Adobe Kaiti Std}
  \setCJKfamilyfont{cusong}{STZhongsong}
}
\newcommand\installFZ{%
  \setmainfont{Times New Roman} % could be changed to "Times New Roman PS Std" !!
  \setsansfont{Arial}
  \setmonofont{Courier New}
  \setCJKmainfont[BoldFont={FZHei-B01},ItalicFont={FZKai-Z03}]{FZShuSong_GB18030-Z01}
  \setCJKsansfont{FZHei-B01} % Hei
  \setCJKmonofont{FZKai-Z03} % Kai
  \setCJKfamilyfont{song}{FZShuSong_GB18030-Z01}
  \setCJKfamilyfont{hei}{FZHei-B01}
  \setCJKfamilyfont{fs}{FZKai-Z03} % Kai
  \setCJKfamilyfont{kai}{FZKai-Z03} % Kai
  \setCJKfamilyfont{li}{FZKai-Z03} % Kai
  \setCJKfamilyfont{you}{FZKai-Z03} % Kai
  \setCJKfamilyfont{cusong}{FZXiaoBiaoSong-B05} % 小标宋
}
\newcommand{\cusong}{\CJKfamily{cusong}} % 中宋作为加粗宋体
\ifisttf
  \installTTF
\else
  \ifisfz
    \installFZ
  \else
    \installOTF
  \fi
\fi
\newcommand{\song}{\CJKfamily{song}}    % 宋体
\newcommand{\fs}{\CJKfamily{fs}}        % 仿宋体
\newcommand{\kai}{\CJKfamily{kai}}      % 楷体
\newcommand{\hei}{\CJKfamily{hei}}      % 黑体
\newcommand{\li}{\CJKfamily{li}}        % 隶书
\newcommand{\you}{\CJKfamily{you}}      % 幼圆
\def\songti{\song}
\def\fangsong{\fs}
\def\kaishu{\kai}
\def\heiti{\hei}
\def\lishu{\li}
\def\youyuan{\you}
\newlength\thu@linespace
\newcommand{\thu@choosefont}[2]{%
    \setlength{\thu@linespace}{#2*\real{#1}}%
    \fontsize{#2}{\thu@linespace}\selectfont}
\def\thu@define@fontsize#1#2{%
    \expandafter\newcommand\csname #1\endcsname[1][\baselinestretch]{%
    \thu@choosefont{##1}{#2}}}
\thu@define@fontsize{chuhao}{42bp}
\thu@define@fontsize{xiaochu}{36bp}
\thu@define@fontsize{yihao}{26bp}
\thu@define@fontsize{xiaoyi}{24bp}
\thu@define@fontsize{erhao}{22bp}
\thu@define@fontsize{xiaoer}{18bp}
\thu@define@fontsize{sanhao}{16bp}
\thu@define@fontsize{xiaosan}{15bp}
\thu@define@fontsize{sihao}{14bp}
\thu@define@fontsize{banxiaosi}{13bp}
\thu@define@fontsize{xiaosi}{12bp}
\thu@define@fontsize{dawu}{11bp}
\thu@define@fontsize{wuhao}{10.5bp}
\thu@define@fontsize{xiaowu}{9bp}
\thu@define@fontsize{liuhao}{7.5bp}
\thu@define@fontsize{xiaoliu}{6.5bp}
\thu@define@fontsize{qihao}{5.5bp}
\thu@define@fontsize{bahao}{5bp}
\newcommand{\pozhehao}{\kern0.3ex\rule[0.8ex]{2em}{0.1ex}\kern0.3ex}
\renewcommand\contentsname{目\hspace{1em}录}
\titlecontents{chapter}[0pt]{\vspace{.5\baselineskip}\bfseries} {第\thecontentslabel 章\quad}{} {\hspace{.5em}\titlerule*[10pt]{$\cdot$}\contentspage} 
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}} % 上标形式引用
\newcommand\equationname{公式}
\renewcommand\bibname{参考文献}
\renewcommand\figurename{图}
\renewcommand\tablename{表}

\def\thu@tabular{\xiaowu[1.25]\old@tabular}
\DeclareCaptionLabelFormat{thu}{{\xiaowu[1.25]\song #1~\rmfamily #2}}
\DeclareCaptionLabelSeparator{thu}{\hspace{1em}} %图 label 和标题之间空一个空格
\DeclareCaptionFont{thu}{\xiaowu[1.25]}
\captionsetup{labelformat=thu,labelsep=thu,font=thu}
\captionsetup[figure]{position=bottom,belowskip=-3bp \@plus 2bp \@minus 2bp,aboveskip=6bp \@plus 2bp \@minus 2bp}%
\captionsetup[subfloat]
{labelformat=simple,font=thu,captionskip=6bp,nearskip=0bp,farskip=0bp,topadjust=0bp}
\renewcommand{\thesubfigure}{(\alph{subfigure})}
\renewcommand{\thesubtable}{(\alph{subtable})}


\geometry{top=20mm,bottom=21.5mm,left=26mm,right=26mm}
\geometry{headheight=9mm,headsep=1mm,footskip=9mm}

\renewcommand\setheadrule[1]{%
  \ifdim#1=\z@
    \let\makeheadrule\@empty
  \else
    \def\makeheadrule{%
    \makebox[0pt][l]{\rule[.6mm]{\linewidth}{1pt}}%
    \rule[0mm]{\linewidth}{1pt}}%
  \fi}
\renewpagestyle{plain}{
\sethead[\raisebox{1.4mm}{\xiaowu \thepage}][\raisebox{1.4mm}{\songti \xiaowu 阵列雷达最优子阵技术}][]{}{\raisebox{1.4mm}{\xiaowu {第~\thecontentslabel~章\quad \chaptertitle}}}{\raisebox{1.4mm}{\xiaowu \thepage}}%
%% \setfoot{}{{\songti \wuhao 第~\thepage~页}}{}%
\headrule%
%% \footrule%
}
\setfootrule{1bp}
\renewcommand\frontmatter{%
    \if@openright\cleardoublepage\else\clearpage\fi
    \@mainmatterfalse
    \pagenumbering{Roman}
    \pagestyle{plain}}
\newcommand\midmatter{%
    \if@openright\cleardoublepage\else\clearpage\fi
    \@mainmatterfalse
    \pagenumbering{roman}
    \pagestyle{plain}}
\renewcommand\mainmatter{%
    \if@openright\cleardoublepage\else\clearpage\fi
    \@mainmattertrue
    \pagenumbering{arabic}
    \pagestyle{plain}}
\renewcommand\backmatter{%
    \if@openright\cleardoublepage\else\clearpage\fi
    \titleformat{\chapter}{\filcenter \heiti \sanhao}{附录\,\thechapter\,}{1em}{}
    \titlecontents{chapter}[0pt]{\vspace{0.25\baselineskip} \heiti \xiaosi[1.25]}
      {附录\,\thecontentslabel\quad}{}
      {\hspace{.5em}\titlerule*{.}\contentspage}
    \@mainmattertrue
    \pagestyle{plain}}
\renewcommand\cleardoublepage{\clearpage\if@openright \ifodd\c@page\else
  \newpage{}
  \thispagestyle{empty}
  \vspace*{\fill}
  \begin{center}
  \end{center}
  \vspace*{\fill}
  \clearpage\fi\fi%
}

\setlength{\topskip}{0pt}
\setcounter{secnumdepth}{3}
\setlength{\footnotesep}{2.2ex \@minus 2bp}
%% \RequirePackage{everypage}
%% \AddEverypageHook{\setcounter{footnote}{0}} 
\makeatletter
\@addtoreset{footnote}{page}


%% \renewcommand{\thefootnote}{\textcircled{\arabic{footnote}}}
\titleformat{\chapter}{\filcenter\sf \heiti\sanhao[1.25]}{第\thechapter 章\,}{1em}{}
\titleformat{\section}{\filcenter\bfseries \cusong\sihao[1.25]}{\thesection}{1em}{}
\titleformat{\subsection}{\sf \heiti\wuhao[1.25]}{\thesubsection}{1em}{}
\titleformat{\subsubsection}{\bfseries \kaishu\wuhao[1.25]}{\thesubsubsection}{1em}{}
% \titlespacing*{命令}{左距离}{上距离}{下距离} 
%% \titlespacing{\chapter}{0pt}{2.4ex-\topskip-\heightof{A}}{2.4ex \@minus 2bp}
\titlespacing{\chapter}{0pt}{16pt}{16pt}
%% \titlespacing{\section}{0pt}{2ex-\heightof{a}}{2ex \@minus 2bp}
\titlespacing{\section}{0pt}{14pt}{14pt}
%% \titlespacing{\subsection}{0pt}{2ex \@minus 2bp}{2ex \@minus 2bp}
\titlespacing{\subsection}{0pt}{10.5pt}{10.5pt}
%% \titlespacing{\subsubsection}{2em}{1ex \@minus 2bp}{0ex \@minus 2bp}
\titlespacing{\subsubsection}{2em}{10.5pt}{10.5pt}

%% \titleformat{\section}         % Customise the \section command 
%%   {\Large\scshape\raggedright} % Make the \section headers large (\Large),
%%                                % small capitals (\scshape) and left aligned (\raggedright)
%%   {}{0em}                      % Can be used to give a prefix to all sections, like 'Section ...'
%%   {}                           % Can be used to insert code before the heading
%%   [\titlerule]                 % Inserts a horizontal line after the heading

\renewcommand\normalsize{%
%% \@setfontsize\normalsize{12bp}{12.87bp}%
%% \renewcommand{\baselinestretch}{2}%
\setlength\baselineskip{15pt}%
\setlength\abovedisplayskip{10bp \@minus 1bp}%
\setlength\abovedisplayshortskip{10bp \@minus 1bp}%
\setlength\belowdisplayskip{\abovedisplayskip}%
\setlength\belowdisplayshortskip{\abovedisplayshortskip}%
}

\newlength\CJK@twochars
\def\CJK@spaceChar{\Unicode{48}{7}}
\def\CJKindent{%
  \settowidth\CJK@twochars{中国}%
  \parindent\CJK@twochars}
\AtBeginDocument{%
  \CJKindent\relax
}
\setlength{\parskip}{0bp \@minus 2bp}
\newcommand*{\ziju}[1]{\renewcommand{\CJKglue}{\hskip #1}}

\renewenvironment{thebibliography}[1]{%
   \chapter*{\bibname}%
   \list{\@biblabel{\@arabic\c@enumiv}}%
        {\renewcommand{\makelabel}[1]{##1\hfill}
         \settowidth\labelwidth{1.1cm}
         \setlength{\labelsep}{0.4em}
         \setlength{\itemindent}{0pt}
         \setlength{\leftmargin}{\labelwidth+\labelsep}
         \addtolength{\itemsep}{-0.7em}
         \usecounter{enumiv}%
         \let\p@enumiv\@empty
         \renewcommand\theenumiv{\@arabic\c@enumiv}}%
    \sloppy\frenchspacing
    \clubpenalty4000%
    \widowpenalty4000%
    \interlinepenalty4000%
    \sfcode`\.\@m}
   {\def\@noitemerr
     {\@latex@warning{Empty `thebibliography' environment}}%
    \endlist\frenchspacing}
%% \newpagestyle{mainpage}{
%% \sethead{\sectiontitle}{}{\sc \thepage}
%% \setfoot{}{}{}
%% \headrule}

\newtheorem{proof}{证明}[chapter]
\newtheorem{assumption}{假设}[chapter]
\newtheorem{definition}{定义}[chapter]
\newtheorem{lemma}{引理}[chapter]
