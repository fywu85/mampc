function u = mpcvarmove(x0, x_ref, u_ref, jac, params)
    Hp = params.Hp;             % Prediction horizon
    Hc = params.Hc;             % Control horizon
    Ts = params.Ts;             % Samping time interval
    Nx = params.Nx;             % State dimension
    Nu = params.Nu;             % Input dimension
    Q = 2*diag(params.Qvar);    % Stage cost
    Qf = 2*diag(params.Qfvar);  % Terminal cost
    R = diag(params.Rvar);      % Input cost
    xmin = params.xmin;         % State lower bound
    xmax = params.xmax;         % State upper bound
    umin = params.umin;         % Input lower bound
    umax = params.umax;         % Input upper bound
    Ny = Nx;
    C = eye(Ny);
    D = zeros(Ny, Nu);

    H = zeros((Hp+1)*Nx+Hc*Nu, (Hp+1)*Nx+Hc*Nu);
    for i = 1:Hp-1
        H(i*Nx+1:i*Nx+Nx, i*Nx+1:i*Nx+Nx) = Q;
    end
    H(Hp*Nx+1:Hp*Nx+Nx, Hp*Nx+1:Hp*Nx+Nx) = Qf;
    for i = 0:Hc-1
        H((Hp+1)*Nx+i*Nu+1:(Hp+1)*Nx+i*Nu+Nu, ...
          (Hp+1)*Nx+i*Nu+1:(Hp+1)*Nx+i*Nu+Nu) = R;
    end

    Aeq = zeros((Hp+1)*Nx, (Hp+1)*Nx+Hc*Nu);
    beq = zeros((Hp+1)*Nx, 1);
    Aeq(1:Nx, 1:Nx) = eye(Nx);
    beq(1:Nx, 1) = x0 - x_ref(1, :)';
    for i = 1:Hp
        x_pred = x_ref(i+1, :);
        if i+1 <= Hc
            u_pred = u_ref(i, :);
        else
            u_pred = zeros(Nu, 1);
        end
        [A_pred, B_pred] = jac(x_pred, u_pred);
        sys_pred = c2d(ss(A_pred, B_pred, C, D), Ts);
        Aeq(i*Nx+1:i*Nx+Nx, (i-1)*Nx+1:(i-1)*Nx+Nx) = sys_pred.A;
        Aeq(i*Nx+1:i*Nx+Nx, i*Nx+1:i*Nx+Nx) = -eye(Nx);
        beq(i*Nx+1:i*Nx+Nx, 1) = 0;
    end
    for i = 1:Hc
        x_pred = x_ref(i+1, :);
        u_pred = u_ref(i, :);
        [A_pred, B_pred] = jac(x_pred, u_pred);
        sys_pred = c2d(ss(A_pred, B_pred, C, D), Ts);
        Aeq(i*Nx+1:i*Nx+Nx, ...
            (Hp+1)*Nx+(i-1)*Nu+1:(Hp+1)*Nx+(i-1)*Nu+Nu) = sys_pred.B;
    end
    
    lb = zeros((Hp+1)*Nx+Hc*Nu, 1);
    ub = zeros((Hp+1)*Nx+Hc*Nu, 1);
    lb(1:Nx, 1) = -inf;
    ub(1:Nx, 1) = inf;
    for i = 1:Hp
        lb(i*Nx+1:i*Nx+Nx, 1) = xmin - x_ref(i+1, :);
        ub(i*Nx+1:i*Nx+Nx, 1) = xmax - x_ref(i+1, :);
    end
    for i = 1:Hc
        lb((Hp+1)*Nx+(i-1)*Nu+1:(Hp+1)*Nx+(i-1)*Nu+Nu, 1) = umin - u_ref(i, :);
        ub((Hp+1)*Nx+(i-1)*Nu+1:(Hp+1)*Nx+(i-1)*Nu+Nu, 1) = umax - u_ref(i, :);
    end
    
    % Constrained QP
    options = optimoptions('quadprog', 'Display', 'off');
    [solution, fval, exitflag, output] = ...
        quadprog(H, [], [], [], Aeq, beq, lb, ub, [], options);
    if exitflag ~= 1
        disp(output);
        imagesc(Aeq);
        error('MPC failed.');
    else
        if params.debug
            sol_x = solution(1:(Hp+1)*Nx);
            sol_u = solution(1:(Hp+1)+1:end);
            disp(sol_x);
            disp(sol_u);
            disp(fval);
        end
        u = solution((Hp+1)*Nx+1:(Hp+1)*Nx+Nu) + u_ref(1, :)';
    end
end
