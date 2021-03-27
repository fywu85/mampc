function dydt = pendulum_ode(t, y, u)
    dydt = pendulum(y, u);
end