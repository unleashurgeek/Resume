%-------------------------------------------------------------------------------
%                Identification
%-------------------------------------------------------------------------------
\ProvidesClass{deedy-resume-openfont}[2018/05/11 CV class]
\NeedsTeXFormat{LaTeX2e}


%-------------------------------------------------------------------------------
%                Class options
%
% (need to be done before the external package loading, for example because
% we need \paperwidth, \paperheight and \@ptsize to be defined before loading
% geometry and fancyhdr)
%-------------------------------------------------------------------------------
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article}


%-------------------------------------------------------------------------------
%                3rd party packages
%-------------------------------------------------------------------------------
% Needed to make fixed length table
\RequirePackage{array}
% Needed to handle list environment
\RequirePackage{enumitem}
% Needed to handle text alignment
\RequirePackage{ragged2e}
% Needed to configure page layout
\RequirePackage[marginparsep=0pt]{geometry}% showframe
% Needed to make header & footer effeciently
\RequirePackage{fancyhdr}
% Needed to manage colors
\RequirePackage{xcolor}
% Needed to use \ifxetex-\else-\fi statement
\RequirePackage{ifxetex}
% Needed to use \if-\then-\else statement
\RequirePackage{xifthen}
% Needed to use a toolbox of programming tools
\RequirePackage{etoolbox}
% Needed to change line spacing in specific environment
\RequirePackage{setspace}
% Allows for easy aligned columns
\RequirePackage{multicol}
% Needed to manage fonts
\RequirePackage[quiet]{fontspec}
% To support LaTeX quoting style
\defaultfontfeatures{Ligatures=TeX}
% Needed to manage math fonts
\RequirePackage{unicode-math}
% Needed to use icons from font-awesome
% (https://github.com/posquit0/latex-fontawesome)
\RequirePackage{fontawesome}
% Needed to deal a paragraphs
\RequirePackage{parskip}
% Needed to deal hyperlink
\RequirePackage[hidelinks]{hyperref}
\hypersetup{%
  pdftitle={},
  pdfauthor={},
  pdfsubject={},
  pdfkeywords={}
}

% Section seperators 
\usepackage{titlesec}
\titlespacing{\section}{0pt}{0pt}{0pt} 
\titlespacing{\subsection}{0pt}{0pt}{0pt}
\newcommand{\sectionsep}{\vspace{8pt}}

%-------------------------------------------------------------------------------
%                Configuration for directory locations
%-------------------------------------------------------------------------------
% Configure a directory location for fonts(default: 'fonts/')
\newcommand*{\fontdir}[1][fonts/]{\def\@fontdir{#1}}% chktex 21
\fontdir{}

%-------------------------------------------------------------------------------
%                Configuration for layout
%-------------------------------------------------------------------------------
%% Page Layout
% Configure page margins with geometry
\geometry{left=1.25cm, top=0.75cm, right=1.25cm, bottom=0.75cm}

% Forcing default separation for multicolumn to allow editing
\setlength\columnsep{10pt}

%% Header & Footer
% Set offset to each header and footer
\fancyhfoffset{0em}
% Remove head rule
\renewcommand{\headrulewidth}{0pt}
% Clear all header & footer fields
\fancyhf{}
% Enable if you want to make header or footer using fancyhdr
\pagestyle{fancy}

%-------------------------------------------------------------------------------
%                Configuration for colors
%-------------------------------------------------------------------------------
% Gray-scale colors
\definecolor{white}{HTML}{FFFFFF}
\definecolor{black}{HTML}{000000}
\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{5D5D5D}
\definecolor{lightgray}{HTML}{999999}
% Awesome colors
\definecolor{awesome-emerald}{HTML}{00A388}
\definecolor{awesome-skyblue}{HTML}{0395DE}
\definecolor{awesome-red}{HTML}{DC3522}
\definecolor{awesome-pink}{HTML}{EF4089}
\definecolor{awesome-orange}{HTML}{FF6138}
\definecolor{awesome-nephritis}{HTML}{27AE60}
\definecolor{awesome-concrete}{HTML}{95A5A6}
\definecolor{awesome-darknight}{HTML}{131A28}
% Other colors
\definecolor{dark-blue}{HTML}{3298BA}
\definecolor{dark-red}{HTML}{b71c1c}
\definecolor{rip}{HTML}{ff60f4}
\definecolor{test}{HTML}{2b2b2b}

\colorlet{awesome}{dark-red}

\definecolor{darktext}{HTML}{414141}
\colorlet{text}{darkgray}
\colorlet{graytext}{gray}
\colorlet{lighttext}{lightgray}

\definecolor{date}{HTML}{666666} 
\definecolor{primary}{HTML}{2b2b2b} 
\definecolor{headings}{HTML}{6A6A6A}
\definecolor{subheadings}{HTML}{333333}

%-------------------------------------------------------------------------------
%                Configuration for fonts
%-------------------------------------------------------------------------------
\newfontfamily\headerfont[
  Path=\@fontdir Montserrat/,
  UprightFont=*-Regular,
  ItalicFont=*-Italic,
  BoldFont=*-Bold,
  BoldItalicFont=*-BoldItalic,
]{Montserrat}

\newfontfamily\headerfontlight[
  Path=\@fontdir Montserrat/,
  UprightFont=*-Thin,
  ItalicFont=*-ThinItalic,
  BoldFont=*-Regular,
  BoldItalicFont=*-Italic,
]{Montserrat}

\newfontfamily\bodyfont[
  Path=\@fontdir SourceSansPro/,
  UprightFont=*-Regular,
  ItalicFont=*-It,
  BoldFont=*-Bold,
  BoldItalicFont=*-BoldIt
]{SourceSansPro}

\newfontfamily\bodyfontlight[
  Path=\@fontdir SourceSansPro/,
  UprightFont=*-Light,
  ItalicFont=*-LightIt,
  BoldFont=*-Semibold,
  BoldItalicFont=*-SemiboldIt
]{SourceSansPro}

\setmainfont[
  Path=\@fontdir SourceSansPro/,
  UprightFont=*-Regular,
  ItalicFont=*-It,
  BoldFont=*-Bold,
  BoldItalicFont=*-BoldIt
]{SourceSansPro}

%-------------------------------------------------------------------------------
%                Configuration for styles
%-------------------------------------------------------------------------------
\newcommand*{\firstnamestyle}[1]{{\fontsize{36pt}{1em}\headerfontlight\color{darkgray} #1}}
\newcommand*{\lastnamestyle}[1]{{\fontsize{36pt}{1em}\headerfont\bfseries\color{text} #1}}
\newcommand*{\headerinfostyle}[1]{\fontsize{10pt}{1em}\headerfont\color{text} #1}

\newcommand*{\sectionstyle}[1]{{\fontsize{20pt}{1em}\bodyfont\bfseries\scshape\color{text} #1}}
\newcommand*{\sidesectionstyle}[1]{{\fontsize{16pt}{1em}\bodyfont\bfseries\scshape\color{text} #1}}

\newcommand*{\entrytitlestyle}[1]{{\fontsize{12pt}{1em}\headerfont\bfseries\color{awesome} #1}}
\newcommand*{\entrypositionstyle}[1]{{\fontsize{11pt}{1em}\headerfont\color{text} #1}}
\newcommand*{\entrylocationstyle}[1]{{\fontsize{10pt}{1em}\headerfont\color{awesome-concrete} #1}}
\newcommand*{\entrydatestyle}[1]{{\fontsize{10pt}{1em}\bodyfontlight\scshape\color{graytext} #1}}
\newcommand*{\descriptionstyle}[1]{{\fontsize{12pt}{1em}\bodyfont\color{text} #1}}


%-------------------------------------------------------------------------------
%                Commands for personal information
%-------------------------------------------------------------------------------
% Define writer's name
% Usage: \name{<firstname>}{<lastname>}
\newcommand*{\name}[2]{\def\@firstname{#1}\def\@lastname{#2}}% chktex 21

% Defines writer's phone (optional)
% Usage: \phone{<phone number>}
\newcommand*{\phone}[1]{\def\@phone{#1}}% chktex 21

% Defines writer's email (optional)
% Usage: \email{<email adress>}
\newcommand*{\email}[1]{\def\@email{#1}}% chktex 21

% Defines writer's homepage (optional)
% Usage: \homepage{<url>}
\newcommand*{\homepage}[1]{\def\@homepage{#1}}% chktex 21

% Defines writer's github (optional)
% Usage: \github{<github-nick>}
\newcommand*{\github}[1]{\def\@github{#1}}% chktex 21

%-------------------------------------------------------------------------------
%                Commands for extra
%-------------------------------------------------------------------------------
\newcommand{\AfterNameSpace}{.4mm}
\newcommand{\AfterHeaderInfoSpace}{.5mm}
\newcommand{\AfterHeaderSpace}{4mm}
\newcommand{\HeaderInfoSpace}{\space}
\newcommand{\HeaderInfoSep}{\quad\textbar\quad}

\newcommand{\SectionTopSkip}{3mm}
\newcommand{\SectionContentTopSkip}{2.5mm}

\newcommand{\EntryInfoSep}{\quad\textbar\space}
\newcommand{\EntryItemSep}{5pt}

\newbool{HasColumn}
\setbool{HasColumn}{false}
\newcommand{\ColumnSpace}{5mm}

%-------------------------------------------------------------------------------
%                Commands for utilities
%-------------------------------------------------------------------------------
\def\vhrulefill#1{\leavevmode\leaders\hrule\@height#1\hfill \kern\z@}% chktex 21
\def\headerline#1{\noindent\makebox[\linewidth]{\rule{\paperwidth}{#1}}}

\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}% chktex 21
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}% chktex 21
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}% chktex 21
\newcolumntype{M}[1]{>{\centering\arraybackslash}m{#1}}

% Use to execute conditional statements by checking empty string
\newcommand*{\ifempty}[3]{\ifthenelse{\isempty{#1}}{#2}{#3}}

%-------------------------------------------------------------------------------
%                Commands for elements of CV structure
%-------------------------------------------------------------------------------
% Headers
\newcommand*{\simpleheader}{%
  \begin{center}
    \firstnamestyle{\@firstname}\lastnamestyle{{}\space\@lastname}% chktex 21
    \\[\AfterHeaderInfoSpace]%
    % \color{darkgray}\vhrulefill{0.4pt}
    \color{darkgray}\headerline{0.4pt}
  \end{center}
}

\newcommand*{\gapheader}{%
  \begin{tabular}[b]{@{}l}
    \firstnamestyle{\@firstname}\lastnamestyle{{}\space\@lastname}% chktex 21
  \end{tabular}
  \hfill%
  \setlength{\tabcolsep}{.33334em}
  \begin{tabular}[b]{cl@{}}
    \headerinfostyle{%
      \ifthenelse{\isundefined{\@phone}}{}%
      {%
        \faPhone{} & \headerinfostyle{\@phone}\\
      }%
      \ifthenelse{\isundefined{\@github}}{}%
      {%
        \faGithub{} & \headerinfostyle{\href{https://github.com/\@github}{\@github}}\\
      }%
      \ifthenelse{\isundefined{\@homepage}}{}%
      {%
        \faHome{} & \headerinfostyle{\href{https://\@homepage}{\@homepage}}\\
      }%
      \ifthenelse{\isundefined{\@email}}{}%
      {%
        \fontsize{3.5mm}{1em}{\faEnvelope{}} & \headerinfostyle{\href{mailto:\@email}{\@email}}%
      }%
    }
  \end{tabular}%
  \\[\AfterNameSpace]%
  \color{darkgray}\vhrulefill{0.4pt}
}

\newcommand*{\infoheader}{%
  \begin{center}
    \firstnamestyle{\@firstname}\lastnamestyle{{}\space\@lastname}% chktex 21
    \\[\AfterNameSpace]%
    \headerinfostyle{%
      \newbool{isstart}%
      \setbool{isstart}{true}%
      \ifthenelse{\isundefined{\@phone}}{}%
      {%
        \faPhone\HeaderInfoSpace\@phone% chktex 21
        \setbool{isstart}{false}%
      }%
      \ifthenelse{\isundefined{\@email}}{}%
      {%
        \ifbool{isstart}{\setbool{isstart}{false}}{\HeaderInfoSep}%
        \href{mailto:\@email}{\faEnvelope\HeaderInfoSpace\@email}%
      }%
      \ifthenelse{\isundefined{\@homepage}}{}%
      {%
        \ifbool{isstart}{\setbool{isstart}{false}}{\HeaderInfoSep}%
        \href{https://\@homepage}{\faHome\HeaderInfoSpace\@homepage}%
      }%
      \ifthenelse{\isundefined{\@github}}{}%
      {%
        \ifbool{isstart}{\setbool{isstart}{false}}{\HeaderInfoSep}%
        \href{https://github.com/\@github}{\faGithub\HeaderInfoSpace\@github}%
      }%
    } \\[\AfterHeaderInfoSpace]%
    \color{darkgray}\vhrulefill{0.4pt}
  \end{center}
}

\newenvironment{column}{%
  \setbool{HasColumn}{true}
  \begin{minipage}[t]{\dimexpr0.30\textwidth-\ColumnSpace}
}{%
  \end{minipage}
  \hfill
}

\newenvironment{main}{%
  \ifbool{HasColumn}{%
    % \begin{minipage}[t]{0.70\textwidth}
    \begin{minipage}[t]{\linewidth}
  }{%
    \begin{minipage}[t]{\linewidth}
  }
}{%
  \ifbool{HasColumn}{%
    \end{minipage}
  }{%
    \end{minipage}
  }
}

% Main Section
\newcommand{\mainsection}[1]{%
  \vspace{\SectionTopSkip}
  \sectionstyle{#1}
  \phantomsection{}
  \color{darkgray}\vhrulefill{0.4pt}
}

\newcommand{\sidesection}[1]{
  % \vspace{\SectionTopSkip}
  \sidesectionstyle{#1}
  \phantomsection{}
  % \\\color{darkgray}\vhrulefill{0.9pt}
}

\newenvironment{entries}{%
  \vspace{\SectionContentTopSkip}
  \begin{center}
}{%
  \end{center}
}

% Define an entry of cv information
% Usage: \cventry{<position>}{<title>}{<location>}{<date>}{<description>}
\newcommand*{\entry}[5]{%
  \vspace{1.0mm}
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{l@{\extracolsep{\fill}}r}
    \entrytitlestyle{#2}\entrypositionstyle{\EntryInfoSep{} #1} & \entrydatestyle{#4}
  \end{tabular*}\\
  \vspace{1.0mm}
  \setlength\tabcolsep{0pt}
  \setlength{\extrarowheight}{0pt}
  \begin{tabular*}{\textwidth}{l@{\extracolsep{\fill}}r}
    % \ifbool{HasColumn}{%
    %   \ifempty{#3}{%
    %     \entrytitlestyle{#2} & \entrydatestyle{#4}\\
    %     \multicolumn{2}{L{\textwidth}}{\entrylocationstyle{#1}}\\
    %   }{%
    %     \entrytitlestyle{#2} & \entrydatestyle{#4}\\
    %     \multicolumn{2}{L{\textwidth}}{\entrylocationstyle{#1\EntryInfoSep{}#3}}\\
    %   }
    % }{%
    %   \ifempty{#3}
    %   {\entrytitlestyle{#2}\entrypositionstyle{\EntryInfoSep{} #1} & \entrydatestyle{#4} \\}
    %   {\entrytitlestyle{#2}\entrypositionstyle{\EntryInfoSep{} #1} & \entrydatestyle{#4} \\
    %   \multicolumn{2}{L{\textwidth}}{\entrylocationstyle{#3}}\\}
    % }
    \multicolumn{2}{L{\textwidth}}{\descriptionstyle{#5}}
  \end{tabular*}%
}

\newenvironment{entryitems}{%
  \vspace{-2.0mm}
  \begin{justify}
  \begin{itemize}[leftmargin=2ex, nosep, noitemsep]
    \setlength{\parskip}{\EntryItemSep}
    \renewcommand{\labelitemi}{\color{awesome}\textbf{\bullet}}
    \renewcommand{\labelitemii}{\color{awesome}\textbf{--}}
}{%
  \end{itemize}
  \end{justify}
  \vspace{-2.0mm}
}
