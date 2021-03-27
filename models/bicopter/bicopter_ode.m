function dydt = bicopter_ode(t, y, u)
    dydt = bicopter(y, u);
end