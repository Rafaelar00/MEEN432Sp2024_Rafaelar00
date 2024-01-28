% Project 1 Delieverables
%Martian Orpilla, Rafael Reyes, Christan Ta

% Initial Conditions 
w_0 = 1.0; % Initial Angular Velocity [rad/s]
J = 1; % Rotational Inertia [kg-m^2]
b = 1; % Damping Coefficient [N-m-s/rad]
A = 1; % Constant Applied Torque [N-m]

simout = sim("P1_Week1_Deliverables.slx");
dT = [0.001, 0.1, 1]; % Time Step [s]
solver = ["ode1", "ode4"]; % Fixed Time Step Solver [Euler]

i = 0;
j = 0;

for i = 1:length(dT)
    for j = 1:length(solver)
        simout = sim("P1_Week1_Deliverables.slx","Solver",solver(j),"FixedStep",string(dT(i)));
        W = simout.w.Data;
        T = simout.tout;
        subplot(3,2,(i-1)*2+j)
        plot(W,T)
        xlabel("Time(t)")
        ylabel("Angular Vel")
        title("W" + " " + solver(j) + " " + "stepsize:"+ string(dT(i)))
    end
end

for i = 1:length(dT)
    for j = 1:length(solver)
        simout = sim("P1_demo.slx","Solver",solver(j),"FixedStep",string(dT(i)));
        W_DOT = simout.w_dot.Data;
        T = simout.tout;
        figure(2)
        subplot(3,2,(i-1)*2+j)
        plot(W_DOT,T)
        xlabel("Time(t)")
        ylabel("Angular Accel")
        title("WDOT" + " " + solver(j) + " " + "stepsize:"  + string(dT(i)))
    end
end

exportgraphics(figure(1),'W_plot.png','Resolution',300)
exportgraphics(figure(2),'W_Dot_plot.png','Resolution',300)