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
     #fig("graphics/system.png")
   ],
   [
     #fig("graphics/bonddiagram.png")
   ]
 )

= State Equations
$
dot(p)_3 = u_"in" - (R_w) / (L_w) p_3 - (T_m G_R) / (R M) p_9
\
dot(p)_9 = (G_"R" T_"m") / (R L_"w") p_3 - (b_tau G_"R"^2) / (R^2 M) p_9 - (rho A_"f" C_"p") / (2 M^2) p_9 abs(p_9) - g C_R "sgn"(p_9)
$

= Initial Conditions
Since the vehicle starts from rest and an initial point that we call "zero", *all initial conditions will be zero*.


#pagebreak()
= Output
== Part 1

#fig("graphics/part-1.pdf")



#pagebreak()
= Discussion

The actual velocity has a negligible lag of 0.083 m/s behind the commanded velocity, this value was measured with MATLAB's cursor tools. There was also a negligible overshoot of 0.024 m/s at the peak around 46 s, this value was also measured with MATLAB's cursor tools. Besides a primary overshoot due to the P value, there are no cursory oscillations as controlled by the large I value. The performance of the controller does not vary much with the speed of the vehicle