<!-- PROJECT LOGO -->
<br />
<p align="center">
  <h3 align="center">Stochastic simulations</h3>

  <p align="center">
    Stochastic simulations using Octave for normal multivariate and queueing theory problems.
    <br />
  </p>
</p>


<!-- TABLE OF CONTENTS -->

<summary><h2 style="display: inline-block">Table of Contents</h2></summary>
<ol>
  <li>
    <a href="#about-the-project">About The Project</a>
  </li>
  <li>
    <a href="#getting-started">Getting Started</a>
    <ul>
      <li><a href="#prerequisites">Prerequisites</a></li>
      <li><a href="#installation">Installation</a></li>
    </ul>
  </li>
  <li><a href="#license">License</a></li>
  <li><a href="#acknowledgements">Acknowledgements</a></li>
</ol>


<!-- ABOUT THE PROJECT -->
## About The Project

The projects are intended for making stochastic simulations using Octave for normal multivariate and queueing theory problems.

### [Queueing Theory](https://github.com/brenoslivio/Octave-Simulations/blob/main/Queueing_Theory/queueSim.m)

We have a M/M/c/K/FIFO queue, with arrival rate ![lambda](http://www.sciweavers.org/upload/Tex2Img_1617392652/render.png) and service rate ![mu](http://www.sciweavers.org/upload/Tex2Img_1617392602/render.png). Also, queue is finite with ![k](http://www.sciweavers.org/upload/Tex2Img_1617392769/render.png). How many servers do we need to the expected waiting time for a client (coming from a long operation time) be less than 4 minutes?

We will have to make a transition rate matrix with the following idea:

![](https://i.imgur.com/cDeHkCb.png)

With the simulation we can see 2 servers are more than enough.

### [Random Normal Multivariate](https://github.com/brenoslivio/Octave-Simulations/blob/main/Normal_Multivariate/randnSim.m)

Decide if it is worth the $100.00 upgrade to play a match in which you attempt 100 'shots', and each ball that lands in the hole generates $2.00. 

Make a thousand simulations of the "100-stroke match" for the robot without upgrade and calculate the average profit, then repeat for the robot with upgrade. Compare the profits and decide if it is worth the upgrade to play a match.

The strokes' position follows a normal multivariate distribution which we have the following covariance matrices:

Robot without upgrade -
![](http://www.sciweavers.org/upload/Tex2Img_1617393350/render.png)

Robot with upgrade -
![](http://www.sciweavers.org/upload/Tex2Img_1617393394/render.png)

The hole is the polygon with the following coordinates:
![](http://www.sciweavers.org/upload/Tex2Img_1617393482/render.png)

Without the upgrade a 100-stroke could be like this:

![](https://raw.githubusercontent.com/brenoslivio/Octave-Simulations/main/Normal_Multivariate/WithoutUpgrade.jpg)

And with the upgrade:

![](https://raw.githubusercontent.com/brenoslivio/Octave-Simulations/main/Normal_Multivariate/WithUpgrade.jpg)

Making the simulation we can see the upgrade is too costly, and it's better to not do it, having a better profit.

<!-- GETTING STARTED -->
## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

Octave with the [Statistics Package](https://octave.sourceforge.io/statistics/) from Octave Forge.

### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/brenoslivio/Octave-Simulations.git
   ```
2. Run with Octave the proper codes.

<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.

<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements

* [MathWorks - Normally distributed random numbers](https://www.mathworks.com/help/matlab/ref/randn.html)
* [Octave Forge - Statistics Package](https://octave.sourceforge.io/statistics/)
* [Wikipedia - M/m/c queue](https://en.wikipedia.org/wiki/M/M/c_queue)
