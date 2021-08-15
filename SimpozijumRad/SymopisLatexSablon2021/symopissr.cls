%%
%% This is file `symopissr.cls',
%%
%% -----------------------------------------------------------------
%% 
%% This file is part of the symopis package for preparing
%% symopis articles.
%% 
%% -----------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}[2005/12/01]
\ProvidesClass{symopis}
    [2013/03/10 v1.0 symopis articles]
\emergencystretch1em
\advance\hoffset-1in
\advance\voffset-1in
\advance\hoffset2.95mm
\newif\if@nobotseplist  \@nobotseplistfalse
\def\@endparenv{%
  \addpenalty\@endparpenalty\if@nobotseplist\else\addvspace\@topsepadd\fi\@endpetrue}
\def\@doendpe{%
  \@endpetrue
  \def\par{\@restorepar
           \everypar{}%
           \par
           \if@nobotseplist
             \addvspace\topsep
             \addvspace\partopsep
             \global\@nobotseplistfalse
           \fi
           \@endpefalse}%
  \everypar{{\setbox\z@\lastbox}%
            \everypar{}%
            \if@nobotseplist\global\@nobotseplistfalse\fi
            \@endpefalse}}
\def\enumerate{%
  \ifnum \@enumdepth >\thr@@\@toodeep\else
    \advance\@enumdepth\@ne
    \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
    \expandafter
    \list
      \csname label\@enumctr\endcsname
      {\advance\partopsep\topsep
       \topsep\z@\@plus\p@
       \ifnum\@listdepth=\@ne
         \labelsep0.72em
       \else
         \ifnum\@listdepth=\tw@
           \labelsep0.3em
         \else
           \labelsep0.5em
         \fi
       \fi
       \usecounter\@enumctr\def\makelabel##1{\hss\llap{##1}}}%
  \fi}
\def\endenumerate{\ifnum\@listdepth=\@ne\global\@nobotseplisttrue\fi\endlist}
\def\itemize{%
  \ifnum \@itemdepth >\thr@@\@toodeep\else
    \advance\@itemdepth\@ne
    \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
    \expandafter
    \list
      \csname\@itemitem\endcsname
      {\advance\partopsep\topsep
       \topsep\z@\@plus\p@
       \ifnum\@listdepth=\@ne
         \labelsep0.83em
       \else
         \ifnum\@listdepth=\tw@
           \labelsep0.75em
         \else
           \labelsep0.5em
         \fi
      \fi
      \def\makelabel##1{\hss\llap{##1}}}%
  \fi}
\def\enditemize{\ifnum\@listdepth=\@ne\global\@nobotseplisttrue\fi\endlist}
\def\@sect#1#2#3#4#5#6[#7]#8{%
  \ifnum #2>\c@secnumdepth
    \let\@svsec\@empty
  \else
    \refstepcounter{#1}%
    \protected@edef\@svsec{\@seccntformat{#1}\relax}%
  \fi
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@
    \begingroup
      #6{%
        \@hangfrom{\hskip #3\relax
          \ifnum #2=1
            \colorbox[rgb]{1,1,1}{\kern0.15em\@svsec\kern0.15em}\quad
          \else
            \@svsec\quad
          \fi}%
          \interlinepenalty \@M #8\@@par}%
    \endgroup
    \csname #1mark\endcsname{#7}%
    \addcontentsline{toc}{#1}{%
      \ifnum #2>\c@secnumdepth \else
        \protect\numberline{\csname the#1\endcsname}%
      \fi
      #7}%
  \else
    \def\@svsechd{%
      #6{\hskip #3\relax
      \@svsec #8}%
      \csname #1mark\endcsname{#7}%
      \addcontentsline{toc}{#1}{%
        \ifnum #2>\c@secnumdepth \else
          \protect\numberline{\csname the#1\endcsname}%
        \fi
        #7}}%
  \fi
  \@xsect{#5}}
\def\@seccntformat#1{\csname the#1\endcsname}
\def\@biblabel#1{\textcolor{black}{\sffamily\bfseries#1}}
\def\ps@plain{\let\@mkboth\@gobbletwo
  \let\@oddhead\@empty
  \let\@evenhead\@empty
  \let\@evenfoot\@empty
   \def\@fsthead{%
    \ifx\@serieslogo\@empty
    \else
      \setbox\@tempboxa\hbox{\includegraphics[height=42\p@]{\@serieslogo}}%
      \rlap{\hspace\textwidth\hspace{-\wd\@tempboxa}\hspace{\z@}%
            \vtop to\z@{\vskip-0mm\unhbox\@tempboxa\vss}}%
    \fi
    } 
  \let\@oddfoot\@empty
}
\def\symopis@opterrshort{Option  "\CurrentOption" not supported}
\def\symopis@opterrlong{The option "\CurrentOption" from article.cls is not supported by symopis.cls.}
\DeclareOption{a5paper}{\@latexerr{\symopis@opterrshort}{\symopis@opterrlong}}
\DeclareOption{b5paper}{\@latexerr{\symopis@opterrshort}{\symopis@opterrlong}}
\DeclareOption{legalpaper}{\@latexerr{\symopis@opterrshort}{\symopis@opterrlong}}
\DeclareOption{executivepaper}{\@latexerr{\symopis@opterrshort}{\symopis@opterrlong}}
\DeclareOption{landscape}{\@latexerr{\symopis@opterrshort}{\symopis@opterrlong}}
\DeclareOption{10pt}{\@latexerr{\symopis@opterrshort}{\symopis@opterrlong}}
\DeclareOption{11pt}{\@latexerr{\symopis@opterrshort}{\symopis@opterrlong}}
\DeclareOption{12pt}{\@latexerr{\symopis@opterrshort}{\symopis@opterrlong}}
\DeclareOption{oneside}{\@latexerr{\symopis@opterrshort}{\symopis@opterrlong}}
%\DeclareOption{twoside}{\@latexerr{\symopis@opterrshort}{\symopis@opterrlong}}
\DeclareOption{titlepage}{\@latexerr{\symopis@opterrshort}{\symopis@opterrlong}}
\DeclareOption{notitlepage}{\@latexerr{\symopis@opterrshort}{\symopis@opterrlong}}
\DeclareOption{onecolumn}{\@latexerr{\symopis@opterrshort}{\symopis@opterrlong}}
\DeclareOption{twocolumn}{\@latexerr{\symopis@opterrshort}{\symopis@opterrlong}}
\DeclareOption{fleqn}{\@latexerr{\symopis@opterrshort}{\symopis@opterrlong}}
\DeclareOption{openbib}{\@latexerr{\symopis@opterrshort}{\symopis@opterrlong}}
\DeclareOption{a4paper}{\PassOptionsToClass{\CurrentOption}{article}
                        \advance\hoffset-2.95mm
                        \advance\voffset8.8mm}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass[oneside,notitlepage,fleqn]{article}
%\renewcommand\normalsize{\@setfontsize\normalsize{11}{12.5}}
\renewcommand\normalsize{%
   \@setfontsize\normalsize{11}{12.5}%
   \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}
%\normalsize
\renewcommand\small{%
   \@setfontsize\small\@ixpt{10}%
   \abovedisplayskip 8.5\p@ \@plus3\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus2\p@
   \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 4\p@ \@plus2\p@ \@minus2\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\renewcommand\footnotesize{%
   \@setfontsize\footnotesize{10.5}{11.5}%
   \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus\p@
   \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 3\p@ \@plus\p@ \@minus\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}
\renewcommand\large{\@setfontsize\large{12}{13}}
\renewcommand\Large{\@setfontsize\Large{13}{14}}
\setlength\parindent{1.5em}
%\setlength\headheight{3mm}
%\setlength\headsep   {10mm}
%\setlength\footskip{3mm}
\setlength\textwidth{170mm}
\setlength\textheight{255mm}
\setlength\oddsidemargin{20mm}
%\setlength\evensidemargin{38mm}
%\setlength\marginparwidth{25mm}
%\setlength\topmargin{13mm}
\setlength{\skip\footins}{2\baselineskip \@plus 4\p@ \@minus 2\p@}
\def\@listi{\leftmargin\leftmargini
            \parsep\z@ \@plus\p@
            \topsep 8\p@ \@plus2\p@ \@minus4\p@
            \itemsep \parsep}
\let\@listI\@listi
\@listi
\def\@listii {\leftmargin\leftmarginii
              \labelwidth\leftmarginii
              \advance\labelwidth-\labelsep
              \topsep    4\p@ \@plus2\p@ \@minus\p@
              \parsep\z@ \@plus\p@
              \itemsep   \parsep}
\def\@listiii{\leftmargin\leftmarginiii
              \labelwidth\leftmarginiii
              \advance\labelwidth-\labelsep
              \topsep    2\p@ \@plus\p@\@minus\p@
              \parsep    \z@
              \partopsep \p@ \@plus\z@ \@minus\p@
              \itemsep   \z@ \@plus\p@}
             
              
%\def\ps@headings{%
%    \def\@evenhead{\large\sffamily\bfseries
%                   \llap{\hbox to0.5\oddsidemargin{\thepage\hss}}\leftmark\hfil}%
%    \def\@oddhead{\large\sffamily\bfseries\rightmark\hfil
%                  \rlap{\hbox to0.5\oddsidemargin{\hss\thepage}}}%
%    \def\@oddfoot{\hfil
%                  \rlap{%
%                    \vtop{%
%                      \vskip10mm
%                      \colorbox[rgb]{1,1,1}
%                                    {\@tempdima\evensidemargin
%                                     \advance\@tempdima1in
%                                     \advance\@tempdima\hoffset
%                                     \hb@xt@\@tempdima{%
%                                       \textcolor{darkgray}{\normalsize\sffamily
%                                       \bfseries\quad
%                                       \expandafter\textsolittle
%                                       \expandafter{\@EventShortName}}%
%                                     \strut\hss}}}}}
%    \let\@evenfoot\@empty
%    \let\@mkboth\markboth
%  \let\sectionmark\@gobble
%  \let\subsectionmark\@gobble}
%\pagestyle{headings}
\renewcommand\maketitle{
\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{plain}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}

\newwrite\tocfile
\def\@maketitle{%
  \newpage
  \null\vskip-\baselineskip
  \vskip-\headsep
  \vspace*{-3mm}
  \@titlerunning
  \@authorrunning
  \let \footnote \thanks
  \parindent\z@ \raggedright
    {\includegraphics[height=2cm,width=17cm]{SablonSYM.png}
    \vskip 3mm%
    \Large\bfseries\sffamily\mathversion{bold}\@title\par}%
    \vskip 3mm%
    \ifnum\c@authors=0 %
      \@latexerr{No \noexpand\author given}%
        {Provide at least one author.}%
    \else
      \@author
    \fi
%    \bgroup
%      \let\footnote\@gobble
%      \immediate\openout\tocfile=\jobname.vtc
%      \protected@write\tocfile{}{%
%        \string\contitem
%        \string\title{\@title}%
%        \string\author{\AB@authfortoc}%
%        \string\page{\thepage}}%
%      \closeout\tocfile
%    \egroup
%  \par
}
\setcounter{secnumdepth}{4}
\renewcommand{\thesection}{\arabic{section}.\hspace*{-4mm}}
\renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}.\hspace*{-3mm}}
\renewcommand{\thesubsubsection}{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}.\hspace*{-3mm}}
\renewcommand\section{\@startsection {section}{1}{-2mm}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\large\sffamily\bfseries\raggedright}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\large\sffamily\bfseries\raggedright}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalsize\sffamily\bfseries\raggedright}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {-3.25ex \@plus-1ex \@minus-.2ex}%
                                    {1.5ex \@plus .2ex}%
                                    {\normalsize\bfseries\raggedright}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\z@}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalsize\bfseries}}
\setlength\leftmargini  {2.6em} %\parindent
\setlength\leftmarginii {2.6em}
\setlength\leftmarginiii{2.6em}
\setlength\leftmarginiv {2.6em}
\setlength\leftmarginv  {2.6em}
\setlength\leftmarginvi {2.6em}
\renewcommand\labelenumi{%
  \textcolor{black}{\theenumi.}}
\renewcommand\labelenumii{%
  \textcolor{black}{\theenumii.}}
\renewcommand\labelenumiii{%
  \textcolor{black}{\theenumiii.}}
\renewcommand\labelenumiv{%
  \textcolor{black}{\theenumiv.}}
\renewcommand\labelitemi{%
  \textcolor{black}{\ifnum\@listdepth=\@ne
                                  \rule{0.3em}{0.3em}%
                                \else
                                  \rule{0.2em}{0.2em}%
                                \fi}}
\renewcommand\labelitemii{%
  \textcolor{black}{\rule{0.2em}{0.2em}}}
\renewcommand\labelitemiii{%
  \textcolor{black}{\sffamily\bfseries\textasteriskcentered}}
\renewcommand\labelitemiv{%
  \textcolor{black}{\sffamily\bfseries\textperiodcentered}}
\renewenvironment{description}
               {\list{}{\advance\partopsep\topsep\topsep\z@\@plus\p@
                        \labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\ifnum\@listdepth=\@ne\global\@nobotseplisttrue\fi\endlist}
\renewcommand*\descriptionlabel[1]{%
  \hspace\labelsep\textcolor{darkgray}{\sffamily\bfseries\mathversion{bold}#1}}
\renewenvironment{abstract}
{%

\begin{center}
\vspace*{-9mm}
\line(1,0){490}
\end{center}
  \noindent
    \hspace*{0mm}\fboxsep0.5mm{%
    \it\bfseries\fontsize{11}{12.5}\selectfont Rezime:\enskip}%
  \it\normalsize\selectfont\noindent\ignorespaces}
  {\ifx\@subjclass\@empty\else
     \vskip\baselineskip\noindent
     \subjclassHeading\@subjclass
   \fi
   \ifx\@keywords\@empty\else
     \vskip\baselineskip\noindent
     \keywordsHeading\@keywords
   \fi
   \hspace*{3mm}}
\newenvironment{abstractEN}
{%

\begin{center}
\vspace*{-9mm}

\end{center}
  \noindent
    \hspace*{0mm}\fboxsep0.5mm{%
    \it\bfseries\fontsize{11}{12.5}\selectfont Abstract:\enskip}%
  \it\normalsize\selectfont\noindent\ignorespaces}
  {\ifx\@subjclass\@empty\else
     \vskip\baselineskip\noindent
     \subjclassHeading\@subjclass
   \fi
   
\ifx\@keywordsen\@empty\else
     \vskip\baselineskip\noindent
     \keywordsenHeading\@keywordsen
   \fi
   \hspace*{3mm}}

\renewenvironment{thebibliography}[1]
  {
  \renewcommand{\refname}{\large LITERATURA}
  \if@noskipsec \leavevmode \fi
   \par
   \@tempskipa-3.5ex \@plus -1ex \@minus -.2ex\relax
   \@afterindenttrue
   \@tempskipa -\@tempskipa \@afterindentfalse
   \if@nobreak
     \everypar{}%
   \else
     \addpenalty\@secpenalty\addvspace\@tempskipa
   \fi
   \noindent
   \hspace*{-2mm}\fboxsep1.5mm\colorbox[rgb]{1,1,1}{\raisebox{-0.4ex}{%
     \normalsize\sffamily\bfseries\refname}}%
   \@xsect{1ex \@plus.2ex}%
   \list{[\@biblabel{\@arabic\c@enumiv}]\hspace*{-1mm}}%
        {\leftmargin7mm
         \labelsep\leftmargin
         \settowidth\labelwidth{\@biblabel{#1}}%
         \advance\labelsep-\labelwidth
         \usecounter{enumiv}%
         \let\p@enumiv\@empty
         \renewcommand\theenumiv{\@arabic\c@enumiv}}%
   \fontsize{11}{12.5}\selectfont
   \sloppy
   \clubpenalty4000
   \@clubpenalty \clubpenalty
   \widowpenalty4000%
   \sfcode`\.\@m}
  {\def\@noitemerr
     {\@latex@warning{Empty `thebibliography' environment}}%
   \endlist}
\renewcommand\footnoterule{%
  \kern-8\p@
  {\color[rgb]{0.60,0.60,0.61}\hrule\@width40mm\@height1\p@}%
  \kern6.6\p@}
\renewcommand\@makefntext[1]{%
    \parindent\z@\hangindent1em
    \leavevmode
    \hb@xt@1em{\@makefnmark\hss}#1}
\usepackage[utf8]{inputenc}
\IfFileExists{lmodern.sty}{\RequirePackage{lmodern}}{}
\RequirePackage[T1]{fontenc}
\RequirePackage{textcomp}
\RequirePackage[mathscr]{eucal}
\RequirePackage{amssymb}
\RequirePackage{soul}
\sodef\textsolittle{}{.12em}{.5em\@plus.08em\@minus.06em}%
        {.4em\@plus.275em\@minus.183em}
\RequirePackage{color}
\definecolor{darkgray}{rgb}{0.31,0.31,0.33}
\RequirePackage{babel}
\RequirePackage[tbtags,fleqn]{amsmath}
\RequirePackage{amsthm}
\thm@headfont{%
  \textcolor{darkgray}{$\blacktriangleright$}\nobreakspace\sffamily\bfseries}
\def\th@remark{%
  \thm@headfont{%
    \textcolor{darkgray}{$\blacktriangleright$}\nobreakspace\sffamily}%
  \normalfont % body font
  \thm@preskip\topsep \divide\thm@preskip\tw@
  \thm@postskip\thm@preskip
}
\def\@endtheorem{\endtrivlist}%\@endpefalse
\renewcommand\qedsymbol{\textcolor{darkgray}{\ensuremath{\blacktriangleleft}}}
\renewenvironment{proof}[1][\proofname]{\par
  \pushQED{\qed}%
  \normalfont \topsep6\p@\@plus6\p@\relax
  \trivlist
  \item[\hskip\labelsep
        \color{darkgray}\sffamily\bfseries
    #1\@addpunct{.}]\ignorespaces
}{%
  \popQED\endtrivlist%\@endpefalse
}
\theoremstyle{plain}
\newtheorem{theorem}{Theorem}
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{corollary}[theorem]{Corollary}
\theoremstyle{definition}
\newtheorem{definition}[theorem]{Definition}
\newtheorem{example}[theorem]{Example}
\theoremstyle{remark}
\newtheorem*{remark}{Remark}
\RequirePackage{graphicx}
\RequirePackage{array}
\let\@classzold\@classz
\def\@classz{%
   \expandafter\ifx\d@llarbegin\begingroup
     \toks \count@ =
     \expandafter{\expandafter\small\the\toks\count@}%
   \fi
   \@classzold}
\RequirePackage{multirow}
\RequirePackage{tabularx}
\RequirePackage[online]{threeparttable}
\def\TPTtagStyle#1{#1)}
\def\tablenotes{\small\TPT@defaults
  \@ifnextchar[\TPT@setuptnotes\TPTdoTablenotes} % ]
\RequirePackage{listings}
\lstset{basicstyle=\small\ttfamily,%
        backgroundcolor=\color[rgb]{1,1,1},%
        frame=single,framerule=0pt,xleftmargin=\fboxsep,xrightmargin=\fboxsep}
\RequirePackage{lastpage}
\IfFileExists{doi.sty}
  {\RequirePackage{doi}%
   \renewcommand*{\doitext}{}}
  {\RequirePackage{hyperref}%
   \def\doi##1{##1}}
\hypersetup{pdfborder={0 0 0}}
\RequirePackage[labelsep=space,singlelinecheck=false,%
  font={up},labelfont={bf},%
  listof=false]{caption}%"listof" instead of "list" for backward compatibility
%\@ifpackagelater{hyperref}{2009/12/09}
%  {\captionsetup{compatibility=false}}%cf. http://groups.google.de/group/comp.text.tex/browse_thread/thread/db9310eb540fbbd8/42e30f3b7b3aa17a?lnk=raot
  {}
  
\renewcommand{\thetable}{\arabic{table}:}  
  
\DeclareCaptionLabelFormat{boxed}{%
  \kern0.05em{\color[rgb]{0.99,0.78,0.07}\rule{0.73em}{0.73em}}%
  \hspace*{0.67em}\bothIfFirst{#1}{~}#2}
\captionsetup[table]{position=top}
\RequirePackage[figuresright]{rotating}
\RequirePackage{subfig}
\def\titlerunning#1{\gdef\@titlerunning{{\let\footnote\@gobble\markboth{#1}{#1}}}}
\def\authorrunning#1{%
  \gdef\@authorrunning{\expandafter\def\expandafter\@tempa\expandafter{#1}%
                       \ifx\@tempa\@empty\else\markright{#1}\fi}}
\titlerunning{\@title}
\authorrunning{\AB@authrunning}
\newcommand*\volumeinfo[6]{%
  {\gdef\@Editors{#1}%
   \gdef\@Eds{Editor}\ifnum #2>1 \gdef\@Eds{Editors}\fi
   \gdef\@Event{#3}%
   \setcounter{page}{#6}}}
\volumeinfo{}{1}{}{}{}{1}
\RequirePackage{authblk}
\renewcommand*\Authand{{, }}
\renewcommand*\Authfont{\small}
\renewcommand*\AB@authnote[1]{\textsuperscript{#1}}
\renewcommand*\AB@affilnote[1]{\protect\item[$^#1$]}
\renewcommand*\Affilfont{\fontsize{9.5}{10}\selectfont}
\setlength\affilsep{\baselineskip}
\newcommand\AB@authrunning{}
\newcommand\AB@authfortoc{}
\renewcommand\author[2][]%
      {\ifnewaffil\addtocounter{affil}{1}%
       \edef\AB@thenote{\arabic{affil}}\fi
      \if\relax#1\relax\def\AB@note{\AB@thenote}\else\def\AB@note{#1}%
        \setcounter{Maxaffil}{0}\fi
      \ifnum\value{authors}>1\relax
      \@namedef{@sep\number\c@authors}{\Authsep}\fi
      \addtocounter{authors}{1}%
      \begingroup
          \let\protect\@unexpandable@protect \let\and\AB@pand
          \def\thanks{\protect\thanks}\def\footnote{\protect\footnote}%
         \@temptokena=\expandafter{\huge\AB@authors}%
         {\def\\{\protect\\[\@affilsep]\protect\Affilfont
              \protect\AB@resetsep}%
              \xdef\AB@author{\AB@blk@and#2}%
       \ifnewaffil\gdef\AB@las{}\gdef\AB@lasx{\protect\Authand}\gdef\AB@as{}%
           \xdef\AB@authors{\the\@temptokena\AB@blk@and}%
       \else
          \xdef\AB@authors{\the\@temptokena\AB@as\AB@au@str}%
          \global\let\AB@las\AB@lasx\gdef\AB@lasx{\protect\Authands}%
          \gdef\AB@as{\Authsep}%
       \fi
       \gdef\AB@au@str{#2}}%
         \@temptokena=\expandafter{\AB@authlist}%
         \let\\=\authorcr
         \xdef\AB@authlist{\the\@temptokena
           \protect\@nameuse{@sep\number\c@authors}%
           \protect\Authfont#2\AB@authnote{\AB@note}}%
         %new
         \@temptokena=\expandafter{\AB@authrunning}%
         \let\\=\authorcr
         \xdef\AB@authrunning{\the\@temptokena
           \protect\@nameuse{@sep\number\c@authors}#2}%
         %
         %new
         \@temptokena=\expandafter{\AB@authfortoc}%
         \let\\=\authorcr
         \xdef\AB@authfortoc{\the\@temptokena
           \expandafter\noexpand\csname @sep\number\c@authors\endcsname#2}%
         %
      \endgroup
      \ifnum\value{authors}>2\relax
      \@namedef{@sep\number\c@authors}{\Authand}\fi
      \newaffilfalse
}
\renewcommand\affil[2][]%
   {\newaffiltrue\let\AB@blk@and\AB@pand
      \if\relax#1\relax\def\AB@note{\AB@thenote}\else\def\AB@note{#1}%
        \setcounter{Maxaffil}{0}\fi
      \begingroup
        \let\protect\@unexpandable@protect
        \def\thanks{\protect\thanks}\def\footnote{\protect\footnote}%
        \@temptokena=\expandafter{\AB@authors}%
        {\def\\{\protect\\\protect\Affilfont}\xdef\AB@temp{#2}}%
         \xdef\AB@authors{\the\@temptokena\AB@las\AB@au@str
         \protect\\[\affilsep]\protect\Affilfont\AB@temp}%
         \gdef\AB@las{}\gdef\AB@au@str{}%
        {\xdef\AB@temp{#2}}%
        \@temptokena=\expandafter{\AB@affillist}%
        \xdef\AB@affillist{\the\@temptokena \AB@affilsep
          \AB@affilnote{\AB@note}\protect\Affilfont\AB@temp}%
      \endgroup
       \let\AB@affilsep\AB@affilsepx}
\renewcommand\@author{\ifx\AB@affillist\AB@empty\AB@authrunning\else
      \ifnum\value{affil}>\value{Maxaffil}\def\rlap##1{##1}%
    \AB@authlist\\[\affilsep]
    \labelwidth1em\labelsep\z@\leftmargini\labelwidth
    \edef\@enumctr{enumi}%
    \list\theenumi{\usecounter\@enumctr\def\makelabel##1{\rlap{##1}\hss}}%
      \AB@affillist
    \endlist
    \else  \AB@authors\fi\fi}
\newcommand*\Copyright[2][]{%
  \def\@Copyright{%
    \def\@tempa{#1}\ifx\@tempa\@empty
      \ifx#2\@empty \else \textcopyright\ #2\\\fi
    \else
      \setbox\@tempboxa\hbox{\includegraphics[height=14\p@,clip]{cc-by-#1}}%
      \hspace*{\wd\@tempboxa}\enskip\ifx#2\@empty \else \textcopyright\ #2;\\\fi
      \href{http://creativecommons.org/licenses/by-#1/3.0/}%
           {\smash{\unhbox\@tempboxa}}\enskip
            licensed under Creative Commons License \MakeUppercase{#1}\\
    \fi}}
\Copyright[]{\@empty}
\def\keywords#1{\def\@keywords{#1}}
\let\@keywords\@empty
\def\keywordsHeading{%
  \textcolor{black}{\bfseries Klju\v cne re\v ci:\enskip}}
\def\subjclass#1{\gdef\@subjclass{#1}}
\let\@subjclass\@empty

\def\keywordsen#1{\def\@keywordsen{#1}}
\let\@keywordsen\@empty
\def\keywordsenHeading{%
  \textcolor{black}{\bfseries Keywords:\enskip}}

\def\subjclassHeading{%
  }
\def\doiHeading{%
  }
\def\serieslogo#1{\gdef\@serieslogo{#1}}
\serieslogo{}
\def\EventShortName#1{\gdef\@EventShortName{#1}}
\EventShortName{}
\def\DOI#1{\gdef\@DOI{#1}}
\DOI{}
\endinput
%%
%% End of file `symopis.cls'.
