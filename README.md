# CAT Bond Pricing Code

This folder contains the MATLAB code used for numerical experiments in the paper *Pricing catastrophe risk during transitions of physical and economic environments*. The code prices CAT-bond cash-flow components under regime-switching physical and economic environments, using conditional affine formulas together with simulation of the environment Markov chain.

Most scripts are written as experiment drivers: they set parameters, call the pricing functions, and save `.mat` output files for plotting. The core functions are reusable, but many scripts assume that all `.m` files are on the MATLAB path and that the Parallel Computing Toolbox is available for `parfor` loops.

## Core Pricing Functions

- `pricefun12.m` estimates the first two CAT-bond price components by simulating Markov-chain environment paths and averaging `price1base.m` and `price2base.m`.
- `pricefun34.m` estimates the third and fourth price components. These terms use both environment-path simulation and inner Monte Carlo integration over event times.
- `price1base.m`, `price2base.m`, `price3base.m`, and `price4base.m` evaluate the four conditional pricing terms given one realized environment path.
- `rbondbase.m`, `lbondbase.m`, and `pricefunrl.m` price benchmark zero-coupon risk-free and floating-rate bonds.
- `defaultprobbase.m` and `triggerprob.m` compute the conditional and simulated trigger/default probabilities.

## Conditional Expectation Building Blocks

- `condexpect1.m` implements the basic conditional exponential-affine expectation.
- `condexpect2.m` implements the corresponding expectation with the hazard-rate factor in front.
- `condexpect3.m` and `condexpect4.m` handle expectations split across coupon/payment intervals.
- `Bfuct.m`, `Cfuct.m`, `BBfuct.m`, and `CCfuct.m` are the affine coefficient functions used by the conditional expectation formulas.
- `h.m` maps factors across environment state changes using the physical and economic state multipliers.

## Model Parameters

- `g1.m`, `g2.m`, and `g3.m` define the mean-reversion speeds for the three rate factors.
- `theta1.m`, `theta2.m`, and `theta3.m` define the physical-measure long-run means.
- `sigma1.m`, `sigma2.m`, and `sigma3.m` define the factor volatilities.
- `gamma1.m`, `gamma2.m`, and `gamma3.m` define the diffusion market prices of risk.
- `thetastar1.m`, `thetastar2.m`, and `thetastar3.m` convert the long-run means to their pricing-measure counterparts.
- `R.m` defines the recovery rate in each environment state.
- `mu.m` returns the drift vector for the three-factor process in a given environment.

## Markov Chain Utilities

- `ctmcgenerator.m` simulates a continuous-time Markov-chain path up to a terminal time.
- `samplefromp.m` samples discrete states from a probability vector.
- `constructAs.m` contains calculations used to construct or check environment transition matrices.
- `matrix_exponent.m` is a symbolic scratch script for checking matrix exponential formulas.

## Experiment Scripts

- `environment1.m` to `environment12.m` run the main sensitivity experiments for environment transition effects. The notes in `New Text Document.txt` describe the intended parameter grids:
  - `environment1`-`environment3`: vary `aco` while fixing `bco`.
  - `environment4`-`environment6`: vary `bco` while fixing `aco`.
  - `environment7`-`environment9`: vary `acon` while fixing `bcon`.
  - `environment10`-`environment12`: vary `bcon` while fixing `acon`.
- `change1.m` prices the four initial environment states under the baseline transition setup.
- `rhotest.m`, `rhotest1.m`, and `rhotest2.m` test sensitivity to correlations among the hazard, risk-free, and floating-rate factors.
- `detest.m` and `detest1.m` vary the economic-environment transition rate `e01`.
- `dptest.m` and `dptest1.m` vary the physical-environment transition rate `p01`.
- `kappatest.m` varies the event-risk market price parameter `kappa`.
- `accuracytest.m` appears to compare pricing accuracy across simulation settings.
- `verification.m` checks selected model quantities, including trigger probability and benchmark bond prices.
- `initialenvtest.m` is a small, low-simulation test run for the baseline initial environment.
- `zerocouponbonds.m`, `Untitled.m`, and `Untitled2.m` are exploratory or scratch scripts.

## Plotting and Outputs

- `plotting.m`, `plotting2.m`, and `envplotting.m` generate figures from saved experiment results.
- The `plots/` folder contains exported figure files.
- The `.mat` files store saved numerical output from the experiment scripts. For example, `env1.mat` to `env12.mat` correspond to the environment sensitivity runs, while `rho0.mat`, `rho1.mat`, and `rho2.mat` correspond to correlation sensitivity runs.

## Batch Job Files

- `Task1` to `Task22` are PBS job scripts for running the MATLAB experiments on a cluster. Each task loads MATLAB R2022a and runs one experiment script, such as `environment1`, `change1`, `rhotest1`, or `kappatest`.

## Citation

If you use this code, please cite the associated paper:

```bibtex
@article{liu2026pricing,
  title = {Pricing catastrophe risk during transitions of physical and economic environments},
  author = {Liu, Haibo and Liu, Yuhao and Tang, Qihe and Zhu, Jinxia},
  journal = {European Journal of Operational Research},
  volume = {331},
  number = {2},
  pages = {615--628},
  year = {2026},
  issn = {0377-2217},
  doi = {10.1016/j.ejor.2025.09.042},
  url = {https://www.sciencedirect.com/science/article/pii/S0377221725007970}
}
```
