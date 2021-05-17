function [unn, nn_switch] = is_converge(x, r, H, params)
    unn = nnmove(x);
    nn_switch = false;
    Ts = params.Ts;
    u = unn;
    dx = params.ode([], x, u);
    x = x + dx*Ts;
    %[~, x_pred] = ode113(@(t, y) mpc_params.ode(t, y, u), [0, Ts], x);
    %x = x_pred(end, :)';
    %x = mpc_params.A * x + mpc_params.B * u;
    for iter = 1:H
        state_violate = false;
        if isfield(params, 'rwp') && r < params.rwp
            state_violate = state_violate || norm(x, 2) > params.rwp;
        else
            for i = 1:length(x)
                state_violate = state_violate || ...
                    x(i) < 1.1*(params.xmin(i) + params.x_eq(i));
                state_violate = state_violate || ...
                    x(i) > 1.1*(params.xmax(i) + params.x_eq(i));
            end
        end
        input_violate = false;
        for i = 1:length(u)
            input_violate = input_violate || ...
                u(i) < 1.1*(params.umin(i) + params.u_eq(i));
            input_violate = input_violate || ...
                u(i) > 1.1*(params.umax(i) + params.u_eq(i));
        end
        if state_violate || input_violate
            %fprintf('Violation detected.\n');
            %fprintf('State %d Input %d\n', state_violate, input_violate);
            break
        elseif norm(x, 2) < r
            nn_switch = true;
            break
        else
            u = nnmove(x);
            dx = params.ode([], x, u);
            x = x + dx*Ts;
            %[~, x_pred] = ode23(...
            %    @(t, y) mpc_params.ode(t, y, u), [0, Ts], x);
            %x = x_pred(end, :)';
            %x = mpc_params.A * x + mpc_params.B * u;
        end
    end
end
