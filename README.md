# Memory-Augmented Model Predictive Control

This repository hosts the source code for the journal article
"Composing MPC with LQR and Neural Networks for Efficient and Stable Control"
currently in submission to the _IEEE Transactions on Automatic Control_.

The code contains four numerical experiments: pendulum, triple pendulum, bicopter, and quadcopter.

To run the experiment, 
```
gen [exp]  # generate necessary exp. mpc, imp. mpc, and nn models
runn [exp] # run the generated models for running time comparison
```
where `[exp]` may be any one of the four `pendulum`, `triplependulum`, `bicopter`, and `quadcopter`.
