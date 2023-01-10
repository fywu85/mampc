function dydt = biasedpendulum_ode(t, y, u, b)
    dydt = pendulum(y, u) + b;
end