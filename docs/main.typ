#import "template.typ": *
#import "@preview/oasis-align:0.3.0": *
#show: template.with(
  title: "Lab 5 - Autonomous Electric Vehicle",
  class: "EME 171",
  authors: "Jason Pieck, Peter Webster, Alexander Zamora",
  page-width: 8.5in,
  // page-height: 11in,
  
)
///////////////////////////////////////////////////

= System
#set grid(column-gutter: .2in)
 #oasis-align(
   [
     #fig("Graphics/system.png")
   ],
   [
     #fig("Graphics/bonddiagram.png")
   ]
 )

= State Equations
$
dot(p)_3 = u_"in" - (R_w) / (L_w) p_3 - (T_m G_R) / (R M) p_9
\
dot(p)_9 = (G_"R" T_"m") / (R L_"w") p_3 - (b_tau G_"R"^2) / (R^2 M) p_9 - (rho A_"f" C_"p") / (2 M^2) p_9 abs(p_9) - M g C_R "sgn"(p_9)/M
$

= Initial Conditions


#pagebreak()
= Output




#pagebreak()
= Discussion
