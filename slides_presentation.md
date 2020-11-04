---
author: 
    - "Maxime AYRAULT"
title: | 
	   | Reconfiguration d’Architectures pour l’Amélioration de la Résilience des Véhicules Connectés
	   |
	  
short-title : |
              | Soutenance de mi-parcours
			  |
subtitle: | 
	      | Soutenance de mi-parcours
          | 
		  | Encadrants de Thèse :
		  | Etienne Borde 
		  | Ulrich Kühne 

date: "6 Novembre 2020"

theme: CambridgeUS
colortheme: dolphin

toc: no
toc-depth: 2
//toc-title: Sommaire


header-includes:
    - \usepackage{epsfig}
	- \usepackage{graphicx}
	- \usepackage{rotating}
	- \usepackage{amssymb}
	- \usepackage{hyperref}
	- \usepackage[french]{babel}
	- \usepackage[utf8]{inputenc}
	- \usepackage[T1]{fontenc}
	- \usepackage{pslatex}
	- \usepackage{url}
	- \usepackage{color}
	- \usepackage{float}
	- \usepackage{parskip}
	- \usepackage{standalone}
	- \usepackage{longtable}
	- \usepackage{booktabs}
	- \usepackage{listings}
	- \usepackage{color}
	- \usepackage{caption}
	- \usepackage{float}
    - \usepackage{subcaption}
    - \definecolor{codegreen}{rgb}{0,0.6,0}
	- \definecolor{codered}{rgb}{0.6,0,0}
	- \definecolor{codeblue}{rgb}{0,0,0.6}
	- \definecolor{darkgreen}{rgb}{0.18,0.54,0.34}
	- \definecolor{codegray}{rgb}{0.5,0.5,0.5}
	- \definecolor{codepurple}{rgb}{0.58,0,0.82}
	- \definecolor{backcolour}{rgb}{0.95,0.95,0.92}
    - \usepackage{appendixnumberbeamer}
	- \usepackage{lipsum}
    - \newcommand{\backupbegin} {\newcounter{finalframe} \setcounter{finalframe}{\value{finalframe}}\stepcounter{finalframe} \stepcounter{finalframe}}
    - \newcommand{\backupend}{ \addtocounter{framenumber}{-1}} 
	- \usepackage{booktabs} 
	- \usepackage{dcolumn} 
	- \usepackage{threeparttable}
	- \usepackage{adjustbox}
---


---

# Chaire C3S - Connected Cars and CyberSecurity


\begin{columns}
    \begin{column}{0.30\textwidth}
		\begin{figure}[h]
			\centering
			\includegraphics[width=0.8\textwidth]{logo/NOKIA.png}
		\end{figure}
    \end{column}
    \begin{column}{0.30\textwidth}
		\begin{figure}[h]
			\centering
			\includegraphics[width=0.8\textwidth]{logo/Renault.png}
		\end{figure}
    \end{column}
    \begin{column}{0.30\textwidth}
		\begin{figure}[h]
			\centering
			\includegraphics[width=0.8\textwidth]{logo/Thales.png}
		\end{figure}
    \end{column}
\end{columns}


\begin{columns}
    \begin{column}{0.30\textwidth}
		\begin{figure}[h]
			\centering
			\includegraphics[width=0.8\textwidth]{logo/valeo.png}
		\end{figure}
    \end{column}
    \begin{column}{0.30\textwidth}
		\begin{figure}[h]
			\centering
			\includegraphics[width=0.8\textwidth]{logo/Wavestone.png}
		\end{figure}
    \end{column}
    \begin{column}{0.30\textwidth}
		\begin{figure}[h]
			\centering
			\includegraphics[width=0.4\textwidth]{logo/Telecom.png}
		\end{figure}
    \end{column}
\end{columns}



# Sommaire

\begin{exampleblock}{Présentation du sujet}
  \begin{itemize}
	\item Contexte
	\item Caractérisation de l'attaquant
	\item Définition résilience
  \end{itemize}
\end{exampleblock}

\begin{exampleblock}{Défense du véhicule}
  \begin{itemize}
  	\item \'Etat de l'art défenses dynamiques
	\item Présentation défense MTD basée sur la reconfiguration du réseau
  \end{itemize}
\end{exampleblock}

\begin{exampleblock}{Théorie des jeux}
  \begin{itemize}
	\item \'Etat de l'art
	\item Définition de notre jeu
  \end{itemize}
\end{exampleblock}



\begin{exampleblock}{Travaux futurs}
  \begin{itemize}
	\item Amélioration du modèle et prise en compte de la résilience
	\item Calcul de l'indice de résilience du véhicule
  \end{itemize}
\end{exampleblock}





# Présentation du Sujet - Le Contexte

\begin{columns}
    \begin{column}{0.75\textwidth}
		\begin{exampleblock}{Problème}
			\begin{itemize}
				\item Les véhicules deviennent vulnérables à des cyber-attaques.
			\end{itemize}
		\end{exampleblock}
    \end{column}
    \begin{column}{0.22\textwidth}
\begin{figure}[h]
    \centering
    \includegraphics[width=0.8\textwidth]{assets/Car.pdf}
    \label{idea1}
\end{figure}
    \end{column}
\end{columns}

\begin{exampleblock}{Sous-problème 1}
  \begin{itemize}
	\item Cohabitation entre \textbf{applications critiques} et \textbf{applications non critiques}. \newline
	$\rightarrow$ Améliorer la sécurité de la voiture sans perturber son fonctionnement.
  \end{itemize}
\end{exampleblock}

\begin{exampleblock}{Sous-problème 2}
  \begin{itemize}
	\item Durée vie $\approx$ 20 ans et MAJ compliquées \newline
	$\rightarrow$ Devoir être le plus \textbf{résilient} possible. \newline
	$\implies$ \emph{Augmenter} Disponibilité ; \emph{Maintenir} Confidentialité et Intégrité 
  \end{itemize}
\end{exampleblock}


# Présentation du Sujet - Trois Types d'Attaquants

\begin{itemize}
  \only<1,2,3>{ \item[1]  \textbf{Attaque physique} : Via diagnostique de la voiture. Objectif :
  Rajouter des fonctionnalités sur le véhicules pour lesquelles on a
  pas payé.}
  \only<2,3>{ \item[2] \textbf{Attaque courte portée} : Via smartphone/laptop.. Objectif :
  Prendre le contrôle d'un véhicule proche, ou envoyer de fausses
  informations au véhicules alentours.}
  \only<3>{ \item[3] \textbf{Attaque longue portée} : Via WiFi/4G. Objectif : Prendre le
  contrôle d'une flotte de véhicule. }
\end{itemize}


\begin{figure}[h]
    \centering
    \only<1>{\includegraphics[width=0.5\textwidth]{assets/Car_Archi_1.jpg} }
	\only<2>{\includegraphics[width=0.5\textwidth]{assets/Car_Archi_2.jpg} }
	\only<3>{\includegraphics[width=0.5\textwidth]{assets/Car_Archi_3.jpg} }
    \label{idea1}
\end{figure}



# Présentation du Sujet - Définition Résilience

\begin{exampleblock}{Définition de la Résilience\footnotemark}
  \begin{itemize}
	\item The persistence of service delivery that can justifiably be
    trusted, when facing changes.
  \end{itemize}
\end{exampleblock}


\begin{exampleblock}{Notre Définition de la Résilience}
  \begin{itemize}
	\item Se défendre de manière \emph{proactive} le plus longtemps possible
		  contre toutes formes d'attaques. Une fois ces défenses
		  tombées, revenir rapidement dans un \'etat de fonctionnement nominal grâce
		  à des mécanismes de défenses \emph{réactifs}.
  \end{itemize}
\end{exampleblock}

\footnotetext{Laprie, Jean-Claude. “From Dependability to Resilience.”
International Conference on Dependable Systems and Networks (DSN 2008,
2008, 2.)}


- Exemple de méthodes visant à améliorer la *résilience* : \textit{Redondance, Obsfucation, Cryptographie, Monitorat, Isolation}.



# Défense du Véhicule - Techniques de Défenses Dynamiques

- Véhicules limités en puissance calcul et en ressources. \newline
  $\rightarrow$ Utilisation de méthodes de défense légère.

- Deux types de défenses dynamiques complémentaires applicables sur
  les véhicules : *Moving Target Defense* (MTD) et *Modes Dégradés*.

- Côté réactif : **Modes Dégradés** : bloquer la progression d'un
  attaquant après les défenses percées. \newline Aide au retour du
  système dans état nominal.

- Côté proactif : **MTD**\footnotemark : ralentir l'acquisition de
  connaissances sur le système par un attaquant.


\footnotetext{Gui-linCaiet al. “Moving target defense : state of
the art and characteristics”. en. In :Frontiers of Information
Technology and Electronic Engineering17.11 (nov. 2016)}

# Défense du Véhicule - Moving Target Defense

\begin{columns}
    \begin{column}{0.75\textwidth}
        \begin{itemize}
            \item Rendre dynamique différents aspects d'un système
				  \newline $\rightarrow$ Casser la relation asymétrique attaquant /
				  défenseur.
        \end{itemize}
    \end{column}
    \begin{column}{0.22\textwidth}
\begin{figure}[h]
    \centering
    \includegraphics[width=0.85\textwidth]{assets/MTD.jpg}
    \label{MTD}
\end{figure}
    \end{column}
\end{columns}


- Ralentir un attaquant dans l'acquisition de connaissances, la
 découverte de vulnérabilités et l'exploitation de failles

\begin{exampleblock}{Les MTD se divisent en 5 catégories \footnotemark : }
  \begin{itemize}
	\item Changer dynamiquement la \emph{représentation des données}
	\item Utilisation dynamique d'\emph{applications}
	\item Modification de l'\emph{environnement d'ex\'ecution}
	\item Rendre dynamique la \emph{plateforme d'ex\'ecution}
	\item Configuration dynamique du \emph{réseau}
  \end{itemize}
\end{exampleblock}

\footnotetext{H.Okhraviet al.Survey of Cyber Moving Target Techniques
:en. Rapp. tech. Fort Belvoir, VA :Defense Technical Information
Center, sept. 2013.}

# Défense du Véhicule - Efficacité des MTD Lors d'une Attaque

\begin{columns}
    \begin{column}{0.26\textwidth}
\begin{figure}[h]
    \centering
    \includegraphics[width=1\textwidth]{assets/hacker.jpg}
    \label{MTD}
\end{figure}
    \end{column}
\begin{column}{0.72\textwidth}
\begin{exampleblock}{Une attaque est divisée en 5 phases \footnotemark : }
  \begin{enumerate}
	\item Reconnaissance
	\item Accès
	\item Déploiement
	\item Lancement
	\item Persistence
  \end{enumerate}
\end{exampleblock}
    \end{column}
\end{columns}



\footnotetext{H.Okhraviet al. “Finding Focus in the Blur of
Moving-Target Techniques”. In :IEEE SecurityPrivacy12.2 (mar. 2014)}

\begin{table}
\begin{adjustbox}{width=\textwidth, totalheight=\textheight-2\baselineskip,keepaspectratio}
\begin{threeparttable}
\begin{tabular}{|l|l|l|l|l|l|} 
\hline
MTD/ Attack              & Reconnaissance & Accès        & Déploiement  & Lancement    & Persistence  \\ \hline
Réseau                   & $\checkmark$   &              &              & $\checkmark$ &              \\ \hline
Plateforme               &                & $\checkmark$ & $\checkmark$ &              & $\checkmark$ \\ \hline
Enviromenent d'Execution &                &              & $\checkmark$ & $\checkmark$ &              \\ \hline
Logiciel                 &                &              & $\checkmark$ & $\checkmark$ &              \\ \hline
Donées                   &                &              & $\checkmark$ & $\checkmark$ &              \\ \hline
\end{tabular}
\end{threeparttable}
\end{adjustbox}
\end{table}



# Défense du Véhicule - Défense MTD Basée sur la Reconfiguration du Réseau

- Ralentir l'attaquant durant la phase de *Reconnaissance*

- Méthode permettant cacher un véhicule dans un réseau\footnotemark. \newline
  $\rightarrow$ Changement régulier adresse IP + Limitation impact sur QoS.

\footnotetext{Maxime Ayrault, Etienne Borde, Ulrich Kühne. “Run or
Hide ? Both ! A Method Based onIPv6 Address Switching to Escape While
Being Hidden”. In :Proceedings of the 6th ACMWorkshop on Moving Target
Defense - MTD’19.}


\begin{minipage}{0.38\textwidth}
\begin{figure}[]
    \centering
    \includegraphics[width=0.9\textwidth]{assets/net.pdf}
    \label{MTD}
\end{figure}
\end{minipage}
\begin{minipage}{0.6\textwidth}
\begin{exampleblock}{Actuellement : }
  \begin{itemize}
	\item Un véhicule = Une adresse IPv4 (appartenant 
    \`a la plage d'adresse du constructeur)
	\item Découverte de l'adresse $\rightarrow$ Collecte d'informations
    du système par attaquant possible.
  \end{itemize}
\end{exampleblock}

\end{minipage}



# Défense du Véhicule - Principe de notre Méthode


\begin{columns}
    \begin{column}{0.75\textwidth}
        \begin{itemize}
            \item Un véhicule = $N$ adresses IP.
				  \vspace{0.3cm} 
            \item Une seule adresse IP active à la fois. \newline (Active =
   				  Acceptant les messages entrant = Vert ) \vspace{0.3cm}
            \item Rotation périodique de l'adresse IP active. \vspace{0.3cm}
            \item Renouvellement adresse IP après utilisation.\vspace{0.3cm}
            \item Utilisation \textit{MultiPath TCP} (MPTCP) \newline $\rightarrow$ Garantir une
				  qualité de service suffisante. 
        \end{itemize}
    \end{column}
    \begin{column}{0.23\textwidth}
\begin{figure}[h]
    \centering
    \includegraphics[width=1\textwidth]{assets/Car2.pdf}
    \label{MTD}
\end{figure}
    \end{column}
\end{columns}



# Défense du Véhicule - Différentes Versions de la Méthode

$N =$ Nombre adresses IP par véhicule

- Version 1 : $N > 2$ ; Pas de renouvellement adresse après utilisation.

- Version 2 : $N > 2$ ; Renouvellement adresse après utilisation.

- Version 3 : $N = 2$ ; Renouvellement adresse après utilisation.

\bigskip

\begin{table}
\begin{tabular}{l | c | c | c | c }
 & Version 1 & Version 2 & Version 3 \\
\hline \hline
Coût interface & +++ & +++ &  + \\ 
Coût bande passante & +  & ++ & +++ \\
Risque d'attaque DoS & +++  & + & + \\
\end{tabular}
\end{table}



# Défense du Véhicule -  Exemple d'Utilisation de la Version 3

\begin{figure}[h]
    \centering
    \includegraphics[width=0.6\textwidth]{assets/exemple_ver3.pdf}
    \label{idea1}
\end{figure}



# Théorie des Jeux - Etat de l'Art

\begin{columns}
    \begin{column}{0.75\textwidth}
        \begin{itemize}
            \item Problème décisionnel à résoudre ? \newline $\rightarrow$
			      Modélisation du problème grâce à la théorie des jeux \footnotemark \newline
				  $\rightarrow$ Analyse sur le modèle afin trouver une/des solution(s)
        \end{itemize}
    \end{column}
    \begin{column}{0.22\textwidth}
\begin{figure}[h]
    \centering
    \includegraphics[width=1\textwidth]{assets/game.jpg}
    \label{MTD}
\end{figure}
    \end{column}
\end{columns}


\footnotetext{Lin Chenet J.Leneutre. “A Game Theoretical Framework on
Intrusion Detection in Heteroge-neous Networks”. en. In :IEEE
Transactions on Information Forensics and Security4.2 (juin 2009)}

\begin{exampleblock}{Exemple : Recherche stratégies défenses optimales
en cas d'attaque.}
$\rightarrow$ Représentation interractions attaquant / defenseur avec
  modèle mathématique. \newline
$\rightarrow$ Permet l'observation de l'impact de la configuration
  système et méthodes défenses sur interactions attaquant /
  défenseur.
\end{exampleblock}


# Théorie des Jeux - Etat de l'Art

- La recherche des meilleures stratégies passe par l'analyse de
  plusieurs équilibres\footnotemark.

\footnotetext{Ziad Ismail et al.  “A Game Theoretical Model forOptimal
Distribution of Network Security Resources”.en. In: (2017)}

- **Equilibre de Nash** ; joueurs jouent simultanément. Détermination
  stratégies dont les deux joueurs ne devraient pas dévier seul.

- **Equilibre de Stackelberg** ; joueurs jouent chacun leur
  tour. Determination des meilleures stratégies permettant de limiter
  les gains du second joueur.

- **Minmax**. Permet de minimiser le reward maximum que l'autre joueur
  pourrait obtenir.



# Théorie des Jeux - Définition du Jeu


\begin{columns}
	\begin{column}{0.99\textwidth}
	\centering
	\textbf{2 joueurs}
	\end{column}
\end{columns}


\begin{columns}
	\begin{column}{0.30\textwidth}
	\centering
	1 Attaquant
	\end{column}
\begin{column}{0.30\textwidth}
	\centering
	1 Défenseur
	\end{column}
\end{columns}

\medskip

\begin{columns}
	\begin{column}{0.99\textwidth}
	\centering
	\textbf{Un ensemble d'actions fini par joueur}
	\end{column}
\end{columns}


\begin{columns}
	\begin{column}{0.30\textwidth}
	\centering
	\emph{-Attaquer \newline -Ne Pas Attaquer}
	\end{column}
\begin{column}{0.30\textwidth}
	\centering
	\emph{- Se reconfigurer\newline - Se dégrader\newline - Ne Rien Faire}
	\end{column}
\end{columns}

\bigskip

\begin{columns}
	\begin{column}{0.99\textwidth}
	\centering
	\textbf{Une fonction de Reward associée par combinaison d'actions}
	\end{column}
\end{columns}


\begin{columns}
	\begin{column}{0.30\textwidth}
	\centering
	$R_A$ = Gain - Coût action
	\end{column}
\begin{column}{0.30\textwidth}
	\centering
	$R_D$ = Gain - Coût action
	\end{column}
\end{columns}

\bigskip

\begin{columns}
	\begin{column}{0.99\textwidth}
	\centering
	\textbf{Représentation de l'utilisation des actions}
	\end{column}
\end{columns}


\begin{columns}
	\begin{column}{0.30\textwidth}
	\centering
	\emph{-$p_i$ : Attaquer \newline -$p_i^{not}$ :Ne Pas Attaquer}
	\end{column}
\begin{column}{0.30\textwidth}
	\centering
	\emph{-$q_i$ : Se reconfigurer\newline -$q_i^{deg}$ : Se dégrader\newline -$q_i^{not}$ : Ne Rien Faire}
	\end{column}
\end{columns}


\medskip

\begin{columns}
	\begin{column}{0.99\textwidth}
	\centering
	\textbf{Budget attribué à chaque joueur}
	\end{column}
\end{columns}


\begin{columns}
	\begin{column}{0.30\textwidth}
	\centering
	$P \geq \sum p_i + p_i^{not}$
	\end{column}
\begin{column}{0.30\textwidth}
	\centering
	$Q \geq \sum q_i + q_i^{deg} + q_i^{not}$
	\end{column}
\end{columns}


# Théorie des Jeux - Jeu Sous Forme Normale

\begin{table}[]
\begin{tabular}{l|l|l|l|}
\cline{2-4}
                                                & Reconf ($q_i$)  & Rien ($q_i^{not}$) & Degradé ($q_i^{deg}$) \\ \hline
\multicolumn{1}{|l|}{Attaque ($p_i$)}           & $R^a_1 ; R^d_1$ & $R^a_2 ; R^d_2$    & $R^a_3 ; R^d_3$       \\ \hline
\multicolumn{1}{|l|}{Pas Attaque ($p_i^{not}$)} & $R^a_4 ; R^d_4$ & $R^a_5 ; R^d_5$    & $R^a_6 ; R^d_6$       \\ \hline
\end{tabular}
\end{table}

\bigskip

\begin{columns}
	\begin{column}{0.30\textwidth}
\begin{exampleblock}{Exemple Fonction Utilité Attaquant}
  \begin{itemize}
	\item $U_A = \sum_i \newline p_i q_i  R^a_1 + \newline p_i  q_i^{not} R^a_2 + \newline p_i  q_i^{deg}   R^a_3 + \newline p_i^{not}  q_i   R^a_4 + \newline p_i^{not}  q_i^{not}   R^a_5 + \newline p_i^{not}  q_i^{deg}   R^a_6$
  \end{itemize}
\end{exampleblock}
	\end{column}
\begin{column}{0.60\textwidth}
\begin{itemize}
\item Utiliser les différents équilibres présentés afin de determiner les stratégies
	optimales permettant d'avoir les fonction d'utilité maximales.
\end{itemize}
\end{column}
\end{columns}




# Futurs travaux

- Adapter le modèle au cas d'étude du véhicule.

- Prise en compte de la résilience dans le modèle du jeu.

- Calcul de l'indice de la résilience.

- Créer un modèle générique du jeu.
