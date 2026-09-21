%%% IMEJ.cls 30-Jan-2018 version 1.0
%%% 
%%% This is the IMEJ LaTeX class file for authors of the International Marine Energy Journal.
%%%
%%% It is based upon the IEEEtran LaTeX class for authors of the Institute of Electrical and Electronics Engineers (IEEE) Transactions journals and conferences, IEEEtran.cls 2015/08/26 version v1.0b
%%% 
%%% This work is distributed under the LaTeX Project Public License (LPPL)( http://www.latex-project.org/ ) version 1.3, and may be freely used, distributed and modified. A copy of the LPPL, version 1.3, is included in the base LaTeX documentation of all distributions of LaTeX released 2003/12/01 or later.
%%% Retain all contribution notices and credits.
%%% ** Modified files should be clearly indicated as such, including renaming them and changing author support contact information. **
%%%
%%% Contributors to the IEEEtran.cls:
%%%
%%% Gerry Murray (1993), Silvano Balemi (1993),
%%% Jon Dixon (1996), Peter N"uchter (1996),
%%% Juergen von Hagen (2000), and Michael Shell (2001-2014)
%%% Copyright (c) 1993-2000 by Gerry Murray, Silvano Balemi, Jon Dixon, Peter N"uchter, Juergen von Hagen
%%% Copyright (c) 2001-2015 by Michael Shell
%%% Special thanks to Peter Wilson (CUA) and Donald Arseneau for allowing the inclusion of the \@ifmtarg command from their ifmtarg LaTeX package.
%%%
%%% Converted to IMEJ.cls by Luke Blunden (2018)
%%% Current maintainer (v1.0) Luke Blunden (managing-editor@marineenergyjournal.org)
%%%
%%% 
%%%*************************************************************************
%%% Legal Notice:
%%% This code is offered as-is without any warranty either expressed or implied; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE! User assumes all risk. In no event shall any contributor to this code be liable for any damages or losses, including, but not limited to, incidental, consequential, or any other damages, resulting from the use or misuse of any information contained here.
%%%
%%% All comments are the opinions of their respective authors and are not necessarily endorsed by any organization.
%%%
%%%*************************************************************************
%%
%
% Available class options 
% e.g., \documentclass[10pt,conference]{IMEJ} 
% 
%             *** choose only one from each category ***
%
% 9pt, 10pt, 11pt, 12pt
%    Sets normal font size. The default is 10pt.
% 
% conference, journal, technote, peerreview, peerreviewca
%    determines format mode - conference papers, journal papers,
%    correspondence papers (technotes), or peer review papers. The user
%    should also select 9pt when using technote. peerreview is like
%    journal mode, but provides for a single-column "cover" title page for
%    anonymous peer review. The paper title (without the author names) is
%    repeated at the top of the page after the cover page. For peer review
%    papers, the \IMEJpeerreviewmaketitle command must be executed (will
%    automatically be ignored for non-peerreview modes) at the place the
%    cover page is to end, usually just after the abstract (keywords are
%    not normally used with peer review papers). peerreviewca is like
%    peerreview, but allows the author names to be entered and formatted
%    as with conference mode so that author affiliation and contact
%    information can be easily seen on the cover page.
%    The default is journal.
%
% draft, draftcls, draftclsnofoot, final
%    determines if paper is formatted as a widely spaced draft (for
%    handwritten editor comments) or as a properly typeset final version.
%    draftcls restricts draft mode to the class file while all other LaTeX
%    packages (i.e., \usepackage{graphicx}) will behave as final - allows
%    for a draft paper with visible figures, etc. draftclsnofoot is like
%    draftcls, but does not display the date and the word "DRAFT" at the foot
%    of the pages. If using one of the draft modes, the user will probably
%    also want to select onecolumn.
%    The default is final.
%
% a4paper
%    Only A4 paper size is used for IMEJ
%
% oneside, twoside
%    determines if layout follows single sided or two sided (duplex)
%    printing. The only notable change is with the headings at the top of
%    the pages.
%    The default is twoside.
%
% onecolumn, twocolumn
%    determines if text is organized into one or two columns per page. One
%    column mode is usually used only with draft papers.
%    The default is twocolumn.
%
% romanappendices
%    Use the "Appendix I" convention when numbering appendices. 
%
% captionsoff
%    disables the display of the figure/table captions. Some journals
%    request that captions be removed and figures/tables be put on pages
%    of their own at the end of an initial paper submission. The endfloat
%    package can be used with this class option to achieve this format.
%
% nofonttune
%    turns off tuning of the font interword spacing. Maybe useful to those
%    not using the standard Times fonts or for those who have already "tuned"
%    their fonts.
%    The default is to enable IMEJtran to tune font parameters.
%
%
%----------
% Available CLASSINPUTs provided (all are macros unless otherwise noted):
% \CLASSINPUTbaselinestretch
% \CLASSINPUTinnersidemargin
% \CLASSINPUToutersidemargin
% \CLASSINPUTtoptextmargin
% \CLASSINPUTbottomtextmargin
%
% Available CLASSINFOs provided:
% \ifCLASSINFOpdf                       (TeX if conditional)
% \CLASSINFOpaperwidth                  (macro)
% \CLASSINFOpaperheight                 (macro)
% \CLASSINFOnormalsizebaselineskip      (length)
% \CLASSINFOnormalsizeunitybaselineskip (length)
%
% Available CLASSOPTIONs provided:
% all class option flags (TeX if conditionals) unless otherwise noted,
% e.g., \ifCLASSOPTIONcaptionsoff
% point size options provided as a single macro:
% \CLASSOPTIONpt
% which will be defined as 9, 10, 11, or 12 depending on the document's
% normalsize point size.
% also, class option peerreviewca implies the use of class option peerreview
% and classoption draft implies the use of class option draftcls





\ProvidesClass{IMEJ}[v1.0 March 2018]
\typeout{-- https://marineenergyjournal.org/imej/information/authors}
\typeout{-- Based on IEEEtran v1.0b by Michael Shell.}
\typeout{-- Not endorsed by any person or organization other than IMEJ.}
\NeedsTeXFormat{LaTeX2e}

% IMEJ.cls version numbers
% These values serve as a way a .tex file can
% determine if the new features are provided.
% The version number of this IMEJ.cls can be obtained from 
% these values. i.e., V1.4
% KEEP THESE AS INTEGERS! i.e., NO {4a} or anything like that-
% (no need to enumerate "a" minor changes here)
\def\IMEJtransversionmajor{1}
\def\IMEJtransversionminor{0}


% hook to allow easy changeover to IMEJ.cls/tools.sty error reporting
\def\@IMEJclspkgerror{\ClassError{IMEJ}}


% These do nothing, but provide them like in article.cls
\newif\if@restonecol
\newif\if@titlepage


% class option conditionals
\newif\ifCLASSOPTIONonecolumn       \CLASSOPTIONonecolumnfalse
\newif\ifCLASSOPTIONtwocolumn       \CLASSOPTIONtwocolumntrue

\newif\ifCLASSOPTIONoneside         \CLASSOPTIONonesidefalse
\newif\ifCLASSOPTIONtwoside         \CLASSOPTIONtwosidetrue

\newif\ifCLASSOPTIONfinal           \CLASSOPTIONfinaltrue
\newif\ifCLASSOPTIONdraft           \CLASSOPTIONdraftfalse
\newif\ifCLASSOPTIONdraftcls        \CLASSOPTIONdraftclsfalse
\newif\ifCLASSOPTIONdraftclsnofoot  \CLASSOPTIONdraftclsnofootfalse

\newif\ifCLASSOPTIONpeerreview      \CLASSOPTIONpeerreviewfalse
\newif\ifCLASSOPTIONpeerreviewca    \CLASSOPTIONpeerreviewcafalse

\newif\ifCLASSOPTIONjournal         \CLASSOPTIONjournaltrue

\newif\ifCLASSOPTIONnofonttune      \CLASSOPTIONnofonttunefalse

\newif\ifCLASSOPTIONcaptionsoff     \CLASSOPTIONcaptionsofffalse


\newif\ifCLASSOPTIONromanappendices \CLASSOPTIONromanappendicesfalse


% class info conditionals

% indicates if pdf (via pdflatex) output
\newif\ifCLASSINFOpdf               \CLASSINFOpdffalse


% v1.0b internal flag to show if using a4paper
\newif\if@IMEJusingAfourpaper       \@IMEJusingAfourpapertrue
% v1.0b internal flag to show if using cspaper
\newif\if@IMEJusingcspaper          \@IMEJusingcspaperfalse


% IMEJ class scratch pad registers
% dimen
\newdimen\@IMEJtmpdimenA
\newdimen\@IMEJtmpdimenB
\newdimen\@IMEJtmpdimenC
% count
\newcount\@IMEJtmpcountA
\newcount\@IMEJtmpcountB
\newcount\@IMEJtmpcountC
% token list
\newtoks\@IMEJtmptoksA

% we use \CLASSOPTIONpt so that we can ID the point size (even for 9pt docs)
% as well as LaTeX's \@ptsize to retain some compatability with some
% external packages
\def\@ptsize{0}
% LaTeX does not support 9pt, so we set \@ptsize to 0 - same as that of 10pt
\DeclareOption{9pt}{\def\CLASSOPTIONpt{9}\def\@ptsize{0}}
\DeclareOption{10pt}{\def\CLASSOPTIONpt{10}\def\@ptsize{0}}
\DeclareOption{11pt}{\def\CLASSOPTIONpt{11}\def\@ptsize{1}}
\DeclareOption{12pt}{\def\CLASSOPTIONpt{12}\def\@ptsize{2}}


\DeclareOption{a4paper}{\setlength{\paperwidth}{210mm}%
                        \setlength{\paperheight}{297mm}%
                        \@IMEJusingAfourpapertrue
                        \@IMEJusingcspaperfalse
                        \def\CLASSOPTIONpaper{a4}%
                        \def\CLASSINFOpaperwidth{210mm}%
                        \def\CLASSINFOpaperheight{297mm}}


\DeclareOption{oneside}{\@twosidefalse\@mparswitchfalse
                        \CLASSOPTIONonesidetrue\CLASSOPTIONtwosidefalse}
\DeclareOption{twoside}{\@twosidetrue\@mparswitchtrue
                        \CLASSOPTIONtwosidetrue\CLASSOPTIONonesidefalse}

\DeclareOption{onecolumn}{\CLASSOPTIONonecolumntrue\CLASSOPTIONtwocolumnfalse}
\DeclareOption{twocolumn}{\CLASSOPTIONtwocolumntrue\CLASSOPTIONonecolumnfalse}

% If the user selects draft, then this class AND any packages
% will go into draft mode.
\DeclareOption{draft}{\CLASSOPTIONdrafttrue\CLASSOPTIONdraftclstrue
                      \CLASSOPTIONdraftclsnofootfalse} 
% draftcls is for a draft mode which will not affect any packages
% used by the document.
\DeclareOption{draftcls}{\CLASSOPTIONdraftfalse\CLASSOPTIONdraftclstrue
                         \CLASSOPTIONdraftclsnofootfalse} 
% draftclsnofoot is like draftcls, but without the footer.
\DeclareOption{draftclsnofoot}{\CLASSOPTIONdraftfalse\CLASSOPTIONdraftclstrue
                               \CLASSOPTIONdraftclsnofoottrue} 
\DeclareOption{final}{\CLASSOPTIONdraftfalse\CLASSOPTIONdraftclsfalse
                      \CLASSOPTIONdraftclsnofootfalse}

\DeclareOption{journal}{\CLASSOPTIONpeerreviewfalse\CLASSOPTIONpeerreviewcafalse
                        \CLASSOPTIONjournaltrue}

\DeclareOption{peerreview}{\CLASSOPTIONpeerreviewtrue\CLASSOPTIONpeerreviewcafalse
                           \CLASSOPTIONjournalfalse}

\DeclareOption{peerreviewca}{\CLASSOPTIONpeerreviewtrue\CLASSOPTIONpeerreviewcatrue
                             \CLASSOPTIONjournalfalse}

\DeclareOption{nofonttune}{\CLASSOPTIONnofonttunetrue}

\DeclareOption{captionsoff}{\CLASSOPTIONcaptionsofftrue}

\DeclareOption{romanappendices}{\CLASSOPTIONromanappendicestrue}


% default to A4 paper, 10pt, twocolumn, one sided, final, journal
\ExecuteOptions{a4paper,10pt,twocolumn,oneside,final,journal}
% overrride these defaults per user requests
\ProcessOptions



%% -- Command Argument Scanning Support Functions --

% Sets the category codes for punctuation to their normal values.
% For local use with argument scanning.
\def\IMEJnormalcatcodespunct{\catcode`\!=12 \catcode`\,=12 \catcode`\:=12
\catcode`\;=12 \catcode`\`=12 \catcode`\'=12 \catcode`\"=12 \catcode`\.=12
\catcode`\/=12 \catcode`\?=12 \catcode`\*=12 \catcode`\+=12 \catcode`\-=12
\catcode`\<=12 \catcode`\>=12 \catcode`\(=12 \catcode`\)=12 \catcode`\[=12
\catcode`\]=12 \catcode`\==12 \catcode`\|=12}
% Sets the category codes for numbers to their normal values.
% For local use with argument scanning.
\def\IMEJnormalcatcodesnum{\catcode`\0=12 \catcode`\1=12 \catcode`\2=12
\catcode`\3=12 \catcode`\4=12 \catcode`\5=12 \catcode`\6=12 \catcode`\7=12
\catcode`\8=12 \catcode`\9=12}
% combined action of \IMEJnormalcatcodespunct and \IMEJnormalcatcodesnum
\def\IMEJnormalcatcodes{\IMEJnormalcatcodespunct\IMEJnormalcatcodesnum}


% usage: \@IMEJextracttoken*{}
% \@IMEJextracttoken fully expands its argument (which it then stores in
% \@IMEJextracttokenarg) via \edef and then the meaning of the first
% nonbrace (but including the empty group) token found is assigned via \let
% to \@IMEJextractedtoken as well as stored in the macro
% \@IMEJextractedtokenmacro. Tokens that would otherwise be discarded during
% the acquisition of the first are stored in \@IMEJextractedtokensdiscarded,
% however their original relative brace nesting depths are not guaranteed to
% be preserved.
% If the argument is empty, or if a first nonbrace token does not exist (or
% is an empty group), \@IMEJextractedtoken will be \relax and
% \@IMEJextractedtokenmacro and \@IMEJextractedtokensdiscarded will be empty.
%
% For example:
% \@IMEJextracttoken{{{ab}{cd}}{{ef}g}}
% results in:
%
% \@IMEJextracttokenarg          ==> a macro containing {{ab}{cd}}{{ef}g}
% \@IMEJextractedtoken           ==> the letter a
% \@IMEJextractedtokenmacro      ==> a macro containing a
% \@IMEJextractedtokensdiscarded ==> a macro containing bcd{ef}g
%
% the *-star form, \@IMEJextracttoken*, does not expand its argument
% contents during processing.
\def\@IMEJextracttoken{\@ifstar{\let\@IMEJextracttokendef=\def\@@IMEJextracttoken}{\let\@IMEJextracttokendef=\edef\@@IMEJextracttoken}}

\def\@@IMEJextracttoken#1{\@IMEJextracttokendef\@IMEJextracttokenarg{#1}\relax
\def\@IMEJextractedtokensdiscarded{}\relax % initialize to empty
% if the macro is unchanged after being acquired as a single undelimited argument
% with anything after it being stripped off as a delimited argument
% we know we have one token without any enclosing braces. loop until this is true.
\let\@IMEJextracttokencurgroup\@IMEJextracttokenarg
\loop
  % trap case of an empty argument as this would cause a problem with
  % \@@@IMEJextracttoken's first (nondelimited) argument acquisition
  \ifx\@IMEJextracttokencurgroup\@empty
    \def\@IMEJextractedtokenmacro{}\relax
  \else
    \expandafter\@@@IMEJextracttoken\@IMEJextracttokencurgroup\@IMEJgeneralsequenceDELIMITER\relax
  \fi
  \ifx\@IMEJextractedtokenmacro\@IMEJextracttokencurgroup
  \else
    \let\@IMEJextracttokencurgroup=\@IMEJextractedtokenmacro
\repeat
% we can safely do a \let= here because there should be at most one token
% the relax is needed to handle the case of no token found
\expandafter\let\expandafter\@IMEJextractedtoken\@IMEJextractedtokenmacro\relax}

\def\@@@IMEJextracttoken#1#2\@IMEJgeneralsequenceDELIMITER{\def\@IMEJextractedtokenmacro{#1}\relax
\def\@@IMEJextractedtokensdiscarded{#2}\expandafter\expandafter\expandafter\def\expandafter\expandafter\expandafter
\@IMEJextractedtokensdiscarded\expandafter\expandafter\expandafter
{\expandafter\@@IMEJextractedtokensdiscarded\@IMEJextractedtokensdiscarded}}
%%
%% -- End of Command Argument Scanning Support Functions --







%%% LB 2018: The IMEJ uses Palatino Linotype font, so default to Palatino.
\renewcommand{\sfdefault}{phv}
\renewcommand{\rmdefault}{ppl}
\renewcommand{\ttdefault}{pcr}
%%%


% enable the selected main text font
\normalfont\selectfont





% v1.0 improved paper size setting code.
% Set pdfpage and dvips paper sizes. Conditional tests are similar to that
% of ifpdf.sty. Retain within {} to ensure tested macros are never altered,
% even if only effect is to set them to \relax.
% if \pdfoutput is undefined or equal to relax, output a dvips special
{\@ifundefined{pdfoutput}{\AtBeginDvi{\special{papersize=\CLASSINFOpaperwidth,\CLASSINFOpaperheight}}}{%
% pdfoutput is defined and not equal to \relax
% check for pdfpageheight existence just in case someone sets pdfoutput
% under non-pdflatex. If exists, set them regardless of value of \pdfoutput.
\@ifundefined{pdfpageheight}{\relax}{\global\pdfpagewidth\paperwidth
\global\pdfpageheight\paperheight}%
% if using \pdfoutput=0 under pdflatex, send dvips papersize special
\ifcase\pdfoutput
\AtBeginDvi{\special{papersize=\CLASSINFOpaperwidth,\CLASSINFOpaperheight}}%
\else
% we are using pdf output, set CLASSINFOpdf flag
\global\CLASSINFOpdftrue
\fi}}

% let the user know the selected papersize
\typeout{-- Using \CLASSINFOpaperwidth\space x \CLASSINFOpaperheight\space
(\CLASSOPTIONpaper)\space paper.}

\ifCLASSINFOpdf
\typeout{-- Using PDF output.}
\else
\typeout{-- Using DVI output.}
\fi


% The idea hinted here is for LaTeX to generate markleft{} and markright{}
% automatically for you after you enter \author{}, \journal{},
% \journaldate{}, journalvol{}, \journalnum{}, etc.
% However, there may be some backward compatibility issues here as
% well as some special applications for IMEJ.cls and special issues
% that may require the flexible \markleft{}, \markright{} and/or \markboth{}.
% We'll leave this as an open future suggestion.
%\newcommand{\journal}[1]{\def\@journal{#1}}
%\def\@journal{}



% pointsize values
% used with ifx to determine the document's normal size
\def\@IMEJptsizenine{9}
\def\@IMEJptsizeten{10}
\def\@IMEJptsizeeleven{11}
\def\@IMEJptsizetwelve{12}



% FONT DEFINITIONS (No sizexx.clo file needed) 
% v1.0 revised font sizes, displayskip values and
%      revised normalsize baselineskip to reduce underfull vbox problems
%      on the 58pc = 696pt = 9.5in text height we want
%      normalsize     #lines/column  baselineskip (aka leading)
%             9pt     63             11.0476pt (truncated down)
%            10pt     58             12pt      (exact)
%            11pt     52             13.3846pt (truncated down)
%            12pt     50             13.92pt   (exact)
%

% we need to store the nominal baselineskip for the given font size
% in case baselinestretch ever changes.
% this is a dimen, so it will not hold stretch or shrink
\newdimen\@IMEJnormalsizeunitybaselineskip
\@IMEJnormalsizeunitybaselineskip\baselineskip



%% ******* WARNING! *******
%%
%% Authors should not alter font sizes, baselineskip ("leading"),
%% margins or other spacing values in an attempt to squeeze more
%% material on each page.
%%
%% The original IMEJ style file will restore the correct
%% values when re-typesetting/proofing the submitted document,
%% possibly resulting in unexpected layout changes, or articles over length.
%%
%% ******* WARNING! *******


% 9pt option defaults
\ifx\CLASSOPTIONpt\@IMEJptsizenine
%%% LB 2018:
\typeout{-- This is a 9.5 point document.}
\def\normalsize{\@setfontsize{\normalsize}{9.5}{11.0476pt}}
%%% 
\setlength{\@IMEJnormalsizeunitybaselineskip}{11.0476pt}
\normalsize
\abovedisplayskip 1.5ex plus 3pt minus 1pt
\belowdisplayskip \abovedisplayskip
\abovedisplayshortskip 0pt plus 3pt
\belowdisplayshortskip 1.5ex plus 3pt minus 1pt
\def\small{\@setfontsize{\small}{8.5}{10pt}}
\def\footnotesize{\@setfontsize{\footnotesize}{8}{9pt}}
\def\scriptsize{\@setfontsize{\scriptsize}{7}{8pt}}
\def\tiny{\@setfontsize{\tiny}{5}{6pt}}
% sublargesize is the same as large - 10pt
\def\sublargesize{\@setfontsize{\sublargesize}{10}{12pt}}
\def\large{\@setfontsize{\large}{10}{12pt}}
\def\Large{\@setfontsize{\Large}{12}{14pt}}
\def\LARGE{\@setfontsize{\LARGE}{14}{17pt}}
\def\huge{\@setfontsize{\huge}{17}{20pt}}
\def\Huge{\@setfontsize{\Huge}{20}{24pt}}
\fi
%
% 10pt option defaults
\ifx\CLASSOPTIONpt\@IMEJptsizeten
\typeout{-- This is a 10 point document.}
\def\normalsize{\@setfontsize{\normalsize}{10}{12.00pt}}
\setlength{\@IMEJnormalsizeunitybaselineskip}{12pt}
\normalsize
\abovedisplayskip 1.5ex plus 4pt minus 2pt
\belowdisplayskip \abovedisplayskip
\abovedisplayshortskip 0pt plus 4pt
\belowdisplayshortskip 1.5ex plus 4pt minus 2pt
\def\small{\@setfontsize{\small}{9}{10pt}}
\def\footnotesize{\@setfontsize{\footnotesize}{8}{9pt}}
\def\scriptsize{\@setfontsize{\scriptsize}{7}{8pt}}
\def\tiny{\@setfontsize{\tiny}{5}{6pt}}
% sublargesize is a tad smaller than large - 11pt
\def\sublargesize{\@setfontsize{\sublargesize}{11}{13.4pt}}
\def\large{\@setfontsize{\large}{12}{14pt}}
\def\Large{\@setfontsize{\Large}{14}{17pt}}
\def\LARGE{\@setfontsize{\LARGE}{17}{20pt}}
\def\huge{\@setfontsize{\huge}{20}{24pt}}
\def\Huge{\@setfontsize{\Huge}{24}{28pt}}
\fi
%
% 11pt option defaults
\ifx\CLASSOPTIONpt\@IMEJptsizeeleven
\typeout{-- This is an 11 point document.}
\def\normalsize{\@setfontsize{\normalsize}{11}{13.3846pt}}
\setlength{\@IMEJnormalsizeunitybaselineskip}{13.3846pt}
\normalsize
\abovedisplayskip 1.5ex plus 5pt minus 3pt
\belowdisplayskip \abovedisplayskip
\abovedisplayshortskip 0pt plus 5pt
\belowdisplayshortskip 1.5ex plus 5pt minus 3pt
\def\small{\@setfontsize{\small}{10}{12pt}}
\def\footnotesize{\@setfontsize{\footnotesize}{9}{10.5pt}}
\def\scriptsize{\@setfontsize{\scriptsize}{8}{9pt}}
\def\tiny{\@setfontsize{\tiny}{6}{7pt}}
% sublargesize is the same as large - 12pt
\def\sublargesize{\@setfontsize{\sublargesize}{12}{14pt}}
\def\large{\@setfontsize{\large}{12}{14pt}}
\def\Large{\@setfontsize{\Large}{14}{17pt}}
\def\LARGE{\@setfontsize{\LARGE}{17}{20pt}}
\def\huge{\@setfontsize{\huge}{20}{24pt}}
\def\Huge{\@setfontsize{\Huge}{24}{28pt}}
\fi
%
% 12pt option defaults
\ifx\CLASSOPTIONpt\@IMEJptsizetwelve
\typeout{-- This is a 12 point document.}
\def\normalsize{\@setfontsize{\normalsize}{12}{13.92pt}}
\setlength{\@IMEJnormalsizeunitybaselineskip}{13.92pt}
\normalsize
\abovedisplayskip 1.5ex plus 6pt minus 4pt
\belowdisplayskip \abovedisplayskip
\abovedisplayshortskip 0pt plus 6pt
\belowdisplayshortskip 1.5ex plus 6pt minus 4pt
\def\small{\@setfontsize{\small}{10}{12pt}}
\def\footnotesize{\@setfontsize{\footnotesize}{9}{10.5pt}}
\def\scriptsize{\@setfontsize{\scriptsize}{8}{9pt}}
\def\tiny{\@setfontsize{\tiny}{6}{7pt}}
% sublargesize is the same as large - 14pt
\def\sublargesize{\@setfontsize{\sublargesize}{14}{17pt}}
\def\large{\@setfontsize{\large}{14}{17pt}}
\def\Large{\@setfontsize{\Large}{17}{20pt}}
\def\LARGE{\@setfontsize{\LARGE}{20}{24pt}}
\def\huge{\@setfontsize{\huge}{22}{26pt}}
\def\Huge{\@setfontsize{\Huge}{24}{28pt}}
\fi




% v1.0
% Improved \textunderscore to provide a much better fake _ when used with
% OT1 encoding. Under OT1, detect use of pcr or cmtt \ttfamily and use
% available true _ glyph for those two typewriter fonts.
\def\@IMEJstringptm{ptm} % Times Roman family
\def\@IMEJstringppl{ppl} % Palatino Roman family
\def\@IMEJstringphv{phv} % Helvetica Sans Serif family
\def\@IMEJstringpcr{pcr} % Courier typewriter family
\def\@IMEJstringcmtt{cmtt} % Computer Modern typewriter family
\DeclareTextCommandDefault{\textunderscore}{\leavevmode
\ifx\f@family\@IMEJstringpcr\string_\else
\ifx\f@family\@IMEJstringcmtt\string_\else
\ifx\f@family\@IMEJstringptm\kern 0em\vbox{\hrule\@width 0.5em\@height 0.5pt\kern -0.3ex}\else
\ifx\f@family\@IMEJstringppl\kern 0em\vbox{\hrule\@width 0.5em\@height 0.5pt\kern -0.3ex}\else
\ifx\f@family\@IMEJstringphv\kern -0.03em\vbox{\hrule\@width 0.62em\@height 0.52pt\kern -0.33ex}\kern -0.03em\else
\kern 0.09em\vbox{\hrule\@width 0.6em\@height 0.44pt\kern -0.63pt\kern -0.42ex}\kern 0.09em\fi\fi\fi\fi\fi\relax}




% set the default \baselinestretch
\def\baselinestretch{1}
\ifCLASSOPTIONdraftcls
  \def\baselinestretch{1.5}% default baselinestretch for draft modes
\fi 


% process CLASSINPUT baselinestretch
\ifx\CLASSINPUTbaselinestretch\@IMEJundefined
\else
  \edef\baselinestretch{\CLASSINPUTbaselinestretch} % user CLASSINPUT override
  \typeout{** ATTENTION: Overriding \string\baselinestretch\space to
           \baselinestretch\space via \string\CLASSINPUT.}
\fi

\small\normalsize % make \baselinestretch take affect




% store the normalsize baselineskip
\newdimen\CLASSINFOnormalsizebaselineskip
\CLASSINFOnormalsizebaselineskip=\baselineskip\relax
% and the normalsize unity (baselinestretch=1) baselineskip
% we could save a register by giving the user access to
% \@IMEJnormalsizeunitybaselineskip. However, let's protect
% its read only internal status
\newdimen\CLASSINFOnormalsizeunitybaselineskip
\CLASSINFOnormalsizeunitybaselineskip=\@IMEJnormalsizeunitybaselineskip\relax
% store the nominal value of jot
\newdimen\IMEJnormaljot
\IMEJnormaljot=0.25\baselineskip\relax

% set \jot
\jot=\IMEJnormaljot\relax






% here are the interword spacing ratios we'll use
% for medium (normal weight)
\def\@IMEJinterspaceratioM{0.35}
\def\@IMEJinterspaceMINratioM{0.23}
\def\@IMEJinterspaceMAXratioM{0.50}

% for bold
\def\@IMEJinterspaceratioB{0.375}
\def\@IMEJinterspaceMINratioB{0.23}
\def\@IMEJinterspaceMAXratioB{0.55}





% command to revise the interword spacing for the current font under TeX:
% \fontdimen2 = nominal interword space
% \fontdimen3 = interword stretch
% \fontdimen4 = interword shrink
% since all changes to the \fontdimen are global, we can enclose these commands
% in braces to confine any font attribute or length changes
\def\@@@IMEJsetfontdimens#1#2#3{{%
\setlength{\@IMEJtmpdimenB}{\f@size pt}% grab the font size in pt, could use 1em instead.
\setlength{\@IMEJtmpdimenA}{#1\@IMEJtmpdimenB}%
\fontdimen2\font=\@IMEJtmpdimenA\relax
\addtolength{\@IMEJtmpdimenA}{-#2\@IMEJtmpdimenB}%
\fontdimen3\font=-\@IMEJtmpdimenA\relax
\setlength{\@IMEJtmpdimenA}{#1\@IMEJtmpdimenB}%
\addtolength{\@IMEJtmpdimenA}{-#3\@IMEJtmpdimenB}%
\fontdimen4\font=\@IMEJtmpdimenA\relax}}

% revise the interword spacing for each font weight
\def\@@IMEJsetfontdimens{{%
\mdseries
\@@@IMEJsetfontdimens{\@IMEJinterspaceratioM}{\@IMEJinterspaceMAXratioM}{\@IMEJinterspaceMINratioM}%
\bfseries
\@@@IMEJsetfontdimens{\@IMEJinterspaceratioB}{\@IMEJinterspaceMAXratioB}{\@IMEJinterspaceMINratioB}%
}}

% revise the interword spacing for each font shape
% \slshape is not often used for IMEJ work and is not altered here. The \scshape caps are
% already a tad too large in the free LaTeX fonts (as compared to what the IMEJ uses) so we
% won't alter these either.
\def\@IMEJsetfontdimens{{%
\normalfont
\@@IMEJsetfontdimens
\normalfont\itshape
\@@IMEJsetfontdimens
}}

% command to revise the interword spacing for each font size (and shape
% and weight). Only the \rmfamily is done here as \ttfamily uses a 
% fixed spacing and \sffamily is not used as the main text of IMEJ papers.
\def\@IMEJtunefonts{{\selectfont\rmfamily
\tiny\@IMEJsetfontdimens
\scriptsize\@IMEJsetfontdimens
\footnotesize\@IMEJsetfontdimens
\small\@IMEJsetfontdimens
\normalsize\@IMEJsetfontdimens
\sublargesize\@IMEJsetfontdimens
\large\@IMEJsetfontdimens
\LARGE\@IMEJsetfontdimens
\huge\@IMEJsetfontdimens
\Huge\@IMEJsetfontdimens}}

% if the nofonttune class option is not given, revise the interword spacing
% now - in case IMEJ makes any default length measurements, and make
% sure all the default fonts are loaded
\ifCLASSOPTIONnofonttune\else
\@IMEJtunefonts
\fi

% and again at the start of the document in case the user loaded different fonts
\AtBeginDocument{\ifCLASSOPTIONnofonttune\else\@IMEJtunefonts\fi}





% -- v1.0a page setup commands --

% The default sample text for calculating margins
% Note that IMEJ publications use \scriptsize for headers and footers.
\def\IMEJdefaultsampletext{\normalfont\normalsize gT}
\def\IMEJdefaultheadersampletext{\normalfont\scriptsize T}% IMEJ headers default to uppercase
\def\IMEJdefaultfootersampletext{\normalfont\scriptsize gT}



% usage: \IMEJsettextwidth{inner margin}{outer margin}
% Sets \textwidth to allow the specified inner and outer margins
% for the current \paperwidth.
\def\IMEJsettextwidth#1#2{\@IMEJtmpdimenA\paperwidth
\@IMEJtmpdimenB#1\relax
\advance\@IMEJtmpdimenA by -\@IMEJtmpdimenB
\@IMEJtmpdimenB#2\relax
\advance\@IMEJtmpdimenA by -\@IMEJtmpdimenB
\textwidth\@IMEJtmpdimenA}



% usage: \IMEJsetsidemargin{mode: i, o, c, a}{margin/offset}
% Sets \oddsidemargin and \evensidemargin to yield the specified margin
% of the given mode.
% The available modes are:
% i = inner margin
% o = outer margin
% c = centered, with the given offset
% a = adjust the margins using the given offset
% For the offsets, positive values increase the inner margin.
% \textwidth should be set properly for the given margins before calling this
% function.
\def\IMEJsetsidemargin#1#2{\@IMEJtmpdimenA #2\relax
\@IMEJextracttoken{#1}\relax
% check for mode errors
\ifx\@IMEJextractedtokenmacro\@empty
  \@IMEJclspkgerror{Empty mode type in \string\IMEJsetsidemargin\space (line \the\inputlineno).\MessageBreak
  Defaulting to `i'}{Valid modes for \string\IMEJsetsidemargin\space are: i, o, c and a.}\relax
  \let\@IMEJextractedtoken=i\relax
  \def\@IMEJextractedtokenmacro{i}\relax
\else
  \ifx\@IMEJextractedtokensdiscarded\@empty\else
    \typeout{** WARNING: \string\IMEJsetsidemargin\space mode specifiers after the first in `\@IMEJextracttokenarg' ignored (line \the\inputlineno).}\relax
  \fi
\fi
% handle each mode
\if\@IMEJextractedtoken a\relax
  \advance\oddsidemargin by \@IMEJtmpdimenA\relax
\else
\if\@IMEJextractedtoken c\relax
  \oddsidemargin\paperwidth
  \advance\oddsidemargin by -\textwidth
  \divide\oddsidemargin by 2\relax
  \advance\oddsidemargin by -1in\relax
  \advance\oddsidemargin by \@IMEJtmpdimenA\relax
\else
\if\@IMEJextractedtoken o\relax
  \oddsidemargin\paperwidth
  \advance\oddsidemargin by -\textwidth
  \advance\oddsidemargin by -\@IMEJtmpdimenA
  \advance\oddsidemargin by -1in\relax
\else
  \if\@IMEJextractedtoken i\relax
  \else
    \@IMEJclspkgerror{Unknown mode type `\@IMEJextractedtokenmacro' in \string\IMEJsetsidemargin\space (line \the\inputlineno).\MessageBreak
    Defaulting to `i'}%
    {Valid modes for \string\IMEJsetsidemargin\space are: i, o, c  and a.}%
  \fi
  \oddsidemargin\@IMEJtmpdimenA
  \advance\oddsidemargin by -1in\relax
\fi\fi\fi
% odd and even side margins both mean "inner" for single sided pages
\evensidemargin\oddsidemargin
% but are mirrors of each other when twosided is in effect
\if@twoside
  \evensidemargin\paperwidth
  \advance\evensidemargin by -\textwidth
  \advance\evensidemargin by -\oddsidemargin
  % have to compensate for both the builtin 1in LaTex offset
  % and the fact we already subtracted this offset from \oddsidemargin
  \advance\evensidemargin -2in\relax
\fi}



% usage: \IMEJsettextheight[sample text]{top text margin}{bottom text margin}
% Sets \textheight based on the specified top margin and bottom margin.
% Takes into consideration \paperheight, \topskip, and (by default) the
% the actual height and depth of the \IMEJdefaultsampletext text. 
\def\IMEJsettextheight{\@ifnextchar [{\@IMEJsettextheight}{\@IMEJsettextheight[\IMEJdefaultsampletext]}}
\def\@IMEJsettextheight[#1]#2#3{\textheight\paperheight\relax
  \@IMEJtmpdimenA #2\relax
  \advance \textheight by -\@IMEJtmpdimenA% subtract top margin
  \@IMEJtmpdimenA #3\relax
  \advance \textheight by -\@IMEJtmpdimenA% subtract bottom margin
  \advance \textheight by \topskip% add \topskip
  % subtract off everything above the top, and below the bottom, baselines
  \settoheight{\@IMEJtmpdimenA}{\begingroup #1\relax\relax\relax\endgroup}\relax
  \advance \textheight by -\@IMEJtmpdimenA
  \settodepth{\@IMEJtmpdimenA}{\begingroup #1\relax\relax\relax\endgroup}\relax
  \advance \textheight by -\@IMEJtmpdimenA}



\newdimen\IMEJquantizedlength
\IMEJquantizedlength 0sp\relax
\newdimen\IMEJquantizedlengthdiff
\IMEJquantizedlengthdiff 0sp\relax
\def\IMEJquantizedlengthint{0}

% usage: \IMEJquantizelength{mode: d, c, i}{base unit}{length}
% Sets the length \IMEJquantizedlength to be an integer multiple of the given
% (nonzero) base unit such that \IMEJquantizedlength approximates the given
% length.
% \IMEJquantizedlengthdiff is a length equal to the difference between the
% \IMEJquantizedlength and the given length.
% \IMEJquantizedlengthint is a macro containing the integer number of base units
% in \IMEJquantizedlength.
% i.e., \IMEJquantizedlength =  \IMEJquantizedlengthint * base unit
% The mode determines how \IMEJquantizedlength is quantized:
% d = always decrease (always round down \IMEJquantizeint)
% c = use the closest match
% i = always increase (always round up \IMEJquantizeint)
% In anycase, if the given length is already quantized,
% \IMEJquantizedlengthdiff will be set to zero.
\def\IMEJquantizelength#1#2#3{\begingroup
% work in isolation so as not to externally disturb the \@IMEJtmp
% variables
% load the argument values indirectly via \IMEJquantizedlengthdiff
% in case the user refers to our \@IMEJtmpdimenX, \IMEJquantizedlength,
% etc. in the arguments. we also will work with these as counters,
% i.e., in sp units
% A has the base unit
\IMEJquantizedlengthdiff #2\relax\relax\relax\relax
\@IMEJtmpcountA\IMEJquantizedlengthdiff
% B has the input length
\IMEJquantizedlengthdiff #3\relax\relax\relax\relax
\@IMEJtmpcountB\IMEJquantizedlengthdiff
\@IMEJtmpdimenA\the\@IMEJtmpcountA sp\relax
\@IMEJtmpdimenB\the\@IMEJtmpcountB sp\relax
% \@IMEJtmpcountC will have the quantized int
% \IMEJquantizedlength will have the quantized length
% \@IMEJtmpdimenC will have the quantized diff
% initialize them to zero as this is what will be
% exported if an error occurs
\@IMEJtmpcountC 0\relax
\IMEJquantizedlength 0sp\relax
\@IMEJtmpdimenC 0sp\relax
% extract mode
\@IMEJextracttoken{#1}\relax
% check for mode errors
\ifx\@IMEJextractedtokenmacro\@empty
  \@IMEJclspkgerror{Empty mode type in \string\IMEJquantizelength\space (line \the\inputlineno).\MessageBreak
  Defaulting to `d'}{Valid modes for \string\IMEJquantizelength\space are: d, c and i.}\relax
  \let\@IMEJextractedtoken=d\relax
  \def\@IMEJextractedtokenmacro{d}\relax
\else
  \ifx\@IMEJextractedtokensdiscarded\@empty\else
    \typeout{** WARNING: \string\IMEJquantizelength\space mode specifiers after the first in `\@IMEJextracttokenarg' ignored (line \the\inputlineno).}\relax
  \fi
\fi
% check for base unit is zero error
\ifnum\@IMEJtmpcountA=0\relax
\@IMEJclspkgerror{Base unit is zero in \string\IMEJquantizelength\space (line \the\inputlineno).\MessageBreak
  \string\IMEJquantizedlength\space and \string\IMEJquantizedlengthdiff\space are set to zero}{Division by zero is not allowed.}\relax
\else% base unit is nonzero
  % \@IMEJtmpcountC carries the number of integer units
  % in the quantized length (integer length \ base)
  \@IMEJtmpcountC\@IMEJtmpcountB\relax
  \divide\@IMEJtmpcountC by \@IMEJtmpcountA\relax
  % \IMEJquantizedlength has the (rounded down) quantized length
  % = base * int
  \IMEJquantizedlength\@IMEJtmpdimenA\relax
  \multiply\IMEJquantizedlength by \@IMEJtmpcountC\relax
  % \@IMEJtmpdimenC has the difference
  % = quantized length - length
  \@IMEJtmpdimenC\IMEJquantizedlength\relax
  \advance\@IMEJtmpdimenC by -\@IMEJtmpdimenB\relax
  % trap special case of length being already quantized
  % to avoid a roundup under i option
  \ifdim\@IMEJtmpdimenC=0sp\relax
  \else % length not is already quantized
    % set dimenA to carry the upper quantized (absolute value) difference:
    % quantizedlength + base - length
    \advance\@IMEJtmpdimenA by \IMEJquantizedlength\relax
    \advance\@IMEJtmpdimenA by -\@IMEJtmpdimenB\relax
    % set dimenB to carry the lower quantized (absolute value) difference:
    % length - quantizedlength
    \advance\@IMEJtmpdimenB by -\IMEJquantizedlength\relax
    % handle each mode
    \if\@IMEJextractedtoken c\relax
      % compare upper and lower amounts, select upper if lower > upper
      \ifdim\@IMEJtmpdimenB>\@IMEJtmpdimenA\relax
        % use upper
        \advance\IMEJquantizedlength by \the\@IMEJtmpcountA sp\relax
        \advance\@IMEJtmpcountC by 1\relax
        \@IMEJtmpdimenC\@IMEJtmpdimenA
      \else% <=. uselower
        % no need to do anything for lower, use output values already setup
      \fi
    \else% not mode c
    \if\@IMEJextractedtoken i\relax
      % always round up under i mode
      \advance\IMEJquantizedlength by \the\@IMEJtmpcountA sp\relax
      \advance\@IMEJtmpcountC by 1\relax
      \@IMEJtmpdimenC\@IMEJtmpdimenA
    \else
      \if\@IMEJextractedtoken d\relax
      \else
        \@IMEJclspkgerror{Unknown mode type `\@IMEJextractedtokenmacro' in \string\IMEJquantizelength\space (line \the\inputlineno).\MessageBreak
        Defaulting to `d'}%
        {Valid modes for \string\IMEJquantizelength\space are: d, c, and i.}\relax
      \fi % if d
      % no need to do anything for d, use output values already setup
    \fi\fi % if i, c
  \fi % if length is already quantized
\fi% if base unit is zero
% globally assign the results to macros we use here to escape the enclosing
% group without needing to call \global on any of the \@IMEJtmp variables.
% \@IMEJtmpcountC has the quantized int
% \IMEJquantizedlength has the quantized length
% \@IMEJtmpdimenC has the quantized diff
\xdef\@IMEJquantizedlengthintmacro{\the\@IMEJtmpcountC}\relax
\@IMEJtmpcountC\IMEJquantizedlength\relax
\xdef\@IMEJquantizedlengthmacro{\the\@IMEJtmpcountC}\relax
\@IMEJtmpcountC\@IMEJtmpdimenC\relax
\xdef\@IMEJquantizedlengthdiffmacro{\the\@IMEJtmpcountC}\relax
\endgroup
% locally assign the outputs here from the macros
\expandafter\IMEJquantizedlength\@IMEJquantizedlengthmacro sp\relax
\expandafter\IMEJquantizedlengthdiff\@IMEJquantizedlengthdiffmacro sp\relax
\edef\IMEJquantizedlengthint{\@IMEJquantizedlengthintmacro}\relax}



\newdimen\IMEJquantizedtextheightdiff
\IMEJquantizedtextheightdiff 0sp\relax

% usage: \IMEJquantizetextheight[base unit]{mode: d, c, i}
% Sets \textheight to be an integer multiple of the current \baselineskip
% (or the optionally specified base unit) plus the first (\topskip) line.
% \IMEJquantizedtextheightdiff is a length equal to the difference between
% the new quantized and original \textheight.
% \IMEJquantizedtextheightlpc is a macro containing the integer number of
% lines per column under the quantized \textheight. i.e.,
% \textheight = \IMEJquantizedtextheightlpc * \baselineskip + \topskip
% The mode determines how \textheight is quantized:
% d = always decrease (always round down the number of lines per column)
% c = use the closest match
% i = always increase (always round up the number of lines per column)
% In anycase, if \textheight is already quantized, it will remain unchanged,
% and \IMEJquantizedtextheightdiff will be set to zero.
% Depends on: \IMEJquantizelength
\def\IMEJquantizetextheight{\@ifnextchar [{\@IMEJquantizetextheight}{\@IMEJquantizetextheight[\baselineskip]}}
\def\@IMEJquantizetextheight[#1]#2{\begingroup
% use our \IMEJquantizedtextheightdiff as a scratch pad
% we need to subtract off \topskip before quantization
\IMEJquantizedtextheightdiff\textheight
\advance\IMEJquantizedtextheightdiff by -\topskip\relax
\IMEJquantizelength{#2}{#1}{\IMEJquantizedtextheightdiff}
% add back \topskip line
\advance\IMEJquantizedlength by \topskip
\@IMEJtmpcountC\IMEJquantizedlengthint\relax
\advance\@IMEJtmpcountC by 1\relax
% globally assign the results to macros we use here to escape the enclosing
% group without needing to call \global on any of the \@IMEJtmp variables.
\xdef\@IMEJquantizedtextheightlpcmacro{\the\@IMEJtmpcountC}\relax
\@IMEJtmpcountC\IMEJquantizedlength\relax
\xdef\@IMEJquantizedtextheightmacro{\the\@IMEJtmpcountC}\relax
\@IMEJtmpcountC\IMEJquantizedlengthdiff\relax
\xdef\@IMEJquantizedtextheightdiffmacro{\the\@IMEJtmpcountC}\relax
\endgroup
% locally assign the outputs here from the macros
\textheight\@IMEJquantizedtextheightmacro sp\relax
\IMEJquantizedtextheightdiff\@IMEJquantizedtextheightdiffmacro sp\relax
\edef\IMEJquantizedtextheightlpc{\@IMEJquantizedtextheightlpcmacro}}



% usage: \IMEJsettopmargin[sample text]{mode: t, b, c, a, q}{margin/offset}
% Sets \topmargin based on the specified vertical margin.
% Takes into consideration the base 1in offset, \headheight, \headsep,
% \topskip, and (by default) the the actual height (or, for the bottom, depth)
% of the \IMEJdefaultsampletext text.
% The available modes are:
% t = top margin
% b = bottom margin
% c = vertically centered, with the given offset
% a = adjust the vertical margins using the given offset
% q = adjust the margins using \IMEJquantizedtextheightdiff and the given offset
% For the offsets, positive values increase the top margin.
% \headheight, \headsep, \topskip and \textheight should be set properly for the
% given margins before calling this function.
\def\IMEJsettopmargin{\@ifnextchar [{\@IMEJsettopmargin}{\@IMEJsettopmargin[\IMEJdefaultsampletext]}}
\def\@IMEJsettopmargin[#1]#2#3{\@IMEJtmpdimenA #3\relax
\@IMEJextracttoken{#2}\relax
% check for mode errors
\ifx\@IMEJextractedtokenmacro\@empty
  \@IMEJclspkgerror{Empty mode type in \string\IMEJsettopmargin\space (line \the\inputlineno).\MessageBreak
  Defaulting to `t'}{Valid modes for \string\IMEJsettopmargin\space are: t, b, c, a and q.}\relax
  \let\@IMEJextractedtoken=t\relax
  \def\@IMEJextractedtokenmacro{t}\relax
\else
  \ifx\@IMEJextractedtokensdiscarded\@empty\else
    \typeout{** WARNING: \string\IMEJsettopmargin\space mode specifiers after the first in `\@IMEJextracttokenarg' ignored (line \the\inputlineno).}\relax
  \fi
\fi
% handle each mode
\if\@IMEJextractedtoken a\relax
  \advance\topmargin by \@IMEJtmpdimenA\relax
\else
\if\@IMEJextractedtoken q\relax
  % we need to adjust by half the \IMEJquantizedtextheightdiff value
  \@IMEJtmpdimenB\IMEJquantizedtextheightdiff\relax
  \divide\@IMEJtmpdimenB by 2\relax
  % a positive \IMEJquantizedtextheightdiff means we need to reduce \topmargin
  % because \textheight has been lenghtened
  \advance\topmargin by -\@IMEJtmpdimenB\relax
  \advance\topmargin by \@IMEJtmpdimenA\relax
\else
\if\@IMEJextractedtoken c\relax
  \topmargin\paperheight
  \advance\topmargin by -\textheight
  % \textheight includes \topskip, but we should not count topskip whitespace here, backout
  \advance \topmargin by \topskip
  \settoheight{\@IMEJtmpdimenB}{\begingroup #1\relax\relax\relax\endgroup}\relax
  \advance\topmargin by -\@IMEJtmpdimenB\relax
  \settodepth{\@IMEJtmpdimenB}{\begingroup #1\relax\relax\relax\endgroup}\relax
  \advance\topmargin by -\@IMEJtmpdimenB\relax
  \divide\topmargin by 2\relax
  \advance\topmargin by \@IMEJtmpdimenA\relax
\else
\if\@IMEJextractedtoken b\relax
  \topmargin\paperheight
  \advance\topmargin by -\textheight
  % \textheight includes \topskip, but we should not count topskip whitespace here, backout
  \advance \topmargin by \topskip
  \settodepth{\@IMEJtmpdimenB}{\begingroup #1\relax\relax\relax\endgroup}\relax
  \advance\topmargin by -\@IMEJtmpdimenB\relax
  \advance\topmargin by -\@IMEJtmpdimenA\relax
\else
  \if\@IMEJextractedtoken t\relax
  \else
    \@IMEJclspkgerror{Unknown mode type `\@IMEJextractedtokenmacro' in \string\IMEJsettopmargin\space (line \the\inputlineno).\MessageBreak
    Defaulting to `t'}%
    {Valid modes for \string\IMEJsettopmargin\space are: t, b, c, a and q.}\relax
  \fi
  \topmargin\@IMEJtmpdimenA\relax
  \settoheight{\@IMEJtmpdimenB}{\begingroup #1\relax\relax\relax\endgroup}\relax
  \advance\topmargin by \@IMEJtmpdimenB\relax
\fi\fi % if t, b, c
% convert desired top margin into actual \topmargin
% this is not done for the q or a modes because they are only adjustments
\advance \topmargin by -\topskip
\advance \topmargin by -1in
\advance \topmargin by -\headheight
\advance \topmargin by -\headsep
\fi\fi % if q, a
}



% usage: \IMEJsetheadermargin[header sample][text sample]{mode: t, b, c, a}{margin/offset}
% Differentially adjusts \topmargin and \headsep (such that their sum is unchanged)
% based on the specified header margin.
% Takes into consideration the base 1in offset, \headheight, \topskip, and (by default)
% the actual height (or depth) of the \IMEJdefaultheadersampletext and
% \IMEJdefaultsampletext text.
% The available modes are:
% t = top margin (top of the header text to the top of the page)
% b = bottom margin (bottom of the header text to the top of the main text)
% c = vertically centered between the main text and the top of the page,
%     with the given offset
% a = adjust the vertical position using the given offset
% For the offsets, positive values move the header downward.
% \headheight, \headsep, \topskip and \topmargin should be set properly before
% calling this function.
\def\IMEJsetheadermargin{\@ifnextchar [{\@IMEJsetheadermargin}{\@IMEJsetheadermargin[\IMEJdefaultheadersampletext]}}
\def\@IMEJsetheadermargin[#1]{\@ifnextchar [{\@@IMEJsetheadermargin[#1]}{\@@IMEJsetheadermargin[#1][\IMEJdefaultsampletext]}}
\def\@@IMEJsetheadermargin[#1][#2]#3#4{\@IMEJtmpdimenA #4\relax
\@IMEJextracttoken{#3}\relax
% check for mode errors
\ifx\@IMEJextractedtokenmacro\@empty
  \@IMEJclspkgerror{Empty mode type in \string\IMEJsetheadermargin\space (line \the\inputlineno).\MessageBreak
  Defaulting to `t'}{Valid modes for \string\IMEJsetheadermargin\space are: t, b, c, and a.}\relax
  \let\@IMEJextractedtoken=t\relax
  \def\@IMEJextractedtokenmacro{t}\relax
\else
  \ifx\@IMEJextractedtokensdiscarded\@empty\else
    \typeout{** WARNING: \string\IMEJsetheadermargin\space mode specifiers after the first in `\@IMEJextracttokenarg' ignored (line \the\inputlineno).}\relax
  \fi
\fi
% handle each mode
\if\@IMEJextractedtoken a\relax
  % No need to do anything here and can pass through the adjustment
  % value as is. The end adjustment of \topmargin and \headsep will
  % do all that is needed
\else
\if\@IMEJextractedtoken c\relax
  % get the bottom margin
  \@IMEJtmpdimenB\headsep\relax
  \settodepth{\@IMEJtmpdimenC}{\begingroup #1\relax\relax\relax\endgroup}\relax
  \advance\@IMEJtmpdimenB by -\@IMEJtmpdimenC
  \advance\@IMEJtmpdimenB by \topskip
  \settoheight{\@IMEJtmpdimenC}{\begingroup #2\relax\relax\relax\endgroup}\relax
  \advance\@IMEJtmpdimenB by -\@IMEJtmpdimenC
  % at this point \@IMEJtmpdimenB has the actual header bottom margin
  % subtract from it the top header margin
  \advance\@IMEJtmpdimenB -1in\relax % take into consideration the system 1in offset of the top margin
  \advance\@IMEJtmpdimenB by -\topmargin
  \advance\@IMEJtmpdimenB by -\headheight
  \settoheight{\@IMEJtmpdimenC}{\begingroup #1\relax\relax\relax\endgroup}\relax
  \advance\@IMEJtmpdimenB by \@IMEJtmpdimenC
  % at this point \@IMEJtmpdimenB has the difference between the bottom and top margins
  % we need to adjust by half this amount to center the header
  \divide\@IMEJtmpdimenB by 2\relax
  % and add to offset
  \advance\@IMEJtmpdimenA by \@IMEJtmpdimenB
\else
\if\@IMEJextractedtoken b\relax
  \@IMEJtmpdimenB\headsep\relax
  \settodepth{\@IMEJtmpdimenC}{\begingroup #1\relax\relax\relax\endgroup}\relax
  \advance\@IMEJtmpdimenB by -\@IMEJtmpdimenC
  \advance\@IMEJtmpdimenB by \topskip
  \settoheight{\@IMEJtmpdimenC}{\begingroup #2\relax\relax\relax\endgroup}\relax
  \advance\@IMEJtmpdimenB by -\@IMEJtmpdimenC
  % at this point \@IMEJtmpdimenB has the actual header bottom margin
  % get the difference between the actual and the desired
  \advance\@IMEJtmpdimenB by -\@IMEJtmpdimenA
  \@IMEJtmpdimenA\@IMEJtmpdimenB
\else
  \if\@IMEJextractedtoken t\relax
  \else
    \@IMEJclspkgerror{Unknown mode type `\@IMEJextractedtokenmacro' in \string\IMEJsetheadermargin\space (line \the\inputlineno).\MessageBreak
    Defaulting to `t'}%
    {Valid modes for \string\IMEJsetheadermargin\space are: t, b, c and a.}\relax
  \fi
  \@IMEJtmpdimenB 1in\relax % take into consideration the system 1in offset of the top margin
  \advance\@IMEJtmpdimenB by \topmargin
  \advance\@IMEJtmpdimenB by \headheight
  \settoheight{\@IMEJtmpdimenC}{\begingroup #1\relax\relax\relax\endgroup}\relax
  \advance\@IMEJtmpdimenB by -\@IMEJtmpdimenC
  % at this point \@IMEJtmpdimenB has the actual header top margin
  % get the difference between the desired and the actual
  \advance\@IMEJtmpdimenA by -\@IMEJtmpdimenB
\fi\fi % if t, b, c
\fi % if a
% advance \topmargin by the needed amount and reduce \headsep by the same
% so as not to disturb the location of the main text
\advance\topmargin by \@IMEJtmpdimenA\relax
\advance\headsep by -\@IMEJtmpdimenA\relax
}



% usage: \IMEJsetfootermargin[footer sample][text sample]{mode: t, b, c, a}{margin/offset}
% Adjusts \footskip based on the specified footer margin.
% Takes into consideration the base 1in offset, \paperheight, \headheight,
% \headsep, \textheight and (by default) the actual height (or depth) of the
% \IMEJdefaultfootersampletext and \IMEJdefaultsampletext text.
% The available modes are:
% t = top margin (top of the footer text to the bottom of the main text)
% b = bottom margin (bottom of the footer text to the bottom of page)
% c = vertically centered between the main text and the bottom of the page,
%     with the given offset
% a = adjust the vertical position using the given offset
% For the offsets, positive values move the footer downward.
% \headheight, \headsep, \topskip, \topmargin, and \textheight should be set
% properly before calling this function.
\def\IMEJsetfootermargin{\@ifnextchar [{\@IMEJsetfootermargin}{\@IMEJsetfootermargin[\IMEJdefaultfootersampletext]}}
\def\@IMEJsetfootermargin[#1]{\@ifnextchar [{\@@IMEJsetfootermargin[#1]}{\@@IMEJsetfootermargin[#1][\IMEJdefaultsampletext]}}
\def\@@IMEJsetfootermargin[#1][#2]#3#4{\@IMEJtmpdimenA #4\relax
\@IMEJextracttoken{#3}\relax
% check for mode errors
\ifx\@IMEJextractedtokenmacro\@empty
  \@IMEJclspkgerror{Empty mode type in \string\IMEJsetfootermargin\space (line \the\inputlineno).\MessageBreak
  Defaulting to `t'}{Valid modes for \string\IMEJsetfootermargin\space are: t, b, c, and a.}\relax
  \let\@IMEJextractedtoken=t\relax
  \def\@IMEJextractedtokenmacro{t}\relax
\else
  \ifx\@IMEJextractedtokensdiscarded\@empty\else
    \typeout{** WARNING: \string\IMEJsetfootermargin\space mode specifiers after the first in `\@IMEJextracttokenarg' ignored (line \the\inputlineno).}\relax
  \fi
\fi
% handle each mode
\if\@IMEJextractedtoken a\relax
  % No need to do anything here and can pass through the adjustment
  % value as is. The end adjustment of \footskip will do all that
  % is needed
\else
\if\@IMEJextractedtoken c\relax
  % calculate the bottom margin
  \@IMEJtmpdimenB 1in\relax % system 1in offset
  \advance\@IMEJtmpdimenB\topmargin\relax
  \advance\@IMEJtmpdimenB\headheight\relax
  \advance\@IMEJtmpdimenB\headsep\relax
  \advance\@IMEJtmpdimenB\textheight\relax
  \advance\@IMEJtmpdimenB\footskip\relax
  \settodepth{\@IMEJtmpdimenC}{\begingroup #1\relax\relax\relax\endgroup}\relax
  \advance\@IMEJtmpdimenC by \@IMEJtmpdimenB
  \@IMEJtmpdimenB\paperheight
  \advance\@IMEJtmpdimenB by -\@IMEJtmpdimenC
  % at this point \@IMEJtmpdimenB has the actual footer bottom margin
  % now subtract off the footer top margin
  \advance\@IMEJtmpdimenB -\footskip\relax
  \settodepth{\@IMEJtmpdimenC}{\begingroup #2\relax\relax\relax\endgroup}\relax
  \advance\@IMEJtmpdimenB by \@IMEJtmpdimenC
  \settoheight{\@IMEJtmpdimenC}{\begingroup #1\relax\relax\relax\endgroup}\relax
  \advance\@IMEJtmpdimenB by \@IMEJtmpdimenC
  % at this point \@IMEJtmpdimenB has the difference between the bottom
  % and top footer margins
  % our adjustment must be half this value to center the footer
  \divide\@IMEJtmpdimenB by 2\relax
  % add to the offset
  \advance\@IMEJtmpdimenA by \@IMEJtmpdimenB
\else
\if\@IMEJextractedtoken b\relax
  % calculate the bottom margin
  \@IMEJtmpdimenB 1in\relax % system 1in offset
  \advance\@IMEJtmpdimenB\topmargin\relax
  \advance\@IMEJtmpdimenB\headheight\relax
  \advance\@IMEJtmpdimenB\headsep\relax
  \advance\@IMEJtmpdimenB\textheight\relax
  \advance\@IMEJtmpdimenB\footskip\relax
  \settodepth{\@IMEJtmpdimenC}{\begingroup #1\relax\relax\relax\endgroup}\relax
  \advance\@IMEJtmpdimenC by \@IMEJtmpdimenB
  \@IMEJtmpdimenB\paperheight
  \advance\@IMEJtmpdimenB by -\@IMEJtmpdimenC
  % at this point \@IMEJtmpdimenB has the actual footer bottom margin
  % get the difference between the actual and the desired
  \advance\@IMEJtmpdimenB by -\@IMEJtmpdimenA
  \@IMEJtmpdimenA\@IMEJtmpdimenB
\else
  \if\@IMEJextractedtoken t\relax
  \else
    \@IMEJclspkgerror{Unknown mode type `\@IMEJextractedtokenmacro' in \string\IMEJsetfootermargin\space (line \the\inputlineno).\MessageBreak
    Defaulting to `t'}%
    {Valid modes for \string\IMEJsetfootermargin\space are: t, b, c and a.}\relax
  \fi
  \@IMEJtmpdimenB\footskip\relax
  \settodepth{\@IMEJtmpdimenC}{\begingroup #2\relax\relax\relax\endgroup}\relax
  \advance\@IMEJtmpdimenB by -\@IMEJtmpdimenC
  \settoheight{\@IMEJtmpdimenC}{\begingroup #1\relax\relax\relax\endgroup}\relax
  \advance\@IMEJtmpdimenB by -\@IMEJtmpdimenC
  % at this point \@IMEJtmpdimenB has the actual footer top margin
  % get the difference between the desired and the actual
  \advance\@IMEJtmpdimenA by -\@IMEJtmpdimenB
\fi\fi % if t, b, c
\fi % if a
% advance \footskip by the needed amount
\advance\footskip by \@IMEJtmpdimenA\relax
}

% -- End v1.0a page setup commands --





% v1.0
% LaTeX is a little to quick to use hyphenations
% So, we increase the penalty for their use and raise
% the badness level that triggers an underfull hbox
% warning. The author may still have to tweak things,
% but the appearance will be much better "right out
% of the box" than that under v1.0 and prior.
% TeX default is 50
\hyphenpenalty=750

% If we didn't adjust the interword spacing, 2200 might be better.
% The TeX default is 1000
\hbadness=1350
% The IMEJ does not use extra spacing after punctuation
\frenchspacing

% v1.0 increase this a tad to discourage equation breaks
\binoppenalty=1000 % default 700
\relpenalty=800     % default 500

% v1.8a increase these to discourage widows and orphans
\clubpenalty=1000          % default 150
\widowpenalty=1000         % default 150
\displaywidowpenalty=1000 % default  50


% margin note stuff
\marginparsep      10pt
\marginparwidth    20pt
\marginparpush     25pt


% if things get too close, go ahead and let them touch
\lineskip            0pt
\normallineskip      0pt
\lineskiplimit       0pt
\normallineskiplimit 0pt

% The distance from the lower edge of the text body to the
% footline
\footskip 0.4in

% normally zero, should be relative to font height.
% put in a little rubber to help stop some bad breaks (underfull vboxes)
\parskip 0ex plus 0.2ex minus 0.1ex

\parindent    1.0em

%%% LB 2018:
\headheight   12pt
\headsep      8mm
%%%

% use the normal font baselineskip
% so that \topskip is unaffected by changes in \baselinestretch
\topskip=\@IMEJnormalsizeunitybaselineskip


% v1.0 \maxdepth defaults to 4pt, but should be font size dependent
\maxdepth=0.5\@IMEJnormalsizeunitybaselineskip

%%% LB 2018:
\textheight       261mm  
%%%

% set the default top margin to 58pt
% which results in a \topmargin of -49.59pt for 10pt documents
\IMEJsettopmargin{t}{58pt}
% tweak textheight to a perfect integer number of lines/column.
% standard is: 9pt/63 lpc; 10pt/58 lpc; 11pt/52 lpc; 12pt/50 lpc
\IMEJquantizetextheight{c}
% tweak top margin so that the error is shared equally at the top and bottom
\IMEJsettopmargin{q}{0sp}

%%% LB 2018:
\columnsep         6mm
\textwidth        178mm   % 2 x 86mm + 6mm = 178mm
%%%


% set the default side margins to center the text
\IMEJsetsidemargin{c}{0pt}



% draft mode settings override that of all other modes
% provides a nice 1in margin all around the paper and extra
% space between the lines for editor's comments
\ifCLASSOPTIONdraftcls
  % we want 1in side margins regardless of paper type
  \IMEJsettextwidth{1in}{1in}
  \IMEJsetsidemargin{c}{0pt}
  % want 1in top and bottom margins
  \IMEJsettextheight{1in}{1in}
  \IMEJsettopmargin{t}{1in}
  % digitize textheight to be an integer number of lines.
  % this may cause the top and bottom margins to be off a tad
  \IMEJquantizetextheight{c}
  % tweak top margin so that the error is shared equally at the top and bottom
  \IMEJsettopmargin{q}{0sp}
\fi



% process CLASSINPUT inner/outer margin
% if inner margin defined, but outer margin not, set outer to inner.
\ifx\CLASSINPUTinnersidemargin\@IMEJundefined
\else
  \ifx\CLASSINPUToutersidemargin\@IMEJundefined
    \edef\CLASSINPUToutersidemargin{\CLASSINPUTinnersidemargin}
  \fi
\fi

\ifx\CLASSINPUToutersidemargin\@IMEJundefined
\else
  % if outer margin defined, but inner margin not, set inner to outer.
  \ifx\CLASSINPUTinnersidemargin\@IMEJundefined
    \edef\CLASSINPUTinnersidemargin{\CLASSINPUToutersidemargin}
  \fi
  \IMEJsettextwidth{\CLASSINPUTinnersidemargin}{\CLASSINPUToutersidemargin}
  \IMEJsetsidemargin{i}{\CLASSINPUTinnersidemargin}
  \typeout{** ATTENTION: Overriding inner side margin to \CLASSINPUTinnersidemargin\space and 
           outer side margin to \CLASSINPUToutersidemargin\space via \string\CLASSINPUT.}
\fi



% process CLASSINPUT top/bottom text margin
% if toptext margin defined, but bottomtext margin not, set bottomtext to toptext margin
\ifx\CLASSINPUTtoptextmargin\@IMEJundefined
\else
  \ifx\CLASSINPUTbottomtextmargin\@IMEJundefined
    \edef\CLASSINPUTbottomtextmargin{\CLASSINPUTtoptextmargin}
  \fi
\fi

\ifx\CLASSINPUTbottomtextmargin\@IMEJundefined
\else
  % if bottomtext margin defined, but toptext margin not, set toptext to bottomtext margin
  \ifx\CLASSINPUTtoptextmargin\@IMEJundefined
    \edef\CLASSINPUTtoptextmargin{\CLASSINPUTbottomtextmargin}
  \fi
  \IMEJsettextheight{\CLASSINPUTtoptextmargin}{\CLASSINPUTbottomtextmargin}
  \IMEJsettopmargin{t}{\CLASSINPUTtoptextmargin}
  \typeout{** ATTENTION: Overriding top text margin to \CLASSINPUTtoptextmargin\space and 
           bottom text margin to \CLASSINPUTbottomtextmargin\space via \string\CLASSINPUT.}
\fi



% default to center header and footer text in the margins
\IMEJsetheadermargin{c}{0pt}
\IMEJsetfootermargin{c}{0pt}



% v1.0a display lines per column info message on user's console
\def\IMEJdisplayinfolinespercolumn{\@IMEJtmpdimenA=\textheight
% topskip represents only one line even if > baselineskip
\advance\@IMEJtmpdimenA by -1\topskip
\@IMEJtmpcountA=\@IMEJtmpdimenA
\@IMEJtmpcountB=\@IMEJtmpdimenA
\divide\@IMEJtmpcountB by \baselineskip
% need to add one line to include topskip (first) line
\advance\@IMEJtmpcountB by 1
% save lines per column value as text
\edef\@IMEJnumlinespercolumninfotxt{\the\@IMEJtmpcountB}
% backout topskip advance to allow direct \@IMEJtmpcountA comparison
\advance\@IMEJtmpcountB by -1
% restore value as text height (without topskip) rather than just as number of lines
\multiply\@IMEJtmpcountB by \baselineskip
% is the column height an integer number of lines per column?
\ifnum\@IMEJtmpcountA=\@IMEJtmpcountB
\edef\@IMEJnumlinespercolumnexactinfotxt{exact}
\else
\@IMEJtmpdimenA\@IMEJtmpcountA sp\relax
\advance\@IMEJtmpdimenA by -\@IMEJtmpcountB sp\relax
\edef\@IMEJnumlinespercolumnexactinfotxt{approximate, difference = \the\@IMEJtmpdimenA}
\fi
\typeout{-- Lines per column: \@IMEJnumlinespercolumninfotxt\space (\@IMEJnumlinespercolumnexactinfotxt).}}
% delay execution till start of document to allow for user changes
\AtBeginDocument{\IMEJdisplayinfolinespercolumn}



% LIST SPACING CONTROLS

% Controls the amount of EXTRA spacing
% above and below \trivlist 
% Both \list and IED lists override this.
% However, \trivlist will use this as will most
% things built from \trivlist like the \center
% environment.
\topsep           0.5\baselineskip

% Controls the additional spacing around lists preceded
% or followed by blank lines. the IMEJ does not increase
% spacing before or after paragraphs so it is set to zero.
% \z@ is the same as zero, but faster.
\partopsep          \z@

% Controls the spacing between paragraphs in lists. 
% The IMEJ does not increase spacing before or after paragraphs
% so this is also zero. 
% With IMEJ.cls, global changes to
% this value DO affect lists (but not IED lists).
\parsep             \z@

% Controls the extra spacing between list items. 
% The IMEJ does not put extra spacing between items.
% With IMEJ.cls, global changes to this value DO affect
% lists (but not IED lists).
\itemsep            \z@

% \itemindent is the amount to indent the FIRST line of a list
% item. It is auto set to zero within the \list environment. To alter
% it, you have to do so when you call the \list.
% However, the IMEJ uses this for the theorem environment
% There is an alternative value for this near \leftmargini below
\itemindent         -1em

% \leftmargin, the spacing from the left margin of the main text to
% the left of the main body of a list item is set by \list.
% Hence this statement does nothing for lists.
% But, quote and verse do use it for indention.
\leftmargin         2em

% we retain this stuff from the older IMEJ.cls so that \list
% will work the same way as before. However, itemize, enumerate and
% description (IED) could care less about what these are as they
% all are overridden.
\leftmargini        2em
%\itemindent         2em  % Alternative values: sometimes used.
%\leftmargini        0em
\leftmarginii       1em
\leftmarginiii    1.5em
\leftmarginiv     1.5em
\leftmarginv      1.0em
\leftmarginvi     1.0em
\labelsep         0.5em 
\labelwidth         \z@


% The old IMEJ.cls behavior of \list is retained.
% However, the new V1.3 IED list environments override all the
% @list stuff (\@listX is called within \list for the
% appropriate level just before the user's list_decl is called). 
% \topsep is now 2pt as the IMEJ puts a little extra space around
% lists - used by those non-IED macros that depend on \list.
% Note that \parsep and \itemsep are not redefined as in 
% the sizexx.clo \@listX (which article.cls uses) so global changes
% of these values DO affect \list
% 
\def\@listi{\leftmargin\leftmargini \topsep 2pt plus 1pt minus 1pt}
\let\@listI\@listi
\def\@listii{\leftmargin\leftmarginii\labelwidth\leftmarginii%
    \advance\labelwidth-\labelsep \topsep 2pt}
\def\@listiii{\leftmargin\leftmarginiii\labelwidth\leftmarginiii%
    \advance\labelwidth-\labelsep \topsep 2pt}
\def\@listiv{\leftmargin\leftmarginiv\labelwidth\leftmarginiv%
    \advance\labelwidth-\labelsep \topsep 2pt}
\def\@listv{\leftmargin\leftmarginv\labelwidth\leftmarginv%
    \advance\labelwidth-\labelsep \topsep 2pt}
\def\@listvi{\leftmargin\leftmarginvi\labelwidth\leftmarginvi%
    \advance\labelwidth-\labelsep \topsep 2pt}


% The IMEJ uses 5) not 5.
\def\labelenumi{\theenumi)}     \def\theenumi{\arabic{enumi}}

% The IMEJ uses a) not (a)
\def\labelenumii{\theenumii)}  \def\theenumii{\alph{enumii}}

% The IMEJ uses iii) not iii.
\def\labelenumiii{\theenumiii)} \def\theenumiii{\roman{enumiii}}

% The IMEJ uses A) not A.
\def\labelenumiv{\theenumiv)}   \def\theenumiv{\Alph{enumiv}}

% exactly the same as in article.cls
\def\p@enumii{\theenumi}
\def\p@enumiii{\theenumi(\theenumii)}
\def\p@enumiv{\p@enumiii\theenumiii}

% itemized list label styles
\def\labelitemi{$\scriptstyle\bullet$}
\def\labelitemii{\textbf{--}}
\def\labelitemiii{$\ast$}
\def\labelitemiv{$\cdot$}



% **** V1.3 ENHANCEMENTS ****
% Itemize, Enumerate and Description (IED) List Controls
% ***************************
% 
% Itemized list indentation
\newdimen\IMEJilabelindent
\IMEJilabelindent \parindent

% This controls the default amount the enumerated list labels
% are indented to the right.
% Normally, this is the same as the paragraph indention
\newdimen\IMEJelabelindent
\IMEJelabelindent \parindent

% This controls the default amount the description list labels
% are indented to the right.
% Normally, this is the same as the paragraph indention
\newdimen\IMEJdlabelindent
\IMEJdlabelindent \parindent

% This is the value actually used within the IED lists.
% The IED environments automatically set its value to
% one of the three values above, so global changes do 
% not have any effect
\newdimen\IMEJlabelindent
\IMEJlabelindent \parindent

% The actual amount labels will be indented is
% \IMEJlabelindent multiplied by the factor below
% corresponding to the level of nesting depth
% This provides a means by which the user can
% alter the effective \IMEJlabelindent for deeper
% levels
% There may not be such a thing as correct "standard IMEJ"
% values. What the IMEJ actually does may depend on the specific
% circumstances.
% The first list level almost always has full indention.
% The second levels I've seen have only 75% of the normal indentation
% Three level or greater nestings are very rare. I am guessing
% that they don't use any indentation.
\def\IMEJlabelindentfactori{1.0}   % almost always one
\def\IMEJlabelindentfactorii{0.75} % 0.0 or 1.0 may be used in some cases
\def\IMEJlabelindentfactoriii{0.0} % 0.75? 0.5? 0.0?
\def\IMEJlabelindentfactoriv{0.0}
\def\IMEJlabelindentfactorv{0.0}
\def\IMEJlabelindentfactorvi{0.0}

% value actually used within IED lists, it is auto
% set to one of the 6 values above
% global changes here have no effect
\def\IMEJlabelindentfactor{1.0}

% This controls the default spacing between the end of the IED
% list labels and the list text, when normal text is used for
% the labels.
% compsoc uses a larger value here, but we'll set that later
% in the class so that this code block area can be extracted
% as-is for IMEJtools.sty
\newdimen\IMEJiednormlabelsep
\IMEJiednormlabelsep 0.6em

% This controls the default spacing between the end of the IED
% list labels and the list text, when math symbols are used for
% the labels (nomenclature lists). The IMEJ usually increases the 
% spacing in these cases
\newdimen\IMEJiedmathlabelsep
\IMEJiedmathlabelsep 1.2em

% This controls the extra vertical separation put above and
% below each IED list. the IMEJ usually puts a little extra spacing
% around each list. However, this spacing is barely noticeable.
% compsoc uses a larger value here, but we'll set that later
% in the class so that this code block area can be extracted
% as-is for IMEJtools.sty
\newskip\IMEJiedtopsep
\IMEJiedtopsep 2pt plus 1pt minus 1pt


% This command is executed within each IED list environment
% at the beginning of the list. You can use this to set the 
% parameters for some/all your IED list(s) without disturbing 
% global parameters that affect things other than lists.
% i.e., renewcommand{\IMEJiedlistdecl}{\setlength{\labelsep}{5em}}
% will alter the \labelsep for the next list(s) until 
% \IMEJiedlistdecl is redefined. 
\def\IMEJiedlistdecl{\relax}

% This command provides an easy way to set \leftmargin based
% on the \labelwidth, \labelsep and the argument \IMEJlabelindent
% Usage: \IMEJcalcleftmargin{width-to-indent-the-label}
% output is in the \leftmargin variable, i.e., effectively:
% \leftmargin = argument + \labelwidth + \labelsep
% Note controlled spacing here, shield end of lines with %
\def\IMEJcalcleftmargin#1{\setlength{\leftmargin}{#1}%
\addtolength{\leftmargin}{\labelwidth}%
\addtolength{\leftmargin}{\labelsep}}

% This command provides an easy way to set \labelwidth to the
% width of the given text. It is the same as
% \settowidth{\labelwidth}{label-text}
% and useful as a shorter alternative.
% Typically used to set \labelwidth to be the width
% of the longest label in the list
\def\IMEJsetlabelwidth#1{\settowidth{\labelwidth}{#1}}

% When this command is executed, IED lists will use the 
% IMEJiedmathlabelsep label separation rather than the normal
% spacing. To have an effect, this command must be executed via
% the \IMEJiedlistdecl or within the option of the IED list
% environments.
\def\IMEJusemathlabelsep{\setlength{\labelsep}{\IMEJiedmathlabelsep}}

% A flag which controls whether the IED lists automatically
% calculate \leftmargin from \IMEJlabelindent, \labelwidth and \labelsep
% Useful if you want to specify your own \leftmargin
% This flag must be set (\IMEJnocalcleftmargintrue or \IMEJnocalcleftmarginfalse) 
% via the \IMEJiedlistdecl or within the option of the IED list
% environments to have an effect.
\newif\ifIMEJnocalcleftmargin
\IMEJnocalcleftmarginfalse

% A flag which controls whether \IMEJlabelindent is multiplied by
% the \IMEJlabelindentfactor for each list level.
% This flag must be set via the \IMEJiedlistdecl or within the option 
% of the IED list environments to have an effect.
\newif\ifIMEJnolabelindentfactor
\IMEJnolabelindentfactorfalse


% internal variable to indicate type of IED label
% justification
% 0 - left; 1 - center; 2 - right
\def\@IMEJiedjustify{0}


% commands to allow the user to control IED
% label justifications. Use these commands within
% the IED environment option or in the \IMEJiedlistdecl
% Note that changing the normal list justifications
% is nonstandard and the IMEJ may not like it if you do so!
% I include these commands as they may be helpful to
% those who are using these enhanced list controls for
% other non-IMEJ related LaTeX work.
% itemize and enumerate automatically default to right
% justification, description defaults to left.
\def\IMEJiedlabeljustifyl{\def\@IMEJiedjustify{0}}%left
\def\IMEJiedlabeljustifyc{\def\@IMEJiedjustify{1}}%center
\def\IMEJiedlabeljustifyr{\def\@IMEJiedjustify{2}}%right




% commands to save to and restore from the list parameter copies
% this allows us to set all the list parameters within
% the list_decl and prevent \list (and its \@list) 
% from overriding any of our parameters
% v1.0 use \edefs instead of dimen's to conserve dimen registers
% Note controlled spacing here, shield end of lines with %
\def\@IMEJsavelistparams{\edef\@IMEJiedtopsep{\the\topsep}%
\edef\@IMEJiedlabelwidth{\the\labelwidth}%
\edef\@IMEJiedlabelsep{\the\labelsep}%
\edef\@IMEJiedleftmargin{\the\leftmargin}%
\edef\@IMEJiedpartopsep{\the\partopsep}%
\edef\@IMEJiedparsep{\the\parsep}%
\edef\@IMEJieditemsep{\the\itemsep}%
\edef\@IMEJiedrightmargin{\the\rightmargin}%
\edef\@IMEJiedlistparindent{\the\listparindent}%
\edef\@IMEJieditemindent{\the\itemindent}}

% Note controlled spacing here
\def\@IMEJrestorelistparams{\topsep\@IMEJiedtopsep\relax%
\labelwidth\@IMEJiedlabelwidth\relax%
\labelsep\@IMEJiedlabelsep\relax%
\leftmargin\@IMEJiedleftmargin\relax%
\partopsep\@IMEJiedpartopsep\relax%
\parsep\@IMEJiedparsep\relax%
\itemsep\@IMEJieditemsep\relax%
\rightmargin\@IMEJiedrightmargin\relax%
\listparindent\@IMEJiedlistparindent\relax%
\itemindent\@IMEJieditemindent\relax}


% v1.6b provide original LaTeX IED list environments
% note that latex.ltx defines \itemize and \enumerate, but not \description
% which must be created by the base classes
% save original LaTeX itemize and enumerate
\let\LaTeXitemize\itemize
\let\endLaTeXitemize\enditemize
\let\LaTeXenumerate\enumerate
\let\endLaTeXenumerate\endenumerate

% provide original LaTeX description environment from article.cls
\newenvironment{LaTeXdescription}
               {\list{}{\labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}
\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                 \normalfont\bfseries #1}


% override LaTeX's default IED lists
\def\itemize{\@IMEJitemize}
\def\enditemize{\@endIMEJitemize}
\def\enumerate{\@IMEJenumerate}
\def\endenumerate{\@endIMEJenumerate}
\def\description{\@IMEJdescription}
\def\enddescription{\@endIMEJdescription}

% provide the user with aliases - may help those using packages that
% override itemize, enumerate, or description
\def\IMEJitemize{\@IMEJitemize}
\def\endIMEJitemize{\@endIMEJitemize}
\def\IMEJenumerate{\@IMEJenumerate}
\def\endIMEJenumerate{\@endIMEJenumerate}
\def\IMEJdescription{\@IMEJdescription}
\def\endIMEJdescription{\@endIMEJdescription}


% v1.0 we want to keep the IMEJ IED list definitions as our own internal
% commands so they are protected against redefinition
\def\@IMEJitemize{\@ifnextchar[{\@@IMEJitemize}{\@@IMEJitemize[\relax]}}
\def\@IMEJenumerate{\@ifnextchar[{\@@IMEJenumerate}{\@@IMEJenumerate[\relax]}}
\def\@IMEJdescription{\@ifnextchar[{\@@IMEJdescription}{\@@IMEJdescription[\relax]}}
\def\@endIMEJitemize{\endlist}
\def\@endIMEJenumerate{\endlist}
\def\@endIMEJdescription{\endlist}


% DO NOT ALLOW BLANK LINES TO BE IN THESE IED ENVIRONMENTS
% AS THIS WILL FORCE NEW PARAGRAPHS AFTER THE IED LISTS
% IMEJ itemized list MDS 1/2001
% Note controlled spacing here, shield end of lines with %
\def\@@IMEJitemize[#1]{%
                \ifnum\@itemdepth>3\relax\@toodeep\else%
                \ifnum\@listdepth>5\relax\@toodeep\else%
                \advance\@itemdepth\@ne%
                \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
                % get the IMEJlabelindentfactor for this level
                \advance\@listdepth\@ne% we need to know what the level WILL be
                \edef\IMEJlabelindentfactor{\csname IMEJlabelindentfactor\romannumeral\the\@listdepth\endcsname}%
                \advance\@listdepth-\@ne% undo our increment
                \def\@IMEJiedjustify{2}% right justified labels are default
                % set other defaults
                \IMEJnocalcleftmarginfalse%
                \IMEJnolabelindentfactorfalse%
                \topsep\IMEJiedtopsep%
                \IMEJlabelindent\IMEJilabelindent%
                \labelsep\IMEJiednormlabelsep%
                \partopsep 0ex%
                \parsep 0ex%
                \itemsep 0ex%
                \rightmargin 0em%
                \listparindent 0em%
                \itemindent 0em%
                % calculate the label width
                % the user can override this later if
                % they specified a \labelwidth
                \settowidth{\labelwidth}{\csname labelitem\romannumeral\the\@itemdepth\endcsname}%
                \@IMEJsavelistparams% save our list parameters
                \list{\csname\@itemitem\endcsname}{%
                \@IMEJrestorelistparams% override any list{} changes
                                       % to our globals
                \let\makelabel\@IMEJiedmakelabel% v1.6b setup \makelabel
                \IMEJiedlistdecl% let user alter parameters
                #1\relax%
                % If the user has requested not to use the
                % IMEJlabelindent factor, don't revise \IMEJlabelindent
                \ifIMEJnolabelindentfactor\relax%
                \else\IMEJlabelindent=\IMEJlabelindentfactor\IMEJlabelindent%
                \fi%
                % Unless the user has requested otherwise,
                % calculate our left margin based
                % on \IMEJlabelindent, \labelwidth and
                % \labelsep
                \ifIMEJnocalcleftmargin\relax%
                \else\IMEJcalcleftmargin{\IMEJlabelindent}%
                \fi}\fi\fi}%


% DO NOT ALLOW BLANK LINES TO BE IN THESE IED ENVIRONMENTS
% AS THIS WILL FORCE NEW PARAGRAPHS AFTER THE IED LISTS
% IMEJ enumerate list MDS 1/2001
% Note controlled spacing here, shield end of lines with %
\def\@@IMEJenumerate[#1]{%
                \ifnum\@enumdepth>3\relax\@toodeep\else%
                \ifnum\@listdepth>5\relax\@toodeep\else%
                \advance\@enumdepth\@ne%
                \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
                % get the IMEJlabelindentfactor for this level
                \advance\@listdepth\@ne% we need to know what the level WILL be
                \edef\IMEJlabelindentfactor{\csname IMEJlabelindentfactor\romannumeral\the\@listdepth\endcsname}%
                \advance\@listdepth-\@ne% undo our increment
                \def\@IMEJiedjustify{2}% right justified labels are default
                % set other defaults
                \IMEJnocalcleftmarginfalse%
                \IMEJnolabelindentfactorfalse%
                \topsep\IMEJiedtopsep%
                \IMEJlabelindent\IMEJelabelindent%
                \labelsep\IMEJiednormlabelsep%
                \partopsep 0ex%
                \parsep 0ex%
                \itemsep 0ex%
                \rightmargin 0em%
                \listparindent 0em%
                \itemindent 0em%
                % calculate the label width
                % We'll set it to the width suitable for all labels using
                % normalfont 1) to 9)
                % The user can override this later
                \settowidth{\labelwidth}{9)}%
                \@IMEJsavelistparams% save our list parameters
                \list{\csname label\@enumctr\endcsname}{\usecounter{\@enumctr}%
                \@IMEJrestorelistparams% override any list{} changes
                                       % to our globals
                \let\makelabel\@IMEJiedmakelabel% v1.6b setup \makelabel
                \IMEJiedlistdecl% let user alter parameters 
                #1\relax%
                % If the user has requested not to use the
                % IMEJlabelindent factor, don't revise \IMEJlabelindent
                \ifIMEJnolabelindentfactor\relax%
                \else\IMEJlabelindent=\IMEJlabelindentfactor\IMEJlabelindent%
                \fi%
                % Unless the user has requested otherwise,
                % calculate our left margin based
                % on \IMEJlabelindent, \labelwidth and
                % \labelsep
                \ifIMEJnocalcleftmargin\relax%
                \else\IMEJcalcleftmargin{\IMEJlabelindent}%
                \fi}\fi\fi}%


% DO NOT ALLOW BLANK LINES TO BE IN THESE IED ENVIRONMENTS
% AS THIS WILL FORCE NEW PARAGRAPHS AFTER THE IED LISTS
% IMEJ description list MDS 1/2001
% Note controlled spacing here, shield end of lines with %
\def\@@IMEJdescription[#1]{%
                \ifnum\@listdepth>5\relax\@toodeep\else%
                % get the IMEJlabelindentfactor for this level
                \advance\@listdepth\@ne% we need to know what the level WILL be
                \edef\IMEJlabelindentfactor{\csname IMEJlabelindentfactor\romannumeral\the\@listdepth\endcsname}%
                \advance\@listdepth-\@ne% undo our increment
                \def\@IMEJiedjustify{0}% left justified labels are default
                % set other defaults
                \IMEJnocalcleftmarginfalse%
                \IMEJnolabelindentfactorfalse%
                \topsep\IMEJiedtopsep% 
                \IMEJlabelindent\IMEJdlabelindent%
                % assume normal labelsep
                \labelsep\IMEJiednormlabelsep%
                \partopsep 0ex%
                \parsep 0ex%
                \itemsep 0ex%
                \rightmargin 0em%
                \listparindent 0em%
                \itemindent 0em%
                % Bogus label width in case the user forgets
                % to set it.
                % TIP: If you want to see what a variable's width is you
                % can use the TeX command \showthe\width-variable to 
                % display it on the screen during compilation 
                % (This might be helpful to know when you need to find out
                % which label is the widest)
                \settowidth{\labelwidth}{Hello}%
                \@IMEJsavelistparams% save our list parameters
                \list{}{\@IMEJrestorelistparams% override any list{} changes
                                               % to our globals
                \let\makelabel\@IMEJiedmakelabel% v1.6b setup \makelabel
                \IMEJiedlistdecl% let user alter parameters 
                #1\relax%
                % If the user has requested not to use the
                % labelindent factor, don't revise \IMEJlabelindent
                \ifIMEJnolabelindentfactor\relax%
                \else\IMEJlabelindent=\IMEJlabelindentfactor\IMEJlabelindent%
                \fi%
                % Unless the user has requested otherwise,
                % calculate our left margin based
                % on \IMEJlabelindent, \labelwidth and
                % \labelsep
                \ifIMEJnocalcleftmargin\relax%
                \else\IMEJcalcleftmargin{\IMEJlabelindent}\relax%
                \fi}\fi}

% v1.6b we use one makelabel that does justification as needed.
\def\@IMEJiedmakelabel#1{\relax\if\@IMEJiedjustify 0\relax
\makebox[\labelwidth][l]{\normalfont #1}\else
\if\@IMEJiedjustify 1\relax
\makebox[\labelwidth][c]{\normalfont #1}\else
\makebox[\labelwidth][r]{\normalfont #1}\fi\fi}


% VERSE and QUOTE
% v1.0 define environments with newenvironment
\newenvironment{verse}{\let\\=\@centercr
    \list{}{\itemsep\z@ \itemindent -1.5em \listparindent \itemindent
    \rightmargin\leftmargin\advance\leftmargin 1.5em}\item\relax}
    {\endlist}
\newenvironment{quotation}{\list{}{\listparindent 1.5em \itemindent\listparindent
    \rightmargin\leftmargin \parsep 0pt plus 1pt}\item\relax}
    {\endlist}
\newenvironment{quote}{\list{}{\rightmargin\leftmargin}\item\relax}
    {\endlist}


% \titlepage
% provided only for backward compatibility. \maketitle is the correct
% way to create the title page. 
\def\titlepage{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
    \else \newpage \fi \thispagestyle{empty}\c@page\z@}
\def\endtitlepage{\if@restonecol\twocolumn \else \newpage \fi}

% standard values from article.cls
\arraycolsep     5pt
\arrayrulewidth .4pt
\doublerulesep   2pt

\tabcolsep       6pt
\tabbingsep      0.5em


%% FOOTNOTES
%
%\skip\footins 10pt plus 4pt minus 2pt
% v1.0 respond to changes in font size
% space added above the footnotes (if present)
\skip\footins 0.9\baselineskip  plus 0.4\baselineskip  minus 0.2\baselineskip

% v1.0, we need to make \footnotesep responsive to changes
% in \baselineskip or sge spacings will result when in
% draft mode. Here is a little LaTeX secret - \footnotesep
% determines the height of an invisible strut that is placed
% *above* the baseline of footnotes after the first. Since
% LaTeX considers the space for characters to be 0.7\baselineskip
% above the baseline and 0.3\baselineskip below it, we need to
% use 0.7\baselineskip as a \footnotesep to maintain equal spacing
% between all the lines of the footnotes. The IMEJ often uses a tad
% more, so use 0.8\baselineskip. This slightly larger value also helps
% the text to clear the footnote marks. Note that \thanks in IMEJ
% uses its own value of \footnotesep which is set in \maketitle.
{\footnotesize
\global\footnotesep 0.8\baselineskip}


\skip\@mpfootins = \skip\footins
\fboxsep = 3pt
\fboxrule = .4pt
% v1.0 use 1em, then use LaTeX2e's \@makefnmark
% Note that the IMEJ normally *left* aligns the footnote marks, so we don't need
% box resizing tricks here.
\long\def\@makefntext#1{\parindent 1em\indent\hbox{\@makefnmark}#1}% v1.0 use 1em
% v1.0 compsoc does not use superscipts for footnote marks

% The IMEJ does not use footnote rules
\def\footnoterule{}


% v1.0 do not allow LaTeX to break a footnote across multiple pages
\interfootnotelinepenalty=10000

% v1.0 discourage breaks within equations
% Note that amsmath normally sets this to 10000,
% but LaTeX2e normally uses 100.
\interdisplaylinepenalty=2500

% default allows section depth up to /paragraph
\setcounter{secnumdepth}{4}



\newcounter{section}
\newcounter{subsection}[section]
\newcounter{subsubsection}[subsection]
\newcounter{paragraph}[subsubsection]

% used only by IMEJ's IMEJeqnarray as other packages may
% have their own, different, implementations
\newcounter{IMEJsubequation}[equation]

% as shown when called by user from \ref, \label and in table of contents
\def\theequation{\arabic{equation}}                          % 1
\def\theIMEJsubequation{\theequation\alph{IMEJsubequation}}  % 1a (used only by IMEJ's IMEJeqnarray)


\def\thesection{\Roman{section}}                             % I
% v1.0, \mbox prevents breaks around - 
\def\thesubsection{\mbox{\thesection-\Alph{subsection}}}     % I-A
% v1.0 use I-A1 format used by the IMEJ rather than I-A.1
\def\thesubsubsection{\thesubsection\arabic{subsubsection}}  % I-A1
\def\theparagraph{\thesubsubsection\alph{paragraph}}         % I-A1a


% From Heiko Oberdiek. Because of the \mbox in \thesubsection, we need to
% tell hyperref to disable the \mbox command when making PDF bookmarks.
% This done already with hyperref.sty version 6.74o and later, but
% it will not hurt to do it here again for users of older versions.
\@ifundefined{pdfstringdefPreHook}{\let\pdfstringdefPreHook\@empty}{}%
\g@addto@macro\pdfstringdefPreHook{\let\mbox\relax}


% Main text forms (how shown in main text headings)
% v1.0, using \thesection in \thesectiondis allows changes
% in the former to automatically appear in the latter
\def\thesectiondis{\thesection.}                   % I.
\def\thesubsectiondis{\Alph{subsection}.}          % B.
\def\thesubsubsectiondis{\arabic{subsubsection})}  % 3)
\def\theparagraphdis{\alph{paragraph})}            % d)


% just like LaTeX2e's \@eqnnum
\def\theequationdis{{\normalfont \normalcolor (\theequation)}}% (1)
% IMEJsubequation used only by IMEJ's IMEJeqnarray
\def\theIMEJsubequationdis{{\normalfont \normalcolor (\theIMEJsubequation)}}% (1a)
% redirect LaTeX2e's equation number display and all that depend on
% it, through IMEJ's \theequationdis
\def\@eqnnum{\theequationdis}



% v1.0 provide string macros as article.cls does
\def\contentsname{Contents}
\def\listfigurename{List of Figures}
\def\listtablename{List of Tables}
\def\refname{References}
\def\indexname{Index}
\def\figurename{Fig.}
\def\tablename{TABLE}
\def\partname{Part}
\def\appendixname{Appendix}
\def\abstractname{Abstract}
% IMEJ specific names
\def\IMEJkeywordsname{Index Terms}
\def\IMEJproofname{Proof}


% LIST OF FIGURES AND TABLES AND TABLE OF CONTENTS
%
\def\@pnumwidth{1.55em}
\def\@tocrmarg{2.55em}
\def\@dotsep{4.5}
\setcounter{tocdepth}{3}

% adjusted some spacings here so that section numbers will not easily 
% collide with the section titles. 
% VIII; VIII-A; and VIII-A.1 are usually the worst offenders.
% MDS 1/2001
\def\tableofcontents{\section*{\contentsname}\@starttoc{toc}}
\def\l@section#1#2{\addpenalty{\@secpenalty}\addvspace{1.0em plus 1pt}%
    \@tempdima 2.75em \begingroup \parindent \z@ \rightskip \@pnumwidth%
    \parfillskip-\@pnumwidth {\bfseries\leavevmode #1}\hfil\hbox to\@pnumwidth{\hss #2}\par%
    \endgroup}
% argument format #1:level, #2:labelindent,#3:labelsep
\def\l@subsection{\@dottedtocline{2}{2.75em}{3.75em}}
\def\l@subsubsection{\@dottedtocline{3}{6.5em}{4.5em}}
% must provide \l@ defs for ALL sublevels EVEN if tocdepth
% is such as they will not appear in the table of contents
% these defs are how TOC knows what level these things are!
\def\l@paragraph{\@dottedtocline{4}{6.5em}{5.5em}}
\def\l@subparagraph{\@dottedtocline{5}{6.5em}{6.5em}}
\def\listoffigures{\section*{\listfigurename}\@starttoc{lof}}
\def\l@figure{\@dottedtocline{1}{0em}{2.75em}}
\def\listoftables{\section*{\listtablename}\@starttoc{lot}}
\let\l@table\l@figure


% Definitions for floats
%
% Normal Floats
% v1.0 floatsep et al. revised down by 0.15\baselineskip
% to account for the sideeffects of \topskip compensation
\floatsep 0.85\baselineskip plus  0.2\baselineskip minus  0.2\baselineskip
\textfloatsep 1.55\baselineskip plus  0.2\baselineskip minus  0.4\baselineskip
\@fptop 0pt plus 1fil
\@fpsep 0.75\baselineskip plus 2fil
\@fpbot 0pt plus 1fil
\def\topfraction{0.9}
\def\bottomfraction{0.4}
\def\floatpagefraction{0.8}
% v1.0, let top floats approach 90% of page
\def\textfraction{0.1}

% Double Column Floats
\dblfloatsep 0.85\baselineskip plus  0.2\baselineskip minus  0.2\baselineskip

\dbltextfloatsep 1.55\baselineskip plus  0.2\baselineskip minus  0.4\baselineskip
% Note that it would be nice if the rubber here actually worked in LaTeX2e.
% There is a long standing limitation in LaTeX, first discovered (to the best
% of my knowledge) by Alan Jeffrey in 1992. LaTeX ignores the stretchable
% portion of \dbltextfloatsep, and as a result, double column figures can and
% do result in an non-integer number of lines in the main text columns with
% underfull vbox errors as a consequence. A post to comp.text.tex
% by Donald Arseneau confirms that this had not yet been fixed in 1998.
% IMEJ v1.0 will fix this problem for you in the titles, but it doesn't
% protect you from other double floats. Happy vspace'ing.

\@dblfptop 0pt plus 1fil
\@dblfpsep 0.75\baselineskip plus 2fil
\@dblfpbot 0pt plus 1fil
\def\dbltopfraction{0.8}
\def\dblfloatpagefraction{0.8}
\setcounter{dbltopnumber}{4}

\intextsep 0.85\baselineskip plus 0.2\baselineskip minus  0.2\baselineskip
\setcounter{topnumber}{2}
\setcounter{bottomnumber}{2}
\setcounter{totalnumber}{4}



% article class provides these, we should too.
\newlength\abovecaptionskip
\newlength\belowcaptionskip
% but only \abovecaptionskip is used above figure captions and *below* table
% captions
\setlength\abovecaptionskip{0.5\baselineskip}

\setlength\belowcaptionskip{0pt}
% v1.0 create hooks in case the caption spacing ever needs to be
% overridden by a user
\def\@IMEJfigurecaptionsepspace{\vskip\abovecaptionskip\relax}%
\def\@IMEJtablecaptionsepspace{\vskip\abovecaptionskip\relax}%


% 1.6b revise caption system so that \@makecaption uses two arguments
% as with LaTeX2e. Otherwise, there will be problems when using hyperref.
\def\@IMEJtablestring{table}


% v1.0 compensate for \topskip so top of top figures align with tops of the first lines of main text
% here we calculate a space equal to the amount \topskip exceeds the main text height
% we hook in at \@floatboxreset
\def\@IMEJfiguretopskipspace{\ifdim\prevdepth=-1000pt\relax
\setlength{\@IMEJtmpdimenA}{1\topskip}\relax
\addtolength{\@IMEJtmpdimenA}{-0.7\@IMEJnormalsizeunitybaselineskip}\relax
\vspace*{\@IMEJtmpdimenA}\fi}
% v1.0 compensate for \topskip at the top of top tables so caption text is on main text baseline
% use a strut set on the caption baseline within \@makecaption
\def\@IMEJtabletopskipstrut{\ifdim\prevdepth=-1000pt\rule{0pt}{\topskip}\fi}
% the \ifdim\prevdepth checks are always expected to be true for IMEJ style float caption ordering
% because top of figure content and top of captions in tables is the first thing on the vertical
% list of these floats
% thanks to Donald Arseneau for his 2000/11/11 post "Re: caption hacking" with info on this topic.



%
% traditional noncompsoc \@makecaption
\long\def\@makecaption#1#2{%
% test if is a for a figure or table
\ifx\@captype\@IMEJtablestring%
% if a table, do table caption
\footnotesize\bgroup\par\centering\@IMEJtabletopskipstrut{\normalfont\footnotesize #1}\\{\normalfont\footnotesize\scshape #2}\par\addvspace{0.5\baselineskip}\egroup%
\@IMEJtablecaptionsepspace
% if not a table, format it as a figure
\else
\@IMEJfigurecaptionsepspace
% 3/2001 use footnotesize, not small; use two nonbreaking spaces, not one
\setbox\@tempboxa\hbox{\normalfont\footnotesize {#1.}\nobreakspace\nobreakspace #2}%
\ifdim \wd\@tempboxa >\hsize%
% if caption is longer than a line, let it wrap around
\setbox\@tempboxa\hbox{\normalfont\footnotesize {#1.}\nobreakspace\nobreakspace}%
\parbox[t]{\hsize}{\normalfont\footnotesize\noindent\unhbox\@tempboxa#2}%
% if caption is shorter than a line, center if conference, left justify otherwise
\else%
\hbox to\hsize{\normalfont\footnotesize\box\@tempboxa\hfil}%
\fi
\fi}




% v1.0 disable captions class option, do so in a way that retains operation of \label
% within \caption
\ifCLASSOPTIONcaptionsoff
\long\def\@makecaption#1#2{\vspace*{2em}\footnotesize\bgroup\par\addvspace{0.5\baselineskip}\centering{\footnotesize #1}\par\addvspace{0.5\baselineskip}\egroup%
\let\@IMEJtemporiglabeldefsave\label
\let\@IMEJtemplabelargsave\relax
\def\label##1{\gdef\@IMEJtemplabelargsave{##1}}%
\setbox\@tempboxa\hbox{#2}%
\let\label\@IMEJtemporiglabeldefsave
\ifx\@IMEJtemplabelargsave\relax\else\label{\@IMEJtemplabelargsave}\fi}
\fi


% v1.0 define end environments with \def not \let so as to work OK with
% preview-latex
\newcounter{figure}
\def\thefigure{\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure}
% v1.0 within figures add \@IMEJfiguretopskipspace compensation to LaTeX2e's \@floatboxreset
\def\figure{\def\@floatboxreset{\reset@font\normalsize\@setminipage\@IMEJfiguretopskipspace}\@float{figure}}
\def\endfigure{\end@float}
% v1.0 also add \@IMEJfiguretopskipspace compensation to \figure*
\@namedef{figure*}{\def\@floatboxreset{\reset@font\normalsize\@setminipage\@IMEJfiguretopskipspace}\@dblfloat{figure}}
\@namedef{endfigure*}{\end@dblfloat}

\newcounter{table}
\def\thetable{\@Roman\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\thetable}
% v1.0 The IMEJ uses 8pt text for tables
% within tables alter LaTeX2e's \@floatboxreset to use \footnotesize
\def\table{\def\@floatboxreset{\reset@font\footnotesize\@setminipage}\@float{table}}
\def\endtable{\end@float}
% v1.6b double column tables need to default to footnotesize as well.
\@namedef{table*}{\def\@floatboxreset{\reset@font\footnotesize\@setminipage}\@dblfloat{table}}
\@namedef{endtable*}{\end@dblfloat}




%% -- Command Argument Scanning Support Functions --
%% v1.0a 

% usage: \@IMEJstripouterbraces*{}
% \@IMEJstripouterbraces fully expands its argument (which it then stores
% in \@IMEJstripouterbracesarg) via \edef, then removes any outer enclosing
% braces, and finally stores the result in the macro
% \@IMEJstrippedouterbraces.
%
% For example:
% \@IMEJstripouterbraces{{{{ab}c}}}
% results in:
%
% \@IMEJstripouterbracesarg ==> a macro containing {{{ab}c}}
% \@IMEJstrippedouterbraces ==> a macro containing {ab}c
%
% the *-star form,\@IMEJstripouterbraces*, does not expand the argument
% contents during processing
\def\@IMEJstripouterbraces{\@ifstar{\let\@IMEJstripouterbracesdef=\def\@@IMEJstripouterbraces}{\let\@IMEJstripouterbracesdef=\edef\@@IMEJstripouterbraces}}

\def\@@IMEJstripouterbraces#1{\@IMEJstripouterbracesdef\@IMEJstripouterbracesarg{#1}\relax
% If the macro is unchanged after being acquired as a single delimited
% argument, we know we have one sequence of tokens without any enclosing
% braces. Loop until this is true.
\loop
  \expandafter\@@@IMEJstripouterbraces\@IMEJstripouterbracesarg\@IMEJgeneralsequenceDELIMITER
\ifx\@IMEJstrippedouterbraces\@IMEJstripouterbracesarg
\else
  \let\@IMEJstripouterbracesarg\@IMEJstrippedouterbraces
\repeat}

\def\@@@IMEJstripouterbraces#1\@IMEJgeneralsequenceDELIMITER{\def\@IMEJstrippedouterbraces{#1}}



% usage: \@IMEJextractgroup*{}
% \@IMEJextractgroup fully expands its argument (which it then stores in
% \@IMEJextractgrouparg) via \edef and then assigns the first "brace group"
% of tokens to the macro \@IMEJextractedgroup.
% The remaining groups, if any, are stored in the macro
% \@IMEJextractedgroupremain. If the argument does not contain the requisite
% groups, the respective macros will be defined to be empty.
% There is an asymmetry in that \@IMEJextractedgroup is stripped of its first
% outer grouping while \@IMEJextractedgroupremain retains even the outer
% grouping (if present) that originally identified it as a group.
%
% For example:
% \@IMEJextractgroup{{{ab}}{c{de}}}
% results in:
%
% \@IMEJextractgrouparg       ==> a macro containing {{ab}}{c{de}}
% \@IMEJextractedgroup        ==> a macro containing {ab}
% \@IMEJextractedgroupremain  ==> a macro containing {c{de}}
%
% The *-star form, \@IMEJextractgroup*, does not expand its argument
% contents during processing.
\def\@IMEJextractgroup{\@ifstar{\let\@IMEJextractgroupdef=\def\@@IMEJextractgroup}{\let\@IMEJextractgroupdef=\edef\@@IMEJextractgroup}}

\def\@@IMEJextractgroup#1{\@IMEJextractgroupdef\@IMEJextractgrouparg{#1}\relax
% trap the case of an empty extracted group as this would cause problems with
% \@IMEJextractgroupremain's argument acquisition
\ifx\@IMEJextractgrouparg\@empty
  \def\@IMEJextractedgroup{}\relax
  \def\@IMEJextractedgroupremain{}\relax
\else
  % We have to use some dirty tricks here. We want to insert {} around
  % whatever remains after the first group so that TeX's argument scanner
  % will preserve any originally enclosing braces as well as provide an
  % empty argument to acquire even if there isn't a second group.
  % In this first of two dirty tricks, we put a } at the end of the structure
  % we are going to extract from. The \ifnum0=`{\fi keeps TeX happy to allow
  % what would otherwise be an unbalanced macro definition for
  % \@@IMEJextractgroup to be acceptable to it.
  \ifnum0=`{\fi\expandafter\@IMEJextractgroupremain\@IMEJextractgrouparg}\relax
\fi}

% In the second part of the dirty tricks, we insert a leading { right after
% the first group is acquired, but before the remainder is. Again, the
% \ifnum0=`}\fi keeps TeX happy during definition time, but will disappear
% during run time.
\def\@IMEJextractgroupremain#1{\def\@IMEJextractedgroup{#1}\expandafter\@@IMEJextractgroupremain\expandafter{\ifnum0=`}\fi}

\def\@@IMEJextractgroupremain#1{\def\@IMEJextractedgroupremain{#1}}



% \@IMEJextracttoken relocated at top because margin setting commands rely on it



% usage: \@IMEJextracttokengroups*{}
% \@IMEJextracttokengroups fully expands its argument (which it then stores
% in \@IMEJextracttokengroupsarg) and then assigns the first "brace group" of
% tokens (with the outermost braces removed) to the macro
% \@IMEJextractedfirstgroup.
% The meaning of the first nonbrace (but including the empty group) token
% within this first group is assigned via \let to \@IMEJextractedfirsttoken
% as well as stored in the macro \@IMEJextractedfirsttokenmacro. If a first
% nonbrace token does not exist (or is an empty group), these will be \relax
% and empty, respectively.  Tokens that would otherwise be discarded during
% the acquisition of the first token in the first group are stored in
% \@IMEJextractedfirsttokensdiscarded, however their original relative brace
% nesting depths are not guaranteed to be preserved.
% The first group within this first group is stored in the macro
% \@IMEJextractedfirstfirstgroup.
% Likewise for the next group after the first: \@IMEJextractednextgroup,
% \@IMEJextractednextfirstgroup, \@IMEJextractednextgroupfirsttoken,
% \@IMEJextractednextgroupfirsttokenmacro, and 
% \@IMEJextractednextfirsttokensdiscarded.
% All tokens/groups after the first group, including any enclosing braces,
% are stored in the macro \@IMEJextractedafterfirstgroupremain which will
% be empty if none exist.
%
% For example:
% \@IMEJextracttokengroups{{{ab}{cd}}{{ef}g}}
% will result in:
%
% \@IMEJextracttokengroupsarg             ==> a macro containing {{ab}{cd}}{{ef}g}
% \@IMEJextractedfirstgroup               ==> a macro containing {ab}{cd}
% \@IMEJextractedafterfirstgroupremain    ==> a macro containing {{ef}g}
% \@IMEJextractedfirsttoken               ==> the letter a
% \@IMEJextractedfirsttokenmacro          ==> a macro containing a
% \@IMEJextractedfirsttokensdiscarded     ==> a macro containing bcd
% \@IMEJextractedfirstfirstgroup          ==> a macro containing ab
% \@IMEJextractednextgroup                ==> a macro containing {ef}g
% \@IMEJextractednextfirsttoken           ==> the letter e
% \@IMEJextractednextfirsttokenmacro      ==> a macro containing e
% \@IMEJextractednextfirsttokensdiscarded ==> a macro containing fg
% \@IMEJextractednextfirstgroup           ==> a macro containing ef
%
% If given an empty argument, \@IMEJextractedfirsttoken and
% \@IMEJextractednextfirsttoken will be set to \relax
% and all the macros will be empty.
% the *-star form, \@IMEJextracttokengroups*, does not expand its argument
% contents during processing.
%
% Depends on: \@IMEJextractgroup, \@IMEJextracttoken
\def\@IMEJextracttokengroups{\@ifstar{\let\@IMEJextracttokengroupsdef=\def\@@IMEJextracttokengroups}{\let\@IMEJextracttokengroupsdef=\edef\@@IMEJextracttokengroups}}
\def\@@IMEJextracttokengroups#1{\@IMEJextracttokengroupsdef\@IMEJextracttokengroupsarg{#1}\relax
% begin extraction, these functions are safe with empty arguments
% first group
\expandafter\@IMEJextractgroup\expandafter*\expandafter{\@IMEJextracttokengroupsarg}\relax
\let\@IMEJextractedfirstgroup\@IMEJextractedgroup
\let\@IMEJextractedafterfirstgroupremain\@IMEJextractedgroupremain
\expandafter\@IMEJextracttoken\expandafter*\expandafter{\@IMEJextractedfirstgroup}\relax
\let\@IMEJextractedfirsttoken\@IMEJextractedtoken
\let\@IMEJextractedfirsttokenmacro\@IMEJextractedtokenmacro
\let\@IMEJextractedfirsttokensdiscarded\@IMEJextractedtokensdiscarded
% first first group
\expandafter\@IMEJextractgroup\expandafter*\expandafter{\@IMEJextractedfirstgroup}\relax
\let\@IMEJextractedfirstfirstgroup\@IMEJextractedgroup
% next group
\expandafter\@IMEJextractgroup\expandafter*\expandafter{\@IMEJextractedafterfirstgroupremain}\relax
\let\@IMEJextractednextgroup\@IMEJextractedgroup
\expandafter\@IMEJextracttoken\expandafter*\expandafter{\@IMEJextractednextgroup}\relax
\let\@IMEJextractednextfirsttoken\@IMEJextractedtoken
\let\@IMEJextractednextfirsttokenmacro\@IMEJextractedtokenmacro
\let\@IMEJextractednextfirsttokensdiscarded\@IMEJextractedtokensdiscarded
% next first group
\expandafter\@IMEJextractgroup\expandafter*\expandafter{\@IMEJextractednextgroup}\relax
\let\@IMEJextractednextfirstgroup\@IMEJextractedgroup}


%% -- End of Command Argument Scanning Support Functions --




%%
%% START OF IMEJeqnarray DEFINITIONS
%%
%% Inspired by the concepts, examples, and previous works of LaTeX 
%% coders and developers such as Donald Arseneau, Fred Bartlett, 
%% David Carlisle, Tony Liu, Frank Mittelbach, Piet van Oostrum, 
%% Roland Winkler and Mark Wooding.
%% I don't make the claim that my work here is even near their calibre. ;)


\newif\if@IMEJeqnarrayboxnojot% flag to indicate if the environment was called as the star form
\@IMEJeqnarrayboxnojotfalse

\newif\if@advanceIMEJeqncolcnt% tracks if the environment should advance the col counter
% allows a way to make an \IMEJeqnarraybox that can be used within an \IMEJeqnarray
% used by IMEJeqnarraymulticol so that it can work properly in both
\@advanceIMEJeqncolcnttrue

\newcount\@IMEJeqnnumcols % tracks how many IMEJeqnarray cols are defined
\newcount\@IMEJeqncolcnt  % tracks how many IMEJeqnarray cols the user actually used


% The default math style used by the columns
\def\IMEJeqnarraymathstyle{\displaystyle}
% The default text style used by the columns
% default to using the current font
\def\IMEJeqnarraytextstyle{\relax}

% like the iedlistdecl but for \IMEJeqnarray
\def\IMEJeqnarraydecl{\relax}
\def\IMEJeqnarrayboxdecl{\relax}



% v1.0 flags to indicate that equation numbering is to persist
\newif\if@IMEJeqnumpersist%
\@IMEJeqnumpersistfalse
\newif\if@IMEJsubeqnumpersist%
\@IMEJsubeqnumpersistfalse
%
% v1.0 flags to indicate if (sub)equation number of last line was preadvanced
\newif\if@IMEJeqnumpreadv%
\@IMEJeqnumpreadvfalse
\newif\if@IMEJsubeqnumpreadv%
\@IMEJsubeqnumpreadvfalse

\newcount\@IMEJsubeqnnumrollback% saves previous value of IMEJsubequation number in case we need to restore it

% \yesnumber is the opposite of \nonumber
% a novel concept with the same def as the equationarray package
% However, we give IMEJ versions too since some LaTeX packages such as 
% the MDWtools mathenv.sty redefine \nonumber to something else.
% This command is intended for use in non-IMEJeqnarray math environments
\providecommand{\yesnumber}{\global\@eqnswtrue}


% IMEJyes/nonumber 
% v1.0 add persistant * forms
% These commands can alter the type of equation an IMEJeqnarray line is.
\def\IMEJyesnumber{\@ifstar{\global\@IMEJeqnumpersisttrue\global\@IMEJsubeqnumpersistfalse\@IMEJyesnumber}{\@IMEJyesnumber}}

\def\@IMEJyesnumber{\global\@eqnswtrue
\if@IMEJeqnarrayISinner% alter counters and label only inside an IMEJeqnarray
\ifnum\c@IMEJsubequation>0\relax
   \stepcounter{equation}\setcounter{IMEJsubequation}{0}\gdef\@currentlabel{\p@equation\theequation}\relax
   \gdef\@currentHref{\@IMEJtheHrefequation}% setup hyperref label
\fi
% even if we reached this eqn num via a preadv, it is legit now
\global\@IMEJeqnumpreadvfalse\global\@IMEJsubeqnumpreadvfalse
\fi}

\def\IMEJnonumber{\@ifstar{\global\@IMEJeqnumpersistfalse\global\@IMEJsubeqnumpersistfalse\global\@eqnswfalse}{\global\@eqnswfalse}}


\def\IMEJyessubnumber{\@ifstar{\global\@IMEJsubeqnumpersisttrue\@IMEJyessubnumber}{\@IMEJyessubnumber}}
%
\def\@IMEJyessubnumber{\if@IMEJeqnarrayISinner% alter counters and label only inside an IMEJeqnarray
  \ifnum\c@IMEJsubequation>0\relax% if it already is a subequation, we are good to go as-is
  \else% if we are a regular equation we have to watch out for two cases
    \if@IMEJeqnumpreadv% if this equation is the result of a preadvance, backout and bump the sub eqnnum
       \global\advance\c@equation\m@ne\global\c@IMEJsubequation=\@IMEJsubeqnnumrollback\addtocounter{IMEJsubequation}{1}\relax
    \else% non-preadvanced equations just need initialization of their sub eqnnum
       \setcounter{IMEJsubequation}{1}\relax
    \fi
  \fi% fi already is subequation
  \gdef\@currentlabel{\p@IMEJsubequation\theIMEJsubequation}\relax
  \gdef\@currentHref{\@IMEJtheHrefsubequation}% setup hyperref label
  \global\@IMEJeqnumpreadvfalse\global\@IMEJsubeqnumpreadvfalse% no longer a preadv anymore
  \global\@eqnswtrue
\fi}


\def\IMEJnosubnumber{\@ifstar{\global\@IMEJsubeqnumpersistfalse\@IMEJnosubnumber}{\@IMEJnosubnumber}}
%
\def\@IMEJnosubnumber{\if@IMEJeqnarrayISinner% alter counters and label only inside an IMEJeqnarray
  \if@eqnsw % we do nothing unless we know we will display because we play with the counters here
    % if it currently is a subequation, bump up to the next equation number and turn off the subequation
    \ifnum\c@IMEJsubequation>0\relax\addtocounter{equation}{1}\setcounter{IMEJsubequation}{0}\relax
    \fi
    \global\@IMEJeqnumpreadvfalse\global\@IMEJsubeqnumpreadvfalse% no longer a preadv anymore
    \gdef\@currentlabel{\p@equation\theequation}\relax
    \gdef\@currentHref{\@IMEJtheHrefequation}% setup hyperref label
  \fi
\fi}



% allows users to "push away" equations that get too close to the equation numbers
\def\IMEJeqnarraynumspace{\hphantom{\ifnum\c@IMEJsubequation>0\relax\theIMEJsubequationdis\else\theequationdis\fi}}

% provides a way to span multiple columns within IMEJeqnarray environments
% will consider \if@advanceIMEJeqncolcnt before globally advancing the
% column counter - so as to work within \IMEJeqnarraybox
% usage: \IMEJeqnarraymulticol{number cols. to span}{col type}{cell text}
\long\def\IMEJeqnarraymulticol#1#2#3{\multispan{#1}\relax
% check if column is defined for the precolumn definition
% We have to be careful here because TeX scans for & even within an \iffalse
% where it does not expand macros. So, if we used only one \ifx and a #3
% appeared in the false branch and the user inserted another alignment
% structure that uses & in the \IMEJeqnarraymulticol{}, TeX will not see that
% there is an inner alignment in the false branch yet still will see any &
% there and will think that they apply to the outer alignment resulting in an
% incomplete \ifx error.
% So, here we use separate checks for the pre and post parts in order to keep
% the #3 outside of all conditionals.
\relax\expandafter\ifx\csname @IMEJeqnarraycolDEF#2\endcsname\@IMEJeqnarraycolisdefined\relax
\csname @IMEJeqnarraycolPRE#2\endcsname
\else% if not, error and use default type
\@IMEJclspkgerror{Invalid column type "#2" in \string\IMEJeqnarraymulticol.\MessageBreak
Using a default centering column instead}%
{You must define IMEJeqnarray column types before use.}%
\csname @IMEJeqnarraycolPRE@IMEJdefault\endcsname
\fi
% The ten \relax are to help prevent misleading error messages in case a user
% accidently inserted a macro that tries to acquire additional arguments.
#3\relax\relax\relax\relax\relax\relax\relax\relax\relax\relax
% check if column is defined for the postcolumn definition
\expandafter\ifx\csname @IMEJeqnarraycolDEF#2\endcsname\@IMEJeqnarraycolisdefined\relax
\csname @IMEJeqnarraycolPOST#2\endcsname
\else% if not, use the default type
\csname @IMEJeqnarraycolPOST@IMEJdefault\endcsname
\fi
% advance column counter only if the IMEJeqnarray environment wants it
\if@advanceIMEJeqncolcnt\global\advance\@IMEJeqncolcnt by #1\relax\fi}

% like \omit, but maintains track of the column counter for \IMEJeqnarray
\def\IMEJeqnarrayomit{\omit\if@advanceIMEJeqncolcnt\global\advance\@IMEJeqncolcnt by 1\relax\fi}


% provides a way to define a letter referenced column type
% usage: \IMEJeqnarraydefcol{col. type letter/name}{pre insertion text}{post insertion text}
\def\IMEJeqnarraydefcol#1#2#3{\expandafter\def\csname @IMEJeqnarraycolPRE#1\endcsname{#2}%
\expandafter\def\csname @IMEJeqnarraycolPOST#1\endcsname{#3}%
\expandafter\def\csname @IMEJeqnarraycolDEF#1\endcsname{1}}


% provides a way to define a numerically referenced inter-column glue types
% usage: \IMEJeqnarraydefcolsep{col. glue number}{glue definition}
\def\IMEJeqnarraydefcolsep#1#2{\expandafter\def\csname @IMEJeqnarraycolSEP\romannumeral #1\endcsname{#2}%
\expandafter\def\csname @IMEJeqnarraycolSEPDEF\romannumeral #1\endcsname{1}}


\def\@IMEJeqnarraycolisdefined{1}% just a macro for 1, used for checking undefined column types


% expands and appends the given argument to the \@IMEJtmptoksA token list
% used to build up the \halign preamble
\def\@IMEJappendtoksA#1{\edef\@@IMEJappendtoksA{\@IMEJtmptoksA={\the\@IMEJtmptoksA #1}}%
\@@IMEJappendtoksA}

% also appends to \@IMEJtmptoksA, but does not expand the argument
% uses \toks8 as a scratchpad register
\def\@IMEJappendNOEXPANDtoksA#1{\toks8={#1}%
\edef\@@IMEJappendNOEXPANDtoksA{\@IMEJtmptoksA={\the\@IMEJtmptoksA\the\toks8}}%
\@@IMEJappendNOEXPANDtoksA}

% define some common column types for the user
% math
\IMEJeqnarraydefcol{l}{$\IMEJeqnarraymathstyle}{$\hfil}
\IMEJeqnarraydefcol{c}{\hfil$\IMEJeqnarraymathstyle}{$\hfil}
\IMEJeqnarraydefcol{r}{\hfil$\IMEJeqnarraymathstyle}{$}
\IMEJeqnarraydefcol{L}{$\IMEJeqnarraymathstyle{}}{{}$\hfil}
\IMEJeqnarraydefcol{C}{\hfil$\IMEJeqnarraymathstyle{}}{{}$\hfil}
\IMEJeqnarraydefcol{R}{\hfil$\IMEJeqnarraymathstyle{}}{{}$}
% text
\IMEJeqnarraydefcol{s}{\IMEJeqnarraytextstyle}{\hfil}
\IMEJeqnarraydefcol{t}{\hfil\IMEJeqnarraytextstyle}{\hfil}
\IMEJeqnarraydefcol{u}{\hfil\IMEJeqnarraytextstyle}{}

% vertical rules
\IMEJeqnarraydefcol{v}{}{\vrule width\arrayrulewidth}
\IMEJeqnarraydefcol{vv}{\vrule width\arrayrulewidth\hfil}{\hfil\vrule width\arrayrulewidth}
\IMEJeqnarraydefcol{V}{}{\vrule width\arrayrulewidth\hskip\doublerulesep\vrule width\arrayrulewidth}
\IMEJeqnarraydefcol{VV}{\vrule width\arrayrulewidth\hskip\doublerulesep\vrule width\arrayrulewidth\hfil}%
{\hfil\vrule width\arrayrulewidth\hskip\doublerulesep\vrule width\arrayrulewidth}

% horizontal rules
\IMEJeqnarraydefcol{h}{}{\leaders\hrule height\arrayrulewidth\hfil}
\IMEJeqnarraydefcol{H}{}{\leaders\vbox{\hrule width\arrayrulewidth\vskip\doublerulesep\hrule width\arrayrulewidth}\hfil}

% plain
\IMEJeqnarraydefcol{x}{}{}
\IMEJeqnarraydefcol{X}{$}{$}

% the default column type to use in the event a column type is not defined
\IMEJeqnarraydefcol{@IMEJdefault}{\hfil$\IMEJeqnarraymathstyle}{$\hfil}


% a zero tabskip (used for "-" col types)
\def\@IMEJeqnarraycolSEPzero{0pt plus 0pt minus 0pt}
% a centering tabskip (used for "+" col types)
\def\@IMEJeqnarraycolSEPcenter{1000pt plus 0pt minus 1000pt}

% top level default tabskip glues for the start, end, and inter-column
% may be reset within environments not always at the top level, e.g., \IMEJeqnarraybox
\edef\@IMEJeqnarraycolSEPdefaultstart{\@IMEJeqnarraycolSEPcenter}% default start glue
\edef\@IMEJeqnarraycolSEPdefaultend{\@IMEJeqnarraycolSEPcenter}% default end glue
\edef\@IMEJeqnarraycolSEPdefaultmid{\@IMEJeqnarraycolSEPzero}% default inter-column glue



% creates a vertical rule that extends from the bottom to the top a a cell
% Provided in case other packages redefine \vline some other way.
% usage: \IMEJeqnarrayvrule[rule thickness]
% If no argument is provided, \arrayrulewidth will be used for the rule thickness. 
\newcommand\IMEJeqnarrayvrule[1][\arrayrulewidth]{\vrule\@width#1\relax}

% creates a blank separator row
% usage: \IMEJeqnarrayseprow[separation length][font size commands]
% default is \IMEJeqnarrayseprow[0.25\normalbaselineskip][\relax]
% blank arguments inherit the default values
% uses \skip5 as a scratch register - calls \@IMEJeqnarraystrutsize which uses more scratch registers
\def\IMEJeqnarrayseprow{\relax\@ifnextchar[{\@IMEJeqnarrayseprow}{\@IMEJeqnarrayseprow[0.25\normalbaselineskip]}}
\def\@IMEJeqnarrayseprow[#1]{\relax\@ifnextchar[{\@@IMEJeqnarrayseprow[#1]}{\@@IMEJeqnarrayseprow[#1][\relax]}}
\def\@@IMEJeqnarrayseprow[#1][#2]{\def\@IMEJeqnarrayseprowARGONE{#1}%
\ifx\@IMEJeqnarrayseprowARGONE\@empty%
% get the skip value, based on the font commands
% use skip5 because \IMEJeqnarraystrutsize uses \skip0, \skip2, \skip3
% assign within a bogus box to confine the font changes
{\setbox0=\hbox{#2\relax\global\skip5=0.25\normalbaselineskip}}%
\else%
{\setbox0=\hbox{#2\relax\global\skip5=#1}}%
\fi%
\@IMEJeqnarrayhoptolastcolumn\IMEJeqnarraystrutsize{\skip5}{0pt}[\relax]\relax}

% creates a blank separator row, but omits all the column templates
% usage: \IMEJeqnarrayseprowcut[separation length][font size commands]
% default is \IMEJeqnarrayseprowcut[0.25\normalbaselineskip][\relax]
% blank arguments inherit the default values
% uses \skip5 as a scratch register - calls \@IMEJeqnarraystrutsize which uses more scratch registers
\def\IMEJeqnarrayseprowcut{\multispan{\@IMEJeqnnumcols}\relax% span all the cols
% advance column counter only if the IMEJeqnarray environment wants it
\if@advanceIMEJeqncolcnt\global\advance\@IMEJeqncolcnt by \@IMEJeqnnumcols\relax\fi%
\@ifnextchar[{\@IMEJeqnarrayseprowcut}{\@IMEJeqnarrayseprowcut[0.25\normalbaselineskip]}}
\def\@IMEJeqnarrayseprowcut[#1]{\relax\@ifnextchar[{\@@IMEJeqnarrayseprowcut[#1]}{\@@IMEJeqnarrayseprowcut[#1][\relax]}}
\def\@@IMEJeqnarrayseprowcut[#1][#2]{\def\@IMEJeqnarrayseprowARGONE{#1}%
\ifx\@IMEJeqnarrayseprowARGONE\@empty%
% get the skip value, based on the font commands
% use skip5 because \IMEJeqnarraystrutsize uses \skip0, \skip2, \skip3
% assign within a bogus box to confine the font changes
{\setbox0=\hbox{#2\relax\global\skip5=0.25\normalbaselineskip}}%
\else%
{\setbox0=\hbox{#2\relax\global\skip5=#1}}%
\fi%
\IMEJeqnarraystrutsize{\skip5}{0pt}[\relax]\relax}



% draws a single rule across all the columns optional
% argument determines the rule width, \arrayrulewidth is the default
% updates column counter as needed and turns off struts
% usage: \IMEJeqnarrayrulerow[rule line thickness]
\def\IMEJeqnarrayrulerow{\multispan{\@IMEJeqnnumcols}\relax% span all the cols
% advance column counter only if the IMEJeqnarray environment wants it
\if@advanceIMEJeqncolcnt\global\advance\@IMEJeqncolcnt by \@IMEJeqnnumcols\relax\fi%
\@ifnextchar[{\@IMEJeqnarrayrulerow}{\@IMEJeqnarrayrulerow[\arrayrulewidth]}}
\def\@IMEJeqnarrayrulerow[#1]{\leaders\hrule height#1\hfil\relax% put in our rule 
% turn off any struts
\IMEJeqnarraystrutsize{0pt}{0pt}[\relax]\relax}


% draws a double rule by using a single rule row, a separator row, and then
% another single rule row 
% first optional argument determines the rule thicknesses, \arrayrulewidth is the default
% second optional argument determines the rule spacing, \doublerulesep is the default
% usage: \IMEJeqnarraydblrulerow[rule line thickness][rule spacing]
\def\IMEJeqnarraydblrulerow{\multispan{\@IMEJeqnnumcols}\relax% span all the cols
% advance column counter only if the IMEJeqnarray environment wants it
\if@advanceIMEJeqncolcnt\global\advance\@IMEJeqncolcnt by \@IMEJeqnnumcols\relax\fi%
\@ifnextchar[{\@IMEJeqnarraydblrulerow}{\@IMEJeqnarraydblrulerow[\arrayrulewidth]}}
\def\@IMEJeqnarraydblrulerow[#1]{\relax\@ifnextchar[{\@@IMEJeqnarraydblrulerow[#1]}%
{\@@IMEJeqnarraydblrulerow[#1][\doublerulesep]}}
\def\@@IMEJeqnarraydblrulerow[#1][#2]{\def\@IMEJeqnarraydblrulerowARG{#1}%
% we allow the user to say \IMEJeqnarraydblrulerow[][]
\ifx\@IMEJeqnarraydblrulerowARG\@empty%
\@IMEJeqnarrayrulerow[\arrayrulewidth]%
\else%
\@IMEJeqnarrayrulerow[#1]\relax%
\fi%
\def\@IMEJeqnarraydblrulerowARG{#2}%
\ifx\@IMEJeqnarraydblrulerowARG\@empty%
\\\IMEJeqnarrayseprow[\doublerulesep][\relax]%
\else%
\\\IMEJeqnarrayseprow[#2][\relax]%
\fi%
\\\multispan{\@IMEJeqnnumcols}%
% advance column counter only if the IMEJeqnarray environment wants it
\if@advanceIMEJeqncolcnt\global\advance\@IMEJeqncolcnt by \@IMEJeqnnumcols\relax\fi%
\def\@IMEJeqnarraydblrulerowARG{#1}%
\ifx\@IMEJeqnarraydblrulerowARG\@empty%
\@IMEJeqnarrayrulerow[\arrayrulewidth]%
\else%
\@IMEJeqnarrayrulerow[#1]%
\fi%
}

% draws a double rule by using a single rule row, a separator (cutting) row, and then
% another single rule row 
% first optional argument determines the rule thicknesses, \arrayrulewidth is the default
% second optional argument determines the rule spacing, \doublerulesep is the default
% usage: \IMEJeqnarraydblrulerow[rule line thickness][rule spacing]
\def\IMEJeqnarraydblrulerowcut{\multispan{\@IMEJeqnnumcols}\relax% span all the cols
% advance column counter only if the IMEJeqnarray environment wants it
\if@advanceIMEJeqncolcnt\global\advance\@IMEJeqncolcnt by \@IMEJeqnnumcols\relax\fi%
\@ifnextchar[{\@IMEJeqnarraydblrulerowcut}{\@IMEJeqnarraydblrulerowcut[\arrayrulewidth]}}
\def\@IMEJeqnarraydblrulerowcut[#1]{\relax\@ifnextchar[{\@@IMEJeqnarraydblrulerowcut[#1]}%
{\@@IMEJeqnarraydblrulerowcut[#1][\doublerulesep]}}
\def\@@IMEJeqnarraydblrulerowcut[#1][#2]{\def\@IMEJeqnarraydblrulerowARG{#1}%
% we allow the user to say \IMEJeqnarraydblrulerow[][]
\ifx\@IMEJeqnarraydblrulerowARG\@empty%
\@IMEJeqnarrayrulerow[\arrayrulewidth]%
\else%
\@IMEJeqnarrayrulerow[#1]%
\fi%
\def\@IMEJeqnarraydblrulerowARG{#2}%
\ifx\@IMEJeqnarraydblrulerowARG\@empty%
\\\IMEJeqnarrayseprowcut[\doublerulesep][\relax]%
\else%
\\\IMEJeqnarrayseprowcut[#2][\relax]%
\fi%
\\\multispan{\@IMEJeqnnumcols}%
% advance column counter only if the IMEJeqnarray environment wants it
\if@advanceIMEJeqncolcnt\global\advance\@IMEJeqncolcnt by \@IMEJeqnnumcols\relax\fi%
\def\@IMEJeqnarraydblrulerowARG{#1}%
\ifx\@IMEJeqnarraydblrulerowARG\@empty%
\@IMEJeqnarrayrulerow[\arrayrulewidth]%
\else%
\@IMEJeqnarrayrulerow[#1]%
\fi%
}



% inserts a full row's worth of &'s
% relies on \@IMEJeqnnumcols to provide the correct number of columns
% uses \@IMEJtmptoksA, \count0 as scratch registers
\def\@IMEJeqnarrayhoptolastcolumn{\@IMEJtmptoksA={}\count0=1\relax%
\loop% add cols if the user did not use them all
\ifnum\count0<\@IMEJeqnnumcols\relax%
\@IMEJappendtoksA{&}%
\advance\count0 by 1\relax% update the col count
\repeat%
\the\@IMEJtmptoksA%execute the &'s
}



\newif\if@IMEJeqnarrayISinner % flag to indicate if we are within the lines
\@IMEJeqnarrayISinnerfalse    % of an IMEJeqnarray - after the IMEJeqnarraydecl

\edef\@IMEJeqnarrayTHEstrutheight{0pt} % height and depth of IMEJeqnarray struts
\edef\@IMEJeqnarrayTHEstrutdepth{0pt}

\edef\@IMEJeqnarrayTHEmasterstrutheight{0pt} % default height and depth of
\edef\@IMEJeqnarrayTHEmasterstrutdepth{0pt}  % struts within an IMEJeqnarray

\edef\@IMEJeqnarrayTHEmasterstrutHSAVE{0pt} % saved master strut height
\edef\@IMEJeqnarrayTHEmasterstrutDSAVE{0pt} % and depth

\newif\if@IMEJeqnarrayusemasterstrut % flag to indicate that the master strut value
\@IMEJeqnarrayusemasterstruttrue     % is to be used



% saves the strut height and depth of the master strut
\def\@IMEJeqnarraymasterstrutsave{\relax%
\expandafter\skip0=\@IMEJeqnarrayTHEmasterstrutheight\relax%
\expandafter\skip2=\@IMEJeqnarrayTHEmasterstrutdepth\relax%
% remove stretchability
\dimen0\skip0\relax%
\dimen2\skip2\relax%
% save values
\edef\@IMEJeqnarrayTHEmasterstrutHSAVE{\the\dimen0}%
\edef\@IMEJeqnarrayTHEmasterstrutDSAVE{\the\dimen2}}

% restores the strut height and depth of the master strut
\def\@IMEJeqnarraymasterstrutrestore{\relax%
\expandafter\skip0=\@IMEJeqnarrayTHEmasterstrutHSAVE\relax%
\expandafter\skip2=\@IMEJeqnarrayTHEmasterstrutDSAVE\relax%
% remove stretchability
\dimen0\skip0\relax%
\dimen2\skip2\relax%
% restore values
\edef\@IMEJeqnarrayTHEmasterstrutheight{\the\dimen0}%
\edef\@IMEJeqnarrayTHEmasterstrutdepth{\the\dimen2}}


% globally restores the strut height and depth to the 
% master values and sets the master strut flag to true
\def\@IMEJeqnarraystrutreset{\relax%
\expandafter\skip0=\@IMEJeqnarrayTHEmasterstrutheight\relax%
\expandafter\skip2=\@IMEJeqnarrayTHEmasterstrutdepth\relax%
% remove stretchability
\dimen0\skip0\relax%
\dimen2\skip2\relax%
% restore values
\xdef\@IMEJeqnarrayTHEstrutheight{\the\dimen0}%
\xdef\@IMEJeqnarrayTHEstrutdepth{\the\dimen2}%
\global\@IMEJeqnarrayusemasterstruttrue}


% if the master strut is not to be used, make the current
% values of \@IMEJeqnarrayTHEstrutheight, \@IMEJeqnarrayTHEstrutdepth
% and the use master strut flag, global
% this allows user strut commands issued in the last column to be carried
% into the isolation/strut column
\def\@IMEJeqnarrayglobalizestrutstatus{\relax%
\if@IMEJeqnarrayusemasterstrut\else%
\xdef\@IMEJeqnarrayTHEstrutheight{\@IMEJeqnarrayTHEstrutheight}%
\xdef\@IMEJeqnarrayTHEstrutdepth{\@IMEJeqnarrayTHEstrutdepth}%
\global\@IMEJeqnarrayusemasterstrutfalse%
\fi}



% usage: \IMEJeqnarraystrutsize{height}{depth}[font size commands]
% If called outside the lines of an IMEJeqnarray, sets the height
% and depth of both the master and local struts. If called inside
% an IMEJeqnarray line, sets the height and depth of the local strut
% only and sets the flag to indicate the use of the local strut
% values. If the height or depth is left blank, 0.7\normalbaselineskip
% and 0.3\normalbaselineskip will be used, respectively.
% The optional argument can be used to evaluate the lengths under
% a different font size and styles. If none is specified, the current
% font is used.
% uses scratch registers \skip0, \skip2, \skip3, \dimen0, \dimen2
\def\IMEJeqnarraystrutsize#1#2{\relax\@ifnextchar[{\@IMEJeqnarraystrutsize{#1}{#2}}{\@IMEJeqnarraystrutsize{#1}{#2}[\relax]}}
\def\@IMEJeqnarraystrutsize#1#2[#3]{\def\@IMEJeqnarraystrutsizeARG{#1}%
\ifx\@IMEJeqnarraystrutsizeARG\@empty%
{\setbox0=\hbox{#3\relax\global\skip3=0.7\normalbaselineskip}}%
\skip0=\skip3\relax%
\else% arg one present
{\setbox0=\hbox{#3\relax\global\skip3=#1\relax}}%
\skip0=\skip3\relax%
\fi% if null arg
\def\@IMEJeqnarraystrutsizeARG{#2}%
\ifx\@IMEJeqnarraystrutsizeARG\@empty%
{\setbox0=\hbox{#3\relax\global\skip3=0.3\normalbaselineskip}}%
\skip2=\skip3\relax%
\else% arg two present
{\setbox0=\hbox{#3\relax\global\skip3=#2\relax}}%
\skip2=\skip3\relax%
\fi% if null arg
% remove stretchability, just to be safe
\dimen0\skip0\relax%
\dimen2\skip2\relax%
% dimen0 = height, dimen2 = depth
\if@IMEJeqnarrayISinner% inner does not touch master strut size
\edef\@IMEJeqnarrayTHEstrutheight{\the\dimen0}%
\edef\@IMEJeqnarrayTHEstrutdepth{\the\dimen2}%
\@IMEJeqnarrayusemasterstrutfalse% do not use master
\else% outer, have to set master strut too
\edef\@IMEJeqnarrayTHEmasterstrutheight{\the\dimen0}%
\edef\@IMEJeqnarrayTHEmasterstrutdepth{\the\dimen2}%
\edef\@IMEJeqnarrayTHEstrutheight{\the\dimen0}%
\edef\@IMEJeqnarrayTHEstrutdepth{\the\dimen2}%
\@IMEJeqnarrayusemasterstruttrue% use master strut
\fi}


% usage: \IMEJeqnarraystrutsizeadd{added height}{added depth}[font size commands]
% If called outside the lines of an IMEJeqnarray, adds the given height
% and depth to both the master and local struts.
% If called inside an IMEJeqnarray line, adds the given height and depth
% to the local strut only and sets the flag to indicate the use 
% of the local strut values.
% In both cases, if a height or depth is left blank, 0pt is used instead.
% The optional argument can be used to evaluate the lengths under
% a different font size and styles. If none is specified, the current
% font is used.
% uses scratch registers \skip0, \skip2, \skip3, \dimen0, \dimen2
\def\IMEJeqnarraystrutsizeadd#1#2{\relax\@ifnextchar[{\@IMEJeqnarraystrutsizeadd{#1}{#2}}{\@IMEJeqnarraystrutsizeadd{#1}{#2}[\relax]}}
\def\@IMEJeqnarraystrutsizeadd#1#2[#3]{\def\@IMEJeqnarraystrutsizearg{#1}%
\ifx\@IMEJeqnarraystrutsizearg\@empty%
\skip0=0pt\relax%
\else% arg one present
{\setbox0=\hbox{#3\relax\global\skip3=#1}}%
\skip0=\skip3\relax%
\fi% if null arg
\def\@IMEJeqnarraystrutsizearg{#2}%
\ifx\@IMEJeqnarraystrutsizearg\@empty%
\skip2=0pt\relax%
\else% arg two present
{\setbox0=\hbox{#3\relax\global\skip3=#2}}%
\skip2=\skip3\relax%
\fi% if null arg
% remove stretchability, just to be safe
\dimen0\skip0\relax%
\dimen2\skip2\relax%
% dimen0 = height, dimen2 = depth
\if@IMEJeqnarrayISinner% inner does not touch master strut size
% get local strut size
\expandafter\skip0=\@IMEJeqnarrayTHEstrutheight\relax%
\expandafter\skip2=\@IMEJeqnarrayTHEstrutdepth\relax%
% add it to the user supplied values
\advance\dimen0 by \skip0\relax%
\advance\dimen2 by \skip2\relax%
% update the local strut size
\edef\@IMEJeqnarrayTHEstrutheight{\the\dimen0}%
\edef\@IMEJeqnarrayTHEstrutdepth{\the\dimen2}%
\@IMEJeqnarrayusemasterstrutfalse% do not use master
\else% outer, have to set master strut too
% get master strut size
\expandafter\skip0=\@IMEJeqnarrayTHEmasterstrutheight\relax%
\expandafter\skip2=\@IMEJeqnarrayTHEmasterstrutdepth\relax%
% add it to the user supplied values
\advance\dimen0 by \skip0\relax%
\advance\dimen2 by \skip2\relax%
% update the local and master strut sizes
\edef\@IMEJeqnarrayTHEmasterstrutheight{\the\dimen0}%
\edef\@IMEJeqnarrayTHEmasterstrutdepth{\the\dimen2}%
\edef\@IMEJeqnarrayTHEstrutheight{\the\dimen0}%
\edef\@IMEJeqnarrayTHEstrutdepth{\the\dimen2}%
\@IMEJeqnarrayusemasterstruttrue% use master strut
\fi}


% allow user a way to see the struts
\newif\ifIMEJvisiblestruts
\IMEJvisiblestrutsfalse

% inserts an invisible strut using the master or local strut values
% uses scratch registers \skip0, \skip2, \dimen0, \dimen2
\def\@IMEJeqnarrayinsertstrut{\relax%
\if@IMEJeqnarrayusemasterstrut
% get master strut size
\expandafter\skip0=\@IMEJeqnarrayTHEmasterstrutheight\relax%
\expandafter\skip2=\@IMEJeqnarrayTHEmasterstrutdepth\relax%
\else%
% get local strut size
\expandafter\skip0=\@IMEJeqnarrayTHEstrutheight\relax%
\expandafter\skip2=\@IMEJeqnarrayTHEstrutdepth\relax%
\fi%
% remove stretchability, probably not needed
\dimen0\skip0\relax%
\dimen2\skip2\relax%
% dimen0 = height, dimen2 = depth
% allow user to see struts if desired
\ifIMEJvisiblestruts%
\vrule width0.2pt height\dimen0 depth\dimen2\relax%
\else%
\vrule width0pt height\dimen0 depth\dimen2\relax\fi}


% creates an invisible strut, useable even outside \IMEJeqnarray
% if \IMEJvisiblestrutstrue, the strut will be visible and 0.2pt wide. 
% usage: \IMEJstrut[height][depth][font size commands]
% default is \IMEJstrut[0.7\normalbaselineskip][0.3\normalbaselineskip][\relax]
% blank arguments inherit the default values
% uses \dimen0, \dimen2, \skip0, \skip2
\def\IMEJstrut{\relax\@ifnextchar[{\@IMEJstrut}{\@IMEJstrut[0.7\normalbaselineskip]}}
\def\@IMEJstrut[#1]{\relax\@ifnextchar[{\@@IMEJstrut[#1]}{\@@IMEJstrut[#1][0.3\normalbaselineskip]}}
\def\@@IMEJstrut[#1][#2]{\relax\@ifnextchar[{\@@@IMEJstrut[#1][#2]}{\@@@IMEJstrut[#1][#2][\relax]}}
\def\@@@IMEJstrut[#1][#2][#3]{\mbox{#3\relax%
\def\@IMEJstrutARG{#1}%
\ifx\@IMEJstrutARG\@empty%
\skip0=0.7\normalbaselineskip\relax%
\else%
\skip0=#1\relax%
\fi%
\def\@IMEJstrutARG{#2}%
\ifx\@IMEJstrutARG\@empty%
\skip2=0.3\normalbaselineskip\relax%
\else%
\skip2=#2\relax%
\fi%
% remove stretchability, probably not needed
\dimen0\skip0\relax%
\dimen2\skip2\relax%
\ifIMEJvisiblestruts%
\vrule width0.2pt height\dimen0 depth\dimen2\relax%
\else%
\vrule width0.0pt height\dimen0 depth\dimen2\relax\fi}}


% enables strut mode by setting a default strut size and then zeroing the
% \baselineskip, \lineskip, \lineskiplimit and \jot
\def\IMEJeqnarraystrutmode{\IMEJeqnarraystrutsize{0.7\normalbaselineskip}{0.3\normalbaselineskip}[\relax]%
\baselineskip=0pt\lineskip=0pt\lineskiplimit=0pt\jot=0pt}


% equation and subequation forms to use to setup hyperref's \@currentHref
\def\@IMEJtheHrefequation{equation.\theHequation}
\def\@IMEJtheHrefsubequation{equation.\theHequation\alph{IMEJsubequation}}


\def\IMEJeqnarray{\@IMEJeqnumpersisttrue\@IMEJsubeqnumpersistfalse\@IMEJeqnarray}
\def\endIMEJeqnarray{\end@IMEJeqnarray}

\@namedef{IMEJeqnarray*}{\@IMEJeqnumpersistfalse\@IMEJsubeqnumpersistfalse\@IMEJeqnarray}
\@namedef{endIMEJeqnarray*}{\end@IMEJeqnarray}


% \IMEJeqnarray is an enhanced \eqnarray. 
% The star form defaults to not putting equation numbers at the end of each row.
% usage: \IMEJeqnarray[decl]{cols}
\def\@IMEJeqnarray{\relax\@ifnextchar[{\@@IMEJeqnarray}{\@@IMEJeqnarray[\relax]}}
% We have to be careful here to normalize catcodes just before acquiring the
% cols as that specification may contain punctuation which could be subject
% to document catcode changes.
\def\@@IMEJeqnarray[#1]{\begingroup\IMEJnormalcatcodes\@@@IMEJeqnarray[#1]}
\def\@@@IMEJeqnarray[#1]#2{\endgroup
   % default to showing the equation number or not based on whether or not
   % the star form was involked
   \if@IMEJeqnumpersist\global\@eqnswtrue
   \else% not the star form
   \global\@eqnswfalse
   \fi% if star form
   % provide a basic hyperref \theHequation if this has not already been setup (hyperref not loaded, or no section counter)
   \@ifundefined{theHequation}{\def\theHequation{\arabic{equation}}}{}\relax
   % provide dummy hyperref commands in case hyperref is not loaded
   \providecommand{\Hy@raisedlink}[1]{}\relax
   \providecommand{\hyper@anchorstart}[1]{}\relax
   \providecommand{\hyper@anchorend}{}\relax
   \providecommand{\@currentHref}{}\relax
   \@IMEJeqnumpreadvfalse% reset eqnpreadv flag
   \@IMEJsubeqnumpreadvfalse% reset subeqnpreadv flag
   \@IMEJeqnarrayISinnerfalse% not yet within the lines of the halign
   \@IMEJeqnarraystrutsize{0pt}{0pt}[\relax]% turn off struts by default
   \@IMEJeqnarrayusemasterstruttrue% use master strut till user asks otherwise
   \IMEJvisiblestrutsfalse% diagnostic mode defaults to off
   % no extra space unless the user specifically requests it
   \lineskip=0pt\relax
   \lineskiplimit=0pt\relax
   \baselineskip=\normalbaselineskip\relax%
   \jot=\IMEJnormaljot\relax%
   \mathsurround\z@\relax% no extra spacing around math
   \@advanceIMEJeqncolcnttrue% advance the col counter for each col the user uses, 
                             % used in \IMEJeqnarraymulticol and in the preamble build
   %v1.0 Here we preadvance to the next equation number.
   % If the user later wants a continued subequation, we can roll back.
   \global\@IMEJsubeqnnumrollback=\c@IMEJsubequation%
   \stepcounter{equation}\@IMEJeqnumpreadvtrue% advance equation counter before first line
   \setcounter{IMEJsubequation}{0}% no subequation yet
   \let\@IMEJcurrentlabelsave\@currentlabel% save current label as we later change it globally
   \let\@IMEJcurrentHrefsave\@currentHref% save current href label as we later change it globally
   \def\@currentlabel{\p@equation\theequation}% redefine the ref label
   \def\@currentHref{\@IMEJtheHrefequation}% setup hyperref label
   \IMEJeqnarraydecl\relax% allow a way for the user to make global overrides
   #1\relax% allow user to override defaults
   \let\\\@IMEJeqnarraycr% replace newline with one that can put in eqn. numbers
   \global\@IMEJeqncolcnt\z@% col. count = 0 for first line
   \@IMEJbuildpreamble{#2}\relax% build the preamble and put it into \@IMEJtmptoksA 
   % put in the column for the equation number
   \ifnum\@IMEJeqnnumcols>0\relax\@IMEJappendtoksA{&}\fi% col separator for those after the first
   \toks0={##}%
   % advance the \@IMEJeqncolcnt for the isolation col, this helps with error checking
   \@IMEJappendtoksA{\global\advance\@IMEJeqncolcnt by 1\relax}%
   % add the isolation column
   \@IMEJappendtoksA{\tabskip\z@skip\bgroup\the\toks0\egroup}%
   % advance the \@IMEJeqncolcnt for the equation number col, this helps with error checking
   \@IMEJappendtoksA{&\global\advance\@IMEJeqncolcnt by 1\relax}%
   % add the equation number col to the preamble
   \@IMEJappendtoksA{\tabskip\z@skip\hb@xt@\z@\bgroup\hss\the\toks0\egroup}%
   % note \@IMEJeqnnumcols does not count the equation col or isolation col
   % set the starting tabskip glue as determined by the preamble build
   \tabskip=\@IMEJBPstartglue\relax
   % begin the display alignment
   \@IMEJeqnarrayISinnertrue% commands are now within the lines
   $$\everycr{}\halign to\displaywidth\bgroup
   % "exspand" the preamble
   \span\the\@IMEJtmptoksA\cr}

% enter isolation/strut column (or the next column if the user did not use
% every column), record the strut status, complete the columns, do the strut if needed,
% restore counters (to backout any equation setup for a next line that was never used)
% to their correct values and exit
\def\end@IMEJeqnarray{\@IMEJeqnarrayglobalizestrutstatus&\@@IMEJeqnarraycr\egroup
\if@IMEJsubeqnumpreadv\global\advance\c@IMEJsubequation\m@ne\fi
\if@IMEJeqnumpreadv\global\advance\c@equation\m@ne\global\c@IMEJsubequation=\@IMEJsubeqnnumrollback\fi
\global\let\@currentlabel\@IMEJcurrentlabelsave% restore current label
\global\let\@currentHref\@IMEJcurrentHrefsave% restore current href label
$$\@ignoretrue}


% IMEJeqnarray uses a modifed \\ instead of the plain \cr to
% end rows. This allows for things like \\*[vskip amount]
% These "cr" macros are modified versions of those for LaTeX2e's eqnarray
% the {\ifnum0=`} braces must be kept away from the last column to avoid
% altering spacing of its math, so we use & to advance to the next column
% as there is an isolation/strut column after the user's columns
\def\@IMEJeqnarraycr{\@IMEJeqnarrayglobalizestrutstatus&% save strut status and advance to next column
   {\ifnum0=`}\fi
   \@ifstar{%
      \global\@eqpen\@M\@IMEJeqnarrayYCR
   }{%
      \global\@eqpen\interdisplaylinepenalty \@IMEJeqnarrayYCR
   }%
}

\def\@IMEJeqnarrayYCR{\@testopt\@IMEJeqnarrayXCR\z@skip}

\def\@IMEJeqnarrayXCR[#1]{%
   \ifnum0=`{\fi}%
   \@@IMEJeqnarraycr
   \noalign{\penalty\@eqpen\vskip\jot\vskip #1\relax}}%

\def\@@IMEJeqnarraycr{\@IMEJtmptoksA={}% clear token register
    \advance\@IMEJeqncolcnt by -1\relax% adjust col count because of the isolation column
    \ifnum\@IMEJeqncolcnt>\@IMEJeqnnumcols\relax
    \@IMEJclspkgerror{Too many columns within the IMEJeqnarray\MessageBreak
                          environment}%
    {Use fewer \string &'s or put more columns in the IMEJeqnarray column\MessageBreak 
     specifications.}\relax%
    \else
    \loop% add cols if the user did not use them all
    \ifnum\@IMEJeqncolcnt<\@IMEJeqnnumcols\relax
    \@IMEJappendtoksA{&}%
    \advance\@IMEJeqncolcnt by 1\relax% update the col count
    \repeat
    % this number of &'s will take us the the isolation column
    \fi
    % execute the &'s
    \the\@IMEJtmptoksA%
    % handle the strut/isolation column
    \@IMEJeqnarrayinsertstrut% do the strut if needed
    \@IMEJeqnarraystrutreset% reset the strut system for next line or IMEJeqnarray
    &% and enter the equation number column
    \if@eqnsw% only if we display something
      \Hy@raisedlink{\hyper@anchorstart{\@currentHref}}% start a hyperref anchor
      \global\@IMEJeqnumpreadvfalse\relax% displaying an equation number means
      \global\@IMEJsubeqnumpreadvfalse\relax% the equation counters point to valid equations
      % v1.0 Here we setup the counters, currentlabel and status for what would be the *next*
      % equation line as would be the case under the current settings. However, there are two problems.
      % One problem is that there might not ever be a next line. The second problem is that the user
      % may later alter the meaning of a line with commands such as \IMEJyessubnumber. So, to handle
      % these cases we have to record the current values of the (sub)equation counters and revert back
      % to them if the next line is changed or never comes. The \if@IMEJeqnumpreadv, \if@IMEJsubeqnumpreadv
      % and \@IMEJsubeqnnumrollback stuff tracks this.
      % The logic to handle all this is surprisingly complex, but a nice feature of the approach here is
      % that the equation counters and labels remain valid for what the line would be unless a
      % \IMEJyessubnumber et al. later changes it. So, any hyperref links are always correct.
      \ifnum\c@IMEJsubequation>0\relax% handle subequation
         \theIMEJsubequationdis\relax
         \if@IMEJsubeqnumpersist% setup for default type of next line
            \stepcounter{IMEJsubequation}\global\@IMEJsubeqnumpreadvtrue\relax
            \gdef\@currentlabel{\p@IMEJsubequation\theIMEJsubequation}\relax
            \gdef\@currentHref{\@IMEJtheHrefsubequation}% setup hyperref label
         \else
             % if no subeqnum persist, go ahead and setup for a new equation number
             \global\@IMEJsubeqnnumrollback=\c@IMEJsubequation
             \stepcounter{equation}\global\@IMEJeqnumpreadvtrue\relax
             \setcounter{IMEJsubequation}{0}\gdef\@currentlabel{\p@equation\theequation}\relax
             \gdef\@currentHref{\@IMEJtheHrefequation}% setup hyperref label
         \fi
      \else% display a standard equation number
        \theequationdis\relax
        \setcounter{IMEJsubequation}{0}\relax% not really needed
        \if@IMEJsubeqnumpersist% setup for default type of next line
           % subequations that follow plain equations carry the same equation number e.g, 5, 5a rather than 5, 6a
           \stepcounter{IMEJsubequation}\global\@IMEJsubeqnumpreadvtrue\relax
           \gdef\@currentlabel{\p@IMEJsubequation\theIMEJsubequation}\relax
           \gdef\@currentHref{\@IMEJtheHrefsubequation}% setup hyperref label
         \else
             % if no subeqnum persist, go ahead and setup for a new equation number
             \global\@IMEJsubeqnnumrollback=\c@IMEJsubequation
             \stepcounter{equation}\global\@IMEJeqnumpreadvtrue\relax
             \setcounter{IMEJsubequation}{0}\gdef\@currentlabel{\p@equation\theequation}\relax
             \gdef\@currentHref{\@IMEJtheHrefequation}% setup hyperref label
         \fi
      \fi%
      \Hy@raisedlink{\hyper@anchorend}% end hyperref anchor
    \fi% fi only if we display something
    % reset the flags to indicate the default preferences of the display of equation numbers
    \if@IMEJeqnumpersist\global\@eqnswtrue\else\global\@eqnswfalse\fi
    \if@IMEJsubeqnumpersist\global\@eqnswtrue\fi% ditto for the subequation flag
    % reset the number of columns the user actually used
    \global\@IMEJeqncolcnt\z@\relax
    % the real end of the line
    \cr}





% \IMEJeqnarraybox is like \IMEJeqnarray except the box form puts everything
% inside a vtop, vbox, or vcenter box depending on the letter in the second
% optional argument (t,b,c). Vbox is the default. Unlike \IMEJeqnarray,
% equation numbers are not displayed and \IMEJeqnarraybox can be nested.
% \IMEJeqnarrayboxm is for math mode (like \array) and does not put the vbox
% within an hbox.
% \IMEJeqnarrayboxt is for text mode (like \tabular) and puts the vbox within
% a \hbox{$ $} construct.
% \IMEJeqnarraybox will auto detect whether to use \IMEJeqnarrayboxm or 
% \IMEJeqnarrayboxt depending on the math mode.
% The third optional argument specifies the width this box is to be set to -
% natural width is the default.
% The * forms do not add \jot line spacing
% usage: \IMEJeqnarraybox[decl][pos][width]{cols}
\def\IMEJeqnarrayboxm{\@IMEJeqnarrayboxnojotfalse\@IMEJeqnarrayboxHBOXSWfalse\@IMEJeqnarraybox}
\def\endIMEJeqnarrayboxm{\end@IMEJeqnarraybox}
\@namedef{IMEJeqnarrayboxm*}{\@IMEJeqnarrayboxnojottrue\@IMEJeqnarrayboxHBOXSWfalse\@IMEJeqnarraybox}
\@namedef{endIMEJeqnarrayboxm*}{\end@IMEJeqnarraybox}

\def\IMEJeqnarrayboxt{\@IMEJeqnarrayboxnojotfalse\@IMEJeqnarrayboxHBOXSWtrue\@IMEJeqnarraybox}
\def\endIMEJeqnarrayboxt{\end@IMEJeqnarraybox}
\@namedef{IMEJeqnarrayboxt*}{\@IMEJeqnarrayboxnojottrue\@IMEJeqnarrayboxHBOXSWtrue\@IMEJeqnarraybox}
\@namedef{endIMEJeqnarrayboxt*}{\end@IMEJeqnarraybox}

\def\IMEJeqnarraybox{\@IMEJeqnarrayboxnojotfalse\ifmmode\@IMEJeqnarrayboxHBOXSWfalse\else\@IMEJeqnarrayboxHBOXSWtrue\fi%
\@IMEJeqnarraybox}
\def\endIMEJeqnarraybox{\end@IMEJeqnarraybox}

\@namedef{IMEJeqnarraybox*}{\@IMEJeqnarrayboxnojottrue\ifmmode\@IMEJeqnarrayboxHBOXSWfalse\else\@IMEJeqnarrayboxHBOXSWtrue\fi%
\@IMEJeqnarraybox}
\@namedef{endIMEJeqnarraybox*}{\end@IMEJeqnarraybox}

% flag to indicate if the \IMEJeqnarraybox needs to put things into an hbox{$ $} 
% for \vcenter in non-math mode
\newif\if@IMEJeqnarrayboxHBOXSW%
\@IMEJeqnarrayboxHBOXSWfalse

\def\@IMEJeqnarraybox{\relax\@ifnextchar[{\@@IMEJeqnarraybox}{\@@IMEJeqnarraybox[\relax]}}
% We have to be careful here to normalize catcodes just before acquiring the
% cols as that specification may contain punctuation which could be subject
% to document catcode changes.
\def\@@IMEJeqnarraybox[#1]{\relax\begingroup\IMEJnormalcatcodes\@ifnextchar[{\@@@IMEJeqnarraybox[#1]}{\@@@IMEJeqnarraybox[#1][b]}}
\def\@@@IMEJeqnarraybox[#1][#2]{\relax\@ifnextchar[{\@@@@IMEJeqnarraybox[#1][#2]}{\@@@@IMEJeqnarraybox[#1][#2][\relax]}}

% #1 = decl; #2 = t,b,c; #3 = width, #4 = col specs
\def\@@@@IMEJeqnarraybox[#1][#2][#3]#4{\endgroup\@IMEJeqnarrayISinnerfalse % not yet within the lines of the halign
   \@IMEJeqnarraymasterstrutsave% save current master strut values
   \@IMEJeqnarraystrutsize{0pt}{0pt}[\relax]% turn off struts by default
   \@IMEJeqnarrayusemasterstruttrue% use master strut till user asks otherwise
   \IMEJvisiblestrutsfalse% diagnostic mode defaults to off
   % no extra space unless the user specifically requests it
   \lineskip=0pt\relax%
   \lineskiplimit=0pt\relax%
   \baselineskip=\normalbaselineskip\relax%
   \jot=\IMEJnormaljot\relax%
   \mathsurround\z@\relax% no extra spacing around math
   % the default end glues are zero for an \IMEJeqnarraybox
   \edef\@IMEJeqnarraycolSEPdefaultstart{\@IMEJeqnarraycolSEPzero}% default start glue
   \edef\@IMEJeqnarraycolSEPdefaultend{\@IMEJeqnarraycolSEPzero}% default end glue
   \edef\@IMEJeqnarraycolSEPdefaultmid{\@IMEJeqnarraycolSEPzero}% default inter-column glue
   \@advanceIMEJeqncolcntfalse% do not advance the col counter for each col the user uses, 
                              % used in \IMEJeqnarraymulticol and in the preamble build
   \IMEJeqnarrayboxdecl\relax% allow a way for the user to make global overrides
   #1\relax% allow user to override defaults
   \let\\\@IMEJeqnarrayboxcr% replace newline with one that allows optional spacing
   \@IMEJbuildpreamble{#4}\relax% build the preamble and put it into \@IMEJtmptoksA
   % add an isolation column to the preamble to stop \\'s {} from getting into the last col
   \ifnum\@IMEJeqnnumcols>0\relax\@IMEJappendtoksA{&}\fi% col separator for those after the first
   \toks0={##}%
   % add the isolation column to the preamble
   \@IMEJappendtoksA{\tabskip\z@skip\bgroup\the\toks0\egroup}% 
   % set the starting tabskip glue as determined by the preamble build
   \tabskip=\@IMEJBPstartglue\relax
   % begin the alignment
   \everycr{}%
   % use only the very first token to determine the positioning
   \@IMEJextracttoken{#2}\relax
   \ifx\@IMEJextractedtokensdiscarded\@empty\else
     \typeout{** WARNING: IMEJeqnarraybox position specifiers after the first in `\@IMEJextracttokenarg' ignored (line \the\inputlineno).}\relax
   \fi
   % \@IMEJextractedtoken has the first token, the rest are ignored
   % if we need to put things into and hbox and go into math mode, do so now
   \if@IMEJeqnarrayboxHBOXSW \leavevmode \hbox \bgroup $\fi%
   % use the appropriate vbox type
   \if\@IMEJextractedtoken t\relax\vtop\else\if\@IMEJextractedtoken c\relax%
   \vcenter\else\vbox\fi\fi\bgroup%
   \@IMEJeqnarrayISinnertrue% commands are now within the lines
   \ifx#3\relax\halign\else\halign to #3\relax\fi%
   \bgroup
   % "exspand" the preamble
   \span\the\@IMEJtmptoksA\cr}

% carry strut status and enter the isolation/strut column, 
% exit from math mode if needed, and exit
\def\end@IMEJeqnarraybox{\@IMEJeqnarrayglobalizestrutstatus% carry strut status
&% enter isolation/strut column
\@IMEJeqnarrayinsertstrut% do strut if needed
\@IMEJeqnarraymasterstrutrestore% restore the previous master strut values
% reset the strut system for next IMEJeqnarray
% (sets local strut values back to previous master strut values)
\@IMEJeqnarraystrutreset%
% ensure last line, exit from halign, close vbox
\crcr\egroup\egroup%
% exit from math mode and close hbox if needed
\if@IMEJeqnarrayboxHBOXSW $\egroup\fi}



% IMEJeqnarraybox uses a modifed \\ instead of the plain \cr to
% end rows. This allows for things like \\[vskip amount]
% This "cr" macros are modified versions those for LaTeX2e's eqnarray
% For IMEJeqnarraybox, \\* is the same as \\
% the {\ifnum0=`} braces must be kept away from the last column to avoid
% altering spacing of its math, so we use & to advance to the isolation/strut column
% carry strut status into isolation/strut column
\def\@IMEJeqnarrayboxcr{\@IMEJeqnarrayglobalizestrutstatus% carry strut status
&% enter isolation/strut column
\@IMEJeqnarrayinsertstrut% do strut if needed
% reset the strut system for next line or IMEJeqnarray
\@IMEJeqnarraystrutreset%
{\ifnum0=`}\fi%
\@ifstar{\@IMEJeqnarrayboxYCR}{\@IMEJeqnarrayboxYCR}}

% test and setup the optional argument to \\[]
\def\@IMEJeqnarrayboxYCR{\@testopt\@IMEJeqnarrayboxXCR\z@skip}

% IMEJeqnarraybox does not automatically increase line spacing by \jot
\def\@IMEJeqnarrayboxXCR[#1]{\ifnum0=`{\fi}%
\cr\noalign{\if@IMEJeqnarrayboxnojot\else\vskip\jot\fi\vskip#1\relax}}



% usage: \@IMEJbuildpreamble{column specifiers}
% starts the halign preamble build 
% the assembled preamble is put in \@IMEJtmptoksA
\def\@IMEJbuildpreamble#1{\@IMEJtmptoksA={}% clear token register
\let\@IMEJBPcurtype=u%current column type is not yet known
\let\@IMEJBPprevtype=s%the previous column type was the start
\let\@IMEJBPnexttype=u%next column type is not yet known
% ensure these are valid
\def\@IMEJBPcurglue={0pt plus 0pt minus 0pt}%
\def\@IMEJBPcurcolname{@IMEJdefault}% name of current column definition
% currently acquired numerically referenced glue
% use a name that is easier to remember
\let\@IMEJBPcurnum=\@IMEJtmpcountA%
\@IMEJBPcurnum=0%
% tracks number of columns in the preamble
\@IMEJeqnnumcols=0%
% record the default end glues
\edef\@IMEJBPstartglue{\@IMEJeqnarraycolSEPdefaultstart}%
\edef\@IMEJBPendglue{\@IMEJeqnarraycolSEPdefaultend}%
\edef\@IMEJedefMACRO{#1}\relax% fully expand the preamble to support macro containers
% now parse the user's column specifications
% \ignorespaces is used as a delimiter, need at least one trailing \relax because
% \@@IMEJbuildpreamble looks into the future 
\expandafter\@@IMEJbuildpreamble\@IMEJedefMACRO\ignorespaces\relax\relax}


% usage: \@@IMEJbuildpreamble{current column}{next column}
% parses and builds the halign preamble
\def\@@IMEJbuildpreamble#1#2{\let\@@nextIMEJbuildpreamble=\@@IMEJbuildpreamble%
% use only the very first token to check the end
\@IMEJextracttokengroups{#1}\relax
\ifx\@IMEJextractedfirsttoken\ignorespaces\let\@@nextIMEJbuildpreamble=\@@IMEJfinishpreamble\else%
% identify current and next token type
\@IMEJgetcoltype{#1}{\@IMEJBPcurtype}{1}% current, error on invalid
\@IMEJgetcoltype{#2}{\@IMEJBPnexttype}{0}% next, no error on invalid next
% if curtype is a glue, get the glue def
\if\@IMEJBPcurtype g\@IMEJgetcurglue{#1}{\@IMEJBPcurglue}\fi%
% if curtype is a column, get the column def and set the current column name
\if\@IMEJBPcurtype c\@IMEJgetcurcol{#1}\fi%
% if curtype is a numeral, acquire the user defined glue
\if\@IMEJBPcurtype n\@IMEJprocessNcol{#1}\fi%
% process the acquired glue 
\if\@IMEJBPcurtype g\@IMEJprocessGcol\fi%
% process the acquired col 
\if\@IMEJBPcurtype c\@IMEJprocessCcol\fi%
% ready prevtype for next col spec.
\let\@IMEJBPprevtype=\@IMEJBPcurtype%
% be sure and put back the future token(s) as a group
\fi\@@nextIMEJbuildpreamble{#2}}


% usage: \@@IMEJfinishpreamble{discarded}
% executed just after preamble build is completed
% warn about zero cols, and if prevtype type = u, put in end tabskip glue
% argument is not used
\def\@@IMEJfinishpreamble#1{\ifnum\@IMEJeqnnumcols<1\relax
\@IMEJclspkgerror{No column specifiers declared for IMEJeqnarray}%
{At least one column type must be declared for each IMEJeqnarray.}%
\fi%num cols less than 1
%if last type undefined, set default end tabskip glue
\if\@IMEJBPprevtype u\@IMEJappendtoksA{\tabskip=\@IMEJBPendglue}\fi}


% usage: \@IMEJgetcoltype{col specifier}{\output}{error more}
% Identify and return the column specifier's type code in the given
% \output macro:
% n = number
% g = glue (any other char in catagory 12)
% c = letter
% e = \ignorespaces (end of sequence)
% u = undefined
% error mode: 0 = no error message, 1 = error on invalid char
\def\@IMEJgetcoltype#1#2#3{%
% use only the very first token to determine the type
\@IMEJextracttoken{#1}\relax
% \@IMEJextractedtoken has the first token, the rest are discarded
\let#2=u\relax% assume invalid until know otherwise
\ifx\@IMEJextractedtoken\ignorespaces\let#2=e\else
\ifcat\@IMEJextractedtoken\relax\else% screen out control sequences
\if0\@IMEJextractedtoken\let#2=n\else
\if1\@IMEJextractedtoken\let#2=n\else
\if2\@IMEJextractedtoken\let#2=n\else
\if3\@IMEJextractedtoken\let#2=n\else
\if4\@IMEJextractedtoken\let#2=n\else
\if5\@IMEJextractedtoken\let#2=n\else
\if6\@IMEJextractedtoken\let#2=n\else
\if7\@IMEJextractedtoken\let#2=n\else
\if8\@IMEJextractedtoken\let#2=n\else
\if9\@IMEJextractedtoken\let#2=n\else
\ifcat,\@IMEJextractedtoken\let#2=g\relax
\else\ifcat a\@IMEJextractedtoken\let#2=c\relax\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi
\if#2u\relax
\if0\noexpand#3\relax\else\@IMEJclspkgerror{Invalid character in column specifications}%
{Only letters, numerals and certain other symbols are allowed \MessageBreak
as IMEJeqnarray column specifiers.}\fi\fi}


% usage: \@IMEJgetcurcol{col specifier}
% verify the letter referenced column exists
% and return its name in \@IMEJBPcurcolname
% if column specifier is invalid, use the default column @IMEJdefault
\def\@IMEJgetcurcol#1{\expandafter\ifx\csname @IMEJeqnarraycolDEF#1\endcsname\@IMEJeqnarraycolisdefined%
\def\@IMEJBPcurcolname{#1}\else% invalid column name
\@IMEJclspkgerror{Invalid column type "#1" in column specifications.\MessageBreak
Using a default centering column instead}%
{You must define IMEJeqnarray column types before use.}%
\def\@IMEJBPcurcolname{@IMEJdefault}\fi}


% usage: \@IMEJgetcurglue{glue specifier}{\output}
% identify the predefined (punctuation) glue value
% and return it in the given output macro
\def\@IMEJgetcurglue#1#2{%
% ! = \! (neg small)  -0.16667em (-3/18 em)
% , = \, (small)       0.16667em ( 3/18 em)
% : = \: (med)         0.22222em ( 4/18 em)
% ; = \; (large)       0.27778em ( 5/18 em)
% ' = \quad            1em
% " = \qquad           2em
% . = 0.5\arraycolsep
% / = \arraycolsep
% ? = 2\arraycolsep
% * = 1fil
% + = \@IMEJeqnarraycolSEPcenter
% - = \@IMEJeqnarraycolSEPzero
% Note that all em values are referenced to the math font (textfont2) fontdimen6
% value for 1em.
% 
% use only the very first token to determine the type
\@IMEJextracttoken{#1}\relax
\ifx\@IMEJextractedtokensdiscarded\@empty\else
  \typeout{** WARNING: IMEJeqnarray predefined inter-column glue type specifiers after the first in `\@IMEJextracttokenarg' ignored (line \the\inputlineno).}\relax
\fi
% get the math font 1em value
% LaTeX2e's NFSS2 does not preload the fonts, but \IMEJeqnarray needs
% to gain access to the math (\textfont2) font's spacing parameters.
% So we create a bogus box here that uses the math font to ensure
% that \textfont2 is loaded and ready. If this is not done,
% the \textfont2 stuff here may not work.
% Thanks to Bernd Raichle for his 1997 post on this topic.
{\setbox0=\hbox{$\displaystyle\relax$}}%
% fontdimen6 has the width of 1em (a quad).
\@IMEJtmpdimenA=\fontdimen6\textfont2\relax%
% identify the glue value based on the first token
% we discard anything after the first
\if!\@IMEJextractedtoken\@IMEJtmpdimenA=-0.16667\@IMEJtmpdimenA\edef#2{\the\@IMEJtmpdimenA}\else
\if,\@IMEJextractedtoken\@IMEJtmpdimenA=0.16667\@IMEJtmpdimenA\edef#2{\the\@IMEJtmpdimenA}\else
\if:\@IMEJextractedtoken\@IMEJtmpdimenA=0.22222\@IMEJtmpdimenA\edef#2{\the\@IMEJtmpdimenA}\else
\if;\@IMEJextractedtoken\@IMEJtmpdimenA=0.27778\@IMEJtmpdimenA\edef#2{\the\@IMEJtmpdimenA}\else
\if'\@IMEJextractedtoken\@IMEJtmpdimenA=1\@IMEJtmpdimenA\edef#2{\the\@IMEJtmpdimenA}\else
\if"\@IMEJextractedtoken\@IMEJtmpdimenA=2\@IMEJtmpdimenA\edef#2{\the\@IMEJtmpdimenA}\else
\if.\@IMEJextractedtoken\@IMEJtmpdimenA=0.5\arraycolsep\edef#2{\the\@IMEJtmpdimenA}\else
\if/\@IMEJextractedtoken\edef#2{\the\arraycolsep}\else
\if?\@IMEJextractedtoken\@IMEJtmpdimenA=2\arraycolsep\edef#2{\the\@IMEJtmpdimenA}\else
\if *\@IMEJextractedtoken\edef#2{0pt plus 1fil minus 0pt}\else
\if+\@IMEJextractedtoken\edef#2{\@IMEJeqnarraycolSEPcenter}\else
\if-\@IMEJextractedtoken\edef#2{\@IMEJeqnarraycolSEPzero}\else
\edef#2{\@IMEJeqnarraycolSEPzero}%
\@IMEJclspkgerror{Invalid predefined inter-column glue type "#1" in\MessageBreak
column specifications. Using a default value of\MessageBreak
0pt instead}%
{Only !,:;'"./?*+ and - are valid predefined glue types in the\MessageBreak 
IMEJeqnarray column specifications.}\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi}


% usage: \@IMEJprocessNcol{digit}
% process a numerical digit from the column specification
% and look up the corresponding user defined glue value
% can sform current type from n to g or a as the user defined glue is acquired
\def\@IMEJprocessNcol#1{\if\@IMEJBPprevtype g%
\@IMEJclspkgerror{Back-to-back inter-column glue specifiers in column\MessageBreak
specifications. Ignoring consecutive glue specifiers\MessageBreak
after the first}%
{You cannot have two or more glue types next to each other\MessageBreak 
in the IMEJeqnarray column specifications.}%
\let\@IMEJBPcurtype=a% abort this glue, future digits will be discarded
\@IMEJBPcurnum=0\relax%
\else% if we previously aborted a glue
\if\@IMEJBPprevtype a\@IMEJBPcurnum=0\let\@IMEJBPcurtype=a%maintain digit abortion
\else%acquire this number
% save the previous type before the numerical digits started
\if\@IMEJBPprevtype n\else\let\@IMEJBPprevsavedtype=\@IMEJBPprevtype\fi%
\multiply\@IMEJBPcurnum by 10\relax%
\advance\@IMEJBPcurnum by #1\relax% add in number, \relax is needed to stop TeX's number scan
\if\@IMEJBPnexttype n\else%close acquisition
\expandafter\ifx\csname @IMEJeqnarraycolSEPDEF\expandafter\romannumeral\number\@IMEJBPcurnum\endcsname\@IMEJeqnarraycolisdefined%
\edef\@IMEJBPcurglue{\csname @IMEJeqnarraycolSEP\expandafter\romannumeral\number\@IMEJBPcurnum\endcsname}%
\else%user glue not defined
\@IMEJclspkgerror{Invalid user defined inter-column glue type "\number\@IMEJBPcurnum" in\MessageBreak
column specifications. Using a default value of\MessageBreak
0pt instead}%
{You must define all IMEJeqnarray numerical inter-column glue types via\MessageBreak
\string\IMEJeqnarraydefcolsep \space before they are used in column specifications.}%
\edef\@IMEJBPcurglue{\@IMEJeqnarraycolSEPzero}%
\fi% glue defined or not
\let\@IMEJBPcurtype=g% change the type to reflect the acquired glue
\let\@IMEJBPprevtype=\@IMEJBPprevsavedtype% restore the prev type before this number glue
\@IMEJBPcurnum=0\relax%ready for next acquisition
\fi%close acquisition, get glue
\fi%discard or acquire number
\fi%prevtype glue or not
}


% process an acquired glue
% add any acquired column/glue pair to the preamble
\def\@IMEJprocessGcol{\if\@IMEJBPprevtype a\let\@IMEJBPcurtype=a%maintain previous glue abortions
\else
% if this is the start glue, save it, but do nothing else 
% as this is not used in the preamble, but before
\if\@IMEJBPprevtype s\edef\@IMEJBPstartglue{\@IMEJBPcurglue}%
\else%not the start glue
\if\@IMEJBPprevtype g%ignore if back to back glues
\@IMEJclspkgerror{Back-to-back inter-column glue specifiers in column\MessageBreak
specifications. Ignoring consecutive glue specifiers\MessageBreak
after the first}%
{You cannot have two or more glue types next to each other\MessageBreak 
in the IMEJeqnarray column specifications.}%
\let\@IMEJBPcurtype=a% abort this glue
\else% not a back to back glue
\if\@IMEJBPprevtype c\relax% if the previoustype was a col, add column/glue pair to preamble
\ifnum\@IMEJeqnnumcols>0\relax\@IMEJappendtoksA{&}\fi
\toks0={##}%
% make preamble advance col counter if this environment needs this
\if@advanceIMEJeqncolcnt\@IMEJappendtoksA{\global\advance\@IMEJeqncolcnt by 1\relax}\fi
% insert the column defintion into the preamble, being careful not to expand
% the column definition
\@IMEJappendtoksA{\tabskip=\@IMEJBPcurglue}%
\@IMEJappendNOEXPANDtoksA{\begingroup\csname @IMEJeqnarraycolPRE}%
\@IMEJappendtoksA{\@IMEJBPcurcolname}%
\@IMEJappendNOEXPANDtoksA{\endcsname}%
\@IMEJappendtoksA{\the\toks0}%
\@IMEJappendNOEXPANDtoksA{\relax\relax\relax\relax\relax%
\relax\relax\relax\relax\relax\csname @IMEJeqnarraycolPOST}%
\@IMEJappendtoksA{\@IMEJBPcurcolname}%
\@IMEJappendNOEXPANDtoksA{\endcsname\relax\relax\relax\relax\relax%
\relax\relax\relax\relax\relax\endgroup}%
\advance\@IMEJeqnnumcols by 1\relax%one more column in the preamble
\else% error: non-start glue with no pending column
\@IMEJclspkgerror{Inter-column glue specifier without a prior column\MessageBreak
type in the column specifications. Ignoring this glue\MessageBreak 
specifier}%
{Except for the first and last positions, glue can be placed only\MessageBreak
between column types.}%
\let\@IMEJBPcurtype=a% abort this glue
\fi% previous was a column
\fi% back-to-back glues
\fi% is start column glue
\fi% prev type not a
}


% process an acquired letter referenced column and, if necessary, add it to the preamble
\def\@IMEJprocessCcol{\if\@IMEJBPnexttype g\else
\if\@IMEJBPnexttype n\else
% we have a column followed by something other than a glue (or numeral glue)
% so we must add this column to the preamble now
\ifnum\@IMEJeqnnumcols>0\relax\@IMEJappendtoksA{&}\fi%col separator for those after the first
\if\@IMEJBPnexttype e\@IMEJappendtoksA{\tabskip=\@IMEJBPendglue\relax}\else%put in end glue
\@IMEJappendtoksA{\tabskip=\@IMEJeqnarraycolSEPdefaultmid\relax}\fi% or default mid glue
\toks0={##}%
% make preamble advance col counter if this environment needs this
\if@advanceIMEJeqncolcnt\@IMEJappendtoksA{\global\advance\@IMEJeqncolcnt by 1\relax}\fi
% insert the column definition into the preamble, being careful not to expand
% the column definition
\@IMEJappendNOEXPANDtoksA{\begingroup\csname @IMEJeqnarraycolPRE}%
\@IMEJappendtoksA{\@IMEJBPcurcolname}%
\@IMEJappendNOEXPANDtoksA{\endcsname}%
\@IMEJappendtoksA{\the\toks0}%
\@IMEJappendNOEXPANDtoksA{\relax\relax\relax\relax\relax%
\relax\relax\relax\relax\relax\csname @IMEJeqnarraycolPOST}%
\@IMEJappendtoksA{\@IMEJBPcurcolname}%
\@IMEJappendNOEXPANDtoksA{\endcsname\relax\relax\relax\relax\relax%
\relax\relax\relax\relax\relax\endgroup}%
\advance\@IMEJeqnnumcols by 1\relax%one more column in the preamble
\fi%next type not numeral
\fi%next type not glue
}


%%
%% END OF IMEJeqnarray DEFINITIONS
%%





% set up the running headers and footers
%
% header and footer font and size specifications
\def\@IMEJheaderstyle{\normalfont\scriptsize}
\def\@IMEJfooterstyle{\normalfont\scriptsize}
%



% standard page style, ps@headings
\def\ps@headings{% default to standard twoside headers, no footers
% will change later if the mode requires otherwise
\def\@oddhead{\hbox{}\@IMEJheaderstyle\rightmark\hfil\thepage}\relax
\def\@evenhead{\@IMEJheaderstyle\thepage\hfil\leftmark\hbox{}}\relax
\let\@oddfoot\@empty
\let\@evenfoot\@empty

\ifCLASSOPTIONdraftcls
  % draft footers
  \def\@oddfoot{\@IMEJfooterstyle\@date\hfil DRAFT}\relax
  \def\@evenfoot{\@IMEJfooterstyle DRAFT\hfil\@date}\relax
\fi
% oneside
\if@twoside\else
  % standard one side headers
  \def\@oddhead{\hbox{}\@IMEJheaderstyle\leftmark\hfil\thepage}\relax
  \let\@evenhead\@empty
  \ifCLASSOPTIONdraftcls
    % oneside draft footers
    \def\@oddfoot{\@IMEJfooterstyle\@date\hfil DRAFT}\relax
    \let\@evenfoot\@empty
  \fi
\fi

% turn off footers for draftclsnofoot
\ifCLASSOPTIONdraftclsnofoot
  \let\@oddfoot\@empty
  \let\@evenfoot\@empty
\fi}


% title page style, ps@IMEJtitlepagestyle
\def\ps@IMEJtitlepagestyle{% default title page headers, no footers
\def\@oddhead{\hbox{}\@IMEJheaderstyle\leftmark\hfil\thepage}\relax
\def\@evenhead{\@IMEJheaderstyle\thepage\hfil\leftmark\hbox{}}\relax
\let\@oddfoot\@empty
\let\@evenfoot\@empty
% will change later if the mode requires otherwise
\ifCLASSOPTIONdraftcls
  % draft footers
  \ifCLASSOPTIONdraftclsnofoot\else
    % but only if not draftclsnofoot
    \def\@oddfoot{\@IMEJfooterstyle\@date\hfil DRAFT}\relax
    \def\@evenfoot{\@IMEJfooterstyle DRAFT\hfil\@date}\relax
  \fi
\else
  % all nondraft mode footers
  \if@IMEJusingpubid
    % for title pages that are using a pubid
    % do not repeat pubid on the title page if using a peer review cover page
    \ifCLASSOPTIONpeerreview\else
      % for noncompsoc papers, the pubid uses footnotesize and
      % is at the same vertical position as where the last baseline would normally be
      \def\@oddfoot{\hbox{}\hss\@IMEJfooterstyle\footnotesize\raisebox{\footskip}[0pt][0pt]{\@IMEJpubid}\hss\hbox{}}\relax
      \def\@evenfoot{\hbox{}\hss\@IMEJfooterstyle\footnotesize\raisebox{\footskip}[0pt][0pt]{\@IMEJpubid}\hss\hbox{}}\relax
      
    \fi
  \fi
\fi

}


% peer review cover page style, ps@IMEJpeerreviewcoverpagestyle
\def\ps@IMEJpeerreviewcoverpagestyle{% default peer review cover no headers, no footers
\let\@oddhead\@empty
\let\@evenhead\@empty
\let\@oddfoot\@empty
\let\@evenfoot\@empty
% will change later if the mode requires otherwise
\ifCLASSOPTIONdraftcls
  % draft footers
  \ifCLASSOPTIONdraftclsnofoot\else
    % but only if not draftclsnofoot
    \def\@oddfoot{\@IMEJfooterstyle\@date\hfil DRAFT}\relax
    \def\@evenfoot{\@IMEJfooterstyle DRAFT\hfil\@date}\relax
  \fi
\else
  % all nondraft mode footers
  \if@IMEJusingpubid
    % for peer review cover pages that are using a pubid
    % for noncompsoc papers, the pubid uses footnotesize and
    % is at the same vertical position as where the last baseline would normally be
    \def\@oddfoot{\hbox{}\hss\@IMEJfooterstyle\footnotesize\raisebox{\footskip}[0pt][0pt]{\@IMEJpubid}\hss\hbox{}}\relax
    \def\@evenfoot{\hbox{}\hss\@IMEJfooterstyle\footnotesize\raisebox{\footskip}[0pt][0pt]{\@IMEJpubid}\hss\hbox{}}\relax
    %
  \fi
\fi}



%% Defines the command for putting the header.
%% Note that all the text is forced into uppercase, if you have some text
%% that needs to be in lower case, for instance et. al., then either manually
%% set \leftmark and \rightmark or use \MakeLowercase{et. al.} within the
%% arguments to \markboth.
%% v1.0b add \protect to work with Babel
\def\markboth#1#2{\def\leftmark{\MakeUppercase{\protect#1}}%
\def\rightmark{\MakeUppercase{\protect#2}}}

\def\today{\ifcase\month\or
    January\or February\or March\or April\or May\or June\or
    July\or August\or September\or October\or November\or December\fi
    \space\number\day, \number\year}




%% CITATION AND BIBLIOGRAPHY COMMANDS
% 
% Modify Latex2e \@citex to separate citations with "], ["
\def\@citex[#1]#2{%
  \let\@citea\@empty
  \@cite{\@for\@citeb:=#2\do
    {\@citea\def\@citea{], [}%
     \edef\@citeb{\expandafter\@firstofone\@citeb\@empty}%
     \if@filesw\immediate\write\@auxout{\string\citation{\@citeb}}\fi
     \@ifundefined{b@\@citeb}{\mbox{\reset@font\bfseries ?}%
       \G@refundefinedtrue
       \@latex@warning
         {Citation `\@citeb' on page \thepage \space undefined}}%
       {\hbox{\csname b@\@citeb\endcsname}}}}{#1}}

% v1.0 we create hooks for the optional use of Donald Arseneau's
% cite.sty package. cite.sty is "smart" and will notice that the
% following format controls are already defined and will not
% redefine them. The result will be the proper sorting of the
% citation numbers and auto detection of 3 or more entry "ranges" -
% all in IMEJ style:  [1], [2], [5]--[7], [12]
% This also allows for an optional note, i.e., \cite[mynote]{..}.
% If the \cite with note has more than one reference, the note will
% be applied to the last of the listed references. It is generally
% desired that if a note is given, only one reference is listed in
% that \cite.
% Thanks to Mr. Arseneau for providing the required format arguments
% to produce the IMEJ style.
\def\citepunct{], [}
\def\citedash{]--[}

% v1.0 default to using same font for urls made by url.sty
\AtBeginDocument{\csname url@samestyle\endcsname}

% v1.0 class files should always provide these
\def\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
% v1.0b article.cls is now providing these too
% we do not use \@mkboth, nor alter the page style
\newenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \twocolumn[\section*{\indexname}]%
                \parindent\z@
                \parskip\z@ \@plus .3\p@\relax
                \columnseprule \z@
                \columnsep 35\p@
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}



% Provide support for the control entries of IMEJ.bst V1.00 and later.
% v1.0 optional argument allows for a different aux file to be specified in
% order to handle multiple bibliographies. For example, with multibib.sty:
% \newcites{sec}{Secondary Literature}
% \bstctlcite[@auxoutsec]{BSTcontrolhak}
\def\bstctlcite{\@ifnextchar[{\@bstctlcite}{\@bstctlcite[@auxout]}}
\def\@bstctlcite[#1]#2{\@bsphack
  \@for\@citeb:=#2\do{%
    \edef\@citeb{\expandafter\@firstofone\@citeb}%
    \if@filesw\immediate\write\csname #1\endcsname{\string\citation{\@citeb}}\fi}%
  \@esphack}

% \IMEJnoauxwrite{} allows for citations that do not add to or affect
% the order of the existing citation list. Can be useful for \cite
% within \thanks{}.
\DeclareRobustCommand{\IMEJnoauxwrite}[1]{\relax
\if@filesw
\@fileswfalse
#1\relax\relax\relax\relax\relax
\@fileswtrue
\else
#1\relax\relax\relax\relax\relax
\fi}

% v1.0 provide a way for a user to execute a command just before 
% a given reference number - used to insert a \newpage to balance
% the columns on the last page
\edef\@IMEJtriggerrefnum{0}   % the default of zero means that
                              % the command is not executed
\def\@IMEJtriggercmd{\newpage}

% allow the user to alter the triggered command
\long\def\IMEJtriggercmd#1{\long\def\@IMEJtriggercmd{#1}}

% allow user a way to specify the reference number just before the
% command is executed
\def\IMEJtriggeratref#1{\@IMEJtmpcountA=#1%
\edef\@IMEJtriggerrefnum{\the\@IMEJtmpcountA}}%

% trigger command at the given reference
\def\@IMEJbibitemprefix{\@IMEJtmpcountA=\@IMEJtriggerrefnum\relax%
\advance\@IMEJtmpcountA by -1\relax%
\ifnum\c@enumiv=\@IMEJtmpcountA\relax\@IMEJtriggercmd\relax\fi}


\def\@biblabel#1{[#1]}


% controls bib item spacing
\def\IMEJbibitemsep{0pt plus .5pt}



\def\thebibliography#1{\section*{\refname}%
    \addcontentsline{toc}{section}{\refname}%
    % v1.0 add some rubber space here and provide a command trigger
    \footnotesize\vskip 0.3\baselineskip plus 0.1\baselineskip minus 0.1\baselineskip%
    \list{\@biblabel{\@arabic\c@enumiv}}%
    {\settowidth\labelwidth{\@biblabel{#1}}%
    \leftmargin\labelwidth
    \advance\leftmargin\labelsep\relax
    \itemsep \IMEJbibitemsep\relax
    \usecounter{enumiv}%
    \let\p@enumiv\@empty
    \renewcommand\theenumiv{\@arabic\c@enumiv}}%
    \let\@IMEJlatexbibitem\bibitem%
    \def\bibitem{\@IMEJbibitemprefix\@IMEJlatexbibitem}%
\def\newblock{\hskip .11em plus .33em minus .07em}%
% originally:
%   \sloppy\clubpenalty4000\widowpenalty4000%
% by adding the \interlinepenalty here, we make it more
% difficult, but not impossible, for LaTeX to break within a reference.
% The IMEJ almost never breaks a reference (but they do it more often with
% technotes). You may get an underfull vbox warning around the bibliography, 
% but the final result will be much more like what the IMEJ will publish. 
% MDS 11/2000
\sloppy\clubpenalty4000\widowpenalty4000\interlinepenalty500%
    \sfcode`\.=1000\relax}
\let\endthebibliography=\endlist




% TITLE PAGE COMMANDS
% 


% \IMEJauthorrefmark{} produces a footnote type symbol to indicate author affiliation.
% When given an argument of 1 to 9, \IMEJauthorrefmark{} follows the standard LaTeX footnote
% symbol sequence convention. However, for arguments 10 and above, \IMEJauthorrefmark{} 
% reverts to using lower case roman numerals, so it cannot overflow. Do note that you 
% cannot use \footnotemark[] in place of \IMEJauthorrefmark{} within \author as the footnote
% symbols will have been turned off to prevent \thanks from creating footnote marks.
% \IMEJauthorrefmark{} produces a symbol that appears to LaTeX as having zero vertical
% height - this allows for a more compact line packing, but the user must ensure that
% the interline spacing is large enough to prevent \IMEJauthorrefmark{} from colliding
% with the text above.
% v1.0 make this a robust command
% v1.0 smag uses an arabic author affiliation symbol

\DeclareRobustCommand*{\IMEJauthorrefmark}[1]{\raisebox{0pt}[0pt][0pt]{\textsuperscript{\footnotesize\ensuremath{\ifcase#1\or *\or \dagger\or \ddagger\or%
    \mathsection\or \mathparagraph\or \|\or **\or \dagger\dagger%
    \or \ddagger\ddagger \else\textsuperscript{\expandafter\romannumeral#1}\fi}}}}



% FONT CONTROLS AND SPACINGS FOR CONFERENCE MODE AUTHOR NAME AND AFFILIATION BLOCKS
% 
% The default font styles for the author name and affiliation blocks (confmode)
\def\@IMEJauthorblockNstyle{\normalfont\sublargesize}
\def\@IMEJauthorblockAstyle{\normalfont\normalsize}
% The default if the user does not use an author block
\def\@IMEJauthordefaulttextstyle{\normalfont\sublargesize}

% adjustment spacing from title (or special paper notice) to author name blocks (confmode)
% can be negative
\def\@IMEJauthorblockconfadjspace{-0.25em}


% spacing between name and affiliation blocks (confmode)
% This can be negative.
% The IMEJ doesn't want any added spacing here, but I will leave these
% controls in place in case they ever change their mind.
% Personally, I like 0.75ex.
%\def\@IMEJauthorblockNtopspace{0.75ex}
%\def\@IMEJauthorblockAtopspace{0.75ex}
\def\@IMEJauthorblockNtopspace{0.0ex}
\def\@IMEJauthorblockAtopspace{0.0ex}


% baseline spacing within name and affiliation blocks (confmode)
% must be positive, spacings below certain values will make 
% the position of line of text sensitive to the contents of the
% line above it i.e., whether or not the prior line has descenders, 
% subscripts, etc. For this reason it is a good idea to keep
% these above 2.6ex
\def\@IMEJauthorblockNinterlinespace{2.6ex}
\def\@IMEJauthorblockAinterlinespace{2.75ex}

% This tracks the required strut size.
% See the \@IMEJauthorhalign command for the actual default value used.
\def\@IMEJauthorblockXinterlinespace{2.7ex}

% variables to retain font size and style across groups
% values given here have no effect as they will be overwritten later
\gdef\@IMEJSAVESTATEfontsize{10}
\gdef\@IMEJSAVESTATEfontbaselineskip{12}
\gdef\@IMEJSAVESTATEfontencoding{OT1}
\gdef\@IMEJSAVESTATEfontfamily{ptm}
\gdef\@IMEJSAVESTATEfontseries{m}
\gdef\@IMEJSAVESTATEfontshape{n}

% saves the current font attributes
\def\@IMEJcurfontSAVE{\global\let\@IMEJSAVESTATEfontsize\f@size%
\global\let\@IMEJSAVESTATEfontbaselineskip\f@baselineskip%
\global\let\@IMEJSAVESTATEfontencoding\f@encoding%
\global\let\@IMEJSAVESTATEfontfamily\f@family%
\global\let\@IMEJSAVESTATEfontseries\f@series%
\global\let\@IMEJSAVESTATEfontshape\f@shape}

% restores the saved font attributes
\def\@IMEJcurfontRESTORE{\fontsize{\@IMEJSAVESTATEfontsize}{\@IMEJSAVESTATEfontbaselineskip}%
\fontencoding{\@IMEJSAVESTATEfontencoding}%
\fontfamily{\@IMEJSAVESTATEfontfamily}%
\fontseries{\@IMEJSAVESTATEfontseries}%
\fontshape{\@IMEJSAVESTATEfontshape}%
\selectfont}


% variable to indicate if the current block is the first block in the column
\newif\if@IMEJprevauthorblockincol   \@IMEJprevauthorblockincolfalse


% the command places a strut with height and depth = \@IMEJauthorblockXinterlinespace
% we use this technique to have complete manual control over the spacing of the lines
% within the halign environment.
% We set the below baseline portion at 30%, the above
% baseline portion at 70% of the total length.
% Responds to changes in the document's \baselinestretch
\def\@IMEJauthorstrutrule{\@IMEJtmpdimenA\@IMEJauthorblockXinterlinespace%
\@IMEJtmpdimenA=\baselinestretch\@IMEJtmpdimenA%
\rule[-0.3\@IMEJtmpdimenA]{0pt}{\@IMEJtmpdimenA}}


% blocks to hold the authors' names and affilations. 
% Makes formatting easy for conferences
%
% use real definitions in conference mode
% name block
\def\IMEJauthorblockN#1{\relax\@IMEJauthorblockNstyle% set the default text style
\gdef\@IMEJauthorblockXinterlinespace{0pt}% disable strut for spacer row
% the \expandafter hides the \cr in conditional tex, see the array.sty docs
% for details, probably not needed here as the \cr is in a macro
% do a spacer row if needed
\if@IMEJprevauthorblockincol\expandafter\@IMEJauthorblockNtopspaceline\fi
\global\@IMEJprevauthorblockincoltrue% we now have a block in this column
%restore the correct strut value
\gdef\@IMEJauthorblockXinterlinespace{\@IMEJauthorblockNinterlinespace}%
% input the author names
#1%
% end the row if the user did not already
\crcr}
% spacer row for names
\def\@IMEJauthorblockNtopspaceline{\cr\noalign{\vskip\@IMEJauthorblockNtopspace}}
%
% affiliation block
\def\IMEJauthorblockA#1{\relax\@IMEJauthorblockAstyle% set the default text style
\gdef\@IMEJauthorblockXinterlinespace{0pt}%disable strut for spacer row
% the \expandafter hides the \cr in conditional tex, see the array.sty docs
% for details, probably not needed here as the \cr is in a macro
% do a spacer row if needed
\if@IMEJprevauthorblockincol\expandafter\@IMEJauthorblockAtopspaceline\fi
\global\@IMEJprevauthorblockincoltrue% we now have a block in this column
%restore the correct strut value
\gdef\@IMEJauthorblockXinterlinespace{\@IMEJauthorblockAinterlinespace}%
% input the author affiliations
#1%
% end the row if the user did not already
\crcr
}

% spacer row for affiliations
\def\@IMEJauthorblockAtopspaceline{\cr\noalign{\vskip\@IMEJauthorblockAtopspace}}


% allow papers to compile even if author blocks are used in modes other
% than conference or peerreviewca. For such cases, we provide dummy blocks.

   \ifCLASSOPTIONpeerreviewca\else
      % not peerreviewca mode
         \def\IMEJauthorblockN#1{#1}%
         \def\IMEJauthorblockA#1{#1}%
   \fi




% we provide our own halign so as not to have to depend on tabular
\def\@IMEJauthorhalign{\@IMEJauthordefaulttextstyle% default text style
   \lineskip=0pt\relax% disable line spacing
   \lineskiplimit=0pt\relax%
   \baselineskip=0pt\relax%
   \@IMEJcurfontSAVE% save the current font
   \mathsurround\z@\relax% no extra spacing around math
   \let\\\@IMEJauthorhaligncr% replace newline with halign friendly one
   \tabskip=0pt\relax% no column spacing
   \everycr{}% ensure no problems here
   \@IMEJprevauthorblockincolfalse% no author blocks yet
   \def\@IMEJauthorblockXinterlinespace{2.7ex}% default interline space
   \vtop\bgroup%vtop box
   \halign\bgroup&\relax\hfil\@IMEJcurfontRESTORE\relax ##\relax
   \hfil\@IMEJcurfontSAVE\@IMEJauthorstrutrule\cr}

% ensure last line, exit from halign, close vbox
\def\end@IMEJauthorhalign{\crcr\egroup\egroup}

% handle bogus star form
\def\@IMEJauthorhaligncr{{\ifnum0=`}\fi\@ifstar{\@@IMEJauthorhaligncr}{\@@IMEJauthorhaligncr}}

% test and setup the optional argument to \\[]
\def\@@IMEJauthorhaligncr{\@testopt\@@@IMEJauthorhaligncr\z@skip}

% end the line and do the optional spacer
\def\@@@IMEJauthorhaligncr[#1]{\ifnum0=`{\fi}\cr\noalign{\vskip#1\relax}}



% flag to prevent multiple \and warning messages
\newif\if@IMEJWARNand
\@IMEJWARNandtrue

% if in conference or peerreviewca modes, we support the use of \and as \author is a
% tabular environment, otherwise we warn the user that \and is invalid
% outside of conference or peerreviewca modes.
\def\and{\relax} % provide a bogus \and that we will then override

\renewcommand{\and}[1][\relax]{\if@IMEJWARNand\typeout{** WARNING: \noexpand\and is valid only
                               when in conference or peerreviewca}\typeout{modes (line \the\inputlineno).}\fi\global\@IMEJWARNandfalse}


\ifCLASSOPTIONpeerreviewca
\renewcommand{\and}[1][\hfill]{\end{@IMEJauthorhalign}#1\begin{@IMEJauthorhalign}}%
\fi


% page clearing command
% based on LaTeX2e's \cleardoublepage, but allows different page styles
% for the inserted blank pages
\def\@IMEJcleardoublepage#1{\clearpage\if@twoside\ifodd\c@page\else
\hbox{}\thispagestyle{#1}\newpage\if@twocolumn\hbox{}\thispagestyle{#1}\newpage\fi\fi\fi}

% v1.0b hooks to allow adjustment of space above title
\def\IMEJtitletopspace{0.5\baselineskip}
% an added extra amount to allow for adjustment/offset
\def\IMEJtitletopspaceextra{0pt}

% user command to invoke the title page
\def\maketitle{\par%
  \begingroup%
  \normalfont%
  \def\thefootnote{}%  the \thanks{} mark type is empty
  \def\footnotemark{}% and kill space from \thanks within author
  \let\@makefnmark\relax% v1.0, must *really* kill footnotemark to remove all \textsuperscript spacing as well.
  \footnotesize%       equal spacing between thanks lines
  \footnotesep 0.7\baselineskip%see global setting of \footnotesep for more info
  
  \normalsize%
  \ifCLASSOPTIONpeerreview
     \newpage\global\@topnum\z@ \@maketitle\@IMEJstatictitlevskip\@IMEJaftertitletext%
     \thispagestyle{IMEJpeerreviewcoverpagestyle}\@thanks%
  \else
     \if@twocolumn%
        
           \twocolumn[{\IMEJquantizevspace{\@maketitle}[\IMEJquantizedisabletitlecmds]{0pt}[-\topskip]{\baselineskip}{\@IMEJNORMtitlevspace}{\@IMEJMINtitlevspace}\@IMEJaftertitletext}]%
      
     \else
        \newpage\global\@topnum\z@ \@maketitle\@IMEJstatictitlevskip\@IMEJaftertitletext%
     \fi
     \thispagestyle{IMEJtitlepagestyle}\@thanks%
  \fi
  % pullup page for pubid if used.
  \if@IMEJusingpubid
     \enlargethispage{-\@IMEJpubidpullup}%
  \fi 
  \endgroup
  \setcounter{footnote}{0}\let\maketitle\relax\let\@maketitle\relax
  \gdef\@thanks{}%
  % v1.6b do not clear these as we will need the title again for peer review papers
  % \gdef\@author{}\gdef\@title{}%
  \let\thanks\relax}


% v1.0 parbox to format \@IMEJtitleabstractindextext
\long\def\@IMEJtitleabstractindextextbox#1{\parbox{1\textwidth}{#1}}


% formats the Title, authors names, affiliations and special paper notice
% THIS IS A CONTROLLED SPACING COMMAND! Do not allow blank lines or unintentional
% spaces to enter the definition - use % at the end of each line
\def\@maketitle{\newpage
\bgroup\par\vskip\IMEJtitletopspace\vskip\IMEJtitletopspaceextra\centering%
\vskip0.2em{\Huge\@title\par}\relax\vskip1.0em\par%
  % journal or peerreview
           {\lineskip.5em\sublargesize\@author\@IMEJspecialpapernotice\par
           }\relax
\par\addvspace{0.5\baselineskip}\egroup}




% v1.0 standard LateX2e \thanks, but with \itshape under compsoc. Also make it a \long\def
% We also need to trigger the one-shot footnote rule
\def\@IMEJtriggeroneshotfootnoterule{\global\@IMEJenableoneshotfootnoteruletrue}


\long\def\thanks#1{\footnotemark
    \protected@xdef\@thanks{\@thanks
        \protect\footnotetext[\the\c@footnote]{\ignorespaces#1}}}
\let\@thanks\@empty


% v1.0 allow \author to contain \par's. This is needed to allow \thanks to contain \par.
\long\def\author#1{\gdef\@author{#1}}


% in addition to setting up IMEJitemize, we need to remove a baselineskip space above and
% below it because \list's \pars introduce blank lines because of the footnote struts.
\def\@IMEJsetupcompsocitemizelist{\def\labelitemi{$\bullet$}%
\setlength{\IMEJlabelindent}{0pt}\setlength{\labelsep}{1.2em}\setlength{\parskip}{0pt}%
\setlength{\partopsep}{0pt}\setlength{\topsep}{0.5\baselineskip}\vspace{-1\baselineskip}\relax}


% flag for fake non-compsoc \IMEJcompsocthanksitem - prevents line break on very first item
\newif\if@IMEJbreakcompsocthanksitem \@IMEJbreakcompsocthanksitemfalse



% non-compsoc, allow for dual compilation via rerouting to normal \thanks
\long\def\IMEJcompsocitemizethanks#1{\thanks{#1}}
% redirect to "pseudo-par" \hfil\break\indent after swallowing [] from \IMEJcompsocthanksitem[]
\DeclareRobustCommand{\IMEJcompsocthanksitem}{\@ifnextchar [{\@IMEJthanksswallowoptionalarg}%
{\@IMEJthanksswallowoptionalarg[\relax]}}
% be sure and break only after first item, be sure and ignore spaces after optional argument
\def\@IMEJthanksswallowoptionalarg[#1]{\relax\if@IMEJbreakcompsocthanksitem\hfil\break
\indent\fi\@IMEJbreakcompsocthanksitemtrue\ignorespaces}



% v1.0b define the \IMEJpeerreviewmaketitle as needed
\ifCLASSOPTIONpeerreview
\def\IMEJpeerreviewmaketitle{\@IMEJcleardoublepage{empty}%
\ifCLASSOPTIONtwocolumn
\twocolumn[{\IMEJquantizevspace{\@IMEJpeerreviewmaketitle}[\IMEJquantizedisabletitlecmds]{0pt}[-\topskip]{\baselineskip}{\@IMEJNORMtitlevspace}{\@IMEJMINtitlevspace}}]
\else
\newpage\@IMEJpeerreviewmaketitle\@IMEJstatictitlevskip
\fi
\thispagestyle{IMEJtitlepagestyle}}
\else
% \IMEJpeerreviewmaketitle does nothing if peer review option has not been selected
\def\IMEJpeerreviewmaketitle{\relax}
\fi

% peerreview formats the repeated title like the title in journal papers.
\def\@IMEJpeerreviewmaketitle{\bgroup\par\addvspace{0.5\baselineskip}\centering%
\normalfont\normalsize\vskip0.2em{\Huge\@title\par}\vskip1.0em\par
\par\addvspace{0.5\baselineskip}\egroup}



% v1.0 
% this is a static rubber spacer between the title/authors and the main text
% used for single column text, or when the title appears in the first column
% of two column text (technotes). 
\def\@IMEJstatictitlevskip{{\normalfont\normalsize
% adjust spacing to next text
% v1.6b handle peer review papers
\ifCLASSOPTIONpeerreview
% for peer review papers, the same value is used for both title pages
% regardless of the other paper modes
   \vskip 1\baselineskip plus 0.375\baselineskip minus 0.1875\baselineskip
\else
         \vskip 2.5\baselineskip plus 0.75\baselineskip minus 0.375\baselineskip%
      \fi%
}}


% set the nominal and minimum values for the quantized title spacer
% the quantization algorithm will not allow the spacer size to
% become less than \@IMEJMINtitlevspace - instead it will be lengthened
% default to journal values
\def\@IMEJNORMtitlevspace{2.5\baselineskip}
\def\@IMEJMINtitlevspace{2\baselineskip}



% v1.0a
\def\IMEJquantizevspace{\begingroup\@ifstar{\@IMEJquantizevspacestarformtrue\@IMEJquantizevspace}{\@IMEJquantizevspacestarformfalse\@IMEJquantizevspace}}
% \IMEJquantizevspace[output dimen register]{object}[object decl]
%                    {top baselineskip}
%                    [offset][prevdepth][lineskip limit][lineskip]
%                    {unit height}{nominal vspace}{minimum vspace}
%
% Calculates and creates the vspace needed to make the combined height with
% the given object an integer multiple of the given unit height. This command
% is more general than the older \@IMEJdynamictitlevspace it replaces.
%
% The star form has no effect at present, but is reserved for future use.
%
% If the optional argument [output dimen register] is given, the calculated
% vspace height is stored in the given output dimen (or skip) register
% and no other action is taken, otherwise the object followed by a vspace*
% of the appropriate height is evaluated/output.
%
% The optional object decl (declarations) is code that is evaluated just
% before the object's height is evaluated. Its intented purpose is to allow
% for the alteration or disabling of code within the object during internal
% height evaluation (e.g., \long\def\thanks#1{\relax} ).
% This special code is not invoked if/when the object is rendered at the end.
%
% The nominal vspace is the target value of the added vspace and the minimum
% vspace is the lower allowed limit. The vspacer will be the value that achieves
% integral overall height, in terms of the given unit height, that is closest
% to the nominal vspace and that is not less than the specified minimum vspace.
%
% The line spacing algorithm of TeX is somewhat involved and requires special
% care with regard to the first line of a vertical list (which is indicated
% when \prevdepth is -1000pt or less). top baselineskip specifies the
% baselineskip or topskip used prior to the object. If the height of the
% first line of the object is greater than the given top baselineskip, then
% the top baselineskip is subtracted from the height of the first line and
% that difference is considered along with the rest of the object height
% (because the object will be shifted down by an amount = 
% top line height - top baselineskip). Otherwise, the height of the first line
% of the object is ignored as far as the calculations are concerned.
% This algorithm is adequate for objects that appear at the top of a page
% (e.g., titles) where \topskip spacing is used.
%
% However, as explained on page 78 of the TeXbook, interline spacing is more
% complex when \baselineskip is being used (indicated by \prevdepth > 
% -1000pt). The four optional parameters offset, prevdepth, lineskip limit and
% lineskip are assumed to be equal to be 0pt, \prevdepth, \lineskiplimit and
% \lineskip, respectively, if they are omitted.
%
% The prevdepth is the depth of the line before the object, the lineskip limit
% specifies how close the top of the object can come to the bottom of the
% previous line before \baselineskip is ignored and \lineskip is inserted
% between the object and the line above it. Lineskip does not come into
% play unless the first line of the object is high enough to "get too close"
% (as specified by lineskiplimit) to the line before it. The the prevdepth,
% lineskip limit, and lineskip optional parameters are not needed for the
% first object/line on a page (i.e., prevdepth <= -1000pt) where the simplier
% \topskip spacing rules are in effect.
%
% Offset is a manual adjustment that is added to the height calculations of
% object irrespective of the value of \prevdepth. It is useful when the top
% baselineskip will result in a noninteger unit height object placement even
% if the object itself has integral height. e.g., a footnotesize baselineskip
% is used before the object, thus an offset of, say -3pt, can be given as a
% correction.

% Common combinations of these parameters include:
%
% top baselineskip:   (and default values for offset, prevdepth, etc.)
% \topskip            % for objects that appear at the top of a page
% \maxdimen           % always ignore the height of the top line
% 0pt                 % always consider any positive height of the top line
%
% for objects to appear inline in normal text:
% top baselineskip = \baselineskip
%
% set prevdepth = -1000pt and top baselineskip = 0pt to consider the
% overall height of the object without any other external skip
% consideration

\newif\if@IMEJquantizevspacestarform       % flag to indicate star form
\newif\if@IMEJquantizevspaceuseoutdimenreg % flag to indicate output dimen register is to be used
% Use our own private registers because the object could contain a
% structure that uses the existing tmp scratch pad registers
\newdimen\@IMEJquantizeheightA
\newdimen\@IMEJquantizeheightB
\newdimen\@IMEJquantizeheightC
\newdimen\@IMEJquantizeprevdepth % need to save this early as can change
\newcount\@IMEJquantizemultiple
\newbox\@IMEJquantizeboxA


\def\@IMEJquantizevspace{\@ifnextchar [{\@IMEJquantizevspaceuseoutdimenregtrue\@@IMEJquantizevspace}{\@IMEJquantizevspaceuseoutdimenregfalse\@@IMEJquantizevspace[]}}


\long\def\@@IMEJquantizevspace[#1]#2{\relax
% acquire and store
% #1 optional output dimen register
% #2 object
\edef\@IMEJquantizeoutdimenreg{#1}\relax
% allow for object specifications that contain parameters
\@IMEJtmptoksA={#2}\relax
\long\edef\@IMEJquantizeobject{\the\@IMEJtmptoksA}\relax
\@ifnextchar [{\@@@IMEJquantizevspace}{\@@@IMEJquantizevspace[\relax]}}

\long\def\@@@IMEJquantizevspace[#1]#2{\relax
% acquire and store
% [#1] optional object decl, is \relax if not given by user
% #2 top baselineskip
% allow for object decl specifications that have parameters
\@IMEJtmptoksA={#1}\relax
\long\edef\@IMEJquantizeobjectdecl{\the\@IMEJtmptoksA}\relax
\edef\@IMEJquantizetopbaselineskip{#2}\ivIMEJquantizevspace}

% acquire optional argument set and store
% [offset][prevdepth][lineskip limit][lineskip]
\def\ivIMEJquantizevspace{\@ifnextchar [{\@vIMEJquantizevspace}{\@vIMEJquantizevspace[0pt]}}
\def\@vIMEJquantizevspace[#1]{\edef\@IMEJquantizeoffset{#1}\@ifnextchar [{\@viIMEJquantizevspace}{\@viIMEJquantizevspace[\prevdepth]}}
\def\@viIMEJquantizevspace[#1]{\@IMEJquantizeprevdepth=#1\relax\@ifnextchar [{\@viiIMEJquantizevspace}{\@viiIMEJquantizevspace[\lineskiplimit]}}
\def\@viiIMEJquantizevspace[#1]{\edef\@IMEJquantizelineskiplimit{#1}\@ifnextchar [{\@viiiIMEJquantizevspace}{\@viiiIMEJquantizevspace[\lineskip]}}
\def\@viiiIMEJquantizevspace[#1]{\edef\@IMEJquantizelineskip{#1}\@ixIMEJquantizevspace}

% main routine
\def\@ixIMEJquantizevspace#1#2#3{\relax
\edef\@IMEJquantizeunitheight{#1}\relax
\edef\@IMEJquantizenomvspace{#2}\relax
\edef\@IMEJquantizeminvspace{#3}\relax
% \@IMEJquantizeoutdimenreg
% \@IMEJquantizeobject
% \@IMEJquantizeobjectdecl
% \@IMEJquantizetopbaselineskip
% \@IMEJquantizeoffset
% \@IMEJquantizeprevdepth
% \@IMEJquantizelineskiplimit
% \@IMEJquantizelineskip
% \@IMEJquantizeunitheight
% \@IMEJquantizenomvspace
% \@IMEJquantizeminvspace
% get overall height of object
\setbox\@IMEJquantizeboxA\vbox{\begingroup\@IMEJquantizeobjectdecl\@IMEJquantizeobject\relax\endgroup}\relax
\@IMEJquantizeheightA\ht\@IMEJquantizeboxA\relax
% get height of first line of object
\setbox\@IMEJquantizeboxA\vtop{\begingroup\@IMEJquantizeobjectdecl\@IMEJquantizeobject\relax\endgroup}\relax
\@IMEJquantizeheightB\ht\@IMEJquantizeboxA\relax
\ifdim\@IMEJquantizeprevdepth>-1000pt\relax % prevdepth > -1000pf means full baselineskip\lineskip rules in effect
% lineskip spacing rule takes effect if height of top line > baselineskip - prevdepth - lineskiplimit, 
% otherwise the baselineskip rule is in effect and the height of the first line does not matter at all.
\@IMEJquantizeheightC=\@IMEJquantizetopbaselineskip\relax
\advance\@IMEJquantizeheightC-\@IMEJquantizeprevdepth\relax
\advance\@IMEJquantizeheightC-\@IMEJquantizelineskiplimit\relax % this works even though \@IMEJquantizelineskiplimit is a macro because TeX allows --10pt notation
\ifdim\@IMEJquantizeheightB>\@IMEJquantizeheightC\relax
% lineskip spacing rule is in effect i.e., the object is going to be shifted down relative to the
% baselineskip set position by its top line height (already a part of the total height) + prevdepth + lineskip - baselineskip
\advance\@IMEJquantizeheightA\@IMEJquantizeprevdepth\relax
\advance\@IMEJquantizeheightA\@IMEJquantizelineskip\relax
\advance\@IMEJquantizeheightA-\@IMEJquantizetopbaselineskip\relax
\else
% height of first line <= \@IMEJquantizetopbaselineskip - \@IMEJquantizeprevdepth - \@IMEJquantizelineskiplimit
% standard baselineskip rules are in effect, so don't consider height of first line
\advance\@IMEJquantizeheightA-\@IMEJquantizeheightB\relax
\fi
%
\else % prevdepth <= -1000pt, simplier \topskip type rules in effect
\ifdim\@IMEJquantizeheightB>\@IMEJquantizetopbaselineskip
% height of top line (already included in the total height) in excess of
% baselineskip is the amount it will be downshifted
\advance\@IMEJquantizeheightA-\@IMEJquantizetopbaselineskip\relax
\else
% height of first line is irrelevant, remove it
\advance\@IMEJquantizeheightA-\@IMEJquantizeheightB\relax
\fi
\fi % prevdepth <= -1000pt
%
% adjust height for any manual offset
\advance\@IMEJquantizeheightA\@IMEJquantizeoffset\relax
% add in nominal spacer
\advance\@IMEJquantizeheightA\@IMEJquantizenomvspace\relax
% check for nonzero unitheight
\@IMEJquantizeheightB=\@IMEJquantizeunitheight\relax
\ifnum\@IMEJquantizeheightB=0\relax
\@IMEJclspkgerror{IMEJquantizevspace unit height cannot be zero. Assuming 10pt.}%
{Division by zero is not allowed.}
\@IMEJquantizeheightB=10pt\relax
\fi
% get integer number of lines
\@IMEJquantizemultiple=\@IMEJquantizeheightA\relax
\divide\@IMEJquantizemultiple\@IMEJquantizeheightB\relax
% set A to contain the excess height over the \@IMEJquantizemultiple of lines
% A = height - multiple*unitheight
\@IMEJquantizeheightC\@IMEJquantizeheightB\relax
\multiply\@IMEJquantizeheightC\@IMEJquantizemultiple\relax
\advance\@IMEJquantizeheightA-\@IMEJquantizeheightC\relax
% set B to contain the height short of \@IMEJquantizemultiple+1 of lines
% B = unitheight - A
\advance\@IMEJquantizeheightB-\@IMEJquantizeheightA\relax
% choose A or B based on which is closer
\@IMEJquantizeheightC\@IMEJquantizenomvspace\relax
\ifdim\@IMEJquantizeheightA<\@IMEJquantizeheightB\relax
% C = nomvspace - A, go with lower
\advance\@IMEJquantizeheightC-\@IMEJquantizeheightA\relax
\else
% C = nomvspace + B, go with upper
\advance\@IMEJquantizeheightC\@IMEJquantizeheightB\relax
\fi
% if violate lower bound, use next integer bound
\ifdim\@IMEJquantizeheightC<\@IMEJquantizeminvspace\relax
% A + B = unitheight
\advance\@IMEJquantizeheightC\@IMEJquantizeheightA\relax
\advance\@IMEJquantizeheightC\@IMEJquantizeheightB\relax
\fi
% export object and spacer outside of group
\global\let\@IMEJquantizeobjectout\@IMEJquantizeobject\relax
\global\@IMEJquantizeheightC\@IMEJquantizeheightC\relax
\endgroup
\if@IMEJquantizevspaceuseoutdimenreg
\@IMEJquantizeoutdimenreg=\@IMEJquantizeheightC\relax
\else
\@IMEJquantizeobjectout\relax
\vskip\@IMEJquantizeheightC\relax
\fi}


% user command to disable all global assignments, possible use within object decl
\def\IMEJquantizedisableglobal{\let\global\relax
\let\gdef\def
\let\xdef\edef}
% user command to allow for the disabling of \thanks and other commands, possible use within object decl
\def\IMEJquantizedisabletitlecmds{\long\def\thanks##1{\relax}\relax
\long\def\IMEJcompsocitemizethanks##1{\relax}\def\newpage{\relax}}





% v1.0
% we allow the user access to the last part of the title area
% useful in emergencies such as when a different spacing is needed
% This text is NOT compensated for in the dynamic sizer.
\let\@IMEJaftertitletext=\relax
\long\def\IMEJaftertitletext#1{\def\@IMEJaftertitletext{#1}}


% v1.0 provide a way for users to enter abstract and keywords
% into the onecolumn title are. This text is compensated for
% in the dynamic sizer.
\let\@IMEJtitleabstractindextext=\relax
\long\def\IMEJtitleabstractindextext#1{\def\@IMEJtitleabstractindextext{#1}}

% v1.0 provide a way for users to get the \@IMEJtitleabstractindextext if
% not in compsoc or smag journal mode - this way abstract and keywords
% can still be placed in their conventional position if not in those modes.
\def\IMEJdisplaynontitleabstractindextext{%
               \@IMEJtitleabstractindextext\relax
      }


% command to allow alteration of baselinestretch, but only if the current
% baselineskip is unity. Used to tweak the compsoc abstract and keywords line spacing.
\def\@IMEJtweakunitybaselinestretch#1{{\def\baselinestretch{1}\selectfont
\global\@tempskipa\baselineskip}\ifnum\@tempskipa=\baselineskip%
\def\baselinestretch{#1}\selectfont\fi\relax}


% abstract and keywords are in \small, except 
% for 9pt docs in which they are in \footnotesize
% Because 9pt docs use an 8pt footnotesize, \small
% becomes a rather awkward 8.5pt
\def\@IMEJabskeysecsize{\small}
\ifx\CLASSOPTIONpt\@IMEJptsizenine
 \def\@IMEJabskeysecsize{\footnotesize}
\fi


% v1.0 have abstract and keywords strip leading spaces, pars and newlines
% so that spacing is more tightly controlled.
\def\abstract{\normalfont
    \if@twocolumn
      \@IMEJabskeysecsize\bfseries\textit{\abstractname}---\relax
    \else
      \bgroup\par\addvspace{0.5\baselineskip}\centering\vspace{-1.78ex}\@IMEJabskeysecsize\textbf{\abstractname}\par\addvspace{0.5\baselineskip}\egroup\quotation\@IMEJabskeysecsize
    \fi\@IMEJgobbleleadPARNLSP}
% v1.0 The IMEJ wants only 1 pica from end of abstract to introduction heading when in 
% conference mode (the heading already has this much above it)
\def\endabstract{\relax\vspace{1.34ex}\par\if@twocolumn\else\endquotation\fi
    \normalfont\normalsize}

\def\IMEJkeywords{\normalfont
    \if@twocolumn
      \@IMEJabskeysecsize\bfseries\textit{\IMEJkeywordsname}---\relax
    \else
      \bgroup\par\addvspace{0.5\baselineskip}\centering\@IMEJabskeysecsize\textbf{\IMEJkeywordsname}\par\addvspace{0.5\baselineskip}\egroup\quotation\@IMEJabskeysecsize
    \fi\@IMEJgobbleleadPARNLSP}
\def\endIMEJkeywords{\relax\vspace{0.67ex}
    \par\if@twocolumn\else\endquotation\fi%
    \normalfont\normalsize}





% gobbles all leading \, \\ and \par, upon finding first token that
% is not a \ , \\ or a \par, it ceases and returns that token
% 
% used to strip leading \, \\ and \par from the input
% so that such things in the beginning of an environment will not
% affect the formatting of the text
\long\def\@IMEJgobbleleadPARNLSP#1{\let\@IMEJswallowthistoken=0%
\let\@IMEJgobbleleadPARNLSPtoken#1%
\let\@IMEJgobbleleadPARtoken=\par%
\let\@IMEJgobbleleadNLtoken=\\%
\let\@IMEJgobbleleadSPtoken=\ %
\def\@IMEJgobbleleadSPMACRO{\ }%
\ifx\@IMEJgobbleleadPARNLSPtoken\@IMEJgobbleleadPARtoken%
\let\@IMEJswallowthistoken=1%
\fi%
\ifx\@IMEJgobbleleadPARNLSPtoken\@IMEJgobbleleadNLtoken%
\let\@IMEJswallowthistoken=1%
\fi%
\ifx\@IMEJgobbleleadPARNLSPtoken\@IMEJgobbleleadSPtoken%
\let\@IMEJswallowthistoken=1%
\fi%
% a control space will come in as a macro
% when it is the last one on a line
\ifx\@IMEJgobbleleadPARNLSPtoken\@IMEJgobbleleadSPMACRO%
\let\@IMEJswallowthistoken=1%
\fi%
% if we have to swallow this token, do so and taste the next one
% else spit it out and stop gobbling
\ifx\@IMEJswallowthistoken 1\let\@IMEJnextgobbleleadPARNLSP=\@IMEJgobbleleadPARNLSP\else%
\let\@IMEJnextgobbleleadPARNLSP=#1\fi%
\@IMEJnextgobbleleadPARNLSP}%




% TITLING OF SECTIONS
\def\@IMEJsectpunct{:\ \,}  % Punctuation after run-in section heading  (headings which are
                            % part of the paragraphs), need little bit more than a single space
                            % spacing from section number to title



\def\@seccntformat#1{\csname the#1dis\endcsname\hskip 0.5em\relax}



%v1.7 put {} after #6 to allow for some types of user font control
%and use \@@par rather than \par
\def\@sect#1#2#3#4#5#6[#7]#8{%
  \ifnum #2>\c@secnumdepth
     \let\@svsec\@empty
  \else
     \refstepcounter{#1}%
     % load section label and spacer into \@svsec
     \protected@edef\@svsec{\@seccntformat{#1}\relax}%
  \fi%
  \@tempskipa #5\relax
  \ifdim \@tempskipa>\z@% tempskipa determines whether is treated as a high
     \begingroup #6{\relax% or low level heading
      \noindent % subsections are NOT indented
       % print top level headings. \@svsec is label, #8 is heading title
       % The IMEJ does not block indent the section title text, it flows like normal
       {\hskip #3\relax\@svsec}{\interlinepenalty \@M #8\@@par}}%
     \endgroup
     \addcontentsline{toc}{#1}{\ifnum #2>\c@secnumdepth\relax\else
               \protect\numberline{\csname the#1\endcsname}\fi#7}%
  \else % printout low level headings
     % svsechd seems to swallow the trailing space, protect it with \mbox{}
     % got rid of sectionmark stuff
     \def\@svsechd{#6{\hskip #3\relax\@svsec #8\@IMEJsectpunct\mbox{}}%
     \addcontentsline{toc}{#1}{\ifnum #2>\c@secnumdepth\relax\else
               \protect\numberline{\csname the#1\endcsname}\fi#7}}%
  \fi%skip down
  \@xsect{#5}}


% section* handler
%v1.7 put {} after #4 to allow for some types of user font control
%and use \@@par rather than \par
\def\@ssect#1#2#3#4#5{\@tempskipa #3\relax
  \ifdim \@tempskipa>\z@
     %\begingroup #4\@hangfrom{\hskip #1}{\interlinepenalty \@M #5\par}\endgroup
     % The IMEJ does not block indent the section title text, it flows like normal
     \begingroup \noindent #4{\relax{\hskip #1}{\interlinepenalty \@M #5\@@par}}\endgroup
  % svsechd swallows the trailing space, protect it with \mbox{}
  \else \def\@svsechd{#4{\hskip #1\relax #5\@IMEJsectpunct\mbox{}}}\fi
  \@xsect{#3}}


%% SECTION heading spacing and font
%%
% arguments are: #1 - sectiontype name
% (for \@sect)   #2 - section level
%                #3 - section heading indent
%                #4 - top separation (absolute value used, neg indicates not to indent main text)
%                     If negative, make stretch parts negative too!
%                #5 - (absolute value used) positive: bottom separation after heading,
%                      negative: amount to indent main text after heading
%                Both #4 and #5 negative means to indent main text and use negative top separation
%                #6 - font control
% You've got to have \normalfont\normalsize in the font specs below to prevent
% trouble when you do something like:
% \section{Note}{\ttfamily TT-TEXT} is known to ... 
% The IMEJ sometimes REALLY stretches the area before a section
% heading by up to about 0.5in. However, it may not be a good
% idea to let LaTeX have quite this much rubber.

 % for journals
\def\section{\@startsection{section}{1}{\z@}{3.0ex plus 1.5ex minus 1.5ex}% v1.0 3.0ex from 3.5ex
{0.7ex plus 1ex minus 0ex}{\normalfont\normalsize\centering\scshape}}%
\def\subsection{\@startsection{subsection}{2}{\z@}{3.5ex plus 1.5ex minus 1.5ex}%
{0.7ex plus .5ex minus 0ex}{\normalfont\normalsize\itshape}}%


% for both journals and conferences
% decided to put in a little rubber above the section, might help somebody
\def\subsubsection{\@startsection{subsubsection}{3}{\parindent}{0ex plus 0.1ex minus 0.1ex}%
{0ex}{\normalfont\normalsize\itshape}}%
\def\paragraph{\@startsection{paragraph}{4}{2\parindent}{0ex plus 0.1ex minus 0.1ex}%
{0ex}{\normalfont\normalsize\itshape}}%





% v1.0a provide for a raised line Introduction section for use with Computer
% Society papers. We have to remove any spacing glue after the section
% heading and then remove the blank line for the new paragraph after it.
% LaTeX's section handler alters \everypar and we need to propogate those
% changes outside of the \parbox lest there be spacing problems at the top
% of the next section.
\def\IMEJraisesectionheading#1{\noindent\raisebox{1.5\baselineskip}[0pt][0pt]{\parbox[b]{\columnwidth}{#1\unskip\global\everypar=\everypar}}\vspace{-1\baselineskip}\vspace{-\parskip}\par}



%% ENVIRONMENTS
% "box" symbols at end of proofs
\def\IMEJQEDclosed{\mbox{\rule[0pt]{1.3ex}{1.3ex}}} % for a filled box
% v1.0 some journals use an open box instead that will just fit around a closed one
\def\IMEJQEDopen{{\setlength{\fboxsep}{0pt}\setlength{\fboxrule}{0.2pt}\fbox{\rule[0pt]{0pt}{1.3ex}\rule[0pt]{1.3ex}{0pt}}}}

\def\IMEJQED{\IMEJQEDclosed} % default to closed


%v1.0 flag to indicate if QED symbol is to be shown
\newif\if@IMEJQEDshow  \@IMEJQEDshowtrue
\def\IMEJproofindentspace{2\parindent}% v1.0 allow user to change indentation amount if desired
% v1.7 name change to avoid namespace collision with amsthm. Also add support
% for an optional argument.
\def\IMEJproof{\@ifnextchar[{\@IMEJproof}{\@IMEJproof[\IMEJproofname]}}
\def\@IMEJproof[#1]{\@IMEJQEDshowtrue\par\noindent\hspace{\IMEJproofindentspace}{\itshape #1: }}
\def\endIMEJproof{\if@IMEJQEDshow\hspace*{\fill}\nobreakspace\IMEJQED\fi\par}
% qedhere for equation environments, similar to AMS \qedhere
\def\IMEJQEDhereeqn{\global\@IMEJQEDshowfalse\eqno\let\eqno\relax\let\leqno\relax
                    \let\veqno\relax\hbox{\IMEJQED}}
% IMEJ style qedhere for IMEJeqnarray and other environments
\def\IMEJQEDhere{\global\@IMEJQEDshowfalse\IMEJQED}
% command to disable QED at end of IMEJproof
\def\IMEJQEDoff{\global\@IMEJQEDshowfalse}


%\itemindent is set to \z@ by list, so define new temporary variable
\newdimen\@IMEJtmpitemindent



% 
% v1.0 allow long theorem names to break across lines.
% Thanks to Miquel Payaro for reporting this.
\def\@begintheorem#1#2{\@IMEJtmpitemindent\itemindent\relax\topsep 0pt\rmfamily\trivlist%
    \item[]\textit{\indent #1\ #2:} \itemindent\@IMEJtmpitemindent\relax}
\def\@opargbegintheorem#1#2#3{\@IMEJtmpitemindent\itemindent\relax\topsep 0pt\rmfamily \trivlist%
% v1.0 The IMEJ is back to using () around theorem names which are also in italics
% Thanks to Christian Peel for reporting this.
    \item[]\textit{\indent #1\ #2\ (#3):} \itemindent\@IMEJtmpitemindent\relax}
% v1.0 remove bogus \unskip that caused equations in theorems to collide with
% lines below.
\def\@endtheorem{\endtrivlist}




% v1.0
% display command for the section the theorem is in - so that \thesection
% is not used as this will be in Roman numerals when we want arabic.
% LaTeX2e uses \def\@thmcounter#1{\noexpand\arabic{#1}} for the theorem number
% (second part) display and \def\@thmcountersep{.} as a separator.
% v1.0 intercept calls to the section counter and reroute to \@IMEJthmcounterinsection
% to allow \appendix(ices} to override as needed.
%
% special handler for sections, allows appendix(ices) to override
\gdef\@IMEJthmcounterinsection#1{\arabic{#1}}
% string macro
\edef\@IMEJstringsection{section}

% redefine the #1#2[#3] form of newtheorem to use a hook to \@IMEJthmcounterinsection
% if section in_counter is used
\def\@xnthm#1#2[#3]{%
  \expandafter\@ifdefinable\csname #1\endcsname
    {\@definecounter{#1}\@newctr{#1}[#3]%
     \edef\@IMEJstringtmp{#3}
     \ifx\@IMEJstringtmp\@IMEJstringsection
     \expandafter\xdef\csname the#1\endcsname{%
     \noexpand\@IMEJthmcounterinsection{#3}\@thmcountersep
          \@thmcounter{#1}}%
     \else
     \expandafter\xdef\csname the#1\endcsname{%
       \expandafter\noexpand\csname the#3\endcsname \@thmcountersep
          \@thmcounter{#1}}%
     \fi
     \global\@namedef{#1}{\@thm{#1}{#2}}%
     \global\@namedef{end#1}{\@endtheorem}}}



%% SET UP THE DEFAULT PAGESTYLE
\pagestyle{headings}
\pagenumbering{arabic}

% normally the page counter starts at 1
\setcounter{page}{1}
% however, for peerreview the cover sheet is page 0 or page -1
% (for duplex printing)
\ifCLASSOPTIONpeerreview
   \if@twoside
      \setcounter{page}{-1}
   \else
      \setcounter{page}{0}
   \fi
\fi

% standard book class behavior - let bottom line float up and down as
% needed when single sided
\ifCLASSOPTIONtwoside\else\raggedbottom\fi
% if two column - turn on twocolumn, allow word spacings to stretch more and
% enforce a rigid position for the last lines
\ifCLASSOPTIONtwocolumn
% the peer review option delays invoking twocolumn
   \ifCLASSOPTIONpeerreview\else
      \twocolumn
   \fi
\sloppy 
\flushbottom
\fi




% \APPENDIX and \APPENDICES definitions

% This is the \@ifmtarg command from the LaTeX ifmtarg package
% by Peter Wilson (CUA) and Donald Arseneau
% \@ifmtarg is used to determine if an argument to a command
% is present or not.
% For instance:
% \@ifmtarg{#1}{\typeout{empty}}{\typeout{has something}}
% \@ifmtarg is used with our redefined \section command if
% \appendices is invoked.
% The command \section will behave slightly differently depending
% on whether the user specifies a title: 
% \section{My appendix title}
% or not:
% \section{}
% This way, we can eliminate the blank lines where the title
% would be, and the unneeded : after Appendix in the table of
% contents 
\begingroup
\catcode`\Q=3
\long\gdef\@ifmtarg#1{\@xifmtarg#1QQ\@secondoftwo\@firstoftwo\@nil}
\long\gdef\@xifmtarg#1#2Q#3#4#5\@nil{#4}
\endgroup
% end of \@ifmtarg defs


% v1.0
% command that allows the one time saving of the original definition
% of section to \@IMEJappendixsavesection for \appendix or \appendices 
% we don't save \section here as it may be redefined later by other
% packages (hyperref.sty, etc.)
\def\@IMEJsaveoriginalsectiononce{\let\@IMEJappendixsavesection\section
\let\@IMEJsaveoriginalsectiononce\relax}

% neat trick to grab and process the argument from \section{argument}
% we process differently if the user invoked \section{} with no
% argument (title)
% note we reroute the call to the old \section*
\def\@IMEJprocessthesectionargument#1{%
\@ifmtarg{#1}{%
\@IMEJappendixsavesection*{\appendixname\nobreakspace\thesectiondis}%
\addcontentsline{toc}{section}{\appendixname\nobreakspace\thesection}}{%
\@IMEJappendixsavesection*{\appendixname\nobreakspace\thesectiondis\\* #1}%
\addcontentsline{toc}{section}{\appendixname\nobreakspace\thesection: #1}}}

% we use this if the user calls \section{} after
% \appendix-- which has no meaning. So, we ignore the
% command and its argument. Then, warn the user.
\def\@IMEJdestroythesectionargument#1{\typeout{** WARNING: Ignoring useless
\protect\section\space in Appendix (line \the\inputlineno).}}


% remember \thesection forms will be displayed in \ref calls
% and in the Table of Contents.
% The \sectiondis form is used in the actual heading itself

% appendix command for one single appendix
% normally has no heading. However, if you want a 
% heading, you can do so via the optional argument:
% \appendix[Optional Heading]
\def\appendix{\relax}
\renewcommand{\appendix}[1][]{\@IMEJsaveoriginalsectiononce\par
    % v1.6 keep hyperref's identifiers unique
    \gdef\theHsection{Appendix.A}%
    % v1.6 adjust hyperref's string name for the section
    \xdef\Hy@chapapp{appendix}%
    \setcounter{section}{0}%
    \setcounter{subsection}{0}%
    \setcounter{subsubsection}{0}%
    \setcounter{paragraph}{0}%
    \gdef\thesection{A}%
    \gdef\thesectiondis{}% 
    \gdef\thesubsection{\Alph{subsection}}%
    \gdef\@IMEJthmcounterinsection##1{A}
    \refstepcounter{section}% update the \ref counter
    \@ifmtarg{#1}{\@IMEJappendixsavesection*{\appendixname}%
                  \addcontentsline{toc}{section}{\appendixname}}{%
             \@IMEJappendixsavesection*{\appendixname\nobreakspace\\* #1}%
             \addcontentsline{toc}{section}{\appendixname: #1}}%
    % redefine \section command for appendix
    % leave \section* as is
    \def\section{\@ifstar{\@IMEJappendixsavesection*}{%
                    \@IMEJdestroythesectionargument}}% throw out the argument
                                                     % of the normal form
}



% appendices command for multiple appendices
% user then calls \section with an argument (possibly empty) to
% declare the individual appendices
\def\appendices{\@IMEJsaveoriginalsectiononce\par
    % v1.6 keep hyperref's identifiers unique
    \gdef\theHsection{Appendix.\Alph{section}}%
    % v1.6 adjust hyperref's string name for the section
    \xdef\Hy@chapapp{appendix}%
    \setcounter{section}{-1}% we want \refstepcounter to use section 0
    \setcounter{subsection}{0}%
    \setcounter{subsubsection}{0}%
    \setcounter{paragraph}{0}%
    \ifCLASSOPTIONromanappendices%
    \gdef\thesection{\Roman{section}}%
    \gdef\thesectiondis{\Roman{section}}%
    \gdef\@IMEJthmcounterinsection##1{A\arabic{##1}}
    \else%
    \gdef\thesection{\Alph{section}}%
    \gdef\thesectiondis{\Alph{section}}%
    \gdef\@IMEJthmcounterinsection##1{\Alph{##1}}
    \fi%
    \refstepcounter{section}% update the \ref counter
    \setcounter{section}{0}% NEXT \section will be the FIRST appendix
    % redefine \section command for appendices
    % leave \section* as is
    \def\section{\@ifstar{\@IMEJappendixsavesection*}{% process the *-form
                    \refstepcounter{section}% or is a new section so,
                    \@IMEJprocessthesectionargument}}% process the argument 
                                                 % of the normal form
}




%
%
% \IMEJPARstart
% Definition for the big two line drop cap letter at the beginning of the
% first paragraph of journal papers. The first argument is the first letter
% of the first word, the second argument is the remaining letters of the
% first word which will be rendered in upper case.
% In v1.0 this has been completely rewritten to:
% 
% 1. no longer have problems when the user begins an environment
%    within the paragraph that uses \IMEJPARstart.
% 2. auto-detect and use the current font family
% 3. revise handling of the space at the end of the first word so that
%    interword glue will now work as normal.
% 4. produce correctly aligned edges for the (two) indented lines.
% 
% We generalize things via control macros - playing with these is fun too.
% 
% v1.0 added more control macros to make it easy for IMEJtools.sty users
% to change the font style.
% 
% the number of lines that are indented to clear it
% may need to increase if using decenders
\providecommand{\IMEJPARstartDROPLINES}{2}
% minimum number of lines left on a page to allow a \@IMEJPARstart
% Does not take into consideration rubber shrink, so it tends to
% be overly cautious
\providecommand{\IMEJPARstartMINPAGELINES}{2}
% v1.0 the height of the drop cap is adjusted to match the height of this text
% in the current font (when \IMEJPARstart is called).
\providecommand{\IMEJPARstartHEIGHTTEXT}{T}
% the depth the letter is lowered below the baseline
% the height (and size) of the letter is determined by the sum
% of this value and the height of the \IMEJPARstartHEIGHTTEXT in the current
% font. It is a good idea to set this value in terms of the baselineskip
% so that it can respond to changes therein.
\providecommand{\IMEJPARstartDROPDEPTH}{1.1\baselineskip}
% v1.0 the font the drop cap will be rendered in,
% can take zero or one argument.
\providecommand{\IMEJPARstartFONTSTYLE}{\bfseries}
% v1.0 any additional, non-font related commands needed to modify
% the drop cap letter, can take zero or one argument.
\providecommand{\IMEJPARstartCAPSTYLE}{\MakeUppercase}
% v1.0 the font that will be used to render the rest of the word,
% can take zero or one argument.
\providecommand{\IMEJPARstartWORDFONTSTYLE}{\relax}
% v1.0 any additional, non-font related commands needed to modify
% the rest of the word, can take zero or one argument.
\providecommand{\IMEJPARstartWORDCAPSTYLE}{\MakeUppercase}
% This is the horizontal separation distance from the drop letter to the main text.
% Lengths that depend on the font (e.g., ex, em, etc.) will be referenced
% to the font that is active when \IMEJPARstart is called. 
\providecommand{\IMEJPARstartSEP}{0.15em}
% v1.0 horizontal offset applied to the left of the drop cap.
\providecommand{\IMEJPARstartHOFFSET}{0em}
% v1.0 Italic correction command applied at the end of the drop cap.
\providecommand{\IMEJPARstartITLCORRECT}{\/}

% width of the letter output, set globally. Can be used in \IMEJPARstartSEP
% or \IMEJPARstartHOFFSET, but not the height lengths.
\newdimen\IMEJPARstartletwidth
\IMEJPARstartletwidth 0pt\relax

% definition of \IMEJPARstart
% THIS IS A CONTROLLED SPACING AREA, DO NOT ALLOW SPACES WITHIN THESE LINES
% 
% The token \@IMEJPARstartfont will be globally defined after the first use
% of \IMEJPARstart and will be a font command which creates the big letter
% The first argument is the first letter of the first word and the second
% argument is the rest of the first word(s).
\def\IMEJPARstart#1#2{\par{%
% if this page does not have enough space, break it and lets start
% on a new one
\@IMEJneedspace{\IMEJPARstartMINPAGELINES\baselineskip}{\relax}%
% v1.0 move this up here in case user uses \textbf for \IMEJPARstartFONTSTYLE
% which uses command \leavevmode which causes an unwanted \indent to be issued
\noindent
% calculate the desired height of the big letter
% it extends from the top of \IMEJPARstartHEIGHTTEXT in the current font
% down to \IMEJPARstartDROPDEPTH below the current baseline
\settoheight{\@IMEJtmpdimenA}{\IMEJPARstartHEIGHTTEXT}%
\addtolength{\@IMEJtmpdimenA}{\IMEJPARstartDROPDEPTH}%
% extract the name of the current font in bold
% and place it in \@IMEJPARstartFONTNAME
\def\@IMEJPARstartGETFIRSTWORD##1 ##2\relax{##1}%
{\IMEJPARstartFONTSTYLE{\selectfont\edef\@IMEJPARstartFONTNAMESPACE{\fontname\font\space}%
\xdef\@IMEJPARstartFONTNAME{\expandafter\@IMEJPARstartGETFIRSTWORD\@IMEJPARstartFONTNAMESPACE\relax}}}%
% define a font based on this name with a point size equal to the desired
% height of the drop letter
\font\@IMEJPARstartsubfont\@IMEJPARstartFONTNAME\space at \@IMEJtmpdimenA\relax%
% save this value as a counter (integer) value (sp points)
\@IMEJtmpcountA=\@IMEJtmpdimenA%
% now get the height of the actual letter produced by this font size
\settoheight{\@IMEJtmpdimenB}{\@IMEJPARstartsubfont\IMEJPARstartCAPSTYLE{#1}}%
% If something bogus happens like the first argument is empty or the
% current font is sge, do not allow a zero height.
\ifdim\@IMEJtmpdimenB=0pt\relax%
\typeout{** WARNING: IMEJPARstart drop letter has zero height! (line \the\inputlineno)}%
\typeout{ Forcing the drop letter font size to 10pt.}%
\@IMEJtmpdimenB=10pt%
\fi%
% and store it as a counter
\@IMEJtmpcountB=\@IMEJtmpdimenB%
% Since a font size doesn't exactly correspond to the height of the capital
% letters in that font, the actual height of the letter, \@IMEJtmpcountB,
% will be less than that desired, \@IMEJtmpcountA
% we need to raise the font size, \@IMEJtmpdimenA 
% by \@IMEJtmpcountA / \@IMEJtmpcountB
% But, TeX doesn't have floating point division, so we have to use integer
% division. Hence the use of the counters.
% We need to reduce the denominator so that the loss of the remainder will
% have minimal affect on the accuracy of the result
\divide\@IMEJtmpcountB by 200%
\divide\@IMEJtmpcountA by \@IMEJtmpcountB%
% Then reequalize things when we use TeX's ability to multiply by
% floating point values
\@IMEJtmpdimenB=0.005\@IMEJtmpdimenA%
\multiply\@IMEJtmpdimenB by \@IMEJtmpcountA%
% \@IMEJPARstartfont is globaly set to the calculated font of the big letter
% We need to carry this out of the local calculation area to to create the
% big letter.
\global\font\@IMEJPARstartfont\@IMEJPARstartFONTNAME\space at \@IMEJtmpdimenB%
% Now set \@IMEJtmpdimenA to the width of the big letter
% We need to carry this out of the local calculation area to set the
% hanging indent
\settowidth{\global\@IMEJtmpdimenA}{\@IMEJPARstartfont
\IMEJPARstartCAPSTYLE{#1\IMEJPARstartITLCORRECT}}}%
% end of the isolated calculation environment
\global\IMEJPARstartletwidth\@IMEJtmpdimenA\relax%
% add in the extra clearance we want
\advance\@IMEJtmpdimenA by \IMEJPARstartSEP\relax%
% add in the optional offset
\advance\@IMEJtmpdimenA by \IMEJPARstartHOFFSET\relax%
% v1.0 don't allow negative offsets to produce negative hanging indents
\@IMEJtmpdimenB\@IMEJtmpdimenA
\ifnum\@IMEJtmpdimenB < 0 \@IMEJtmpdimenB 0pt\fi
% \@IMEJtmpdimenA has the width of the big letter plus the
% separation space and \@IMEJPARstartfont is the font we need to use
% Now, we make the letter and issue the hanging indent command
% The letter is placed in a box of zero width and height so that other
% text won't be displaced by it.
\hangindent\@IMEJtmpdimenB\hangafter=-\IMEJPARstartDROPLINES%
\makebox[0pt][l]{\hspace{-\@IMEJtmpdimenA}%
\raisebox{-\IMEJPARstartDROPDEPTH}[0pt][0pt]{\hspace{\IMEJPARstartHOFFSET}%
\@IMEJPARstartfont\IMEJPARstartCAPSTYLE{#1\IMEJPARstartITLCORRECT}%
\hspace{\IMEJPARstartSEP}}}%
{\IMEJPARstartWORDFONTSTYLE{\IMEJPARstartWORDCAPSTYLE{\selectfont#2}}}}




% determines if the space remaining on a given page is equal to or greater
% than the specified space of argument one
% if not, execute argument two (only if the remaining space is greater than zero)
% and issue a \newpage
% 
% example: \@IMEJneedspace{2in}{\vfill}
% 
% Does not take into consideration rubber shrinkage, so it tends to
% be overly cautious
% Based on an example posted by Donald Arseneau
% Note this macro uses \@IMEJtmpdimenB internally for calculations,
% so DO NOT PASS \@IMEJtmpdimenB to this routine
% if you need a dimen register, import with \@IMEJtmpdimenA instead
\def\@IMEJneedspace#1#2{\penalty-100\begingroup%shield temp variable
\@IMEJtmpdimenB\pagegoal\advance\@IMEJtmpdimenB-\pagetotal% space left
\ifdim #1>\@IMEJtmpdimenB\relax% not enough space left
\ifdim\@IMEJtmpdimenB>\z@\relax #2\fi%
\newpage%
\fi\endgroup}



% IMEJbiography ENVIRONMENT
% Allows user to enter biography leaving place for picture (adapts to font size)
% As of v1.0, a new optional argument allows you to have a real graphic!
% v1.0 and later also fixes the "colliding biographies" which could happen when a 
% biography's text was shorter than the space for the photo.
% MDS 7/2001
% v1.0 prevent multiple biographies from making multiple TOC entries
\newif\if@IMEJbiographyTOCentrynotmade
\global\@IMEJbiographyTOCentrynotmadetrue

% biography counter so hyperref can jump directly to the biographies
% and not just the previous section
\newcounter{IMEJbiography}
\setcounter{IMEJbiography}{0}

% photo area size
\def\@IMEJBIOphotowidth{1.0in}    % width of the biography photo area
\def\@IMEJBIOphotodepth{1.25in}   % depth (height) of the biography photo area
% area cleared for photo
\def\@IMEJBIOhangwidth{1.14in}    % width cleared for the biography photo area
\def\@IMEJBIOhangdepth{1.25in}    % depth cleared for the biography photo area
                                  % actual depth will be a multiple of 
                                  % \baselineskip, rounded up
\def\@IMEJBIOskipN{4\baselineskip}% nominal value of the vskip above the biography

\newenvironment{IMEJbiography}[2][]{\normalfont\footnotesize%
\unitlength 1in\parskip=0pt\par\parindent 1em\interlinepenalty500%
% we need enough space to support the hanging indent
% the nominal value of the spacer
% and one extra line for good measure
\@IMEJtmpdimenA=\@IMEJBIOhangdepth%
\advance\@IMEJtmpdimenA by \@IMEJBIOskipN%
\advance\@IMEJtmpdimenA by 1\baselineskip%
% if this page does not have enough space, break it and lets start
% with a new one
\@IMEJneedspace{\@IMEJtmpdimenA}{\relax}%
% nominal spacer can strech, not shrink use 1fil so user can out stretch with \vfill
\vskip \@IMEJBIOskipN plus 1fil minus 0\baselineskip%
% the default box for where the photo goes
\def\@IMEJtempbiographybox{{\setlength{\fboxsep}{0pt}\framebox{%
\begin{minipage}[b][\@IMEJBIOphotodepth][c]{\@IMEJBIOphotowidth}\centering PLACE\\ PHOTO\\ HERE \end{minipage}}}}%
%
% detect if the optional argument was supplied, this requires the
% \@ifmtarg command as defined in the appendix section above
% and if so, override the default box with what they want
\@ifmtarg{#1}{\relax}{\def\@IMEJtempbiographybox{\mbox{\begin{minipage}[b][\@IMEJBIOphotodepth][c]{\@IMEJBIOphotowidth}%
\centering%
#1%
\end{minipage}}}}% end if optional argument supplied
% Make an entry into the table of contents only if we have not done so before
\if@IMEJbiographyTOCentrynotmade%
% link labels to the biography counter so hyperref will jump
% to the biography, not the previous section
\setcounter{IMEJbiography}{-1}%
\refstepcounter{IMEJbiography}%
\addcontentsline{toc}{section}{Biographies}%
\global\@IMEJbiographyTOCentrynotmadefalse%
\fi%
% one more biography
\refstepcounter{IMEJbiography}%
% Make an entry for this name into the table of contents 
\addcontentsline{toc}{subsection}{#2}%
% v1.0 properly handle if a new paragraph should occur while the
% hanging indent is still active. Do this by redefining \par so
% that it will not start a new paragraph. (But it will appear to the
% user as if it did.) Also, strip any leading pars, newlines, or spaces.
\let\@IMEJBIOORGparCMD=\par% save the original \par command
\edef\par{\hfil\break\indent}% the new \par will not be a "real" \par
\settoheight{\@IMEJtmpdimenA}{\@IMEJtempbiographybox}% get height of biography box
\@IMEJtmpdimenB=\@IMEJBIOhangdepth%
\@IMEJtmpcountA=\@IMEJtmpdimenB% countA has the hang depth
\divide\@IMEJtmpcountA by \baselineskip%  calculates lines needed to produce the hang depth
\advance\@IMEJtmpcountA by 1% ensure we overestimate
% set the hanging indent
\hangindent\@IMEJBIOhangwidth%
\hangafter-\@IMEJtmpcountA%
% reference the top of the photo area to the top of a capital T
\settoheight{\@IMEJtmpdimenB}{\mbox{T}}%
% set the photo box, give it zero width and height so as not to disturb anything
\noindent\makebox[0pt][l]{\hspace{-\@IMEJBIOhangwidth}\raisebox{\@IMEJtmpdimenB}[0pt][0pt]{%
\raisebox{-\@IMEJBIOphotodepth}[0pt][0pt]{\@IMEJtempbiographybox}}}%
% now place the author name and begin the bio text
\noindent\textbf{#2\ }\@IMEJgobbleleadPARNLSP}{\relax\let\par=\@IMEJBIOORGparCMD\par%
% 7/2001 v1.0 detect when the biography text is shorter than the photo area
% and pad the unused area - preventing a collision from the next biography entry
% MDS
\ifnum \prevgraf <\@IMEJtmpcountA\relax% detect when the biography text is shorter than the photo
    \advance\@IMEJtmpcountA by -\prevgraf% calculate how many lines we need to pad
    \advance\@IMEJtmpcountA by -1\relax% we compensate for the fact that we indented an extra line
    \@IMEJtmpdimenA=\baselineskip% calculate the length of the padding
    \multiply\@IMEJtmpdimenA by \@IMEJtmpcountA%
    \noindent\rule{0pt}{\@IMEJtmpdimenA}% insert an invisible support strut
\fi%
\par\normalfont}



% v1.0
% added biography without a photo environment
\newenvironment{IMEJbiographynophoto}[1]{%
% Make an entry into the table of contents only if we have not done so before
\if@IMEJbiographyTOCentrynotmade%
% link labels to the biography counter so hyperref will jump
% to the biography, not the previous section
\setcounter{IMEJbiography}{-1}%
\refstepcounter{IMEJbiography}%
\addcontentsline{toc}{section}{Biographies}%
\global\@IMEJbiographyTOCentrynotmadefalse%
\fi%
% one more biography
\refstepcounter{IMEJbiography}%
% Make an entry for this name into the table of contents 
\addcontentsline{toc}{subsection}{#1}%
\normalfont\footnotesize\interlinepenalty500%
\vskip 4\baselineskip plus 1fil minus 0\baselineskip%
\parskip=0pt\par%
\noindent\textbf{#1\ }\@IMEJgobbleleadPARNLSP}{\relax\par\normalfont}


% provide the user with some old font commands
% got this from article.cls
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}


% SPECIAL PAPER NOTICE COMMANDS
% 
% holds the special notice text
\def\@IMEJspecialpapernotice{\relax}
 
% for special papers, like invited papers, the user can do:
% \IMEJspecialpapernotice{(Invited Paper)} before \maketitle
\def\IMEJspecialpapernotice#1{
\def\@IMEJspecialpapernotice{{\\*[1.5ex]\sublargesize\textit{#1}}\vspace*{-2ex}}%
}




% PUBLISHER ID COMMANDS
% to insert a publisher's ID footer
% v1.0 \IMEJpubid has been changed so that the change in page size and style
% occurs in \maketitle. \IMEJpubid must now be issued prior to \maketitle
% use \IMEJpubidadjcol as before - in the second column of the title page
% These changes allow \maketitle to take the reduced page height into
% consideration when dynamically setting the space between the author 
% names and the maintext.
%
% the amount the main text is pulled up to make room for the
% publisher's ID footer
% The IMEJ uses about 1.3\baselineskip for journals, 
% dynamic title spacing will clean up the fraction
\def\@IMEJpubidpullup{1.3\baselineskip}




% holds the ID text
\def\@IMEJpubid{\relax}

% flag so \maketitle can tell if \IMEJpubid was called
\newif\if@IMEJusingpubid
\global\@IMEJusingpubidfalse
% issue this command in the page to have the ID at the bottom
% v1.0 use before \maketitle
\def\IMEJpubid#1{\def\@IMEJpubid{#1}\global\@IMEJusingpubidtrue}


% command which will pull up (shorten) the column it is executed in
% to make room for the publisher ID. Place in the second column of
% the title page when using \IMEJpubid
% Is smart enough not to do anything when in single column text or
% if the user hasn't called \IMEJpubid
% currently needed in for the second column of a page with the
% publisher ID. If not needed in future releases, please provide this
% command and define it as \relax for backward compatibility
% v1.6b do not allow command to operate if the peer review option has been 
% selected because \IMEJpubidadjcol will not be on the cover page.
% v1.0 do nothing if compsoc
\def\IMEJpubidadjcol{\ifCLASSOPTIONpeerreview\else
\if@twocolumn\if@IMEJusingpubid\enlargethispage{-\@IMEJpubidpullup}\fi\fi\fi}

% Special thanks to Peter Wilson, Daniel Luecking, and the other
% gurus at comp.text.tex, for helping me to understand how best to
% implement the IMEJpubid command in LaTeX.



%% Lockout some commands under various conditions

% general purpose bit bucket
\newsavebox{\@IMEJrubishbin}

% flags to prevent multiple warning messages
\newif\if@IMEJWARNthanks
\newif\if@IMEJWARNIMEJPARstart
\newif\if@IMEJWARNIMEJbiography
\newif\if@IMEJWARNIMEJbiographynophoto
\newif\if@IMEJWARNIMEJpubid
\newif\if@IMEJWARNIMEJpubidadjcol
\newif\if@IMEJWARNIMEJmembership
\newif\if@IMEJWARNIMEJaftertitletext
\@IMEJWARNthankstrue
\@IMEJWARNIMEJPARstarttrue
\@IMEJWARNIMEJbiographytrue
\@IMEJWARNIMEJbiographynophototrue
\@IMEJWARNIMEJpubidtrue
\@IMEJWARNIMEJpubidadjcoltrue
\@IMEJWARNIMEJmembershiptrue
\@IMEJWARNIMEJaftertitletexttrue


%% Lockout some commands when in various modes, but allow them to be restored if needed
%%
% save commands which might be locked out
% so that the user can later restore them if needed
\let\@IMEJSAVECMDthanks\thanks
\let\@IMEJSAVECMDIMEJPARstart\IMEJPARstart
\let\@IMEJSAVECMDIMEJbiography\IMEJbiography
\let\@IMEJSAVECMDendIMEJbiography\endIMEJbiography
\let\@IMEJSAVECMDIMEJbiographynophoto\IMEJbiographynophoto
\let\@IMEJSAVECMDendIMEJbiographynophoto\endIMEJbiographynophoto
\let\@IMEJSAVECMDIMEJpubid\IMEJpubid
\let\@IMEJSAVECMDIMEJpubidadjcol\IMEJpubidadjcol
\let\@IMEJSAVECMDIMEJmembership\IMEJmembership
\let\@IMEJSAVECMDIMEJaftertitletext\IMEJaftertitletext


% disable \IMEJPARstart when in draft mode
% This may have originally been done because the pre-v1.0 drop letter
% algorithm had problems with a non-unity baselinestretch
% At any rate, it seems too formal to have a drop letter in a draft
% paper.
\ifCLASSOPTIONdraftcls
\def\IMEJPARstart#1#2{#1#2\if@IMEJWARNIMEJPARstart\typeout{** ATTENTION: \noexpand\IMEJPARstart
 is disabled in draft mode (line \the\inputlineno).}\fi\global\@IMEJWARNIMEJPARstartfalse}
\fi


% provide a way to restore the commands that are locked out
\def\IMEJoverridecommandlockouts{%
\typeout{** ATTENTION: Overriding command lockouts (line \the\inputlineno).}%
\let\thanks\@IMEJSAVECMDthanks%
\let\IMEJPARstart\@IMEJSAVECMDIMEJPARstart%
\let\IMEJbiography\@IMEJSAVECMDIMEJbiography%
\let\endIMEJbiography\@IMEJSAVECMDendIMEJbiography%
\let\IMEJbiographynophoto\@IMEJSAVECMDIMEJbiographynophoto%
\let\endIMEJbiographynophoto\@IMEJSAVECMDendIMEJbiographynophoto%
\let\IMEJpubid\@IMEJSAVECMDIMEJpubid%
\let\IMEJpubidadjcol\@IMEJSAVECMDIMEJpubidadjcol%
\let\IMEJmembership\@IMEJSAVECMDIMEJmembership%
\let\IMEJaftertitletext\@IMEJSAVECMDIMEJaftertitletext}



% need a backslash character for typeout output
{\catcode`\|=0 \catcode`\\=12
|xdef|@IMEJbackslash{\}}


% hook to allow easy disabling of all legacy warnings
\def\@IMEJlegacywarn#1#2{\typeout{** ATTENTION: \@IMEJbackslash #1 is deprecated (line \the\inputlineno).
Use \@IMEJbackslash #2 instead.}}


% provide some legacy IEEEtran commands
\def\IMEJcompsoctitleabstractindextext{\@IMEJlegacywarn{IMEJcompsoctitleabstractindextext}{IMEJtitleabstractindextext}\IMEJtitleabstractindextext}
\def\IMEJdisplaynotcompsoctitleabstractindextext{\@IMEJlegacywarn{IMEJdisplaynotcompsoctitleabstractindextext}{IMEJdisplaynontitleabstractindextext}\IMEJdisplaynontitleabstractindextext}





\endinput

%%%%%%%%%%%%%%%%%%%%%%%%%%%%% End of IMEJ.cls  %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Q. Why do Norwegian ships have barcodes?
% A. So they can scan `da' navy in 

