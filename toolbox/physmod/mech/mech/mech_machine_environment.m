function env = mech_machine_environment(obj)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    obj = bdroot(get_param(obj, 'Handle'));
    % 10 11
    denv = mech_envDialog(obj, 'getenv');
    % 12 13
    env = MECH.MachineEnvironment;
    env.Gravity = evalin('base', denv.Parameters.GravityStr);
    env.GravityUnits = denv.Parameters.GravityUnit;
    env.AnalysisType = denv.Parameters.AnalysisType;
    % 17 18
    env.LinearAssemblyTolerance = evalin('base', denv.Parameters.LinearAssemblyTolStr);
    env.LinearAssemblyToleranceUnits = denv.Parameters.LinearAssemblyUnit;
    env.AngularAssemblyTolerance = evalin('base', denv.Parameters.AngularAssemblyTolStr);
    env.AngularAssemblyToleranceUnits = denv.Parameters.AngularAssemblyUnit;
    % 22 23
    env.ConstraintSolverType = denv.Constraints.ConstraintType;
    env.ConstraintRelTolerance = evalin('base', denv.Constraints.RelativeTolStr);
    env.ConstraintAbsTolerance = evalin('base', denv.Constraints.AbsoluteTolStr);
    env.UseRobustSingularityHandling = l_to_onoff(denv.Constraints.SingularityHandling);
    % 27 28
    env.StatePerturbationType = denv.Linearization.PerturbationType;
    env.PerturbationSize = evalin('base', denv.Linearization.PerturbationSizeStr);
    % 30 31
    env.VisualizeMachine = 'on';
end % function
function val = l_to_onoff(val)
    % 34 35
    if val
        val = 'on';
    else
        val = 'off';
    end % if
end % function
