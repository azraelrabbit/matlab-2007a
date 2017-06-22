function mech_environment(sys)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    dr = get_param(0.0, 'DomainRegistry');
    dr.load('mechanical');
    mech_support('Environment', sys);
end % function
