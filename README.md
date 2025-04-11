# Programmentwurf zur Vorlesung Einfuhrung in MATLAB und Simulink

Die Tschirikow Standardabbildung oder kurz Standardabbildung ist eine flachentreue Abbildung im Quadrat $[0,2\pi]\times[0,2\pi]\subseteq\mathbb{R}^2$ auf sich, definiert durch

$$F:[0,2\pi]\times[0,2\pi]\to[0,2\pi]\times[0,2\pi],\quad F(I,\theta)=\begin{pmatrix}I+K\cdot\sin(\theta)\mod2\pi\\I+\theta+K\cdot\sin(\theta)\mod2\pi\end{pmatrix}$$

mit einem Verzweigungsparameter $K\geq0$

Zur Standardabbildung gehort ein dynamisches System, welches durch die Rekursionsgleichun gen

$$\begin{aligned}I_{n+1}&=I_n+K\cdot\sin(\theta_n)\mod2\pi\\\theta_{n+1}&=\theta_n+I_{n+1}\mod2\pi\end{aligned}$$

gegeben ist und fir ein Paar von Anfangswerten $( I_{0}, \theta _{0})$ $\in$ $[ 0, 2\pi ]$ $\times$ $[ 0, 2\pi ]$ eine Trajektorie $(I_{n},\theta_{n})_{n\in\mathbb{N}}$ generiert. Tragt man fir festen Parameter $K$ und mehreren Anfangswerten die Trajektorien in einem Diagramm auf,so erhalt man ein Phasenportrait.Dabei erkennt man,dass die Dynamik fir wachsende Werte von $K$ chaotischer wird

Ein weiteres Paar an Grofen des dynamischen Systems,welche das Ausmaf an chatoischem Verhalten quantifiziert, sind die Ljapunov Exponenten. Dazu brauchen wir zuerst die Matrix der Ableitungen der Funktion $F$ ,welche in diesem Fall Systemmatriz genannt wird. Diese sieht fin die Standardabbildung folgendermaBen aus

$$DF(I,\theta)=\begin{pmatrix}1&K\cdot\cos(\theta)\\1&1+K\cdot\cos(\theta)\end{pmatrix}.$$

Fur diese Systemmatrix wird auch eine Rekursionsgleichung aufgestellt:

$$\begin{aligned}
Q_{0}& =\begin{pmatrix}1&0\\0&1\end{pmatrix} \\
A_{n+1}& =DF(I_n,\theta_n)\cdot Q_n=\begin{pmatrix}1&K\cdot\cos(\theta_n)\\1&1+K\cdot\cos(\theta_n)\end{pmatrix}\cdot Q_n \\
A_{n+1}& =Q_{n+1}\cdot R_{n+1}
\end{aligned}$$

wobei $Q_{n+1}\cdot R_{n+1}$ die QR-Zerlegung von $A_{n+1}$ ist und fir die Werte $I_{n}$ und $\theta_{n}$ die Werte entsprechend einer Trajektorie zu wahlen sind, zu welcher die Ljapunov Exponenten bestimmt werden sollen. Die beiden Ljapunov Exponenten $\lambda_{i}$ ， $i=1,2$ , sind dann folgendermaBen definiert:

$$\lambda_i=\lim\limits_{N\to\infty}\frac{1}{N}\sum\limits_{n=0}^{N-1}\ln((R_n)_{ii})$$

fur $i=1,2$ .Dabei ist $(R_{n})_{11}$ das erste Diagonalelement der oberen Dreiecksmatrix $R_{n}$ und $(R_{n})_{22}$ das zweite Diagonalelement von $R_{n}$

(a) Berechnen Sie in MATLAB fir 3 verschiedene Werte von $K$ mehrere Trajektorien und erstellen Sie jeweils ein Phasenportrait, also fir jeden Wert von $K$ ein eigenes Phasenpor trait. Dabei soll fir jedes Phasenportrait jede Trajektorie mindestens eine Lange von 1000 haben und es sollen mindestens 50 verschiedene Trajektorien berechnet werden. Wahlen Sie weiterhin fir das erste Phasenportrait $K\in]0,0.6]$ zufallig, fir das zweite Phasenportrai $K\in[0.9,1.1]$ zufallig und fir das dritte Phasenportrait $K\in[1.4,2.0]$ zufallig. Die Phasenportraits sollen die Dynamik gut charakterisieren, also fur wachsendes $K$ die Zunahme des chaotischen Verhaltens erkennen lassen.

(b）Berechnen Sie in MATLAB die Ljapunov Exponenten in Abhangigkeit des Parameters $K$ fir $K$ von $U$ bis 4 und tragen Sie die Werte der beiden Ljapunov Exponenten in einem gemeinsamen Diagramm gegen $K$ auf.Wahlen Sie dabei die Lange der verwendeten Trajektorien und die Anzahl der verschiedenen Parameter $K$ so, dass das Diagramm aussagekraftig erscheint

(c) Um Ihre Berechnungen aus Teil (b) zu plausibilisieren gehen Sie folgendermaBen vor:

 - Welchen Wert hat die Determinante der Systemmatrix $DF(I,\theta)$ in Abhangigkeit von $I$ und $\theta$

 - Die Matrizen $Q_{n}$ sind fir alle $n\in\mathbb{N}$ orthogonale Matrizen. Was bedeutet das fir die Determinante $\operatorname*{det}(Q_{n})$

 - Was folgt daraus fir $\operatorname{det}(A_{n})$ der Matrizen $A_n$ der Rekursion? Hinweis: wenden Sie den Multiplikationssatz fir Matrizen an. —Was folgt daraus fir die Determinante der Matrizen $R_{n}$ ？

 - Die Determinante von $R_{n}$ ist das Produkt der Eigenwerte von $R_{n}$ .Was sagt uns obiges Ergebnis uber die (positiven) Diagonalelemente von $R_{n}$ aus? —Nun konnen Sie den Wert fir $\ln((R_{n})_{11})+\ln((R_{n})_{22})$ explizit angeben. Welchen Wert hat dieser Term in Abhangigkeit von 77.

 - Was folgt daraus fir die beiden Ljapunov Exponenten $\lambda_{1}$ und $\lambda_{2}$ Konnen Sie die gefundene Eigenschaft in Ihrem Diagramm erkennen?

Beantworten Sie bitte obige Fragen.
