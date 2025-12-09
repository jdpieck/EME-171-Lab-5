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

= State Equations <state-eqns>
$
dot(p)_3 = u_"in" - (R_w) / (L_w) p_3 - (T_m G_R) / (R M) p_9
\
dot(p)_9 = (G_"R" T_"m") / (R L_"w") p_3 - (b_tau G_"R"^2) / (R^2 M) p_9 - (rho A_"f" C_"p") / (2 M^2) p_9 abs(p_9) - M g C_R"sgn"(1/M p_9)
$

= Initial Conditions
Since the vehicle starts from rest and an initial point that we call "zero", *all initial conditions will be zero*.


#pagebreak()
= Output
== Part 1
#fig("graphics/part-1.pdf", cap: [A plot of the vehicle velocity as a response to a 100 volt input to $u_"in"$])

#pagebreak()
== Part 2
#fig("graphics/part-2.pdf", cap: [A plot of the velocity response to a $1 "m/s"$ input to $v_"ref"$ for the $K_p$ and $K_i$ we designed.])

#pagebreak()
== Part 3
#fig("graphics/part-3-complete.pdf", cap: [A plot of the simulated vehicle velocity on the first 300 seconds of the LA92 drive cycle.])
#fig("graphics/part-3-vref.pdf", cap: [A plot of the simulated vehicle velocity and the reference velocity])

#pagebreak()
= Discussion
== Part 1
See @state-eqns for state equations. 

== Part 2
The controller gains $K_p$ and $K_i$ are 105 and 435 respectively. These values were found by guessing a large $K_p$ and $K_i$ until the desired steady state behavior was observed. The $K_p$ and $K_i$ were then lowered until 2nd order oscillations disappeared. Once we had the desired $K_i$ value $K_p$ was then lowered until our rise time and settling time were within design specifications.

Our specifications are the following, 

$ 
 T_"Settling" &= 0.610 s\
 T_"Rise" &= 0.230 s  \
 O S % &= 9.467 %
$

$K_p$ affects the speed of our response, therefor if we increase $K_p$ too much we will get oscillations around the steady state value as it responds to quickly to its peak. $K_i$ will affect the state state error of our system, if we choose to small of an error we could get a non-zero steady state error, if we increase $K_i$ too much this error will integrate and diverge quickly. Ergo tuning $K_i$ will affect the accuracy of our response in steady state and $K_p$ will affect the speed of the response.

When we set $K_i = 0$, the  settling time and the overshoot percentage is lower than our tuned values, however the steady state error is large at 0.3 m/s. When we set $K_p = 0$, the system oscillates around the reference velocity, 1 m/s, but does not settle within 5 s.

== Part 3
=== Performance
The actual velocity at time t = 44s has a lag of 0.083 m/s behind the commanded velocity, this value was measured with MATLAB's cursor tools. There was also a negligible overshoot of 0.024 m/s at the peak around t = 46s, this value was also measured with MATLAB's cursor tools. Besides a primary overshoot due to the $K_p$ value, there are no cursory oscillations as controlled by the large I value. The performance of the controller does not vary much with the speed of the vehicle, when measured the over/undershoot of the vehicle measures to be roughly 0.015 m/s for the peaks the lag also stays consistent.

The performance of the vehicle does not change with speed, but rather with acceleration. If the vehicle is accelerating very quickly, we find that the difference between $v_"ref"$ and $v_"act"$ is much larger than when the acceleration is small. The controller performs the worst when there are large changes to the velocity. 

=== Efficiency 
The average efficiency of the vehicle over the LA92 cycle is 72.15%. This is the average of power in from the motor versus the power out over the entire cycle.

The ratio of meters traveled per joule over the LA92 cycle is 0.0021 m/J. This gives us a sense of the fuel efficiency of the system over the route. 