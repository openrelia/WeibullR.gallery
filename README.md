WeibullR.gallery
================

Data and scripts for WeibullR presentations and tutorials

 

Test examples:
--------------

 

**Loading a vector from a .csv file**

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
agc<-read.csv("https://raw.githubusercontent.com/openrelia/WeibullR.gallery/master/data/acid_gas_compressor.csv", header=T)$agc
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 

**Running a script**

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
source("https://raw.githubusercontent.com/openrelia/WeibullR.gallery/master/scripts/contour_challenge.r")
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

![](https://raw.githubusercontent.com/openrelia/WeibullR.gallery/master/images/contour_challenge.jpg)

**A script that displays a dataframe**

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
source("https://raw.githubusercontent.com/openrelia/WeibullR.gallery/master/scripts/manipulate_contour_challenge.r")
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 

 

**Replicating Figure3.13 from “The New Weibull Handbook”**

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
source("https://raw.githubusercontent.com/openrelia/WeibullR.gallery/master/scripts/Fig3.13ln.r")
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

![](https://raw.githubusercontent.com/openrelia/WeibullR.gallery/master/images/Figure3.13.jpg)

 

**A Multi-Distribution plot on Weibull Canvas**

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
source("https://raw.githubusercontent.com/openrelia/WeibullR.gallery/master/scripts/Fig3.13multi.r")
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

![](https://raw.githubusercontent.com/openrelia/WeibullR.gallery/master/images/Figure3.13multi.jpg)

 

**Bathtub Life Data**

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
source("https://raw.githubusercontent.com/openrelia/WeibullR.gallery/master/scripts/bathtub_life.r")
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

![](https://raw.githubusercontent.com/openrelia/WeibullR.gallery/master/images/bathtub_life.jpg)

 

**Life Data Division as Competing Modes**

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
source("https://raw.githubusercontent.com/openrelia/WeibullR.gallery/master/scripts/competing_modes.r")
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

![](https://raw.githubusercontent.com/openrelia/WeibullR.gallery/master/images/competing_modes.jpg)

 

**Linearized 3p fits by t0 modification**

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
source("https://raw.githubusercontent.com/openrelia/WeibullR.gallery/master/scripts/linearized3p.r")
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

![](https://raw.githubusercontent.com/openrelia/WeibullR.gallery/master/images/linearized3p.jpg)

**Compare two data sets by likelihood contour**

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
source("https://raw.githubusercontent.com/openrelia/WeibullR.gallery/master/scripts/compare_6mp.r")
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

![](https://raw.githubusercontent.com/openrelia/WeibullR.gallery/master/images/compare_6mp.jpg)

**Inspection Data for Cracks in Parts in Service - Probit Analysis**

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
source("https://raw.githubusercontent.com/openrelia/WeibullR.gallery/master/scripts/probit_1.r")
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

![](images/parts_cracking_probit.jpg)

 

**Interval Analysis on Parts Cracking Data**

(Requires WeibullR version \> 1.0.11.4 available on
[R-Forge](https://r-forge.r-project.org/R/?group_id=2252))

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
source("https://raw.githubusercontent.com/openrelia/WeibullR.gallery/master/scripts/inspection_intervals.r")
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

![](images/parts_cracking_interval.jpg)

**Comparing the Simple Weibayes Function to a Challenging MLE Contour**

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
source("https://raw.githubusercontent.com/openrelia/WeibullR.gallery/master/scripts/weibayes_study.r")
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

![](https://raw.githubusercontent.com/openrelia/WeibullR.gallery/master/images/weibayes_study.jpg)

**Contour to Bounds**

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
source("https://raw.githubusercontent.com/openrelia/WeibullR.gallery/master/scripts/contour2bounds.r")
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

![](https://raw.githubusercontent.com/openrelia/WeibullR.gallery/master/images/contour2bounds.jpg)

**Likelihood Ratio Bounds on a 3-Parameter** **Model**

 

 

**Fisher Matrix Bounds on a 3-Parameter Model**

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
source("https://raw.githubusercontent.com/openrelia/WeibullR.gallery/master/scripts/three_parameter_FM2.r")
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

![](https://raw.githubusercontent.com/openrelia/WeibullR.gallery/master/images/FM3p2.jpg)
