# 2017-JupyterNotebooksForGeophysics
MSc Geophysics Seminar on developing Jupyter Notebooks for Geophysics 


## Scope
This course aims at discussing advanced computational methods in seismology, and other topics with the aim of developing skills to write and maintain Jupyter Notebooks for small projects and teaching. In addition we learn some basic tools for code development (github). 

## Format
Participating students will prepare basic theoretical concepts, simple python-based notebooks, and possibly report on some applications of methodologies in geosciences.

## Date and Location
tbd

## Programme

| Date  |   Topic |  Presenters |   Misc |  
|---|---|---|---|
| Oct  18, 10:15 C107|  GitHub |  T. Megies | Introduction, Applications |
| Nov  , |  GitHub |   |  |


## Potential topics

* FD simulations of seismic noise
* Earthquake location problem using linear algebra
* Earthquake location problem using probabilistic methods
* Simple homogenization examples
* Elastic code in 2D
* Simple rupture problems in 1D or 2D
* Tomographic inversion using linear algebra

## Specific suggestions

* Analysis of the 2004 Sumatra-Andaman earthquake
Part 1: Instrument response and spectral analysis (based on C. Tape matlab scripsts), involves conversion to ObsPy
Part 2: Analyzing the effects of rupture complexity and Earth heterogeneity
* Probabilistic earthquake source location inversion based on existing matlab scripts
* Review, update, understanding if existing notebook on homogenization by S. Singh, Y. Capdeville
* A simple 2D staggered grid elastic code based on a Fortran implementation
* Simplest tomographic inversion using linear algebra (Matlab codes exist)

## Additional Info on Jupyter Notebook

Useful Jupyter Notebook extensions and how to install/use them can be found here:
 * http://jupyter-contrib-nbextensions.readthedocs.io/en/latest/install.html
 * http://jupyter-contrib-nbextensions.readthedocs.io/en/latest/nbextensions.html

If you're using Anaconda for Jupyter, [just install the extensions using `conda` by doing](https://anaconda.org/conda-forge/jupyter_contrib_nbextensions)...

```bash
$ conda install -c conda-forge jupyter_contrib_nbextensions
```
... and then [follow along with any further configuration needed](conda install -c conda-forge jupyter_contrib_nbextensions ).

It might also be useful to use the [notebook extension configurator plugin](https://github.com/Jupyter-contrib/jupyter_nbextensions_configurator/blob/master/README.md), which can also be installed using `conda`:

```bash
$ conda install -c conda-forge jupyter_nbextensions_configurator
```
