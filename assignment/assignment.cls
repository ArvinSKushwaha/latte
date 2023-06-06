\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{assignment}[2022/12/15 v1.0 Assignment class]

\LoadClass{article}

\RequirePackage[utf8]{inputenc}
\RequirePackage[shortlabels]{enumitem}
\RequirePackage[margin=1in]{geometry}
\RequirePackage{derivative}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{fancyhdr}
\RequirePackage{xfrac}
\RequirePackage{esint}
\RequirePackage{float}
\RequirePackage{graphicx}
\RequirePackage{cancel}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{fancyhdr}
\RequirePackage{tikz}
\RequirePackage{siunitx}
\RequirePackage{mathtools}
\RequirePackage{setspace}

\DeclareSIUnit\angstrom{\text{\AA}}

\pagestyle{fancy}
\fancyhf{}

\RequirePackage{calligra}
\DeclareMathAlphabet{\mathcalligra}{T1}{calligra}{m}{n}
\DeclareFontShape{T1}{calligra}{m}{n}{<->s*[2.2]callig15}{}

\newcommand{\p}[1]{\left( #1 \right)}
\newcommand{\br}[1]{\left[ #1 \right]}
\newcommand{\cbr}[1]{\left\{ #1 \right\}}
\renewcommand{\ang}[1]{\left\langle #1 \right\rangle}
\newcommand{\abs}[1]{\left| #1 \right|}
\newcommand{\norm}[1]{\left\| #1 \right\|}
\renewcommand{\ss}[1]{\ensuremath{\mathcalligra{#1}}}
\newcommand{\s}[1]{\ensuremath{\mathcal{#1}}}
\newcommand{\bb}[1]{\mathbb{#1}}
\newcommand{\degC}{{}^\circ \text{C}}
\newcommand{\degF}{{}^\circ \text{F}}
\newcommand{\degK}{{}^\circ \text{K}}
\newcommand{\powp}[2]{\p{#1}^\p{#2}}
\newcommand{\pow}[2]{{#1}^{#2}}
\newcommand{\intlim}[4]{\int\limits_{#1}^{#2} #3 d #4}
\newcommand{\grad}[1]{\nabla #1}
\newcommand{\del}{\nabla}
\renewcommand{\div}[1]{\nabla \cdot #1}
\newcommand{\curl}[1]{\nabla \times #1}
\newcommand{\ket}[1]{\left| #1 \right\rangle}
\newcommand{\bra}[1]{\left\langle #1 \right|}
\newcommand{\braket}[2]{\left\langle #1 \middle| #2 \right\rangle}
\renewcommand{\Vec}[1]{\left\langle #1 \right\rangle}

\let\v\vec
\renewcommand{\vec}[1]{\ensuremath{\mathbf{#1}}}

\newcommand{\xhat}{\ensuremath{\mathbf{\hat{x}}}}
\newcommand{\yhat}{\ensuremath{\mathbf{\hat{y}}}}
\newcommand{\zhat}{\ensuremath{\mathbf{\hat{z}}}}

\newcommand{\rhohat}{\ensuremath{\mathbf{\hat{\rho}}}}

\newcommand{\rhat}{\ensuremath{\mathbf{\hat{r}}}}
\newcommand{\thetahat}{\ensuremath{\mathbf{\hat{\theta}}}}
\newcommand{\phihat}{\ensuremath{\mathbf{\hat{\phi}}}}

\newcommand{\qed}{\ensuremath{\blacksquare}}

\newbox\totalbox
\newbox\partialbox
\newdimen\partialboxdim

\newenvironment{nibox}
  {\par\vskip-6pt\setbox\totalbox=\vbox\bgroup}
  {\egroup\splitnibox}

\def\splitnibox{%
  \ifvoid\totalbox\par
  \else\continuesplitting\fi}

\def\continuesplitting{\null% In case this starts a new page
  \dimen255=\dimexpr\pagegoal-\pagetotal-\pageshrink-6pt\relax
  \ifdim\ht\totalbox<\dimen255
    \setbox\partialbox=\box\totalbox
    \unvbox\partialbox
  \else
    \setbox\partialbox=\vsplit\totalbox to\dimen255
    \unvbox\partialbox\eject
  \fi
  \splitnibox}

\newcommand\NoIndent[1]{\begin{nibox}#1\end{nibox}}
\newcommand{\clarifier}[1]{\NoIndent{\color{black} #1 \color{BlueViolet}}}

\newenvironment{problem}[2]{%
    \section*{Problem #1}
    #2\vspace{\baselineskip}
    \color{BlueViolet}
}{%
    \color{black}
    \vspace{\baselineskip}
    \hrule
    \vspace{\baselineskip}
}

\newenvironment{multiproblem}[2]{%
    \section*{Problem #1}
    \let\olditem\item
    \renewcommand\item[2][]{{\color{black}\olditem ##1\vspace{\baselineskip}##2}}
    #2\vspace{\baselineskip}
    
    \begin{enumerate}[(a)]
    \color{BlueViolet}
}{%
    \color{black}
    \end{enumerate}
    \vspace{\baselineskip}
    \hrule
    \vspace{\baselineskip}
}

\newenvironment{proof}{\textbf{Proof.}}{\qed}

\makeatletter
\renewcommand*\env@matrix[1][\arraystretch]{%
  \edef\arraystretch{#1}%
  \hskip -\arraycolsep
  \let\@ifnextchar\new@ifnextchar
  \array{*\c@MaxMatrixCols c}}
\makeatother


\makeatletter
\newcommand*{\student}[1]{\gdef\@student{#1}%
}
\newcommand*{\@student}{(STUDENT)}
\newcommand*{\teacher}[1]{\gdef\@teacher{#1}%
}
\newcommand*{\@teacher}{(TEACHER)}
\newcommand*{\course}[1]{\gdef\@course{#1}%
}
\newcommand*{\@course}{(COURSE)}
\newcommand*{\homeworkcount}[1]{\gdef\@homeworkcount{#1}%
}
\newcommand*{\@homeworkcount}{(N)}
\newcommand*{\duedate}[1]{\gdef\@duedate{#1}%
}
\newcommand*{\@duedate}{(DUE DATE)}
\newcommand*{\homeworktype}[1]{\gdef\@homeworktype{#1}%
}
\newcommand*{\@homeworktype}{(HOMEWORK TYPE)}


\rhead{ {\@course\unskip\strut}\ {\@homeworktype\unskip\strut}\ {\@homeworkcount\unskip\strut}\ --- {\@duedate\unskip\strut} }
\lhead{\thepage\ {\@student\unskip\strut} }
\title{ {\@course\unskip\strut}\ {\@homeworktype\unskip\strut}\ {\@homeworkcount\unskip\strut} }
\author{ {\@teacher\unskip\strut}\\ {\@student\unskip\strut} }
\date{ {\@duedate\unskip\strut} }
\makeatother


\graphicspath{ {./} }
\setlength{\parindent}{0pt}

\allowdisplaybreaks
