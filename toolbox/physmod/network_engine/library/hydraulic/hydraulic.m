function hydraulic(root, domain)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    p = domain.across_variable('p');
    p.dimension = [1.0 1.0];
    p.unit = 'Pa';
    % 10 11
    q = domain.through_variable('q');
    q.dimension = [1.0 1.0];
    q.unit = 'm^3/s';
    q.propagate = true;
    % 15 16
    density = domain.parameter('density');
    density.description = 'Fluid density';
    density.type = ne_type('real', [1.0 1.0], 'kg/m^3');
    density.default = {[850.0],'kg/m^3'};
    % 20 21
    viscosity_kin = domain.parameter('viscosity_kin');
    viscosity_kin.description = 'Kinematic viscosity';
    viscosity_kin.type = ne_type('real', [1.0 1.0], 'm^2/s');
    viscosity_kin.default = {[1.8e-05],'m^2/s'};
    % 25 26
    bulk = domain.parameter('bulk');
    bulk.description = 'Bulk modulus';
    bulk.type = ne_type('real', [1.0 1.0], 'Pa');
    bulk.default = {[800000000.0],'Pa'};
    % 30 31
    alpha = domain.parameter('alpha');
    alpha.description = 'Relative amount of trapped air';
    alpha.type = ne_type('real', [1.0 1.0], '1');
    alpha.default = .005;
    % 35 36
end % function
