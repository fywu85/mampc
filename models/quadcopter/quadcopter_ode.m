function dydt = quadcopter_ode(t, y, u)
    dydt = quadcopter(y, u);
end