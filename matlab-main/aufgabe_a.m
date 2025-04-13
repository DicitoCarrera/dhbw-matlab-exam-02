% alle Parameter
num_trajectories = 50;    % Mindestens 50 Trajektorien
num_steps = 1000;         % Mindestens 1000 Schritte pro Trajektorie
two_pi = 2*pi;

% K1 im Intervall (0, 0.6]
K1_min = 0.01;
K1_max = 0.6;
K_values(1) = K1_min + (K1_max - K1_min) * rand(); 

% K2 im Intervall [0.9, 1.1]
K2_min = 0.9;
K2_max = 1.1;
K_values(2) = K2_min + (K2_max - K2_min) * rand();

% K3 im Intervall [1.4, 2.0]
K3_min = 1.4;
K3_max = 2.0;
K_values(3) = K3_min + (K3_max - K3_min) * rand();

fprintf('Gewählte K-Werte: K1=%.4f, K2=%.4f, K3=%.4f\n', K_values(1), K_values(2), K_values(3));

% Berechnund und plotten von Phasenportraits
for i = 1:length(K_values)
    K = K_values(i);
    
    figure; % Erstelle neues Fenster für jedes K
    hold on; % Halte Plot für alle trajektorien
    
    for traj = 1:num_trajectories
        % Zufällige Anfangswerte
        I0 = rand() * two_pi;
        theta0 = rand() * two_pi;
        
        % Arrays zum Speichern der Trajektorie
        I_traj = zeros(1, num_steps + 1);
        theta_traj = zeros(1, num_steps + 1);
        
        % Anfangswerte setzen
        I_traj(1) = I0;
        theta_traj(1) = theta0;
        
        % Iteriere die Standardabbildung
        I_curr = I0;
        theta_curr = theta0;
        
        for n = 1:num_steps
            I_next = mod(I_curr + K * sin(theta_curr), two_pi);
            theta_next = mod(theta_curr + I_next, two_pi);
            
            % Speichern
            I_traj(n+1) = I_next;
            theta_traj(n+1) = theta_next;
            
            % Update für nächsten Schritt
            I_curr = I_next;
            theta_curr = theta_next;
        end
        
        % Plotten der Trajektorie aus dem array
        % nur punkte plotten
        plot(theta_traj, I_traj, '.', 'MarkerSize', 2); 
    end
    
    hold off;
    
    % Alle Beschriftungen für Achsen, skalierung
    axis([0 two_pi 0 two_pi]); % Quadrat [0, 2pi] x [0, 2pi]
    axis square; % Gleiche Skalierung für x und y Achse
    xlabel('\theta_n (mod 2\pi)');
    ylabel('I_n (mod 2\pi)');
    title(sprintf('Phasenportrait der Standardabbildung für K = %.4f', K));
    grid on;
end